unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, EhLibADO;

type
  TForm7 = class(TForm)
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses Unit1, Unit5, Unit4;

procedure TForm7.AdvGlassButton1Click(Sender: TObject);
begin
  buttonSelected := messagedlg('Da li ste sigurni?',mtCustom,[mbYes,mbNo], 0);

  if buttonSelected = mrYes then
    begin
      Form7.ADOQuery1.Locate('Element_naziv','Opis', [loPartialKey]);
      Form7.ADOQuery1.Delete;
    end;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
  ADOQuery1.Active:=False;
  ADOQuery1.Active:=True;
end;

procedure TForm7.FormResize(Sender: TObject);
begin
  DBGridEh1.Width:= Form7.Width - 30;
  DBGridEh1.Height:= Form7.Height - 50;
end;

END.
