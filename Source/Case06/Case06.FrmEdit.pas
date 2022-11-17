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
  StdCtrls,
  Menus,
  PrintersDlgs,
  RichMemo;

type
  TCase06_FrmEdit = class(TForm)
    MainMenu1: TMainMenu;
    MenuItemSummer: TMenuItem;
    MenuItemMoring: TMenuItem;
    MenuItemAfternoon: TMenuItem;
    MenuItemWar: TMenuItem;
    MenuItemCity: TMenuItem;
    MenuItemXiaKeXing: TMenuItem;
    MenuItemBaguwen: TMenuItem;
    MenuItemCenter: TMenuItem;
    MenuItemFont: TMenuItem;
    MenuItemWordwarp: TMenuItem;
    MenuItemRight: TMenuItem;
    MenuItemLeft: TMenuItem;
    MenuItemCharacter: TMenuItem;
    MenuItemUndo: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemDelete: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemCut: TMenuItem;
    MenuItemPrinterSetup: TMenuItem;
    MenuItemPrint: TMenuItem;
    MenuItemFile: TMenuItem;
    MenuItemOpen: TMenuItem;
    MenuItemSaveAs: TMenuItem;
    MenuItemSave: TMenuItem;
    MenuItemClose: TMenuItem;
    MenuItemNew: TMenuItem;
    MenuItemExit: TMenuItem;
    Editor: TRichMemo;
    PrintDialog: TPrintDialog;
    PrinterSetupDialog: TPrinterSetupDialog;
    SaveDialog: TSaveDialog;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    Separator4: TMenuItem;
    Separator5: TMenuItem;
    Separator6: TMenuItem;
    Separator7: TMenuItem;
    procedure EditorKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItemCloseClick(Sender: TObject);
    procedure MenuItemCopyClick(Sender: TObject);
    procedure MenuItemCutClick(Sender: TObject);
    procedure MenuItemDeleteClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemNewClick(Sender: TObject);
    procedure MenuItemOpenClick(Sender: TObject);
    procedure MenuItemPasteClick(Sender: TObject);
    procedure MenuItemPrintClick(Sender: TObject);
    procedure MenuItemPrinterSetupClick(Sender: TObject);
    procedure MenuItemSaveAsClick(Sender: TObject);
    procedure MenuItemSaveClick(Sender: TObject);
    procedure MenuItemSelectAllClick(Sender: TObject);
    procedure MenuItemUndoClick(Sender: TObject);
    procedure AlignClick(Sender: TObject);
    procedure MenuItemWordwarpClick(Sender: TObject);
    procedure MenuItemXiaKeXingClick(Sender: TObject);
  private
    _PathName: string;
  public
    procedure Open(const fileName: string);
  end;

var
  Case06_FrmEdit: TCase06_FrmEdit;

implementation

uses
  Case06.FrmMain;

const
  DefaultFileName = 'Untitled';

var
  FrmMain: TCase06_FrmMain;
  FrmCount: integer = 0;

{$R *.frm}

{ TCase06_FrmEdit }

procedure TCase06_FrmEdit.AlignClick(Sender: TObject);
begin
  MenuItemLeft.Checked := false;
  MenuItemRight.Checked := false;
  MenuItemCenter.Checked := false;

  (Sender as TMenuItem).Checked := true;

  if MenuItemLeft.Checked then
    Editor.SetParaAlignment(Editor.SelStart, Editor.SelLength, TParaAlignment.paLeft)
  else if MenuItemRight.Checked then
    Editor.SetParaAlignment(Editor.SelStart, Editor.SelLength, TParaAlignment.paRight)
  else
    Editor.SetParaAlignment(Editor.SelStart, Editor.SelLength, TParaAlignment.paCenter);
end;

procedure TCase06_FrmEdit.EditorKeyPress(Sender: TObject; var Key: char);
begin
  Editor.Modified := true;
end;

procedure TCase06_FrmEdit.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction := TCloseAction.caFree;
end;

procedure TCase06_FrmEdit.FormCloseQuery(Sender: TObject; var CanClose: boolean);
const
  SWarningText = 'Save changes to %s?';
begin
  if Editor.Modified then
  begin
    case MessageDlg(Format(SWarningText, [_PathName]), mtConfirmation,
        [mbYes, mbNo, mbCancel], 0) of
      mrYes:
      begin
        MenuItemSaveClick(Sender);
      end;
      mrCancel:
      begin
        CanClose := false;
      end;
    end;
  end;
