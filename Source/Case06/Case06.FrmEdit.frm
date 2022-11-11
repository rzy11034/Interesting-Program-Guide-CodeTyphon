object Case06_FrmEdit: TCase06_FrmEdit
  Left = 86
  Height = 480
  Top = 85
  Width = 730
  Caption = 'Case06_FrmEdit'
  ClientHeight = 480
  ClientWidth = 730
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poDefault
  LCLVersion = '7.9'
  Visible = True
  object Editor: TRichMemo
    Left = 8
    Height = 368
    Top = 8
    Width = 496
    HideSelection = False
    Rtf = '{\rtf1\ansi\ansicpg936\deff0\nouicompat\deflang1033\deflangfe2052{\fonttbl{\f0\fnil Microsoft YaHei UI;}}'#13#10'{\*\generator Riched20 10.0.19041}\viewkind4\uc1 '#13#10'\pard\f0\fs18\lang2052\par'#13#10'}'#13#10#0
    ScrollBars = ssBoth
    TabOrder = 0
    ZoomFactor = 1
  end
  object MainMenu1: TMainMenu
    Left = 544
    Top = 80
    object MenuItem1: TMenuItem
      Action = Case06_FrmMain.ActionFile
      GroupIndex = 1
      object MenuItem5: TMenuItem
        Action = Case06_FrmMain.ActionNew
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object MenuItem2: TMenuItem
        Action = Case06_FrmMain.ActionOpen
      end
      object MenuItem3: TMenuItem
        Caption = 'MenuItem3'
      end
      object MenuItem4: TMenuItem
        Caption = 'MenuItem4'
      end
      object MenuItem6: TMenuItem
        Action = Case06_FrmMain.ActionExit
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 144
    object MenuItem7: TMenuItem
      Caption = 'MenuItem7'
    end
    object MenuItem8: TMenuItem
      Caption = 'MenuItem8'
    end
  end
end
