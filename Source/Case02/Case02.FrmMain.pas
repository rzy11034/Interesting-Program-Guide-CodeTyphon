unit Case02.FrmMain;

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
  StdCtrls;

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
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
  private
    _RandomData: array of integer;
    _SpendTime: integer;

  public

  end;

var
  Case02_FrmMain: TCase02_FrmMain;

implementation

{$R *.frm}

{ TCase02_FrmMain }

procedure TCase02_FrmMain.FormCreate(Sender: TObject);
var
  i: integer;
begin
  //初始化，设置数组RandomData的长度为4
  //并将每个数组元素初始化为零
  setLength(_RandomData, 4);
  for i := 0 to 3 do
    _RandomData[i] := ;

  _SpendTime := 0;
  Timer1.Enabled := false;
  Timer1.Interval := 1000;
end;

end.
