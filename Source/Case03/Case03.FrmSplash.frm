object Case03_FrmSplash: TCase03_FrmSplash
  Left = 86
  Height = 705
  Top = 85
  Width = 986
  Caption = 'Case03_FrmSplash'
  ClientHeight = 705
  ClientWidth = 986
  DesignTimePPI = 120
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Button1: TButton
    Left = 632
    Height = 34
    Top = 620
    Width = 95
    AutoSize = True
    Caption = 'Button1'
    OnClick = Button1Click
    TabOrder = 0
  end
  object PaintBox1: TPaintBox
    Left = 20
    Height = 670
    Top = 20
    Width = 470
  end
  object Button2: TButton
    AnchorSideBottom.Side = asrCenter
    Left = 512
    Height = 31
    Top = 624
    Width = 94
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 1
  end
  object Label1: TLabel
    Left = 504
    Height = 472
    Top = 24
    Width = 376
    AutoSize = False
    Caption = 'Label1'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 580
    Top = 100
  end
end
