unit Case04.FrmSplash;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  FPCanvas,
  DeepStar.Utils,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  StdCtrls;

type
  TCase04_FrmSplash = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    _Bitmap: TBitmap;

    procedure __FadeIn(bmp: TBitmap);
    procedure __LoadBitamp;

  public

  end;

var
  Case04_FrmSplash: TCase04_FrmSplash;

implementation

uses
  IntfGraphics,
  FPImage,
  LazCanvas,
  case04.StrConsts,
  Case04.FrmMain;

{$R *.frm}

{ TCase04_FrmSplash }

procedure TCase04_FrmSplash.Button1Click(Sender: TObject);
begin
  Case04_FrmMain.Show;

  Self.Hide;
end;

procedure TCase04_FrmSplash.FormActivate(Sender: TObject);
begin
  __FadeIn(_Bitmap);
  Image1.Picture.Assign(_Bitmap);
end;

procedure TCase04_FrmSplash.FormCreate(Sender: TObject);
begin
  Self.Color := FRM_COLOR;
  Self.Caption := STR_GAME_NAME;

  Self.PaintBox1.SetBounds(20, 20, 400, 600);
  Self.Image1.SetBounds(20, 20, 400, 600);

  _Bitmap := TBitmap.Create;

  Label1.Caption := STR_GAME_INTRODUCE_STR;

  __LoadBitamp;
end;

procedure TCase04_FrmSplash.FormDestroy(Sender: TObject);
begin
  _Bitmap.Free;
end;

procedure TCase04_FrmSplash.__FadeIn(bmp: TBitmap);
var
  scrIntfImg, destIntfImg: TLazIntfImage;
  tempBmp: TBitmap;
  fadeStep, px, py: integer;
  curColor: TFPColor;
begin
  scrIntfImg := bmp.CreateIntfImage;
  destIntfImg := bmp.CreateIntfImage;
  tempBmp := TBitmap.Create;
  try
    for fadeStep := 1 to 32 do
    begin
      Application.ProcessMessages;

      for py := 0 to scrIntfImg.Height - 1 do
      begin
        for px := 0 to scrIntfImg.Width - 1 do
        begin
          curColor := scrIntfImg.Colors[px, py];
          curColor.Red := (curColor.Red * fadeStep) shr 5;
          curColor.Blue := (curColor.Blue * fadeStep) shr 5;
          curColor.Green := (curColor.Green * fadeStep) shr 5;
          destIntfImg.Colors[px, py] := curColor;
        end;
      end;
      tempBmp.LoadFromIntfImage(destIntfImg);
      Self.PaintBox1.Canvas.Draw(0, 0, tempBmp);

      Sleep(20);
    end;

    bmp.Assign(tempBmp);
  finally
    destIntfImg.Free;
    scrIntfImg.Free;
    tempBmp.Free;
  end;
end;

procedure TCase04_FrmSplash.__LoadBitamp;
var
  tempIntfImg, destIntfImg: TLazIntfImage;
  cvs: TLazCanvas;
  png: TPNGImage;
  jpg: TJPEGImage;
begin
  destIntfImg := TLazIntfImage.Create(0, 0);
  tempIntfImg := TLazIntfImage.Create(0, 0);

  png := TPNGImage.Create();
  try
    png.LoadFromFile(CrossFixFileName(PNG_DIALOGBACK));
    destIntfImg.LoadFromBitmap(png.Handle, png.MaskHandle);
  finally
    FreeAndNil(png);
  end;

  cvs := TLazCanvas.Create(destIntfImg);

  jpg := TJPEGImage.Create();
  try
    jpg.LoadFromFile(CrossFixFileName(JPG_CAOCAO_FILE));
    tempIntfImg.LoadFromBitmap(jpg.Handle, jpg.MaskHandle);
    cvs.StretchDraw(150, 150, 100, 100, tempIntfImg);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_GUANYU_FILE_H));
    tempIntfImg.LoadFromBitmap(jpg.Handle, jpg.MaskHandle);
    cvs.StretchDraw(13, 280, 120, 60, tempIntfImg);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_ZHANGFEI_FILE_H));
    tempIntfImg.LoadFromBitmap(jpg.Handle, jpg.MaskHandle);
    cvs.StretchDraw(140, 280, 120, 60, tempIntfImg);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_ZHAOYUN_FILE_H));
    tempIntfImg.LoadFromBitmap(jpg.Handle, jpg.MaskHandle);
    cvs.StretchDraw(270, 280, 120, 60, tempIntfImg);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_MACHAO_FILE_H));
    tempIntfImg.LoadFromBitmap(jpg.Handle, jpg.MaskHandle);
    cvs.StretchDraw(63, 365, 120, 60, tempIntfImg);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_HUANGZHONG_FILE_H));
    tempIntfImg.LoadFromBitmap(jpg.Handle, jpg.MaskHandle);
    cvs.StretchDraw(193, 365, 120, 60, tempIntfImg);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_BING_FILE));
    tempIntfImg.LoadFromBitmap(jpg.Handle, jpg.MaskHandle);
    cvs.StretchDraw(160, 440, 60, 60, tempIntfImg);
    jpg.FreeImage;
  finally
    FreeAndNil(jpg);
  end;

  _Bitmap.LoadFromIntfImage(destIntfImg);

  FreeAndNil(cvs);
  FreeAndNil(tempIntfImg);
  FreeAndNil(destIntfImg);
end;

end.