end;

procedure TCase06_FrmEdit.FormCreate(Sender: TObject);
begin
  _PathName := DefaultFileName;
  FrmCount += 1;
  Caption := _PathName + FrmCount.ToString;
  Editor.Align := TAlign.alClient;
  Editor.Modified := false;

  FrmMain := Case06_FrmMain;
end;

procedure TCase06_FrmEdit.FormDestroy(Sender: TObject);
begin
  Self := nil;
end;

procedure TCase06_FrmEdit.MenuItemCloseClick(Sender: TObject);
begin
  Close
end;

procedure TCase06_FrmEdit.MenuItemCopyClick(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TCase06_FrmEdit.MenuItemCutClick(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TCase06_FrmEdit.MenuItemDeleteClick(Sender: TObject);
begin
  Editor.ClearSelection;
end;

procedure TCase06_FrmEdit.MenuItemExitClick(Sender: TObject);
begin
  FrmMain.MenuItemExitClick(Sender);
end;

procedure TCase06_FrmEdit.MenuItemNewClick(Sender: TObject);
begin
  FrmMain.MenuItemNewClick(Sender);
end;

procedure TCase06_FrmEdit.MenuItemOpenClick(Sender: TObject);
begin
  FrmMain.MenuItemOpenClick(Sender);
end;

procedure TCase06_FrmEdit.MenuItemPasteClick(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TCase06_FrmEdit.MenuItemPrintClick(Sender: TObject);
var
  prm: TPrintParams;
begin
  if PrintDialog.Execute then
  begin
    InitPrintParams(prm);
    prm.SelStart := Editor.SelStart;
    prm.SelLength := Editor.SelLength;
    prm.JobTitle := 'Rich Memo Printing';
    Editor.Print(prm);
  end;
end;

procedure TCase06_FrmEdit.MenuItemPrinterSetupClick(Sender: TObject);
begin
  PrinterSetupDialog.Execute;
end;

procedure TCase06_FrmEdit.MenuItemSaveAsClick(Sender: TObject);
begin
  SaveDialog.FileName := _PathName;
  if SaveDialog.Execute then
  begin
    _PathName := SaveDialog.FileName;
    Caption := ExtractFileName(_PathName);
    MenuItemSaveClick(Sender);
  end;
end;

procedure TCase06_FrmEdit.MenuItemSaveClick(Sender: TObject);
begin
  if _PathName = DefaultFileName then
    MenuItemSaveAsClick(Sender)
  else
  begin
    Editor.Lines.DefaultEncoding := TEncoding.UTF8;
    Editor.Lines.SaveToFile(_PathName);
    Editor.Modified := false;
  end;
end;

procedure TCase06_FrmEdit.MenuItemSelectAllClick(Sender: TObject);
begin
  Editor.SelectAll;
end;

procedure TCase06_FrmEdit.MenuItemUndoClick(Sender: TObject);
begin
  Editor.Undo;
end;

procedure TCase06_FrmEdit.MenuItemWordwarpClick(Sender: TObject);
begin
  Editor.WordWrap := not Editor.WordWrap;

  if Editor.WordWrap then

    Editor.ScrollBars := TScrollStyle.ssVertical
  else
    Editor.ScrollBars := TScrollStyle.ssBoth;

  MenuItemWordwarp.Checked := Editor.WordWrap;
end;

procedure TCase06_FrmEdit.MenuItemXiaKeXingClick(Sender: TObject);
begin
  with Editor.Lines do
  begin
    Add('赵客缦胡缨，吴钩霜雪明。银鞍照白马，疯沓如流星。');
    Add('十步杀一人，千里不留行。事了拂衣去，深藏身与名。');
    Add('闲过信陵饮，脱剑膝前横。将炙啖朱亥，持觞劝侯嬴。');
    Add('三杯吐然诺，五岳倒为轻。眼花耳热后，意气素霓生。');
    Add('救赵挥金锤，邯郸先震惊。千秋二壮士，烜赫大梁城。');
    Add('纵死侠骨香，不惭世上英。谁能书阁下，白首太玄经？');
  end;
end;

procedure TCase06_FrmEdit.Open(const fileName: string);
begin
  _PathName := fileName;
  Caption := ExtractFileName(fileName);

  Editor.Lines.LoadFromFile(fileName);
  Editor.SelStart := 0;
  Editor.Modified := false;

  FrmMain.UpdateWindowMenu;
end;

end.
