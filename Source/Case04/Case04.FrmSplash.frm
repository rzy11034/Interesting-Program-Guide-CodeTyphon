object Case04_FrmSplash: TCase04_FrmSplash
  Left = 86
  Height = 532
  Top = 85
  Width = 680
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Case04_FrmSplash'
  ClientHeight = 532
  ClientWidth = 680
  DoubleBuffered = True
  Font.CharSet = ANSI_CHARSET
  Font.Height = -14
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ParentDoubleBuffered = False
  Position = poScreenCenter
  LCLVersion = '8.1'
  object Button1: TButton
    Left = 422
    Height = 33
    Top = 442
    Width = 179
    Caption = '开始'
    OnClick = Button1Click
    TabOrder = 0
  end
  object Label1: TLabel
    Left = 358
    Height = 378
    Top = 19
    Width = 301
    AutoSize = False
    Caption = 'Label1'
  end
  object PaintBox1: TPaintBox
    Left = 13
    Height = 493
    Top = 19
    Width = 320
  end
  object Image1: TImage
    Left = 38
    Height = 90
    Top = 58
    Width = 90
  end
  object Timer1: TTimer
    Interval = 1
    Left = 464
    Top = 80
  end
end
