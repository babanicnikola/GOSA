unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ExtDlgs, Unit4, ShellApi, ComObj, DB, ADODB, OleServer, Word2000, StdCtrls,
  Vcl.Imaging.GIFImg;

type
  TForm3 = class(TForm)
    MainMenu1: TMainMenu;
    Image1: TImage;
    Dokumentacija1: TMenuItem;
    Tehnickadokumentacjia1: TMenuItem;
    Principrada1: TMenuItem;
    Stanjeispravnosti1: TMenuItem;
    Delovi1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure Delovi1Click(Sender: TObject);
    procedure Tehnickadokumentacjia1Click(Sender: TObject);
    procedure Principrada1Click(Sender: TObject);
    procedure Stanjeispravnosti1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  MasID: integer;

implementation

{$R *.dfm}

uses Unit1, Unit10;

procedure TForm3.Delovi1Click(Sender: TObject);
begin
  Form4.visible:=True;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  MasID:=Form1.ADOQuery1.FieldValues['Redni_broj'];
  if fileexists(Form1.ADOQuery1.FieldValues['mapa'])
    then
      Image1.Picture.LoadFromFile(Form1.ADOQuery1.FieldValues['Mapa'])
    else
      Image1.Picture.LoadFromFile('C:/Gosa Soft/Mape/Nepostojeca.png');
end;

procedure TForm3.Tehnickadokumentacjia1Click(Sender: TObject);
var
  Word : Variant;
begin
  MasID:=Form1.ADOQuery1.FieldValues['Redni_broj'];

  if fileexists(Form1.ADOQuery1.FieldValues['TehDok'])
  then
    begin
      Form10.Visible:=True;
      ShellExecute(Handle, 'open',PChar(Form1.ADOQuery1.Fields[8].AsString),nil,nil,SW_SHOWNORMAL) ;
      Form10.Visible:=False;
    end
  else
    ShowMessage('Tehnicka dokumentacija za ovu masinu nije ubacena!');
end;

procedure TForm3.Principrada1Click(Sender: TObject);
var
  Word : Variant;
begin
  MasID:=Form1.ADOQuery1.FieldValues['Redni_broj'];

  if fileexists(Form1.ADOQuery1.FieldValues['PrincipRada'])
  then
    begin
      Form10.Visible:=True;
      ShellExecute(Handle, 'open',PChar(Form1.ADOQuery1.Fields[9].AsString),nil,nil,SW_SHOWNORMAL) ;
      Form10.Visible:=False;
    end
  else
    ShowMessage('Princip rada za ovu masinu nije ubacen!');
end;

procedure TForm3.Stanjeispravnosti1Click(Sender: TObject);
var
  Word : Variant;
begin
  MasID:=Form1.ADOQuery1.FieldValues['Redni_broj'];

  if fileexists(Form1.ADOQuery1.FieldValues['StanjeIspravnosti'])
  then
    begin
      Form10.Visible:=True;
      ShellExecute(Handle, 'open',PChar(Form1.ADOQuery1.Fields[10].AsString),nil,nil,SW_SHOWNORMAL) ;
      Form10.Visible:=False;
    end
  else
    ShowMessage('Stanje ispravnosti za ovu masinu nije ubaceno!');
end;

end.
