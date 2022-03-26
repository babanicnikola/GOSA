unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.Win.ADODB;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  buttonSelected: integer;

implementation

{$R *.dfm}

uses Unit1, Unit7;

procedure TForm5.Button1Click(Sender: TObject);
begin
  if (Form5.Edit1.Text='') then
    ShowMessage('Unesi naziv!')
  else
    if Form5.ADOTable1.Locate('Naziv', Form5.Edit1.Text, []) = true then
      ShowMessage('Vec postoji element sa zadatim imenom!')
    else
      begin
        ADOTable1.Open;
        ADOTable1.Append;
        ADOTable1.FieldByName('Naziv').AsString:= Form5.Edit1.Text;
        ADOTable1.Post;
        ADOTable1.Refresh;
        Edit1.Text:='';
        ShowMessage('Uspesno unet element!')
      end;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  buttonSelected := messagedlg('Da li ste sigurni?',mtCustom,[mbYes,mbCancel], 0);

  if buttonSelected = mrYes then
    begin
      Form5.ADOTable1.Locate('ID','Naziv', [loPartialKey]);
      Form5.ADOTable1.Delete;
    end;

  ADOTable1.First;
end;

end.
