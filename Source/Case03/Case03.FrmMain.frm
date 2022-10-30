object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 678
  Top = 85
  Width = 921
  BorderStyle = bsDialog
  Caption = '华容道'
  ClientHeight = 678
  ClientWidth = 921
  DesignTimePPI = 120
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 560
    Height = 576
    Top = 24
    Width = 320
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Panel2: TPanel
    Left = 16
    Height = 650
    Top = 19
    Width = 525
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel2'
    ClientHeight = 646
    ClientWidth = 521
    Color = 4227327
    ParentColor = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 30
      Height = 1
      Top = 30
      Width = 1
      BevelOuter = bvNone
      ParentColor = False
      TabOrder = 0
      OnDragDrop = Panel1DragDrop
      OnDragOver = Panel1DragOver
      OnPaint = Panel1Paint
    end
  end
  object Label2: TLabel
    Left = 32
    Height = 24
    Top = 680
    Width = 57
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 560
    Height = 31
    Top = 631
    Width = 94
    Caption = '重新开始'
    OnClick = Button1Click
    TabOrder = 1
  end
  object Button2: TButton
    Left = 786
    Height = 31
    Top = 630
    Width = 94
    Caption = '退出游戏'
    OnClick = Button2Click
    TabOrder = 2
  end
  object ImageList160x160: TImageList
    Left = 330
    Top = 104
  end
  object ImageList80x80: TImageList
    Left = 130
    Top = 170
  end
  object ImageList80x160: TImageList
    Left = 330
    Top = 190
  end
  object ImageList160x80: TImageList
    Left = 130
    Top = 104
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 416
    Top = 320
  end
end
