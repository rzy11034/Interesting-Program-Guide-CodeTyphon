unit Case03.GameData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

type
  TDirection = (Up, Right, Down, Left);

  TGameData = class(TObject)
  private
    _Visited: TArr2D_bool;
    _Map: TArr2D_int;
    _Route: TDirection;
    _BeginPosition: TPoint;
    _CurPosition: TPoint;
    function __IsVaildDirection(x, y: integer): boolean;

  public
    constructor Create;
    destructor Destroy; override;

    property BeginPosition: TPoint read _BeginPosition write _BeginPosition;
    property CurPosition: TPoint read _CurPosition write _CurPosition;
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

function TGameData.__IsVaildDirection(x, y: integer): boolean;
var
  prevX, prevY, curX, curY: integer;
begin
  prevX := beginPosition.X div FIX_PIXEL;
  prevY := beginPosition.Y div FIX_PIXEL;
  curX := curPosition.X div FIX_PIXEL;
  curY := curPosition.Y div FIX_PIXEL;

  Result := _Visited[curY, curX];
end;

end.
