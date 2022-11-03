object Case05_FrmMain: TCase05_FrmMain
  Left = 86
  Height = 366
  Top = 85
  Width = 706
  BorderStyle = bsSingle
  Caption = 'Case05_FrmMain'
  ClientHeight = 346
  ClientWidth = 706
  Menu = MainMenu1
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Panel1: TPanel
    Left = 8
    Height = 234
    Top = 16
    Width = 562
    Caption = 'Panel1'
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Height = 23
    Top = 323
    Width = 706
    Panels = <    
      item
        Width = 150
      end    
      item
        Width = 150
      end    
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object TrackBar1: TTrackBar
    Left = 576
    Height = 100
    Top = 88
    Width = 25
    Orientation = trVertical
    Position = 0
    TabOrder = 2
  end
  object TrackBar2: TTrackBar
    Left = 616
    Height = 100
    Top = 88
    Width = 25
    Orientation = trVertical
    Position = 0
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Height = 20
    Top = 264
    Width = 100
    TabOrder = 4
  end
  object VLCPlayer: TLCLVLCPlayer
    AudioDelay = -1
    AudioVolume = -1
    AudioMuted = False
    Channel = -1
    Chapter = -1
    FitWindow = False
    FullScreenMode = False
    UseEvents = False
    ParentWindow = Panel1
    Left = 176
    Top = 32
  end
  object Timer1: TTimer
    Left = 360
    Top = 72
  end
  object MainMenu1: TMainMenu
    Left = 112
    Top = 32
    object MenuItem1: TMenuItem
      Action = ActionMedia
      object MenuItem2: TMenuItem
        Action = ActionOpen
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object MenuItem3: TMenuItem
        Action = ActionExit
      end
    end
    object MenuItem4: TMenuItem
      Action = ActionContral
      object MenuItem5: TMenuItem
        Action = ActionPlay
      end
      object MenuItem6: TMenuItem
        Action = ActionPause
      end
      object MenuItem7: TMenuItem
        Action = ActionStop
      end
      object Separator2: TMenuItem
        Caption = '-'
      end
      object MenuItem8: TMenuItem
        Action = ActionRecord
      end
    end
  end
  object ActionList1: TActionList
    Left = 40
    Top = 32
    object ActionOpen: TAction
      Category = '控制'
      Caption = '打开(&O)'
      OnExecute = ActionOpenExecute
      ShortCut = 16463
    end
    object ActionExit: TAction
      Category = '控制'
      Caption = '退出(&Q)'
    end
    object ActionMedia: TAction
      Category = '控制'
      Caption = '媒体(&M)'
      OnExecute = ActionMediaExecute
    end
    object ActionContral: TAction
      Category = '控制'
      Caption = '控制(&C)'
      OnExecute = ActionContralExecute
    end
    object ActionPlay: TAction
      Category = '控制'
      Caption = '播放(&L)'
      OnExecute = ActionPlayExecute
    end
    object ActionStop: TAction
      Category = '控制'
      Caption = '停止(&S)'
    end
    object ActionPause: TAction
      Category = '控制'
      Caption = '暂停(&P)'
    end
    object ActionRecord: TAction
      Category = '控制'
      Caption = '录音(&R)'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 232
    Top = 32
  end
end
