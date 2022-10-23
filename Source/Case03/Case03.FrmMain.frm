object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 558
  Top = 85
  Width = 775
  BorderStyle = bsSingle
  Caption = '华容道'
  ClientHeight = 558
  ClientWidth = 775
  DesignTimePPI = 120
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  KeyPreview = True
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 460
    Height = 378
    Top = 24
    Width = 275
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Button1: TButton
    Left = 460
    Height = 31
    Top = 505
    Width = 94
    Caption = 'Button1'
    DragMode = dmAutomatic
    TabOrder = 0
  end
  object Button2: TButton
    Left = 600
    Height = 31
    Top = 500
    Width = 94
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 16
    Height = 512
    Top = 19
    Width = 412
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel2'
    ClientHeight = 508
    ClientWidth = 408
    Color = 4227327
    ParentColor = False
    TabOrder = 2
    object Panel1: TPanel
      Left = 30
      Height = 0
      Top = 30
      Width = 0
      BevelOuter = bvNone
      ParentColor = False
      TabOrder = 0
      OnDragOver = Panel1DragOver
      OnPaint = Panel1Paint
    end
  end
  object Image1: TImage
    Left = 528
    Height = 113
    Top = 352
    Width = 113
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
