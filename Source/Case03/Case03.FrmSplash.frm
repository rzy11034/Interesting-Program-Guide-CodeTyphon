object Case03_FrmSplash: TCase03_FrmSplash
  Left = 86
  Height = 665
  Top = 85
  Width = 850
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Case03_FrmSplash'
  ClientHeight = 665
  ClientWidth = 850
  DesignTimePPI = 120
  DoubleBuffered = True
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ParentDoubleBuffered = False
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Button1: TButton
    Left = 528
    Height = 41
    Top = 552
    Width = 224
    Caption = '开始'
    OnClick = Button1Click
    TabOrder = 0
  end
  object Label1: TLabel
    Left = 448
    Height = 472
    Top = 24
    Width = 376
    AutoSize = False
    Caption = 'Label1'
  end
  object PaintBox1: TPaintBox
    Left = 16
    Height = 616
    Top = 24
    Width = 400
  end
  object Image1: TImage
    Left = 48
    Height = 113
    Top = 72
    Width = 113
  end
  object Timer1: TTimer
    Interval = 1
    Left = 580
    Top = 100
  end
end
