﻿unit Case04.FrmMain;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  TypInfo,
  DeepStar.Utils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Case04.GameData;

type
  TCase04_FrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ImageList160x160: TImageList;
    ImageList160x80: TImageList;
    ImageList80x80: TImageList;
    ImageList80x160: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1DragDrop(Sender, Source: TObject; X, Y: integer);
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: integer;
      State: TDragState; var Accept: boolean);
    procedure Panel1Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    _GameData: TGameData;
    _ImX: integer;
    _ImY: integer;
    _PnX: integer;
    _PnY: integer;

    _JpgCaocao: integer;
    _JpgBing: integer;
    _JpgGuanyu: integer;
    _JpgHuangzhong: integer;
    _JpgMachao: integer;
    _JpgZhangfei: integer;
    _JpgZhaoyun: integer;

    _ImCaocao: TImage;
    _ImGuanyu: TImage;
    _ImHuangzhong: TImage;
    _ImMachao: TImage;
    _ImZhangfei: TImage;
    _ImZhaoyun: TImage;
    _ImBing1: TImage;
    _ImBing2: TImage;
    _ImBing3: TImage;
    _ImBing4: TImage;
    _startDate: TTime;

    procedure __LoadImage;
    procedure __InitCheckerBoard;
    procedure __ImageStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure __ImageEndDrag(Sender, Target: TObject; X, Y: integer);
    procedure __ImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);

  public

  end;

var
  Case04_FrmMain: TCase04_FrmMain;

implementation

uses
  Case04.FrmSplash,
  Case04.StrConsts,
  Case04.DragObject;

{$R *.frm}

{ TCase04_FrmMain }

procedure TCase04_FrmMain.Button1Click(Sender: TObject);
var
  i: integer;
  im: TImage;
begin
  _startDate := now;
  Timer1.Enabled := true;

  if _GameData <> nil then
    FreeAndNil(_GameData);
  _GameData := TGameData.Create;

  for i := Panel1.ControlCount - 1 downto 0 do
  begin
    if Panel1.Controls[i] is TImage then
    begin
      im := Panel1.Controls[i] as TImage;
      FreeAndNil(im);
    end;
  end;

  __InitCheckerBoard;
end;

procedure TCase04_FrmMain.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TCase04_FrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Case04_FrmSplash.Close;
end;

procedure TCase04_FrmMain.FormCreate(Sender: TObject);
begin
  Self.Color := FRM_COLOR;
  Self.Caption := STR_GAME_NAME;

  _GameData := TGameData.Create;
  __LoadImage;
  __InitCheckerBoard;

  Panel1.Width := FIX_PIXEL * 4;
  Panel1.Height := FIX_PIXEL * 5;
  Panel1.Top := 10;
  Panel1.Left := 10;

  Panel2.Width := Panel1.Width + 20;
  Panel2.Height := Panel1.Height + 20;

  Label1.Top := Panel2.Top;
  Label1.Left := Panel2.BaseBounds.Right + 10;
  Label1.Caption := STR_GAME_BEGIN;

  Label2.Top := Panel2.BaseBounds.Bottom + 10;
  Label2.Caption := Format(STR_GAME_TIME, [TimeToStr(0)]);

  Button1.Left := Label1.Left + 30;
  Button1.Top := Label2.Top - 20;

  Button2.Top := Button1.Top;
  Button2.Left := Button1.BaseBounds.Right + 10;

  Self.Width := Label1.BaseBounds.Right + 10;
  Self.Height := Button1.BaseBounds.Bottom + 25;

  _startDate := Now;
end;

procedure TCase04_FrmMain.FormDestroy(Sender: TObject);
begin
  _GameData.Free;
end;

procedure TCase04_FrmMain.FormShow(Sender: TObject);
begin
  Case04_FrmSplash := TCase04_FrmSplash.Create(Self);
  Case04_FrmSplash.ShowModal;
end;

procedure TCase04_FrmMain.Panel1DragDrop(Sender, Source: TObject; X, Y: integer);
begin
  _PnX := x;
  _PnY := y;
end;

procedure TCase04_FrmMain.Panel1DragOver(Sender, Source: TObject; X, Y: integer;
  State: TDragState; var Accept: boolean);
