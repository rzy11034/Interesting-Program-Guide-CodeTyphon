unit Case06.FrmEdit;

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
  RichMemo;

type
  TCase06_FrmEdit = class(TForm)
    Editor: TRichMemo;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    PopupMenu1: TPopupMenu;
    Separator1: TMenuItem;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  Case06_FrmEdit: TCase06_FrmEdit;

implementation

{$R *.frm}

{ TCase06_FrmEdit }

procedure TCase06_FrmEdit.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := TCloseAction.caFree;
end;

procedure TCase06_FrmEdit.FormCreate(Sender: TObject);
begin
  Editor.Align := TAlign.alClient;
end;

procedure TCase06_FrmEdit.FormDestroy(Sender: TObject);
begin
  Self := nil;
end;

end.
