unit Case02.FrmMain;

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
  StdCtrls,
  LCLType;

type
  TCase02_FrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    _RandomData, _CardValue: TArr_int;
    _CardKind: TArr_str;
    _SpendTime: integer;
    _StartTime: TTime;

    function __GetFileName: TArr_str;
  public

  end;

var
  Case02_FrmMain: TCase02_FrmMain;

implementation

uses
  Case02.Calculate;

const
  FILE_PATH = '../../Source/Case02/Resource/';
  CARD_BLACK = 'BACKY.png';
  VALID_CHAR = TCalculate.DIGIT_CHAR + TCalculate.OPERATIONAL_CHAR;

{$R *.frm}

{ TCase02_FrmMain }

procedure TCase02_FrmMain.Button1Click(Sender: TObject);
var
  temp: TArr_str;
  i: integer;
begin
  temp := __GetFileName;

  for i := 0 to High(temp) do
    temp[i] := CrossFixFileName(FILE_PATH + temp[i]);

  Image1.Picture.LoadFromFile(temp[0]);
  Image2.Picture.LoadFromFile(temp[1]);
  Image3.Picture.LoadFromFile(temp[2]);
  Image4.Picture.LoadFromFile(temp[3]);

  Edit1.Text := '';
  _StartTime := Now;
  Timer1.Enabled := true;
end;

procedure TCase02_FrmMain.Button2Click(Sender: TObject);
var
  clt: TCalculate;
  res: integer;
begin
  if Edit1.Text = '' then Exit;

  clt := TCalculate.Create(Edit1.Text + '#');
  try
    res := clt.Calc24;

    if res <> 24 then
    begin
      MessageDlg('错了，请重新计算。', mtError, [mbOK], 0);
      Exit;
    end
    else
    begin
      MessageDlg('恭喜你，答对了。', mtInformation, [mbOK], 0);
      Timer1.Enabled := false;
    end;

    Label6.Caption := Format('结果：%s = %d', [Edit1.Text, clt.Calc24]);
    Edit1.Text := '';
  finally
    clt.Free;
  end;
end;

procedure TCase02_FrmMain.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TCase02_FrmMain.Edit1KeyPress(Sender: TObject; var Key: char);
begin
  if not (key in VALID_CHAR) and (Ord(Key) <> VK_BACK) then
    Key := #0;
end;

procedure TCase02_FrmMain.FormCreate(Sender: TObject);
var
  str: string;
begin
  _SpendTime := 0;
  Timer1.Enabled := false;
  Timer1.Interval := 1000;

  Edit1.Text := '';

  str := FILE_PATH + CARD_BLACK;
  Image1.Picture.LoadFromFile(CrossFixFileName(str));
end;

procedure TCase02_FrmMain.Timer1Timer(Sender: TObject);
var
  _endTime: TTime;
begin
  _SpendTime := _SpendTime + 1;

  _endTime := Now;
  Label5.Caption := Format('使用时间: %s', [TimeToStr(_endTime - _StartTime)]);
end;

function TCase02_FrmMain.__GetFileName: TArr_str;
var
  res: TArr_str;
  flag: TArr_bool;
  i, temp: integer;
begin
  Randomize;

  res := [];
  _RandomData := [];
  _CardValue := [];
  _CardKind := [];

  SetLength(_RandomData, 4);
  SetLength(_CardValue, 4);
  SetLength(_CardKind, 4);
  SetLength(flag, 52);

  i := 0;
  while i <= High(_RandomData) do
  begin
    temp := Random(52);

    if flag[temp] then
      Continue
    else
    begin
      _RandomData[i] := temp;
      flag[temp] := true;
      i += 1;
    end;
  end;

  // 黑=S 红=H 梅=C 方=D
  for i := 0 to High(_RandomData) do
  begin
    if _RandomData[i] in [0 * 13..13 + 0 * 13 - 1] then
      _CardKind[i] := 'S'
    else if _RandomData[i] in [1 * 13..13 + 1 * 13 - 1] then
      _CardKind[i] := 'H'
    else if _RandomData[i] in [2 * 13..13 + 2 * 13 - 1] then
      _CardKind[i] := 'C'
    else if _RandomData[i] in [3 * 13..13 + 3 * 13 - 1] then
      _CardKind[i] := 'D';

    _CardValue[i] := _RandomData[i] mod 13 + 1;
  end;

  SetLength(res, 4);
  for i := 0 to High(_CardValue) do
  begin
    case _CardValue[i] of
      1: res[i] := 'A' + _CardKind[i];
      2..10: res[i] := _CardValue[i].ToString + _CardKind[i];
      11: res[i] := 'J' + _CardKind[i];
      12: res[i] := 'Q' + _CardKind[i];
      13: res[i] := 'K' + _CardKind[i];
      else
        raise Exception.Create('牌面数字有错！');
    end;

    res[i] += '.png';
  end;

  Result := res;
end;

end.
