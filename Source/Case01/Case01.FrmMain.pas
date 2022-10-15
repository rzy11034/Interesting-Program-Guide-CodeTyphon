unit Case01.FrmMain;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  LCLType,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  StdCtrls,
  ExtCtrls;

type
  TCase01_FrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    _Commodity: TStringList;//用于保存商品的名称
    _CurrentCommodityIndex: integer;//用于获取当前商品的索引
    _Prices: array of integer; //保存商品的价格
  public

  end;

var
  Case01_FrmMain: TCase01_FrmMain;

implementation

{$R *.frm}

{ TCase01_FrmMain }

procedure TCase01_FrmMain.Button1Click(Sender: TObject);
var
  pricetemp: integer; //定义一个变量保存输入的价格
begin
  if not TryStrToInt(Edit1.Text, pricetemp) then
  begin
    Edit1.Clear;
    Exit;
  end
  else
  begin
    pricetemp := StrToInt(Edit1.Text); //用StrToInt()将字符串转换成整数
    if pricetemp > _Prices[_CurrentCommodityIndex] then
      Application.MessageBox('您想用这么多的钱买这个破东西？！高了高了！！',
        '猜错了', MB_OK)
    else if pricetemp < _Prices[_CurrentCommodityIndex] then
      Application.MessageBox('您想用这么少的钱买这个好东西？！低了低了！！',
        '猜错了', MB_OK)
    else
      Application.MessageBox('恭喜恭喜！！', '猜对了', MB_OK);

    Edit1.Clear;
  end;
end;

procedure TCase01_FrmMain.Button2Click(Sender: TObject);
const
  TV = '../../Source/Case01/Resource/TV.png';
  Computer = '../../Source/Case01/Resource/Computer.png';
  Player = '../../Source/Case01/Resource/Player.png';
  phone = '../../Source/Case01/Resource/phone.png';
  walkman = '../../Source/Case01/Resource/walkman.png';
  camara = '../../Source/Case01/Resource/camara.png';
  mouse = '../../Source/Case01/Resource/mouse.png';
  guita = '../../Source/Case01/Resource/guita.png';
  mobilephone = '../../Source/Case01/Resource/mobilephone.png';
  car = '../../Source/Case01/Resource/car.png';
begin
  Edit1.Clear;//清空文本框
  Randomize;//初始化随机数
  _CurrentCommodityIndex := Random(10);//产生一个0到9的随机数
  Label6.Caption := _Commodity.strings[_CurrentCommodityIndex];
  case _CurrentCommodityIndex of
    0: Image1.Picture.LoadFromFile(CrossFixFileName(TV));
    1: Image1.Picture.LoadFromFile(CrossFixFileName(Computer));
    2: Image1.Picture.LoadFromFile(CrossFixFileName(Player));
    3: Image1.Picture.LoadFromFile(CrossFixFileName(phone));
    4: Image1.Picture.LoadFromFile(CrossFixFileName(walkman));
    5: Image1.Picture.LoadFromFile(CrossFixFileName(camara));
    6: Image1.Picture.LoadFromFile(CrossFixFileName(mouse));
    7: Image1.Picture.LoadFromFile(CrossFixFileName(guita));
    8: Image1.Picture.LoadFromFile(CrossFixFileName(mobilephone));
    9: Image1.Picture.LoadFromFile(CrossFixFileName(car));
  end;

  Edit1.SetFocus;
  Button2.Caption := '重新开始';
end;

procedure TCase01_FrmMain.Edit1KeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Button1Click(Sender); //直接调用Button1的事件处理程序完成相同的功能
  end;
end;

procedure TCase01_FrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  _Commodity.Free;
end;

procedure TCase01_FrmMain.FormCreate(Sender: TObject);
begin
  _Commodity := TStringList.Create;//先要创建一个对象
  _Commodity.Add('康佳29寸纯平彩电');
  _Commodity.Add('松下掌上电脑');
  _Commodity.Add('JNC MP3播放器891');
  _Commodity.Add('捷视可视电话机2000T');
  _Commodity.Add('索尼随身听EX2000 ');
  _Commodity.Add('索尼数码相机DSC-P1');
  _Commodity.Add('松下剃须刀ES365A');
  _Commodity.Add('日本ESP电吉它');
  _Commodity.Add('Nokiya 8210手机');
  _Commodity.Add('奔驰500');

  Setlength(_Prices, 10);//设置数组的长度
  _Prices[0] := 4390;
  _Prices[1] := 5230;
  _Prices[2] := 2079;
  _Prices[3] := 5380;
  _Prices[4] := 1224;
  _Prices[5] := 7140;
  _Prices[6] := 273;
  _Prices[7] := 5230;
  _Prices[8] := 2810;
  _Prices[9] := 120000;

  _CurrentCommodityIndex := -1;
end;

end.
