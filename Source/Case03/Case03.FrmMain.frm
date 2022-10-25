object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 736
  Top = 85
  Width = 1245
  BorderStyle = bsDialog
  Caption = '华容道'
  ClientHeight = 736
  ClientWidth = 1245
  DesignTimePPI = 120
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 560
    Height = 108
    Top = 24
    Width = 275
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Button1: TButton
    Left = 625
    Height = 62
    Top = 250
    Width = 125
    Caption = 'Button1'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 784
    Height = 31
    Top = 580
    Width = 94
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 1
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
    TabOrder = 2
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
  object Image2: TImage
    Left = 930
    Height = 100
    Top = 450
    Width = 100
    AutoSize = True
  end
  object Panel3: TPanel
    Left = 650
    Height = 125
    Top = 320
    Width = 125
    Caption = 'Panel3'
    Color = clBlue
    ParentColor = False
    TabOrder = 3
  end
  object ImageList160x160: TImageList
    Left = 520
    Top = 104
  end
  object ImageList80x80: TImageList
    Left = 376
    Top = 176
  end
  object ImageList80x160: TImageList
    Left = 520
    Top = 176
  end
  object ImageList160x80: TImageList
    Left = 376
    Top = 104
  end
end
