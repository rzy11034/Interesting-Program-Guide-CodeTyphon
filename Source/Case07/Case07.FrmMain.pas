unit Case07.FrmMain;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  SQLite3Conn,
  SQLDB,
  DB,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  DBGrids,
  StdCtrls,
  LCLType,
  ExtCtrls,
  ZConnection,
  ZDataset,
  ZSqlMonitor;

type
  TCase07_FrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Memo1: TMemo;
    Timer1: TTimer;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZSQLMonitor1: TZSQLMonitor;
    ZTransaction1: TZTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ZSQLMonitor1Trace(Sender: TObject;
      Event: TZLoggingEvent; var LogTrace: boolean);
  private

  public

  end;

var
  Case07_FrmMain: TCase07_FrmMain;

implementation

{$R *.frm}

{ TCase07_FrmMain }

procedure TCase07_FrmMain.Button1Click(Sender: TObject);
var
  s: string;
begin
  ZQuery1.Open;
  DBGrid1.Columns[0].Visible := false;
  System.str(ZQuery1.State, s);
  Caption := s;
end;

procedure TCase07_FrmMain.Button2Click(Sender: TObject);
var
  s: string;
begin
  System.str(ZQuery1.State, s);
  Caption := s;

  ZConnection1.StartTransaction;
  try
    if ZQuery1.State in [dsEdit, dsInsert] then
      ZQuery1.Post;

    System.str(ZQuery1.State, s);
    Caption := s;

    //ZQuery1.ApplyUpdates;
    ZConnection1.Commit;
  except
    ZConnection1.Rollback;
  end;
end;

procedure TCase07_FrmMain.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  Button1.Click;
end;

procedure TCase07_FrmMain.ZSQLMonitor1Trace(Sender: TObject;
  Event: TZLoggingEvent; var LogTrace: boolean);
begin
  Memo1.Lines.Add(Event.AsString);
  Memo1.Lines.Add('');
end;

end.
