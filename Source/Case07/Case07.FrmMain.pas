unit Case07.FrmMain;

{$mode ObjFPC}{$H+}
//{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils, SQLite3DS, DB,
  Forms,
  Controls,
  Graphics,
  Dialogs, DBCtrls;

type
  TCase07_FrmMain = class(TForm)
    DataSource1: TDataSource;
    DBText1: TDBText;
    Sqlite3Dataset1: TSqlite3Dataset;
  private

  public

  end;

var
  Case07_FrmMain: TCase07_FrmMain;

implementation

{$R *.frm}

end.
