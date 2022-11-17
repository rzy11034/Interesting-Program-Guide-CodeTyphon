object Case06_FrmMain: TCase06_FrmMain
  Left = 86
  Height = 659
  Top = 85
  Width = 791
  Caption = '多文档编辑器'
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object MainMenu1: TMainMenu
    Left = 64
    Top = 72
    object MenuItemFile: TMenuItem
      Caption = '文件(&F)'
      GroupIndex = 1
      object MenuItemNew: TMenuItem
        Caption = '新建'
        OnClick = MenuItemNewClick
      end
      object MenuItemOpen: TMenuItem
        Caption = '打开…'
        OnClick = MenuItemOpenClick
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object MenuItemExit: TMenuItem
        Caption = '退出'
        OnClick = MenuItemExitClick
      end
    end
    object MenuItemWindows: TMenuItem
      Caption = '窗口(&W)'
      GroupIndex = 9
      object MenuItemTile: TMenuItem
        Caption = '平铺'
        GroupIndex = 9
        OnClick = MenuItemTileClick
      end
      object MenuItemCascade: TMenuItem
        Caption = '层叠'
        GroupIndex = 9
        OnClick = MenuItemCascadeClick
      end
      object MenuItemArrangeicons: TMenuItem
        Caption = '图标显示'
        GroupIndex = 9
        OnClick = MenuItemArrangeiconsClick
      end
      object Separator2: TMenuItem
        Caption = '-'
      end
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Rich Text File(*.rtf)|*.rtf|Normal Text File(*.txt)|*.txt|All File|*.*'
    FilterIndex = 3
    Left = 232
    Top = 72
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 353
    Top = 77
  end
end
