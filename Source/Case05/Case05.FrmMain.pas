unit Case05.FrmMain;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math,
  DateUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  Menus,
  ComCtrls,
  ActnList,
  Buttons,
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
    ImageList1: TImageList;
    ImageList2: TImageList;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    TrackBarVideoPosition: TTrackBar;
    TrackBarAudioVolume: TTrackBar;
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
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure ActionContralExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionMediaExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure ActionPauseExecute(Sender: TObject);
    procedure ActionPlayExecute(Sender: TObject);
    procedure ActionStopExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBarAudioVolumeChange(Sender: TObject);
    procedure TrackBarVideoPositionMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    _VlcLib: TVLCLibrary;
    _FileName: string;
    _VideoLength: QWord;
    _Frm: TFrame;
    _AudioVolume: -1..100;
  public

  end;

var
  Case05_FrmMain: TCase05_FrmMain;

implementation

const
  MEDIA_PATH = '..\..\Source\Case05\media';
  LIB_PATH = '..\..\Source\Case05\Runtimes\VLC';

  TOTAL_TIME = '时长：%s';
  CURRENT_TIME = '当前播放：%s';

{$R *.frm}

{ TCase05_FrmMain }

procedure TCase05_FrmMain.ActionContralExecute(Sender: TObject);
begin
  Exit;
end;

procedure TCase05_FrmMain.ActionExitExecute(Sender: TObject);
begin
  Close;
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
    ActionPlay.Execute;
  end;
end;

procedure TCase05_FrmMain.ActionPauseExecute(Sender: TObject);
begin
  if VLCPlayer.Playing then
  begin
    VLCPlayer.Pause;
    Timer1.Enabled := false;
    ActionPause.Caption := '取消暂停(&P)';
  end
  else
  begin
    VLCPlayer.Pause;
    Timer1.Enabled := true;
    ActionPause.Caption := '暂停(&P)';
  end;
end;

procedure TCase05_FrmMain.ActionPlayExecute(Sender: TObject);
var
  tempTime: TTime;
  i: integer;
begin
  ActionStop.Execute;

  _Frm := TFrame.Create(Self);
  _Frm.Parent := Self.Panel1;
  _Frm.Align := TAlign.alClient;

  VLCPlayer.ParentWindow := _Frm;
  VLCPlayer.PlayFile(_FileName);

  Sleep(1000);
  _VideoLength := VLCPlayer.VideoLength;

  if _AudioVolume = -1 then
    _AudioVolume := VLCPlayer.AudioVolume
  else
    VLCPlayer.AudioVolume := _AudioVolume;

  tempTime := VLCTimeToDateTime(_VideoLength);

  with StatusBar1 do
  begin
    Panels[0].Text := Format(TOTAL_TIME, [TimeToStr(tempTime)]);
    Panels[2].Text := _FileName;
  end;

  Timer1.Enabled := true;

  TrackBarVideoPosition.Max := SecondOf(tempTime);
  TrackBarVideoPosition.Position := 0;
end;

procedure TCase05_FrmMain.ActionStopExecute(Sender: TObject);
var
  i: integer;
begin
  if _Frm <> nil then
    FreeAndNil(_Frm);

  VLCPlayer.Stop;

  for i := 0 to StatusBar1.Panels.Count - 1 do
    StatusBar1.Panels[i].Text := '';

  Timer1.Enabled := false;
end;

procedure TCase05_FrmMain.FormCreate(Sender: TObject);
begin
  Panel1.Color := clBlack;
  _AudioVolume := 50;
  TrackBarAudioVolume.Position := _AudioVolume;

  _VlcLib := TVLCLibrary.Create(Self);
  _VlcLib.LibraryPath := LIB_PATH + PathDelim;
  _VlcLib.Initialize;

  _FileName := MEDIA_PATH + PathDelim + 'small.mp4';
  ActionPlay.Execute;
end;

procedure TCase05_FrmMain.FormDestroy(Sender: TObject);
begin
  _VlcLib.Free;
end;

procedure TCase05_FrmMain.SpeedButton1Click(Sender: TObject);
begin
  if VLCPlayer.AudioMuted = false then
  begin
    VLCPlayer.AudioMuted := true;
    SpeedButton1.ImageIndex := 0;
  end
  else
  begin
    VLCPlayer.AudioMuted := false;
    SpeedButton1.ImageIndex := 1;
  end;
end;

procedure TCase05_FrmMain.Timer1Timer(Sender: TObject);
var
  tempTime: TTime;
begin
  tempTime := VLCTimeToDateTime(VLCPlayer.VideoPosition);
  StatusBar1.Panels[1].Text := Format(CURRENT_TIME, [TimeToStr(tempTime)]);

  Caption := VLCPlayer.VideoPosition.ToString;

  TrackBarVideoPosition.Position := VLCPlayer.VideoPosition div 1000;
end;

procedure TCase05_FrmMain.TrackBarAudioVolumeChange(Sender: TObject);
begin
  VLCPlayer.AudioVolume := TrackBarAudioVolume.Position;
  WriteLn(TrackBarAudioVolume.Position);
end;

procedure TCase05_FrmMain.TrackBarVideoPositionMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  VLCPlayer.VideoPosition := TrackBarVideoPosition.Position * 1000;
end;

end.
