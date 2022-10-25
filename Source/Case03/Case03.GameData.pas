unit Case03.GameData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  Types,
  DeepStar.Utils;

type
  TDirection = (Up, Right, Down, Left);
  TSize = Types.TSize;

  TGameData = class(TObject)
  private
    _CurElemCenterPos: TPoint;
    _TargetParentPos: TPoint;
    _Direction: TDirection;
    _Visited: TArr2D_bool;
    _Map: TArr2D_int;
    _ControlTag: integer;


    function __IsVaildDirection(x, y: integer): boolean;
    // 得到鼠标移出时方向,
    // 传入控件大小size， 偏移量X，Y
    function __GetMouseLeaveDir(size: TSize; x, y: integer): TDirection;
    // 得到鼠标移入时方向
    // 传入父控件大小size, 子控件相对父控件坐标top, left, 偏移量X，Y
    function __GetMouseEnterDir(size: TSize; top, left, x, y: integer): TDirection;

  public
    constructor Create;
    destructor Destroy; override;

    procedure MoveOut(targetParentPos: TPoint; scoureRect: TRect; X, Y: integer; tag: integer);

    property BeginPosition: TPoint read _BeginPosition write _BeginPosition;
    property CurPosition: TPoint read _CurPosition write _CurPosition;
    property Direction: TDirection read _Direction;
  end;

implementation

uses
  Case03.StrConsts;

{ TGameData }

constructor TGameData.Create;
var
  i, j: integer;
begin
  _Map := [
    [2, 4, 4, 2],
    [2, 4, 4, 2],
    [2, 3, 3, 2],
    [2, 1, 1, 2],
    [1, 0, 0, 1]];

  SetLength(_Visited, 5, 4);

  for i := 0 to High(_Map) do
    for j := 0 to High(_Map[i]) do
      if _Map[i, j] <> 0 then
        _Visited[i, j] := true;
end;

destructor TGameData.Destroy;
begin
  inherited Destroy;
end;

procedure TGameData.MoveOut(targetParentPos: TPoint; scoureRect: TRect; X, Y: integer; tag: integer);
begin
  _TargetParentPos := targetParentPos;
  _Direction := __GetMouseLeaveDir(rect.Size, x, y);
  _ControlTag := tag;
end;

function TGameData.__GetMouseEnterDir(size: TSize; top, left, x, y: integer): TDirection;
var
  w, h, ax, ay, deg: double;
  dtv: integer;
begin
  w := size.Width;
  h := size.Height;

  ax := (x - top - (w / 2)) * specialize IfThen<double>(w > h, h / w, 1);
  ay := (y - left - (h / 2)) * specialize IfThen<double>(h > w, w / h, 1);

  deg := ((RadToDeg(ArcTan2(ay, ax)) + 180) / 90) + 3;
  dtv := round(deg) mod 4;

  Result := TDirection(dtv);
end;

function TGameData.__GetMouseLeaveDir(size: TSize; x, y: integer): TDirection;
var
  w, h, ax, ay, deg: double;
  dtv: integer;
begin
  w := size.Width;
  h := size.Height;

  ax := (x - (w / 2)) * specialize IfThen<double>(w > h, h / w, 1);
  ay := (y - (h / 2)) * specialize IfThen<double>(h > w, w / h, 1);

  deg := ((RadToDeg(ArcTan2(ay, ax)) + 180) / 90) + 3;
  dtv := round(deg) mod 4;

  Result := TDirection(dtv);
end;

function TGameData.__IsVaildDirection(x, y: integer): boolean;
var
  prevX, prevY, curX, curY: integer;
begin
  prevX := X div FIX_PIXEL;
  prevY := Y div FIX_PIXEL;
  curX := curPosition.X div FIX_PIXEL;
  curY := curPosition.Y div FIX_PIXEL;

  Result := _Visited[curY, curX];
end;

end.
