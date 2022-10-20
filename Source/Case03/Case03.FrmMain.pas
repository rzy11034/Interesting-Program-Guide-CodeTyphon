unit Case03.FrmMain;

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
  StdCtrls,
  ExtCtrls,
  Buttons;

type
  TCase03_FrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ImageList160x160: TImageList;
    ImageList160x80: TImageList;
    ImageList80x80: TImageList;
    ImageList80x160: TImageList;
    Label1: TLabel;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _JpgCaocao: integer;
    _JpgBing: integer;
    _JpgGuanyu: integer;
    _JpgHuangzhong: integer;
    _JpgMachao: integer;
    _JpgZhangfei: integer;
    _JpgZhaoyun: integer;

    procedure __LoadImage;
  public

  end;

var
  Case03_FrmMain: TCase03_FrmMain;

implementation

uses
  Case03.StrConsts;

{$R *.frm}

{ TCase03_FrmMain }

procedure TCase03_FrmMain.Button1Click(Sender: TObject);
begin
  Label1.Caption := GAME_OVER_STR;
end;

procedure TCase03_FrmMain.Button2Click(Sender: TObject);
begin
  Label1.Caption := GAME_INTRODUCE_STR;
end;

procedure TCase03_FrmMain.FormCreate(Sender: TObject);
begin

  ImageList160x160.Width := FIX_PIXEL * 2;
  ImageList160x160.Height := FIX_PIXEL * 2;

  ImageList80x80.Width := FIX_PIXEL;
  ImageList80x80.Height := FIX_PIXEL;

  ImageList80x160.Width := FIX_PIXEL;
  ImageList80x160.Height := FIX_PIXEL * 2;

  ImageList160x80.Width := FIX_PIXEL * 2;
  ImageList160x80.Height := FIX_PIXEL;

  __LoadImage;

  BitBtn2.Images := ImageList80x80;
  BitBtn2.ImageIndex := _BmpBing;
end;

procedure TCase03_FrmMain.__LoadImage;
var
  jpg: TJPEGImage;
begin
  jpg := TJPEGImage.Create;
  try
    jpg.LoadFromFile(CrossFixFileName(JPG_CAOCAO_FILE));
    _BmpCaocao := ImageList160x160.Add(jpg, nil);
    jpg.FreeImage;

    jpg.LoadFromFile(CrossFixFileName(JPG_BING_FILE));
    _BmpBing := ImageList80x80.Add(jpg, nil);

    a := jpg.PixelFormat;
  finally
    jpg.Free;
  end;
end;

end.
