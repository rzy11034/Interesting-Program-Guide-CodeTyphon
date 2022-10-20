object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 471
  Top = 85
  Width = 839
  BorderStyle = bsSingle
  Caption = '华容道'
  ClientHeight = 471
  ClientWidth = 839
  DesignTimePPI = 120
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 416
    Height = 378
    Top = 24
    Width = 275
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Button1: TButton
    Left = 400
    Height = 31
    Top = 424
    Width = 94
    Caption = 'Button1'
    OnClick = Button1Click
    TabOrder = 1
  end
  object Button2: TButton
    Left = 504
    Height = 31
    Top = 424
    Width = 94
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 200
    Height = 38
    Top = 240
    Width = 94
    Caption = 'BitBtn1'
    TabOrder = 0
    Visible = False
  end
  object Panel2: TPanel
    Left = 24
    Height = 410
    Top = 24
    Width = 330
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = 'Panel2'
    ClientHeight = 406
    ClientWidth = 326
    Color = 4227327
    ParentColor = False
    TabOrder = 3
    object Panel1: TPanel
      Left = 8
      Height = 397
      Top = 3
      Width = 262
      BevelOuter = bvNone
      TabOrder = 0
    end
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
