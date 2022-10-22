unit Case03.FrmMain;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Buttons;

type
  TCase03_FrmMain = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    ImageList160x160: TImageList;
    ImageList160x80: TImageList;
    ImageList80x80: TImageList;
    ImageList80x160: TImageList;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure BitBtn1EndDrag(Sender, Target: TObject; X, Y: integer);
    procedure BitBtn1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1Paint(Sender: TObject);
    procedure Panel2Paint(Sender: TObject);
    procedure Panel3DragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
  private type
    TDirection = (Up, Right, Down, Left);

  private
    _Map: TArr2D_int;
    _Route: TDirection;
    _BeginPosition: TPoint;

    _JpgCaocao: integer;
    _JpgBing: integer;
    _JpgGuanyu: integer;
    _JpgHuangzhong: integer;
    _JpgMachao: integer;
    _JpgZhangfei: integer;
    _JpgZhaoyun: integer;

    _BitBtnCaocao: TBitBtn;
    _BitBtnGuanyu: TBitBtn;
    _BitBtnHuangzhong: TBitBtn;
    _BitBtnMachao: TBitBtn;
    _BitBtnZhangfei: TBitBtn;
    _BitBtnZhaoyun: TBitBtn;
    _BitBtnBing1: TBitBtn;
    _BitBtnBing2: TBitBtn;
    _BitBtnBing3: TBitBtn;
    _BitBtnBing4: TBitBtn;


    procedure __GameInit;
    procedure __LoadImage;
    procedure __InitBitBtn;
  public

  end;

var
  Case03_FrmMain: TCase03_FrmMain;

implementation

uses
  Case03.DragObject,
  Case03.StrConsts;

{$R *.frm}

{ TCase03_FrmMain }

var
  ax, ay: integer;

procedure TCase03_FrmMain.BitBtn1EndDrag(Sender, Target: TObject; X, Y: integer);
begin
  BitBtn1.SetBounds(x, y, BitBtn1.Width, BitBtn1.Height);
end;

procedure TCase03_FrmMain.BitBtn1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  DragObject := TDragObjectEx.Create(Sender as TControl);
end;

procedure TCase03_FrmMain.Button1Click(Sender: TObject);
var
  jpg: TJPEGImage;
begin
  Label1.Caption := GAME_OVER_STR;

  jpg := TJPEGImage.Create();
  try
    jpg.LoadFromFile(JPG_BACKGROUND_FILE);
    Self.Canvas.Draw(0, 0, jpg);
  finally
    jpg.Free;
  end;
end;

procedure TCase03_FrmMain.Button2Click(Sender: TObject);
begin
  Label1.Caption := GAME_INTRODUCE_STR;
end;

procedure TCase03_FrmMain.FormCreate(Sender: TObject);
begin
  Panel1.Width := FIX_PIXEL * 4;
  Panel1.Height := FIX_PIXEL * 5;
  Panel1.Top := 4;
  Panel1.Left := 4;

  Panel2.Width := Panel1.Width + 10;
  Panel2.Height := Panel1.Height + 10;

  __LoadImage;
  __InitBitBtn;
end;

procedure TCase03_FrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  Caption := Format('X:%d, Y:%d', [x, y]);
end;

procedure TCase03_FrmMain.Panel1Paint(Sender: TObject);
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

procedure TCase03_FrmMain.Panel2Paint(Sender: TObject);
var
  cvs: TCanvas;
  jpg: TJPEGImage;
  rect: TRect;
begin
  cvs := Panel2.Canvas;

  jpg := TJPEGImage.Create();
  try
    jpg.LoadFromFile(CrossFixFileName(JPG_BACKGROUND_FILE));
    rect := TRect.Create(0, 0, Panel2.Width, Panel2.Height);
    cvs.StretchDraw(rect, jpg);
  finally
    jpg.Free;
  end;
end;

