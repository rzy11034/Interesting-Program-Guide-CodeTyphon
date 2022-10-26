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
begin
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
