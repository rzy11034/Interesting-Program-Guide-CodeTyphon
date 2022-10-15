object Case02_FrmMain: TCase02_FrmMain
  Left = 86
  Height = 556
  Top = 85
  Width = 963
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '速算24'
  ClientHeight = 556
  ClientWidth = 963
  DesignTimePPI = 120
  Font.CharSet = ANSI_CHARSET
  Font.Height = -18
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 24
    Height = 32
    Top = 256
    Width = 920
    AutoSize = False
    Caption = '1. 单击“开始游戏”按钮，游戏开始，系统将发出4张扑克牌'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 24
    Height = 48
    Top = 285
    Width = 920
    AutoSize = False
    Caption = '2. 要求用户利用扑克牌显示的数字，通过加减乘除运算，以最快的速度得出24(可以使用括号)，JQKA算做1。然后在文本框中写好表达式，接着单击“计算”按钮'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 24
    Height = 56
    Top = 338
    Width = 920
    AutoSize = False
    Caption = '3. 这时系统会计算输入表达式的结果，告诉用户是对还是错了。在弹出的对话框中单击“确定”按钮，如果错了可以再次输入新的表达式，重复上一步。直到您的表达式正确，这时系统会恭喜算对了！'
    WordWrap = True
  end
  object Image1: TImage
    Left = 40
    Height = 199
    Top = 24
    Width = 152
  end
  object Image2: TImage
    Left = 200
    Height = 199
    Top = 24
    Width = 152
  end
  object Image3: TImage
    Left = 360
    Height = 199
    Top = 24
    Width = 152
  end
  object Image4: TImage
    Left = 520
    Height = 199
    Top = 24
    Width = 152
  end
  object Label4: TLabel
    Left = 24
    Height = 24
    Top = 417
    Width = 180
    Caption = '在下面输入数学表达式'
  end
  object Edit1: TEdit
    Left = 24
    Height = 32
    Top = 448
    Width = 696
    TabOrder = 0
    Text = 'Edit1'
  end
  object Label5: TLabel
    Left = 24
    Height = 24
    Top = 496
    Width = 90
    Caption = '使用时间：'
  end
  object Button1: TButton
    Left = 760
    Height = 31
    Top = 417
    Width = 94
    Caption = '开始游戏'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 760
    Height = 31
    Top = 456
    Width = 94
    Caption = '计算'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 760
    Height = 31
    Top = 496
    Width = 94
    Caption = '退出游戏'
    TabOrder = 3
  end
  object Timer1: TTimer
    Left = 552
    Top = 440
  end
end
