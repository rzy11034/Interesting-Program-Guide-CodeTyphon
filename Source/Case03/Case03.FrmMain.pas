unit Case03.FrmMain;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TCase03_FrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Case03_FrmMain: TCase03_FrmMain;

implementation

uses Case03.StrConsts;

{$R *.frm}

{ TCase03_FrmMain }

procedure TCase03_FrmMain.Button1Click(Sender: TObject);
begin
  Label1.Caption := GameOverStr;
end;

procedure TCase03_FrmMain.Button2Click(Sender: TObject);
begin
   Label1.Caption := GameIntroduceStr;
end;

end.

