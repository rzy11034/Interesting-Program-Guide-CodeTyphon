unit Case05.FrmMain;

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
  ExtCtrls,
  Menus,
  ComCtrls,
  ActnList,
  StdActns,
  StdCtrls,
  lclvlc,
  vlc;

type
  TCase05_FrmMain = class(TForm)
    ActionRecord: TAction;
    ActionPause: TAction;
    ActionStop: TAction;
    ActionMedia: TAction;
    ActionOpen: TAction;
    ActionExit: TAction;
    ActionContral: TAction;
    ActionPlay: TAction;
    ActionList1: TActionList;
    OpenDialog1: TOpenDialog;
    VLCPlayer: TLCLVLCPlayer;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure ActionContralExecute(Sender: TObject);
    procedure ActionMediaExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure ActionPlayExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _VlcLib: TVLCLibrary;
    _FileName: string;
  public

  end;

var
  Case05_FrmMain: TCase05_FrmMain;

implementation

const
  MEDIA_PATH = '..\..\Source\Case05\media';
  LIB_PATH = '..\..\Source\Case05\Runtimes\VLC';

{$R *.frm}

{ TCase05_FrmMain }

procedure TCase05_FrmMain.ActionContralExecute(Sender: TObject);
begin
  Exit;
end;

procedure TCase05_FrmMain.ActionMediaExecute(Sender: TObject);
begin
  Exit;
end;

procedure TCase05_FrmMain.ActionOpenExecute(Sender: TObject);
begin
  OpenDialog1.InitialDir := MEDIA_PATH;

  if OpenDialog1.Execute then
  begin
    _FileName := OpenDialog1.FileName;
    VLCPlayer.PlayFile(_FileName);
  end;
end;

procedure TCase05_FrmMain.ActionPlayExecute(Sender: TObject);
begin
  VLCPlayer.PlayFile(_FileName);
end;

procedure TCase05_FrmMain.FormCreate(Sender: TObject);
begin
  _VlcLib := TVLCLibrary.Create(Self);
  _VlcLib.LibraryPath := LIB_PATH + PathDelim;
  _VlcLib.Initialize;
end;

end.
