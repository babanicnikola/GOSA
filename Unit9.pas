unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, System.UITypes, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.WinXCalendars, Vcl.Mask, DBCtrlsEh, DBGridEh,
  DBLookupEh;

type
  TForm9 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Memo2: TMemo;
    Label5: TLabel;
    Memo3: TMemo;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    Label8: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Memo4: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

uses Unit1, Unit7, Unit8, Unit2;

procedure TForm9.Button1Click(Sender: TObject);
begin
  Form8.ADOQuery1.Append;

  Form8.ADOQuery1.FieldValues['Naziv_masine']:= ComboBox1.Text;
  Form8.ADOQuery1.FieldValues['Vreme_nastanka']:= DateTimeToStr(DBDateTimeEditEh1.Value);
  Form8.ADOQuery1.FieldValues['Vreme_otklanjanja']:= DateTimeToStr(DBDateTimeEditEh2.Value);
  Form8.ADOQuery1.FieldValues['Uzrok_kvara']:= Memo1.Text;
  Form8.ADOQuery1.FieldValues['Manifestacija_kvara']:= Memo2.Text;
  Form8.ADOQuery1.FieldValues['Otklanjanje_kvara']:= Memo3.Text;
  Form8.ADOQuery1.FieldValues['Zamenjen_deo']:= Memo4.Text;
  Form8.ADOQuery1.FieldValues['Odradio']:= Edit3.Text;

  Form8.ADOQuery1.Post;
  Form8.ADOQuery1.Refresh;

  ShowMessage('Kvar uspesno dodat!');
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo3.Lines.Clear;
  Memo4.Lines.Clear;

  Form9.Close;
end;

procedure TForm9.ComboBox1Change(Sender: TObject);
begin
  Combobox2.Items.Clear;
  ComboBox2.Text:='';
  Form7.ADOQuery1.Filter:= Format('Naziv_masine LIKE ''%s%%''',[ComboBox1.Text]);
  Form7.ADOQuery1.Filtered:=true;

  while not Form7.ADOQuery1.Eof do begin
    Combobox2.Items.Add(Form7.ADOQuery1.Fields[1].AsString + Form7.ADOQuery1.Fields[2].AsString);
    Form7.ADOQuery1.Next;
  end;

  Form7.ADOQuery1.Filtered:=False;
end;

procedure TForm9.ComboBox2Change(Sender: TObject);
begin
  Memo4.Lines.Add(ComboBox2.Text + ' & ');
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo3.Lines.Clear;
  Edit3.Text:= '';
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo3.Lines.Clear;
  Memo4.Lines.Clear;
  Combobox1.Items.Clear;
  Combobox2.Items.Clear;

  Form1.ADOQuery1.First;

  while not Form1.ADOQuery1.Eof do begin
    Combobox1.Items.Add(Form1.ADOQuery1.Fields[2].AsString);
    Form1.ADOQuery1.Next;
  end;
  Form1.ADOQuery1.First;
end;

end.
