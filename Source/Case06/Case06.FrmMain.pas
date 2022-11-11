unit Case06.FrmMain;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  Menus,
  ActnList;

type
  TCase06_FrmMain = class(TForm)
    ActionArrangeicons: TAction;
    ActionCascade: TAction;
    ActionTile: TAction;
    ActionOpen: TAction;
    ActionNew: TAction;
    ActionExit: TAction;
    ActionFile: TAction;
    ActionWindows: TAction;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    OpenDialog1: TOpenDialog;
    Separator1: TMenuItem;
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionNewExecute(Sender: TObject);
    procedure ActionNil(Sender: TObject);
  private


  public

  end;

var
  Case06_FrmMain: TCase06_FrmMain;

implementation

uses
  Case06.FrmEdit;

{$R *.frm}

{ TCase06_FrmMain }

procedure TCase06_FrmMain.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TCase06_FrmMain.ActionNewExecute(Sender: TObject);
begin
  TCase06_FrmEdit.Create(Self);
end;

procedure TCase06_FrmMain.ActionNil(Sender: TObject);
begin
  Exit;
end;

end.