var
  Control: TControl;
begin
  if Source is TControl then
    Control := Source as TControl
  else
  if Source is TDragControlObject then
    Control := (Source as TDragControlObject).Control
  else
    Control := nil;

  Accept := Control is TImage;
end;

procedure TCase04_FrmMain.Panel1Paint(Sender: TObject);
var
  cvs: TCanvas;
  jpg: TJPEGImage;
  rect: TRect;
begin
  cvs := Panel1.Canvas;

  jpg := TJPEGImage.Create();
  try
    jpg.LoadFromFile(CrossFixFileName(JPG_BACKGROUND_FILE));
    rect := TRect.Create(0, 0, Panel1.Width, Panel1.Height);
    cvs.StretchDraw(rect, jpg);
  finally
    jpg.Free;
  end;
end;

procedure TCase04_FrmMain.Timer1Timer(Sender: TObject);
var
  s: string;
begin
  s := TimeToStr(now - _startDate);
  Label2.Caption := Format(STR_GAME_TIME, [s]);

  if _GameData.Completed then
  begin
    Timer1.Enabled := false;

    case MessageDlg(STR_GAME_COMPLETED, mtInformation, [mbYes, mbNo], 0) of
      mrYes: Button1Click(Sender);
    end;
  end;
end;

procedure TCase04_FrmMain.__ImageEndDrag(Sender, Target: TObject; X, Y: integer);
var
  dt: TDirection;
  im: TImage;
  p: TPoint;
begin
  im := (Sender as TImage);

  p := _GameData.MoveOut(im.Parent, im, _ImX, _ImY);
  dt := _GameData.Direction;
  im.Top := p.Y;
  im.Left := p.X;

  Caption := GetEnumName(TypeInfo(TDirection), Ord(dt));
end;

procedure TCase04_FrmMain.__ImageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  _ImX := X;
  _ImY := Y;
end;

procedure TCase04_FrmMain.__ImageStartDrag(Sender: TObject; var DragObject: TDragObject);
var
  bmp: TBitmap;
  im: TImage;
begin
  im := (Sender as TImage);

  bmp := TBitmap.Create;
  try
    bmp.SetSize(im.Width, im.Height);
    bmp.Assign((Sender as TImage).Picture.Bitmap);
    DragObject := TDragObjectEx.Create(Sender as TControl, bmp);
  finally
    bmp.Free;
  end;
end;

procedure TCase04_FrmMain.__InitCheckerBoard;
var
  i: integer;
