object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 589
  Top = 85
  Width = 737
  BorderStyle = bsDialog
  Caption = '华容道'
  ClientHeight = 589
  ClientWidth = 737
  Font.CharSet = ANSI_CHARSET
  Font.Height = -14
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  KeyPreview = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 448
    Height = 461
    Top = 19
    Width = 256
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Panel2: TPanel
    Left = 13
    Height = 520
    Top = 15
    Width = 420
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel2'
    ClientHeight = 518
    ClientWidth = 418
    Color = 4227327
    ParentColor = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 24
      Height = 1
      Top = 24
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
    Left = 26
    Height = 17
    Top = 549
    Width = 42
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 448
    Height = 25
    Top = 505
    Width = 75
    Caption = '重新开始'
    OnClick = Button1Click
    TabOrder = 1
  end
  object Button2: TButton
    Left = 629
    Height = 25
    Top = 504
    Width = 75
    Caption = '退出游戏'
    OnClick = Button2Click
    TabOrder = 2
  end
  object ImageList160x160: TImageList
    Left = 264
    Top = 83
  end
  object ImageList80x80: TImageList
    Left = 104
    Top = 136
  end
  object ImageList80x160: TImageList
    Left = 264
    Top = 152
  end
  object ImageList160x80: TImageList
    Left = 104
    Top = 83
  end
end
