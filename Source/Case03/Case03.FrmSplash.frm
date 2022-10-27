object Case03_FrmSplash: TCase03_FrmSplash
  Left = 86
  Height = 588
  Top = 85
  Width = 797
  Caption = 'Case03_FrmSplash'
  ClientHeight = 588
  ClientWidth = 797
  Font.Height = -15
  Font.Name = 'Sans'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  LCLVersion = '7.9'
  object Button1: TButton
    Left = 472
    Height = 27
    Top = 496
    Width = 76
    AutoSize = True
    Caption = 'Button1'
    OnClick = Button1Click
    TabOrder = 0
  end
  object PaintBox1: TPaintBox
    Left = 16
    Height = 536
    Top = 16
    Width = 376
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 464
    Top = 80
  end
end