begin
  {$REGION '棋子初始化'}
  _ImMachao := TImage.Create(Self.Panel1);
  with _ImMachao do
  begin
    Name := '_ImMachao';
    Tag := 2;
    Parent := Self.Panel1;
    AutoSize := true;
    Top := 0;
    Left := 0;
    ImageList80x160.GetBitmap(_JpgMachao, Picture.Bitmap);
  end;

  _ImCaocao := TImage.Create(Self.Panel1);
  with _ImCaocao do
  begin
    Name := '_ImCaocao';
    Tag := 4;
    Parent := Self.Panel1;
    Width := ImageList160x160.Width;
    Height := ImageList160x160.Height;
    Top := 0;
    Left := FIX_PIXEL;
    ImageList160x160.GetBitmap(_JpgCaocao, Picture.Bitmap);
  end;

  _ImZhaoyun := TImage.Create(Self.Panel1);
  with _ImZhaoyun do
  begin
    Name := '_ImZhaoyun';
    Tag := 2;
    Parent := Self.Panel1;
    Width := ImageList80x160.Width;
    Height := ImageList80x160.Height;
    Top := 0;
    Left := FIX_PIXEL * 3;
    ImageList80x160.GetBitmap(_JpgZhaoyun, Picture.Bitmap);
  end;

  _ImZhangfei := TImage.Create(Self.Panel1);
  with _ImZhangfei do
  begin
    Name := '_ImZhangfei';
    Tag := 2;
    Parent := Self.Panel1;
    Width := ImageList80x160.Width;
    Height := ImageList80x160.Height;
    Top := FIX_PIXEL * 2;
    Left := 0;
    ImageList80x160.GetBitmap(_JpgZhangfei, Picture.Bitmap);
  end;

  _ImGuanyu := TImage.Create(Self.Panel1);
  with _ImGuanyu do
  begin
    Name := '_ImGuanyu';
    Tag := 3;
    Parent := Self.Panel1;
    Width := ImageList160x80.Width;
    Height := ImageList160x80.Height;
    Top := FIX_PIXEL * 2;
    Left := FIX_PIXEL;
    ImageList160x80.GetBitmap(_JpgGuanyu, Picture.Bitmap);
  end;

  _ImHuangzhong := TImage.Create(Self.Panel1);
  with _ImHuangzhong do
  begin
    Name := '_ImHuangzhong';
    Tag := 2;
    Parent := Self.Panel1;
    Width := ImageList80x160.Width;
    Height := ImageList80x160.Height;
    Top := FIX_PIXEL * 2;
    Left := FIX_PIXEL * 3;
    ImageList80x160.GetBitmap(_JpgHuangzhong, Picture.Bitmap);
  end;

  _ImBing1 := TImage.Create(Self.Panel1);
  with _ImBing1 do
  begin
    Name := '_ImBing1';
    Tag := 1;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 4;
    Left := 0;
    ImageList80x80.GetBitmap(_JpgBing, Picture.Bitmap);
  end;

  _ImBing2 := TImage.Create(Self.Panel1);
  with _ImBing2 do
  begin
    Name := '_ImBing2';
    Tag := 1;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 3;
    Left := FIX_PIXEL;
    ImageList80x80.GetBitmap(_JpgBing, Picture.Bitmap);
  end;

  _ImBing3 := TImage.Create(Self.Panel1);
  with _ImBing3 do
  begin
    Name := '_ImBing3';
    Tag := 1;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 3;
    Left := FIX_PIXEL * 2;
    ImageList80x80.GetBitmap(_JpgBing, Picture.Bitmap);
  end;

  _ImBing4 := TImage.Create(Self.Panel1);
  with _ImBing4 do
  begin
    Name := '_ImBing4';
    Tag := 1;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 4;
    Left := FIX_PIXEL * 3;
    ImageList80x80.GetBitmap(_JpgBing, Picture.Bitmap);
  end;
  {$ENDREGION}

  for i := 0 to Panel1.ControlCount - 1 do
  begin
    if Panel1.Controls[i] is TImage then
    begin
      (Panel1.Controls[i] as TImage).AutoSize := true;
      (Panel1.Controls[i] as TImage).OnMouseMove := @__ImageMouseMove;
      (Panel1.Controls[i] as TImage).OnStartDrag := @__ImageStartDrag;
      (Panel1.Controls[i] as TImage).OnEndDrag := @__ImageEndDrag;
      (Panel1.Controls[i] as TImage).DragMode := TDragMode.dmAutomatic;
    end;
  end;
end;

procedure TCase04_FrmMain.__LoadImage;
var
  jpg: TJPEGImage;
begin
  ImageList160x160.Width := FIX_PIXEL * 2;
  ImageList160x160.Height := FIX_PIXEL * 2;

  ImageList80x80.Width := FIX_PIXEL;
  ImageList80x80.Height := FIX_PIXEL;

  ImageList80x160.Width := FIX_PIXEL;
  ImageList80x160.Height := FIX_PIXEL * 2;

  ImageList160x80.Width := FIX_PIXEL * 2;
  ImageList160x80.Height := FIX_PIXEL;

  jpg := TJPEGImage.Create;
  try
    jpg.LoadFromFile(CrossFixFileName(JPG_CAOCAO_FILE));
    _JpgCaocao := ImageList160x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_BING_FILE));
    _JpgBing := ImageList80x80.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_GUANYU_FILE_H));
    _JpgGuanyu := ImageList160x80.add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_HUANGZHONG_FILE_S));
    _JpgHuangzhong := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_MACHAO_FILE_S));
    _JpgMachao := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_ZHANGFEI_FILE_S));
    _JpgZhangfei := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_ZHAOYUN_FILE_S));
    _JpgZhaoyun := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;
  finally
    jpg.Free;
  end;
end;

end.
