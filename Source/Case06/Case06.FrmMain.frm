object Case06_FrmMain: TCase06_FrmMain
  Left = 86
  Height = 581
  Top = 85
  Width = 759
  Caption = 'Case06_FrmMain'
  FormStyle = fsMDIForm
  Menu = MainMenu1
  Position = poScreenCenter
  LCLVersion = '7.9'
  WindowState = wsMaximized
  object MainMenu1: TMainMenu
    Left = 24
    Top = 72
    object MenuItem1: TMenuItem
      Action = ActionFile
      object MenuItem3: TMenuItem
        Action = ActionNew
      end
      object MenuItem4: TMenuItem
        Action = ActionOpen
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object MenuItem5: TMenuItem
        Action = ActionExit
      end
    end
    object MenuItem2: TMenuItem
      Caption = '窗口(&W)'
      GroupIndex = 9
      object MenuItem6: TMenuItem
        Caption = '平铺'
        GroupIndex = 9
      end
      object MenuItem7: TMenuItem
        Caption = '层叠'
        GroupIndex = 9
      end
      object MenuItem8: TMenuItem
        Caption = '图标显示'
        GroupIndex = 9
      end
    end
  end
  object ActionList1: TActionList
    Left = 120
    Top = 72
    object ActionFile: TAction
      Caption = '文件(&F)'
      OnExecute = ActionNil
    end
    object ActionNew: TAction
      Caption = '新建'
      OnExecute = ActionNewExecute
    end
    object ActionOpen: TAction
      Caption = '打开…'
    end
    object ActionExit: TAction
      Caption = '退出'
      OnExecute = ActionExitExecute
    end
    object ActionWindows: TAction
      Caption = '窗口(&W)'
      GroupIndex = 9
      OnExecute = ActionNil
    end
    object ActionTile: TAction
      Caption = '平铺'
      GroupIndex = 9
    end
    object ActionCascade: TAction
      Caption = '层叠'
      GroupIndex = 9
    end
    object ActionArrangeicons: TAction
      Caption = '图标显示'
      GroupIndex = 9
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 224
    Top = 72
  end
end
