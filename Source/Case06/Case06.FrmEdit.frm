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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poDefault
  LCLVersion = '7.9'
  Visible = True
  object Editor: TRichMemo
    Left = 16
    Height = 90
    Top = 8
    Width = 150
    HideSelection = False
    Lines.Strings = (
      ''
    )
    OnKeyPress = EditorKeyPress
    Rtf = '{\rtf1\ansi\ansicpg936\deff0\nouicompat\deflang1033\deflangfe2052{\fonttbl{\f0\fnil Microsoft YaHei UI;}}'#13#10'{\*\generator Riched20 10.0.19041}\viewkind4\uc1 '#13#10'\pard\f0\fs18\lang2052\par'#13#10'\par'#13#10'}'#13#10#0
    TabOrder = 0
    ZoomFactor = 1
  end
  object MainMenu1: TMainMenu
    Left = 208
    Top = 16
    object MenuItemFile: TMenuItem
      Caption = '文件(&F)'
      object MenuItemNew: TMenuItem
        Caption = '新建'
        OnClick = MenuItemNewClick
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object MenuItemOpen: TMenuItem
        Caption = '打开…'
        OnClick = MenuItemOpenClick
      end
      object MenuItemClose: TMenuItem
        Caption = '关闭'
        OnClick = MenuItemCloseClick
      end
      object MenuItemSave: TMenuItem
        Caption = '保存'
        OnClick = MenuItemSaveClick
      end
      object MenuItemSaveAs: TMenuItem
        Caption = '另存为'
        OnClick = MenuItemSaveAsClick
      end
      object MenuItemPrint: TMenuItem
        Caption = '打印'
        OnClick = MenuItemPrintClick
      end
      object MenuItemPrinterSetup: TMenuItem
        Caption = '打印机设置'
        OnClick = MenuItemPrinterSetupClick
      end
      object Separator2: TMenuItem
        Caption = '-'
      end
      object MenuItemExit: TMenuItem
        Caption = '退出'
        OnClick = MenuItemExitClick
      end
    end
    object MenuItemEdit: TMenuItem
      Caption = '编辑'
      GroupIndex = 1
      object MenuItemCut: TMenuItem
        Caption = '剪切'
        ShortCut = 16472
        OnClick = MenuItemCutClick
      end
      object MenuItemCopy: TMenuItem
        Caption = '复制'
        ShortCut = 16451
        OnClick = MenuItemCopyClick
      end
      object MenuItemPaste: TMenuItem
        Caption = '粘贴'
        ShortCut = 16470
        OnClick = MenuItemPasteClick
      end
      object MenuItemDelete: TMenuItem
        Caption = '删除'
        ShortCut = 16452
        OnClick = MenuItemDeleteClick
      end
      object Separator3: TMenuItem
        Caption = '-'
      end
      object MenuItemSelectAll: TMenuItem
        Caption = '全选'
        ShortCut = 16449
        OnClick = MenuItemSelectAllClick
      end
      object Separator4: TMenuItem
        Caption = '-'
      end
      object MenuItemUndo: TMenuItem
        Caption = '撤消'
        ShortCut = 16474
        OnClick = MenuItemUndoClick
      end
    end
    object MenuItemCharacter: TMenuItem
      Caption = '字符'
      GroupIndex = 2
      object MenuItemLeft: TMenuItem
        Caption = '左对齐'
        OnClick = AlignClick
      end
      object MenuItemRight: TMenuItem
        Caption = '右对齐'
        OnClick = AlignClick
      end
      object MenuItemCenter: TMenuItem
        Caption = '居中对齐'
        OnClick = AlignClick
      end
      object Separator5: TMenuItem
        Caption = '-'
      end
      object MenuItemWordwarp: TMenuItem
        Caption = '换行'
        OnClick = MenuItemWordwarpClick
      end
      object Separator6: TMenuItem
        Caption = '-'
      end
      object MenuItemFont: TMenuItem
        Caption = '字体'
      end
    end
    object MenuItemBaguwen: TMenuItem
      Caption = '趣味作文'
      GroupIndex = 3
      object MenuItemXiaKeXing: TMenuItem
        Caption = '侠客行'
        OnClick = MenuItemXiaKeXingClick
      end
      object MenuItemCity: TMenuItem
        Caption = '小镇'
      end
      object MenuItemWar: TMenuItem
        Caption = '打斗场景'
      end
      object Separator7: TMenuItem
        Caption = '-'
      end
      object MenuItemAfternoon: TMenuItem
        Caption = '晚霞'
      end
      object MenuItemMoring: TMenuItem
        Caption = '早晨'
      end
      object MenuItemSummer: TMenuItem
        Caption = '炎热的夏天'
      end
    end
  end
  object SaveDialog: TSaveDialog
    Filter = 'Rich Text File(*.rtf)|*.rtf|Normal Text File(*.txt)|*.txt|All File|*.*'
    Left = 416
    Top = 16
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 304
    Top = 16
  end
  object PrintDialog: TPrintDialog
    Left = 520
    Top = 16
  end
end
