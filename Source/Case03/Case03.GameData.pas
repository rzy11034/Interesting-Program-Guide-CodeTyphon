unit Case03.GameData;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math,
  Types,
  Controls,
  DeepStar.Utils;

type
  TDirection = (Up, Right, Down, Left);
  TSize = Types.TSize;

  TGameData = class(TObject)
  private
    _Direction: TDirection;
    _Visited: TArr2D_bool;
    _Map: TArr2D_int;

    function __IsVaildDirection(row, col: integer): boolean;
    // 得到鼠标移出时方向,
    // 传入控件大小size， 偏移量X，Y
    function __GetMouseLeaveDir(size: TSize; x, y: integer): TDirection;
    // 得到鼠标移入时方向
    // 传入父控件大小size, 子控件相对父控件坐标top, left, 偏移量X，Y
    function __GetMouseEnterDir(size: TSize; top, left, x, y: integer): TDirection;

    function __GetMatrixIndex(n: integer): integer;

  public
    constructor Create;
    destructor Destroy; override;

    function MoveOut(targetControl, scoureControl: TControl; X, Y: integer): TPoint;
    function Completed: boolean;

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
  //_Map := [
  //  [2, 4, 4, 2],
  //  [2, 4, 4, 2],
  //  [2, 3, 3, 2],
  //  [2, 1, 1, 2],
  //  [1, 0, 0, 1]];

  _Map := [
    [0, 4, 4, 0],
    [0, 4, 4, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]];

  SetLength(_Visited, 5, 4);

  for i := 0 to High(_Map) do
    for j := 0 to High(_Map[i]) do
      if _Map[i, j] <> 0 then
        _Visited[i, j] := true;
end;

function TGameData.Completed: boolean;
begin
  Result := (_Map[4, 1] = 4) and (_Map[4, 2] = 4);
end;

destructor TGameData.Destroy;
begin
  inherited Destroy;
end;

function TGameData.MoveOut(targetControl, scoureControl: TControl; X, Y: integer): TPoint;
var
  dt: TDirection;
  top, left, tag: integer;
  w, h, row, col: integer;
  nextX, nextY, curX, curY, tempX, tempY: integer;
  res: TPoint;
