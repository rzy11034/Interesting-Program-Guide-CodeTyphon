object Case03_FrmSplash: TCase03_FrmSplash
  Left = 86
  Height = 532
  Top = 85
  Width = 789
  Caption = 'Case03_FrmSplash'
  ClientHeight = 532
  ClientWidth = 789
  DoubleBuffered = True
  Font.CharSet = ANSI_CHARSET
  Font.Height = -14
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  ParentDoubleBuffered = False
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Button1: TButton
    Left = 520
    Height = 33
    Top = 432
    Width = 68
    Caption = 'Button1'
    TabOrder = 0
  end
  object Button2: TButton
    AnchorSideBottom.Side = asrCenter
    Left = 416
    Height = 33
    Top = 432
    Width = 68
    Caption = 'Button2'
    TabOrder = 1
  end
  object Label1: TLabel
    Left = 410
    Height = 378
    Top = 16
    Width = 301
    AutoSize = False
    Caption = 'Label1'
  end
  object Image1: TImage
    Left = 16
    Height = 500
    Top = 16
    Width = 380
  end
  object Timer1: TTimer
    Interval = 1
    Left = 464
    Top = 80
  end
end
