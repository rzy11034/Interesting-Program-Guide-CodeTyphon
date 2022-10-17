unit Case02.Calculate;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

type
  TCalculate = class(TObject)
  const
    OPERATIONAL_CHAR = ['+', '-', '*', '/', '^', '(', ')'];
    DIGIT_CHAR = ['0'..'9'];

  private
    _OriginalStrs, _ReversePolishStrs: TArr_str;


  public
    constructor Create(str: string);
    destructor Destroy; override;

  end;

implementation

{ TCalculate }

constructor TCalculate.Create(str: string);
var
  sb: TStringBuilder;
  i: integer;
  s: string;
  a: TArr_str;
begin
  sb := TStringBuilder.Create();
  try
    i := 0;
    while i < str.Length do
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

    sb.Clear;
    for i := 0 to high(a) do
    begin
      if a[i] <> #0 then
        sb.Append(a[i]);
    end;

    s := sb.ToString;
    a := s.Split([' ']);
  finally
    sb.Free;
  end;
end;

destructor TCalculate.Destroy;
begin
  inherited Destroy;
end;

end.
