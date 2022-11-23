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
  StdCtrls,
  DBCtrls,
  DBGrids, ExtCtrls;

type
  TCase07_FrmMain = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery1ID: TAutoIncField;
    SQLQuery1Name: TStringField;
    SQLQuery1Number: TLongintField;
    SQLTransaction1: TSQLTransaction;
    Timer1: TTimer;
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Case07_FrmMain: TCase07_FrmMain;

implementation

uses
  TypInfo;

{$R *.frm}

{ TCase07_FrmMain }

procedure TCase07_FrmMain.Button10Click(Sender: TObject);
begin
  SQLQuery1.Refresh;
end;

procedure TCase07_FrmMain.Button1Click(Sender: TObject);
begin
  SQLQuery1.First;
end;

procedure TCase07_FrmMain.Button2Click(Sender: TObject);
begin
  SQLQuery1.Prior;
end;

procedure TCase07_FrmMain.Button3Click(Sender: TObject);
begin
  SQLQuery1.Next;
end;

procedure TCase07_FrmMain.Button4Click(Sender: TObject);
begin
  SQLQuery1.Last;
end;

procedure TCase07_FrmMain.Button5Click(Sender: TObject);
begin
  SQLQuery1.Insert;
end;

procedure TCase07_FrmMain.Button6Click(Sender: TObject);
begin
  SQLQuery1.Delete;
end;

procedure TCase07_FrmMain.Button7Click(Sender: TObject);
begin
  SQLQuery1.Edit;
end;

procedure TCase07_FrmMain.Button8Click(Sender: TObject);
begin
  SQLQuery1.Post;
  SQLQuery1.ApplyUpdates;
end;

procedure TCase07_FrmMain.Button9Click(Sender: TObject);
begin
  SQLQuery1.Cancel;
end;

procedure TCase07_FrmMain.DataSource1StateChange(Sender: TObject);
var
  pt: PTypeInfo;
begin
  pt := PTypeInfo(TypeInfo(TDataSetState));
  Caption := GetEnumName(pt, Ord(DataSource1.State));
end;

procedure TCase07_FrmMain.FormCreate(Sender: TObject);
begin
  SQLQuery1.Open;
end;

procedure TCase07_FrmMain.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;

  DBGrid1.row
end;

end.
