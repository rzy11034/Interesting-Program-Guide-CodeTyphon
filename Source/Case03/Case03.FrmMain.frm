object Case03_FrmMain: TCase03_FrmMain
  Left = 86
  Height = 471
  Top = 85
  Width = 671
  BorderStyle = bsSingle
  Caption = '华容道'
  ClientHeight = 471
  ClientWidth = 671
  Font.CharSet = ANSI_CHARSET
  Font.Height = -14
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 432
    Height = 368
    Top = 24
    Width = 220
    AutoSize = False
    Caption = 'Label1'
    WordWrap = True
  end
  object Button1: TButton
    Left = 432
    Height = 25
    Top = 408
    Width = 75
    Caption = 'Button1'
    OnClick = Button1Click
    TabOrder = 0
  end
  object Button2: TButton
    Left = 512
    Height = 25
    Top = 407
    Width = 75
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 1
  end
end
