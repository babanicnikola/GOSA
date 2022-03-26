unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    FileOpenDialog1: TFileOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Label8: TLabel;
    Edit8: TEdit;
    Button3: TButton;
    Label9: TLabel;
    Edit9: TEdit;
    Button4: TButton;
    Label10: TLabel;
    Edit10: TEdit;
    Button5: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  MasID: integer;
  selectedFile: String;
  newFile: String;
  selectedFile2: String;
  newFile2: String;
  selectedFile3: String;
  newFile3: String;
  selectedFile4: String;
  newFile4: String;
  dlg: TOpenDialog;
implementation

{$R *.dfm}

uses Unit1;


procedure TForm6.Button2Click(Sender: TObject);
begin
  Form1.ADOQuery1.Open;
  Form1.ADOQuery1.Edit;
  Form1.ADOQuery1.FieldByName('Redni_broj').AsInteger := StrToInt(Edit1.Text);
  Form1.ADOQuery1.FieldByName('Naziv_masine').AsString := Edit2.Text;
  Form1.ADOQuery1.FieldByName('Tip_masine').AsString := Edit3.Text;
  Form1.ADOQuery1.FieldByName('Inv_broj').AsString := Edit4.Text;
  Form1.ADOQuery1.FieldByName('Fabricki_broj').AsString := Edit5.Text;
  Form1.ADOQuery1.FieldByName('Godina_proizvodnje').AsString := Edit6.Text;

  if selectedFile <> '' then
    Form1.ADOQuery1.FieldByName('Mapa').AsString := 'C:\Gosa Soft\Mape\'+ PChar(Edit1.Text) +'.png';
  if selectedFile2 <> '' then
    Form1.ADOQuery1.FieldByName('TehDok').AsString := 'C:\Gosa Soft\TehDok\'+ PChar(Edit1.Text) +ExtractFileExt(selectedFile2);
  if selectedFile3 <> '' then
    Form1.ADOQuery1.FieldByName('PrincipRada').AsString := 'C:\Gosa Soft\PrincipRada\'+ PChar(Edit1.Text) +ExtractFileExt(selectedFile3);
  if selectedFile4 <> '' then
    Form1.ADOQuery1.FieldByName('StanjeIspravnosti').AsString := 'C:\Gosa Soft\StanjeIspravnosti\'+ PChar(Edit1.Text) +ExtractFileExt(selectedFile4);

  try
    Form1.ADOQuery1.Post;
    ShowMessage('Uspesno izvrsene izmene!');
  except
    ShowMessage('Greska pri editovanju!');
  end;
  Form6.Visible:= False;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := 'C:\';
    dlg.Filter := 'PNG Picture only|*.png';
    if dlg.Execute(Handle) then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;

  if selectedFile <> '' then
    Begin
      DeleteFile(Form1.ADOQuery1.FieldValues['Mapa']);
      NewFile:= 'C:\Gosa Soft\Mape\'+ PChar(Edit1.Text) +'.png';
      CopyFile(PChar(selectedFile), PChar(NewFile), True);
      Form1.ADOQuery1.FieldValues['Mapa']:= NewFile;
      Edit7.Text:= Form1.ADOQuery1.FieldValues['Mapa'];
    End;
end;


procedure TForm6.Button3Click(Sender: TObject);
begin
  selectedFile2 := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := 'C:\';
    dlg.Filter := 'Word Documents *.docx|*.docx|Word Documents *.doc|*.doc|PDF Documents *.pdf|*.pdf' ;
    if dlg.Execute(Handle) then
      selectedFile2 := dlg.FileName;
  finally
    dlg.Free;
  end;

  if selectedFile2 <> '' then
    Begin
      DeleteFile(Form1.ADOQuery1.FieldValues['TehDok']);
      NewFile2:= 'C:\Gosa Soft\TehDok\'+ PChar(Edit1.Text) +ExtractFileExt(selectedFile2);
      CopyFile(PChar(selectedFile2), PChar(NewFile2), True);
      Form1.ADOQuery1.FieldValues['TehDok']:= NewFile2;
      Edit8.Text:= Form1.ADOQuery1.FieldValues['TehDok'];
    End;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  selectedFile3 := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := 'C:\';
    dlg.Filter := 'Word Documents *.docx|*.docx|Word Documents *.doc|*.doc|PDF Documents *.pdf|*.pdf' ;
    if dlg.Execute(Handle) then
      selectedFile3 := dlg.FileName;
  finally
    dlg.Free;
  end;

  if selectedFile3 <> '' then
    Begin
      DeleteFile(Form1.ADOQuery1.FieldValues['PrincipRada']);
      NewFile3:= 'C:\Gosa Soft\PrincipRada\'+ PChar(Edit1.Text) +ExtractFileExt(selectedFile3);
      CopyFile(PChar(selectedFile3), PChar(NewFile3), True);
      Form1.ADOQuery1.FieldValues['PrincipRada']:= NewFile3;
      Edit9.Text:= Form1.ADOQuery1.FieldValues['PrincipRada'];
    End;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
  selectedFile4 := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := 'C:\';
    dlg.Filter := 'Word Documents *.docx|*.docx|Word Documents *.doc|*.doc|PDF Documents *.pdf|*.pdf' ;
    if dlg.Execute(Handle) then
      selectedFile4 := dlg.FileName;
  finally
    dlg.Free;
  end;

  if selectedFile4 <> '' then
    Begin
      DeleteFile(Form1.ADOQuery1.FieldValues['StanjeIspravnosti']);
      NewFile4:= 'C:\Gosa Soft\StanjeIspravnosti\'+ PChar(Edit1.Text) +ExtractFileExt(selectedFile4);
      CopyFile(PChar(selectedFile4), PChar(NewFile4), True);
      Form1.ADOQuery1.FieldValues['StanjeIspravnosti']:= NewFile4;
      Edit10.Text:= Form1.ADOQuery1.FieldValues['StanjeIspravnosti'];
    End;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
    Edit1.Text:=Form1.ADOQuery1.FieldValues['Redni_broj'];
    Edit2.Text:=Form1.ADOQuery1.FieldValues['Naziv_masine'];
    Edit3.Text:=Form1.ADOQuery1.FieldValues['Tip_masine'];
    Edit4.Text:=Form1.ADOQuery1.FieldValues['Inv_Broj'];
    Edit5.Text:=Form1.ADOQuery1.FieldValues['Fabricki_broj'];
    Edit6.Text:=Form1.ADOQuery1.FieldValues['Godina_proizvodnje'];
    Edit7.Text:=Form1.ADOQuery1.FieldValues['Mapa'];
    Edit8.Text:=Form1.ADOQuery1.FieldValues['TehDok'];
    Edit9.Text:=Form1.ADOQuery1.FieldValues['PrincipRada'];
    Edit10.Text:=Form1.ADOQuery1.FieldValues['StanjeIspravnosti'];
    selectedFile := '';
    selectedFile2 := '';
    selectedFile3 := '';
    selectedFile4 := '';

    Form1.ADOQuery1.Open;
    Form1.ADOQuery1.Edit;
end;

end.
