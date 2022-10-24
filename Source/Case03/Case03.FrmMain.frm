object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 589
  Top = 85
  Width = 996
  BorderStyle = bsDialog
  Caption = '华容道'
  ClientHeight = 589
  ClientWidth = 996
  Font.CharSet = ANSI_CHARSET
  Font.Height = -14
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  KeyPreview = True
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 448
    Height = 302
    Top = 19
    Width = 220
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Button1: TButton
    Left = 480
    Height = 25
    Top = 464
    Width = 75
    Caption = 'Button1'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 627
    Height = 25
    Top = 464
    Width = 75
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 13
    Height = 520
    Top = 15
    Width = 420
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel2'
    ClientHeight = 516
    ClientWidth = 416
    Color = 4227327
    ParentColor = False
    TabOrder = 2
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
  object Image2: TImage
    Left = 448
    Height = 110
    Top = 336
    Width = 110
    AutoSize = True
  end
  object ImageList160x160: TImageList
    Left = 416
    Top = 83
  end
  object ImageList80x80: TImageList
    Left = 301
    Top = 141
  end
  object ImageList80x160: TImageList
    Left = 416
    Top = 141
  end
  object ImageList160x80: TImageList
    Left = 301
    Top = 83
  end
end
