unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, System.UITypes;

type
  TForm4 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ADOTable2: TADOTable;
    DataSource1: TDataSource;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  buttonSelected: integer;

implementation

{$R *.dfm}

uses Unit1, Unit5, Unit7, Unit9;

procedure TForm4.Button1Click(Sender: TObject);
begin
  if (Form4.Edit1.Text='') then
    ShowMessage('Unesi opis!')
  else
    if Form4.ADOTable2.Locate('Opis', Form4.Edit1.Text, []) = true then
      ShowMessage('Vec postoji element sa zadatim opisom!')
    else
    begin
      Form4.ADOTable2.Insert;
      Form4.ADOTable2.FieldByName('Element_naziv').AsString:= ComboBox1.Text;
      Form4.ADOTable2.FieldByName('Opis').AsString:= Edit1.Text;
      Form4.ADOTable2.FieldByName('Masina_ID').AsInteger:= Form1.ADOQuery1.FieldByName('ID').AsInteger;
      Form4.ADOTable2.FieldByName('Naziv_Masine').AsString:= Form1.ADOQuery1.FieldByName('Naziv_masine').AsString;
      Form4.ADOTable2.Post;
      Form4.ADOTable2.Append;

      Form4.Edit1.Text:='';
      Form4.DBGrid1.SetFocus;
      Form4.ADOTable2.Refresh;

      ShowMessage('Deo uspesno dodat!');
    end;
  Form9.Combobox2.Clear;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  buttonSelected := messagedlg('Da li ste sigurni?',mtCustom, [mbYes,mbCancel], 0);

  if buttonSelected = mrYes then
    begin
      Form4.ADOTable2.Locate('ID','Element_naziv', [loPartialKey]);
      Form4.ADOTable2.Delete;
    end;
  Form9.Combobox2.Clear;

end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  Form4.Label1.Caption:= Form1.ADOQuery1.FieldByName('Naziv_masine').AsString;
  Form4.Edit1.Text:='';
  Combobox1.Items.Clear;
  Form5.ADOTable1.First;

  while not Form5.ADOTable1.Eof do begin
    Combobox1.Items.Add(Form5.ADOTable1.Fields[1].AsString);
    Form5.ADOTable1.Next;
  end;

  Form4.ADOTable2.Filter:= 'Masina_ID = ' + Form1.ADOQuery1.FieldByName('ID').AsString;
  Form4.ADOTable2.Filtered:=True;
end;

procedure TForm4.FormResize(Sender: TObject);
begin
  DBGrid1.Width:= Form4.Width - 30;
  DBGrid1.Height:= Form4.Height - 170;
end;

end.
