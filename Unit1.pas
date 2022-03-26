unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Vcl.WinXCtrls,
  Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, EhLibADO, EhLibPNGImage, Vcl.Mask, DBCtrlsEh;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    MainMenu1: TMainMenu;
    Delovi1: TMenuItem;
    Elementi1: TMenuItem;
    Masine1: TMenuItem;
    Dodajnovumasinu1: TMenuItem;
    Obrisi1: TMenuItem;
    Image1: TImage;
    Izmeniselektovanumasinu1: TMenuItem;
    Kvarovi1: TMenuItem;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    procedure Elementi1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Dodajnovumasinu1Click(Sender: TObject);
    procedure Obrisi1Click(Sender: TObject);
    procedure Izmeniselektovanumasinu1Click(Sender: TObject);
    procedure Delovi1Click(Sender: TObject);
    procedure Kvarovi1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);

  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit9, Unit10;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  Form3.Visible:=True;
end;

procedure TForm1.DBGridEh1DblClick(Sender: TObject);
begin
  Form3.Visible:=True;
end;

procedure TForm1.Delovi1Click(Sender: TObject);
begin
  Form7.Visible:=true;
end;

procedure TForm1.Dodajnovumasinu1Click(Sender: TObject);
begin
   Form2.Visible:= True;
end;

procedure TForm1.Elementi1Click(Sender: TObject);
begin
   Form5.Visible:= True;
end;

procedure TForm1.Izmeniselektovanumasinu1Click(Sender: TObject);
begin
   Form6.Visible:= True;
end;

procedure TForm1.Kvarovi1Click(Sender: TObject);
begin
   Form8.Visible:= True;
end;


procedure TForm1.FormResize(Sender: TObject);
begin
  DBGridEh1.Width:= Form1.Width - 30;
  DBGridEh1.Height:= Form1.Height - 200;
  Image1.Width:= Form1.Width;
end;

procedure TForm1.Obrisi1Click(Sender: TObject);
begin
  buttonSelected := messagedlg('Da li ste sigurni?',mtCustom,
                              [mbYes,mbNo], 0);

  if buttonSelected = mrYes then
    begin
      Form1.ADOQuery1.Locate('ID','Naziv', [loPartialKey]);
      DeleteFile(Form1.ADOQuery1.FieldValues['Mapa']);
      DeleteFile(Form1.ADOQuery1.FieldValues['TehDok']);
      DeleteFile(Form1.ADOQuery1.FieldValues['PrincipRada']);
      DeleteFile(Form1.ADOQuery1.FieldValues['StanjeIspravnosti']);
      Form1.ADOQuery1.Delete;
    end;

  Form9.Combobox1.Clear;
  Form1.ADOQuery1.First;

  while not Form1.ADOQuery1.Eof do begin
    Form9.Combobox1.Items.Add(Form1.ADOQuery1.Fields[2].AsString);
    Form1.ADOQuery1.Next;
  end;
end;

end.
