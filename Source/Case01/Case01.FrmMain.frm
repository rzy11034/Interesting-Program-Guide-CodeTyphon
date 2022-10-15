object Case01_FrmMain: TCase01_FrmMain
  Left = 86
  Height = 502
  Top = 85
  Width = 835
  BorderStyle = bsSingle
  Caption = '“幸运52”模拟小游戏'
  ClientHeight = 502
  ClientWidth = 835
  DesignTimePPI = 120
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnClose = FormClose
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 16
    Height = 24
    Top = 16
    Width = 443
    Caption = '1.单击“开始游戏”按钮，游戏开始，系统将给出商品信息'
  end
  object Label2: TLabel
    Left = 16
    Height = 24
    Top = 48
    Width = 515
    Caption = '2.请迅速在文本框中输入您估计的商品价格，然后单击“确定”按钮'
  end
  object Label3: TLabel
    Left = 16
    Height = 56
    Top = 80
    Width = 768
    AutoSize = False
    Caption = '3.这时系统会提示您的估计是高了还是低了，在弹出的对话框中单击“确定”按钮，再次输入新的估计值，重复上一步。直到您的估计值正确，这时系统会恭喜您中奖了'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 312
    Height = 24
    Top = 256
    Width = 338
    Caption = '请单击“确定”按钮对您的估计值进行确定：'
  end
  object Label5: TLabel
    Left = 312
    Height = 24
    Top = 216
    Width = 324
    Caption = '请在文本框中输入您对商品价格的估计：'
  end
  object Button1: TButton
    AnchorSideLeft.Side = asrCenter
    AnchorSideRight.Side = asrCenter
    Left = 689
    Height = 31
    Top = 256
    Width = 94
    Caption = '(&Y) 确定'
    OnClick = Button1Click
    TabOrder = 0
  end
  object Button2: TButton
    AnchorSideLeft.Side = asrCenter
    AnchorSideRight.Side = asrCenter
    Left = 689
    Height = 31
    Top = 296
    Width = 94
    Caption = '开始游戏'
    OnClick = Button2Click
    TabOrder = 1
  end
  object Button3: TButton
    AnchorSideLeft.Side = asrCenter
    AnchorSideRight.Side = asrCenter
    Left = 689
    Height = 31
    Top = 336
    Width = 94
    Caption = '退出游戏'
    TabOrder = 2
  end
  object Label6: TLabel
    Left = 16
    Height = 24
    Top = 160
    Width = 72
    Caption = '商品.........'
  end
  object Image1: TImage
    Left = 14
    Height = 281
    Top = 199
    Width = 282
    Stretch = True
  end
  object Edit1: TEdit
    Left = 656
    Height = 32
    Top = 216
    Width = 160
    OnKeyDown = Edit1KeyDown
    TabOrder = 3
  end
end
