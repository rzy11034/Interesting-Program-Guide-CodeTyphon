unit Case03.FrmSplash;

{$mode ObjFPC}{$H+}
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
  ExtCtrls,
  StdCtrls;

type
  TCase03_FrmSplash = class(TForm)
    Button1: TButton;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    BitmapRect: TRect;
    jpg: TJPEGImage;
    PositiveMasks: array of TBrush;//正画刷
    NegativeMasks: array of TBrush;//负画刷
    SolidBlackBrush: TBrush;
    FadeBitmap: TBitmap;//黑画刷
    WorkSpaceBitmap: TBitmap;
    Progress: integer;
    procedure ProcessFadeFromBlackStep; //淡出
  public

  end;

var
  Case03_FrmSplash: TCase03_FrmSplash;

implementation

uses
  Case03.StrConsts;

const
  BRUSHCOUNT = 20;

{$R *.frm}

{ TCase03_FrmSplash }

procedure TCase03_FrmSplash.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TCase03_FrmSplash.FormCreate(Sender: TObject);
var
  i, j: integer;
  BrushRect: TRect;
begin
  BrushRect := Rect(0, 0, 8, 8);
  setLength(PositiveMasks, BRUSHCOUNT);
  setLength(NegativeMasks, BRUSHCOUNT);

  for j := 0 to BRUSHCOUNT - 1 do
  begin
    PositiveMasks[j] := TBrush.Create;
    NegativeMasks[j] := TBrush.Create;
    PositiveMasks[j].Bitmap := TBitmap.Create;
    NegativeMasks[j].Bitmap := TBitmap.Create;
    PositiveMasks[j].Bitmap.Width := 8;
    PositiveMasks[j].Bitmap.Height := 8;
    Randomize();

    for i := 0 to 8 * j - 1 do
    begin
      PositiveMasks[j].Bitmap.Canvas.Pixels[random(8), random(8)] := clBlack;
      NegativeMasks[j].Bitmap.Assign(PositiveMasks[j].Bitmap);
      NegativeMasks[j].Bitmap.Canvas.CopyMode := cmNotSrcCopy;
      NegativeMasks[j].Bitmap.Canvas.Draw(0, 0, PositiveMasks[j].Bitmap);
      // InvertRect(NegativeMasks[j].Bitmap.Canvas.Handle, BrushRect);
    end;

    if SolidBlackBrush = nil then
      SolidBlackBrush := TBrush.Create;
    SolidBlackBrush.Style := bsSolid;
    SolidBlackBrush.Color := clBlack;

    if FadeBitmap = nil then
      FadeBitmap := TBitmap.Create;

    if WorkSpaceBitmap = nil then
      WorkSpaceBitmap := TBitmap.Create;

    Progress := 0;

    if jpg = nil then
      jpg := TJPEGImage.Create;
    jpg.LoadFromFile(CrossFixFileName(JPG_BACKGROUND_FILE));
    FadeBitmap.Assign(jpg);
    jpg.FreeImage;

    WorkSpaceBitmap.Width := FadeBitmap.Width;
    WorkSpaceBitmap.Height := FadeBitmap.Height;
    WorkSpaceBitmap.Canvas.Draw(0, 0, FadeBitmap);
    BitmapRect := Rect(0, 0, FadeBitmap.Width, FadeBitmap.Height);
  end;

  Exit;
end;

procedure TCase03_FrmSplash.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to BRUSHCOUNT - 1 do
  begin
    PositiveMasks[i].Bitmap.Free;
    NegativeMasks[i].Bitmap.Free;
    PositiveMasks[i].Free;
    NegativeMasks[i].Free;
  end;
  SolidBlackBrush.Free;
  FadeBitmap.Free;
  WorkSpaceBitmap.Free;
end;

procedure TCase03_FrmSplash.ProcessFadeFromBlackStep;
begin
  if (Progress = BRUSHCOUNT) then
  begin
    Progress := 0;
    Timer1.Enabled := false;
    WorkSpaceBitmap.Canvas.CopyMode := cmSrcCopy;
    WorkSpaceBitmap.Canvas.Draw(0, 0, FadeBitmap);
  end
  else
  begin
    WorkSpaceBitmap.Canvas.Brush := NegativeMasks[Progress];
    WorkSpaceBitmap.Canvas.CopyMode := cmMergeCopy;
    WorkSpaceBitmap.Canvas.Draw(0, 0, FadeBitmap);
    Progress := Progress + 1;
  end;
  PaintBox1.Canvas.Draw(0, 0, WorkSpaceBitmap);
end;

procedure TCase03_FrmSplash.Timer1Timer(Sender: TObject);
begin
  ProcessFadeFromBlackStep;
end;

end.