procedure TCase03_FrmMain.Panel3DragOver(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
var
  i: integer;
begin
  //Accept := true;
  //
  //for i := 0 to Panel3.ControlCount-1 do
  //begin
  //  //Panel3.Controls[i].Enabled := false;
  //end;
  //
  //ax:=x;
  //ay:=y;
  //Caption := Format('X:%d, Y:%d', [x, y]);
end;

procedure TCase03_FrmMain.__GameInit;
begin
  _Map := [
    [2, 4, 4, 2],
    [2, 4, 4, 2],
    [2, 3, 3, 2],
    [2, 1, 1, 2],
    [1, 0, 0, 1]];
end;

procedure TCase03_FrmMain.__InitBitBtn;
begin
  _BitBtnMachao := TBitBtn.Create(Self.Panel1);
  with _BitBtnMachao do
  begin
    Name := '_BitBtnMachao';
    Caption := '';
    Tag := 2;
    Parent := Self.Panel1;
    Width := ImageList80x160.Width;
    Height := ImageList80x160.Height;
    Top := 0;
    Left := 0;
    Images := ImageList80x160;
    ImageIndex := _JpgMachao;
  end;

  _BitBtnCaocao := TBitBtn.Create(Self.Panel1);
  with _BitBtnCaocao do
  begin
    Name := '_BitBtnCaocao';
    Caption := '';
    Tag := 2;
    Parent := Self.Panel1;
    Width := ImageList160x160.Width;
    Height := ImageList160x160.Height;
    Top := 0;
    Left := 80;
    Images := ImageList160x160;
    ImageIndex := _JpgCaocao;
  end;

  _BitBtnZhaoyun := TBitBtn.Create(Self.Panel1);
  with _BitBtnZhaoyun do
  begin
    Name := '_BitBtnZhaoyun';
    Caption := '';
    Tag := 3;
    Parent := Self.Panel1;
    Width := ImageList80x160.Width;
    Height := ImageList80x160.Height;
    Top := 0;
    Left := FIX_PIXEL * 3;
    Images := ImageList80x160;
    ImageIndex := _JpgZhaoyun;
  end;

  _BitBtnZhangfei := TBitBtn.Create(Self.Panel1);
  with _BitBtnZhangfei do
  begin
    Name := '_BitBtnZhangfei';
    Caption := '';
    Tag := 4;
    Parent := Self.Panel1;
    Width := ImageList80x160.Width;
    Height := ImageList80x160.Height;
    Top := FIX_PIXEL * 2;
    Left := 0;
    Images := ImageList80x160;
    ImageIndex := _JpgZhangfei;
  end;

  _BitBtnGuanyu := TBitBtn.Create(Self.Panel1);
  with _BitBtnGuanyu do
  begin
    Name := '_BitBtnGuanyu';
    Caption := '';
    Tag := 5;
    Parent := Self.Panel1;
    Width := ImageList160x80.Width;
    Height := ImageList160x80.Height;
    Top := FIX_PIXEL * 2;
    Left := FIX_PIXEL;
    Images := ImageList160x80;
    ImageIndex := _JpgGuanyu;
  end;

  _BitBtnHuangzhong := TBitBtn.Create(Self.Panel1);
  with _BitBtnHuangzhong do
  begin
    Name := '_BitBtnHuangzhong';
    Caption := '';
    Tag := 5;
    Parent := Self.Panel1;
    Width := ImageList80x160.Width;
    Height := ImageList80x160.Height;
    Top := FIX_PIXEL * 2;
    Left := FIX_PIXEL * 3;
    Images := ImageList80x160;
    ImageIndex := _JpgHuangzhong;
  end;

  _BitBtnBing1 := TBitBtn.Create(Self.Panel1);
  with _BitBtnBing1 do
  begin
    Name := '_BitBtnBing1';
    Caption := '';
    Tag := 5;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 4;
    Left := 0;
    Images := ImageList80x80;
    ImageIndex := _JpgBing;
  end;

  _BitBtnBing2 := TBitBtn.Create(Self.Panel1);
  with _BitBtnBing2 do
  begin
    Name := '_BitBtnBing2';
    Caption := '';
    Tag := 5;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 3;
    Left := FIX_PIXEL;
    Images := ImageList80x80;
    ImageIndex := _JpgBing;
  end;

  _BitBtnBing3 := TBitBtn.Create(Self.Panel1);
  with _BitBtnBing3 do
  begin
    Name := '_BitBtnBing3';
    Caption := '';
    Tag := 5;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 3;
    Left := FIX_PIXEL * 2;
    Images := ImageList80x80;
    ImageIndex := _JpgBing;
  end;

  _BitBtnBing4 := TBitBtn.Create(Self.Panel1);
  with _BitBtnBing4 do
  begin
    Name := '_BitBtnBing4';
    Caption := '';
    Tag := 5;
    Parent := Self.Panel1;
    Width := ImageList80x80.Width;
    Height := ImageList80x80.Height;
    Top := FIX_PIXEL * 4;
    Left := FIX_PIXEL * 3;
    Images := ImageList80x80;
    ImageIndex := _JpgBing;
  end;
end;

procedure TCase03_FrmMain.__LoadImage;
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

    jpg.LoadFromFile(CrossFixFileName(JPG_GUANYU_FILE));
    _JpgGuanyu := ImageList160x80.add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_HUANGZHONG_FILE));
    _JpgHuangzhong := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_MACHAO_FILE));
    _JpgMachao := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_ZHANGFEI_FILE));
    _JpgZhangfei := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_ZHAOYUN_FILE));
    _JpgZhaoyun := ImageList80x160.Add(jpg, nil);
    jpg.FreeImage;
  finally
    jpg.Free;
  end;
end;

end.