begin
  dt := __GetMouseLeaveDir(scoureControl.ClientRect.Size, x, y);
  _Direction := dt;
  top := scoureControl.Top;
  left := scoureControl.Left;
  tag := scoureControl.Tag;

  w := scoureControl.ClientRect.CenterPoint.X;
  h := scoureControl.ClientRect.CenterPoint.Y;

  row := Length(_Visited) - 1;
  col := Length(_Visited[0]) - 1;

  case tag of
    1:
    begin
      curX := __GetMatrixIndex(left + w);
      CurY := __GetMatrixIndex(top + h);
      nextX := curX;
      nextY := curY;

      case dt of
        TDirection.Up:
        begin
          tempY := CurY - 1;
          if (tempY >= 0) and (__IsVaildDirection(tempY, curX)) then
          begin
            nextY := tempY;

            _Visited[curY, curX] := false;
            _Map[curY, curX] := 0;

            _Visited[nextY, nextX] := true;
            _Map[nextY, curX] := 1;
          end;
        end;

        TDirection.Right:
        begin
          tempX := curX + 1;
          if (tempX <= col) and (__IsVaildDirection(curY, tempX)) then
          begin
            nextX := tempX;

            _Visited[curY, curX] := false;
            _Map[curY, curX] := 0;

            _Visited[curY, nextX] := true;
            _Map[curY, nextX] := 1;
          end;
        end;

        TDirection.Down:
        begin
          tempY := CurY + 1;
          if (tempY <= row) and (__IsVaildDirection(tempY, curX)) then
          begin
            nextY := tempY;

            _Visited[curY, curX] := false;
            _Map[curY, curX] := 0;

            _Visited[nextY, curX] := true;
            _Map[nextY, curX] := 1;
          end;
        end;

        TDirection.Left:
        begin
          tempX := curX - 1;
          if (tempX >= 0) and (__IsVaildDirection(curY, tempX)) then
          begin
            nextX := tempX;

            _Visited[curY, curX] := false;
            _Map[curY, curX] := 0;

            _Visited[curY, nextX] := true;
            _Map[curY, nextX] := 1;
          end;
        end;
      end;

      res.X := nextX * FIX_PIXEL;
      res.Y := nextY * FIX_PIXEL;
    end;

    2:
    begin
      curX := __GetMatrixIndex(left + w);
      curY := __GetMatrixIndex(top + h div 2);
      nextX := curX;
      nextY := curY;

      case dt of
        TDirection.Up:
        begin
          tempY := curY - 1;
          if (tempY >= 0) and (__IsVaildDirection(tempY, curX)) then
          begin
            nextY := tempY;

            _Visited[curY + 1, curX] := false;
            _Map[curY + 1, curX] := 0;

            _Visited[nextY, curX] := true;
            _Map[nextY, curX] := 2;
          end;
        end;

        TDirection.Right:
        begin
          tempX := curX + 1;
          if (tempX <= col)
            and (__IsVaildDirection(curY, tempX))
            and (__IsVaildDirection(curY + 1, tempX)) then
          begin
            nextX := tempX;

            _Visited[curY, curX] := false;
            _Visited[curY + 1, curX] := false;
            _Map[curY, curX] := 0;
            _Map[curY + 1, curX] := 0;

            _Visited[curY, nextX] := true;
            _Visited[curY + 1, nextX] := true;
            _Map[curY, nextX] := 2;
            _Map[curY + 1, nextX] := 2;
          end;
        end;

        TDirection.Down:
        begin
          tempY := curY + 1;
          if (tempY + 1 <= row) and (__IsVaildDirection(tempY + 1, curX)) then
          begin
            nextY := tempY;

            _Visited[curY, curX] := false;
            _Map[curY, curX] := 0;

            _Visited[nextY + 1, curX] := true;
            _Map[nextY + 1, curX] := 2;
          end;
        end;

        TDirection.Left:
        begin
          tempX := curX - 1;
          if (tempX >= 0)
            and (__IsVaildDirection(curY, tempX))
            and (__IsVaildDirection(curY + 1, tempX))
          then
          begin
            nextX := tempX;

            _Visited[curY, curX] := false;
            _Visited[curY + 1, curX] := false;
            _Map[curY, curX] := 0;
            _Map[curY + 1, curX] := 0;

            _Visited[curY, nextX] := true;
            _Visited[curY + 1, nextX] := true;
            _Map[curY, nextX] := 2;
            _Map[curY + 1, nextX] := 2;
          end;
        end;
      end;

      res.X := nextX * FIX_PIXEL;
      res.Y := nextY * FIX_PIXEL;
    end;

    3:
    begin
      curX := __GetMatrixIndex(left + w div 2);
      curY := __GetMatrixIndex(top + h);
      nextX := curX;
      nextY := curY;

      case dt of
        TDirection.Up:
        begin
          tempY := curY - 1;
          if (tempY >= 0)
            and __IsVaildDirection(tempY, curX)
            and __IsVaildDirection(tempY, curX + 1) then
          begin
            nextY := tempY;

            _Visited[curY, curX] := false;
            _Visited[curY, curX + 1] := false;
            _Map[curY, curX] := 0;
            _Map[curY, curX + 1] := 0;

            _Visited[nextY, curX] := true;
            _Visited[nextY, curX + 1] := true;
            _Map[nextY, curX] := 3;
            _Map[nextY, curX + 1] := 3;
          end;
        end;

        TDirection.Right:
        begin
          tempX := curX + 1;
          if (tempX + 1 <= col) and __IsVaildDirection(curY, tempX + 1) then
          begin
            nextX := tempX;

            _Visited[curY, curX] := false;
            _Map[curY, curX] := 0;

            _Visited[curY, nextX + 1] := true;
            _Map[curY, nextX + 1] := 3;
          end;
        end;

        TDirection.Down:
        begin
          tempY := curY + 1;
          if (tempY <= row)
            and __IsVaildDirection(tempY, curx)
            and __IsVaildDirection(tempY, curX + 1) then
          begin
            nextY := tempY;

            _Visited[curY, curX] := false;
            _Visited[curY, curX + 1] := false;
            _Map[curY, curX] := 0;
            _Map[curY, curX + 1] := 0;

            _Visited[nextY, curX] := true;
            _Visited[nextY, curX + 1] := true;
            _Map[nextY, curX] := 3;
            _Map[nextY, curX + 1] := 3;
          end;
        end;

        TDirection.Left:
        begin
          tempX := curX - 1;
          if (tempX >= 0) and __IsVaildDirection(curY, tempX) then
          begin
            nextX := tempX;

            _Visited[curY, curX + 1] := false;
            _Map[curY, curX + 1] := 0;

            _Visited[curY, nextX] := true;
            _Map[curY, nextX] := 3;
          end;
        end;
      end;

      res.X := nextX * FIX_PIXEL;
      res.Y := nextY * FIX_PIXEL;
    end;

    4:
    begin
      curX := __GetMatrixIndex(left + w div 2);
      curY := __GetMatrixIndex(top + h div 2);
      nextX := curX;
      nextY := curY;

      case dt of
        TDirection.Up:
        begin
          tempY := curY - 1;
          if (tempY >= 0)
            and (__IsVaildDirection(tempY, curX))
            and (__IsVaildDirection(tempY, curX + 1)) then
          begin
            nextY := tempY;

            _Visited[curY + 1, curX] := false;
            _Visited[curY + 1, curX + 1] := false;
            _Map[curY + 1, curX] := 0;
            _Map[curY + 1, curX + 1] := 0;

            _Visited[nextY, curX] := true;
            _Visited[nextY, curX + 1] := true;
            _Map[nextY, curX] := 4;
            _Map[nextY, curX + 1] := 4;
          end;
        end;

        TDirection.Right:
        begin
          tempX := curX + 1;
          if (tempX + 1 <= col)
            and __IsVaildDirection(curY, tempX + 1)
            and __IsVaildDirection(curY + 1, tempX + 1) then
          begin
            nextX := tempX;

            _Visited[curY, curX] := false;
            _Visited[curY + 1, curX] := false;
            _Map[curY, curX] := 0;
            _Map[curY + 1, curX] := 0;

            _Visited[curY, nextX + 1] := true;
            _Visited[curY + 1, nextX + 1] := true;
            _Map[curY, nextX + 1] := 4;
            _Map[curY + 1, nextX + 1] := 4;
          end;
        end;

        TDirection.Down:
        begin
          tempY := curY + 1;
          if (tempY + 1 <= row)
            and (__IsVaildDirection(tempY + 1, curX))
            and (__IsVaildDirection(tempY + 1, curX + 1)) then
          begin
            nextY := tempY;

            _Visited[curY, curX] := false;
            _Visited[curY, curX + 1] := false;
            _Map[curY, curX] := 0;
            _Map[curY, curX + 1] := 0;

            _Visited[nextY + 1, curX] := true;
            _Visited[nextY + 1, curX + 1] := true;
            _Map[nextY + 1, curX] := 4;
            _Map[nextY + 1, curX + 1] := 4;
          end;
        end;

        TDirection.Left:
        begin
          tempX := curX - 1;
          if (tempX >= 0)
            and __IsVaildDirection(curY, tempX)
            and __IsVaildDirection(curY + 1, tempX) then
          begin
            nextX := tempX;

            _Visited[curY, curX + 1] := false;
            _Visited[curY + 1, curX + 1] := false;
            _Map[curY, curX + 1] := 0;
            _Map[curY + 1, curX + 1] := 0;

            _Visited[curY, nextX] := true;
            _Visited[curY + 1, nextX] := true;
            _Map[curY, nextX] := 4;
            _Map[curY + 1, nextX] := 4;
          end;
        end;
      end;

      res.X := nextX * FIX_PIXEL;
      res.Y := nextY * FIX_PIXEL;
    end;
  end;

  {$IFDEF DEBUG}
  TArrayUtils_int.Print2D(_Map);
  WriteLn;
  TArrayUtils_bool.Print2D(_Visited);
  DrawLineBlockEnd;
  {$ENDIF}

  Result := res;
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

function TGameData.__GetMatrixIndex(n: integer): integer;
begin
  Result := n div FIX_PIXEL;
end;

function TGameData.__IsVaildDirection(row, col: integer): boolean;
begin
  Result := not _Visited[row, col];
end;

end.
