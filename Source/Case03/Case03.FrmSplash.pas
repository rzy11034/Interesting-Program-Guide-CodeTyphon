unit Case03.FrmSplash;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Types,
  FPCanvas,
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
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
  private
    procedure __FadeIn(bmp: TBitmap);
    procedure __LoadBitamp;

  public

  end;

var
  Case03_FrmSplash: TCase03_FrmSplash;

implementation

uses
  IntfGraphics,
  FPImage,LazCanvas,
  Case03.StrConsts;

{$R *.frm}

{ TCase03_FrmSplash }

procedure TCase03_FrmSplash.FormCreate(Sender: TObject);
begin
  __LoadBitamp;
end;

procedure TCase03_FrmSplash.__FadeIn(bmp: TBitmap);
var
  scrIntfImg, destIntfImg: TLazIntfImage;
  fade, px, py: integer;
  curColor: TFPColor;
begin
  scrIntfImg := bmp.CreateIntfImage;
  destIntfImg := bmp.CreateIntfImage;
  try
    for fade := 1 to 32 do
    begin
      for px := 0 to scrIntfImg.Width - 1 do
      begin
        for py := 0 to scrIntfImg.Height - 1 do
        begin
          curColor := scrIntfImg.Colors[px, py];
          curColor.Red := (curColor.Red * fade) >> 5;
          curColor.Blue := (curColor.Blue * fade) >> 5;
          curColor.Green := (curColor.Green * fade) >> 5;
          destIntfImg.Colors[px, py] := curColor;
        end;
      end;
      bmp.LoadFromIntfImage(destIntfImg);
    end;
  finally
    destIntfImg.Free;
    scrIntfImg.Free;
  end;
end;

procedure TCase03_FrmSplash.__LoadBitamp;
var
  tempIntfImg: TLazIntfImage;
  cvs: TLazCanvas;
  png: TPNGImage;
  jpg: TJPEGImage;
  bmp, tempBmp: TBitmap;
  w, h: integer;
begin
  w := Image1.Width;
  h := Image1.Height;

  bmp := TBitmap.Create;
  tempBmp := TBitmap.Create;
  tempIntfImg := bmp.CreateIntfImage;
  cvs := TLazCanvas.create(tempIntfImg);
  try
    bmp.SetSize(w, h);

    png := TPNGImage.Create();
    try
      png.LoadFromFile(CrossFixFileName(PNG_DIALOGBACK));
      bmp.Canvas.StretchDraw(rect(0, 0, w, h), png);
    finally
      png.Free;
    end;

    //.SetSize(200, 300);
    Image1.Picture.Assign(bmp);
    Image1.Stretch
  finally
    bmp.Free;
  end;
end;

end.
