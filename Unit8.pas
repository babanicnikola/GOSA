unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, System.UITypes, Unit9, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TForm8 = class(TForm)
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    Dodajkvar1: TMenuItem;
    Obrisikvar1: TMenuItem;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Obrisikvar1Click(Sender: TObject);
    procedure Dodajkvar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  buttonSelected: integer;

implementation

{$R *.dfm}

procedure TForm8.Dodajkvar1Click(Sender: TObject);
begin
  Form9.Visible:=True;
end;

procedure TForm8.FormActivate(Sender: TObject);
begin
  DBGridEh1.Width:= Form8.Width;
end;

procedure TForm8.FormResize(Sender: TObject);
begin
  DBGridEh1.Width:= Form8.Width - 30;
  DBGridEh1.Height:= Form8.Height - 80;
end;

procedure TForm8.Obrisikvar1Click(Sender: TObject);
begin
  buttonSelected := messagedlg('Da li ste sigurni?',mtCustom, [mbYes,mbNo], 0);

  if buttonSelected = mrYes then
    begin
      Form8.ADOQuery1.Locate('KvarID','Naziv_masine', [loPartialKey]);
      Form8.ADOQuery1.Delete;
    end;
end;

end.
