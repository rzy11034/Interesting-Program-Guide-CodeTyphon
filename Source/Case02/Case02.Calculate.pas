unit Case02.Calculate;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils,
  DeepStar.UString;

type
  TCalculate = class(TObject)
  const
    OPERATIONAL_CHAR = ['+', '-', '*', '/', '^', '(', ')'];
    DIGIT_CHAR = ['0'..'9'];

  private
    _OriginalStrs: TArr_str;
    _ReversePolishStrs: TArr_str;

    function __GetReversePolishStrings: TArr_str;
    function __GetPriorityLevel(str: string): integer;
    function __Calc(a, b: integer; opt: string): integer;

  public
    constructor Create(str: string);
    destructor Destroy; override;
    function Calc24: integer;
  end;

implementation

{ TCalculate }

constructor TCalculate.Create(str: string);
var
  sb: TStringBuilder;
  i: integer;
  s: string;
  a: TArr_str;
  list: IList_str;
begin
  sb := TStringBuilder.Create();
  try
    i := 0;
    while i < str.Length - 1 do
    begin
      while str.Chars[i] in DIGIT_CHAR do
      begin
        sb.Append(str.Chars[i]);
        i += 1;
      end;

      sb.Append(char(' '));

      if str.Chars[i] in Self.OPERATIONAL_CHAR then
      begin
        sb.Append(str.Chars[i]);
        sb.Append(char(' '));
      end;

      i += 1;
    end;

    s := sb.ToString;
    a := s.Split([' ']);
  finally
    sb.Free;
  end;

  list := TArrayList_str.Create;
  for i := 0 to High(a) do
  begin
    if a[i] <> '' then
      list.AddLast(a[i]);
  end;

  _OriginalStrs := list.ToArray;
  _ReversePolishStrs := __GetReversePolishStrings;
end;

function TCalculate.Calc24: integer;
var
  stack: IStack_int;
  prev, cur, res, i: integer;
begin
  stack := TStack_int.Create;
  res := 0;

  for i := 0 to High(_ReversePolishStrs) do
  begin
    if TryStrToInt(_ReversePolishStrs[i], cur) then
      stack.Push(cur)
    else
    begin
      prev := stack.Pop;
      cur := stack.Pop;
      res := __Calc(prev, cur, _ReversePolishStrs[i]);
      stack.Push(res);
    end;
  end;

  Result := stack.Peek;
end;

destructor TCalculate.Destroy;
begin
  inherited Destroy;
end;

function TCalculate.__Calc(a, b: integer; opt: string): integer;
var
  res: integer;
begin
  case opt of
    '+': res := b + a;
    '-': res := b - a;
    '*': res := b * a;
    '/': res := b div a;
    '^': res := b ** a;
  end;

  Result := res;
end;

function TCalculate.__GetPriorityLevel(str: string): integer;
var
  res: integer;
begin
  res := -1;

  case str of
    '+', '-': res := 1;
    '*', '/': res := 2;
    '^': res := 3;
    else
      res := -1;
  end;

  Result := res;
end;

function TCalculate.__GetReversePolishStrings: TArr_str;
var
  list: IList_str;
  stack: IStack_str;
  i, temp, pCur, pStack: integer;
begin
  list := TArrayList_str.Create;
  stack := TStack_str.Create;

  stack.Push('#');

  for i := 0 to High(_OriginalStrs) do
  begin
    if TryStrToInt(_OriginalStrs[i], temp) then
    begin
      list.AddLast(temp.ToString);
    end
    else if _OriginalStrs[i].Chars[0] in ['+', '-', '*', '/', '^'] then
    begin
      if stack.Peek = '(' then
      begin
        stack.Push(_OriginalStrs[i]);
        Continue;
      end;

      pCur := __GetPriorityLevel(_OriginalStrs[i]);
      pStack := __GetPriorityLevel(stack.Peek);

      if pCur < pStack then
      begin
        list.AddLast(stack.Pop);
        stack.Push(_OriginalStrs[i]);
      end
      else if pCur >= pStack then
        stack.Push(_OriginalStrs[i]);
    end
    else if _OriginalStrs[i].Chars[0] in ['(', ')'] then
    begin
      if _OriginalStrs[i] = '(' then
        stack.Push(_OriginalStrs[i])
      else
      begin
        while stack.Peek <> '(' do
          list.AddLast(stack.Pop);
        stack.Pop;
      end;
    end;
  end;

  while stack.Peek <> '#' do
  begin
    list.AddLast(stack.Pop);
  end;

  Result := list.ToArray;
end;

end.
