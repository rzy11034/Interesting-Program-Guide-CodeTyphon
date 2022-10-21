object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 657
  Top = 85
  Width = 1047
  BorderStyle = bsSingle
  Caption = '华容道'
  ClientHeight = 657
  ClientWidth = 1047
  Font.CharSet = ANSI_CHARSET
  Font.Height = -14
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 368
    Height = 302
    Top = 19
    Width = 220
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Button1: TButton
    Left = 368
    Height = 25
    Top = 404
    Width = 75
    Caption = 'Button1'
    OnClick = Button1Click
    TabOrder = 0
  end
  object Button2: TButton
    Left = 456
    Height = 25
    Top = 404
    Width = 75
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 19
    Height = 410
    Top = 19
    Width = 330
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel2'
    ClientHeight = 406
    ClientWidth = 326
    Color = 4227327
    ParentColor = False
    TabOrder = 2
    OnPaint = Panel2Paint
    object Panel1: TPanel
      Left = 24
      Height = 318
      Top = 24
      Width = 210
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 681
    Height = 410
    Top = 82
    Width = 351
    Caption = 'Panel3'
    ClientHeight = 410
    ClientWidth = 351
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 32
      Height = 30
      Top = 88
      Width = 75
      Caption = 'BitBtn1'
      DragCursor = crNoDrop
      DragMode = dmAutomatic
      OnStartDrag = BitBtn1StartDrag
      TabOrder = 0
    end
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
