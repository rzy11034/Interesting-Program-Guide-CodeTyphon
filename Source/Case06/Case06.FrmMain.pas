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
  ActnList,
  ExtCtrls;

type
  TCase06_FrmMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuItemFile: TMenuItem;
    MenuItemWindows: TMenuItem;
    MenuItemNew: TMenuItem;
    MenuItemOpen: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemTile: TMenuItem;
    MenuItemCascade: TMenuItem;
    MenuItemArrangeicons: TMenuItem;
    OpenDialog: TOpenDialog;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MenuItemArrangeiconsClick(Sender: TObject);
    procedure MenuItemCascadeClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemNewClick(Sender: TObject);
    procedure MenuItemOpenClick(Sender: TObject);
    procedure MenuItemTileClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure __WindowMenuItemClick(Sender: TObject);
  public
    procedure ClearWindowMenu;
    procedure UpdateWindowMenu;
  end;

var
  Case06_FrmMain: TCase06_FrmMain;

implementation

uses
  Case06.FrmEdit;

{$R *.frm}

{ TCase06_FrmMain }

procedure TCase06_FrmMain.ClearWindowMenu;
begin
  while MenuItemWindows.Count > 4 do
    MenuItemWindows.Items[4].Free;
end;

procedure TCase06_FrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  while MDIChildCount > 0  do
    MDIChildren[0].Free;
end;

procedure TCase06_FrmMain.FormCreate(Sender: TObject);
begin
  ClearWindowMenu;
end;

procedure TCase06_FrmMain.MenuItemArrangeiconsClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TCase06_FrmMain.MenuItemCascadeClick(Sender: TObject);
begin
  Cascade;
end;

procedure TCase06_FrmMain.MenuItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TCase06_FrmMain.MenuItemNewClick(Sender: TObject);
begin
  TCase06_FrmEdit.Create(Self);
  UpdateWindowMenu;
end;

procedure TCase06_FrmMain.MenuItemOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    with TCase06_FrmEdit.Create(Self) do
    begin
      Open(OpenDialog.FileName);
    end;
  end;
end;

procedure TCase06_FrmMain.MenuItemTileClick(Sender: TObject);
begin
  Tile;
end;

procedure TCase06_FrmMain.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  MenuItemNew.Click;
  UpdateWindowMenu;
end;

procedure TCase06_FrmMain.UpdateWindowMenu;
var
  i: integer;
  windowMenuItem: TMenuItem;
  s: string;
begin
  ClearWindowMenu;

  for i := 0 to MDIChildCount - 1 do
  begin
    windowMenuItem := TMenuItem.Create(Self);

    if i < 9 then
    begin
      s := '&' + (i + 1).ToString + '. ' + MDIChildren[i].Caption;
      windowMenuItem.Caption := s;
    end
    else
    begin
      s := MDIChildren[i].Caption;
      windowMenuItem.Caption := s;
    end;

    windowMenuItem.Tag := i;
    windowMenuItem.OnClick := @__WindowMenuItemClick;
    MenuItemWindows.Add(windowMenuItem);
  end;
end;

procedure TCase06_FrmMain.__WindowMenuItemClick(Sender: TObject);
begin
  MDIChildren[TMenuItem(Sender).Tag].BringToFront;
  UpdateWindowMenu;
end;

end.
