unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    FileOpenDialog1: TFileOpenDialog;
    Button2: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
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

uses Unit1, Unit7, Unit9;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if (edit1.text='') then
    ShowMessage('Unesi redni broj!')
  else
    if (edit2.text='') then
    ShowMessage('Unesi naziv!')
  else
    begin
      Form1.ADOQuery1.Open;
      Form1.ADOQuery1.Append;

      Form1.ADOQuery1.FieldValues['Redni_broj']:= Edit1.Text;
      Form1.ADOQuery1.FieldValues['Naziv_masine']:= Edit2.Text;
      Form1.ADOQuery1.FieldValues['Tip_masine']:= Edit3.Text;
      Form1.ADOQuery1.FieldValues['Inv_Broj']:= Edit4.Text;
      Form1.ADOQuery1.FieldValues['Fabricki_Broj']:= Edit5.Text;
      Form1.ADOQuery1.FieldValues['Godina_proizvodnje']:= Edit6.Text;

      if selectedFile <> '' then
      Begin
        NewFile:= 'C:\Gosa Soft\Mape\'+ PChar(Edit1.Text) +'.png';
        CopyFile(PChar(selectedFile), PChar(NewFile), True);
        Form1.ADOQuery1.FieldValues['Mapa']:= NewFile;
      End;

      if selectedFile2 <> '' then
      Begin
        NewFile2:= 'C:\Gosa Soft\TehDok\'+ PChar(Edit1.Text)+ExtractFileExt(selectedFile2);
        CopyFile(PChar(selectedFile2), PChar(NewFile2), True);
        Form1.ADOQuery1.FieldValues['TehDok']:= NewFile2;
      End;

      if selectedFile3 <> '' then
      Begin
        NewFile3:= 'C:\Gosa Soft\PrincipRada\'+ PChar(Edit1.Text)+ExtractFileExt(selectedFile3);
        CopyFile(PChar(selectedFile3), PChar(NewFile3), True);
        Form1.ADOQuery1.FieldValues['PrincipRada']:= NewFile3;
      End;

      if selectedFile4 <> '' then
      Begin
        NewFile4:= 'C:\Gosa Soft\StanjeIspravnosti\'+ PChar(Edit1.Text)+ExtractFileExt(selectedFile4);
        CopyFile(PChar(selectedFile4), PChar(NewFile4), True);
        Form1.ADOQuery1.FieldValues['StanjeIspravnosti']:= NewFile4;
      End;

      Form1.ADOQuery1.Post;

      Edit1.Text:='';
      Edit2.Text:='';
      Edit3.Text:='';
      Edit4.Text:='';
      Edit5.Text:='';
      Edit6.Text:='';
      Edit7.Text:='';
      Edit8.Text:='';
      Edit9.Text:='';
      Edit10.Text:='';
      selectedFile:='';
      NewFile:='';
      selectedFile2:='';
      NewFile2:='';
      selectedFile3:='';
      NewFile3:='';
      selectedFile4:='';
      NewFile4:='';
      ShowMessage('Masina uspesno dodata!');
    end;

  Form1.ADOQuery1.First;
  Form9.Combobox1.Clear;
  Form1.ADOQuery1.First;

  while not Form1.ADOQuery1.Eof do begin
    Form9.Combobox1.Items.Add(Form1.ADOQuery1.Fields[2].AsString);
    Form1.ADOQuery1.Next;
  end;

  Form1.ADOQuery1.First;
end;

procedure TForm2.Button2Click(Sender: TObject);
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
    Edit7.Text:= selectedFile;

end;

procedure TForm2.Button3Click(Sender: TObject);
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
    Edit8.Text:= selectedFile2;
end;

procedure TForm2.Button4Click(Sender: TObject);
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
    Edit9.Text:= selectedFile3;
end;

procedure TForm2.Button5Click(Sender: TObject);
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
    Edit10.Text:= selectedFile4;
end;

end.
