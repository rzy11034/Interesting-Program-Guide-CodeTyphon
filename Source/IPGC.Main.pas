unit IPGC.Main;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  {%H-}DeepStar.Utils,
  {%H-}Math,
  Translations,
  LCLType;

procedure Main;
procedure TranslateLCL;

implementation

procedure Main;
var
  map: TArr2D_int;
begin
  Map := [
    [2, 4, 4, 2],
    [2, 4, 4, 2],
    [2, 3, 3, 2],
    [2, 1, 1, 2],
    [1, 0, 0, 1]];

  TArrayUtils_int.Print2D(Map);
end;

procedure TranslateLCL;
var
  po: TPOFile;
  stm: TResourceStream;
begin
  stm := TResourceStream.Create(HINSTANCE, 'LCLSTRCONSTS.ZH_CN', RT_RCDATA);
  try
    try
      po := TPOFile.Create(stm);
      Translations.TranslateUnitResourceStrings('LCLStrConsts', po);
    finally
      po.Free;
    end;
  finally
    stm.Free;
  end;
end;

end.
