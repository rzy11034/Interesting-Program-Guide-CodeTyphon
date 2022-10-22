object Case02_FrmMain: TCase02_FrmMain
  Left = 86
  Height = 447
  Top = 85
  Width = 770
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '速算24'
  ClientHeight = 447
  ClientWidth = 770
  Font.CharSet = ANSI_CHARSET
  Font.Height = -14
  Font.Pitch = fpVariable
  Font.Quality = fqDraft
  OnCreate = FormCreate
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 19
    Height = 26
    Top = 205
    Width = 736
    AutoSize = False
    Caption = '1. 单击“开始游戏”按钮，游戏开始，系统将发出4张扑克牌'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 19
    Height = 38
    Top = 228
    Width = 736
    AutoSize = False
    Caption = '2. 要求用户利用扑克牌显示的数字，通过加减乘除运算，以最快的速度得出24(可以使用括号)，JQKA算做1。然后在文本框中写好表达式，接着单击“计算”按钮'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 19
    Height = 66
    Top = 270
    Width = 736
    AutoSize = False
    Caption = '3. 这时系统会计算输入表达式的结果，告诉用户是对还是错了。在弹出的对话框中单击“确定”按钮，如果错了可以再次输入新的表达式，重复上一步。直到您的表达式正确，这时系统会恭喜算对了！'
    WordWrap = True
  end
  object Image1: TImage
    Left = 32
    Height = 160
    Top = 19
    Width = 130
    Stretch = True
  end
  object Image2: TImage
    Left = 168
    Height = 160
    Top = 19
    Width = 130
    Stretch = True
  end
  object Image3: TImage
    Left = 304
    Height = 160
    Top = 19
    Width = 130
    Stretch = True
  end
  object Image4: TImage
    Left = 440
    Height = 160
    Top = 19
    Width = 130
    Stretch = True
  end
  object Label4: TLabel
    Left = 19
    Height = 20
    Top = 344
    Width = 140
    Caption = '在下面输入数学表达式'
  end
  object Edit1: TEdit
    Left = 19
    Height = 28
    Top = 368
    Width = 557
    OnKeyPress = Edit1KeyPress
    TabOrder = 0
    Text = 'Edit1'
  end
  object Label5: TLabel
    Left = 19
    Height = 20
    Top = 407
    Width = 109
    Caption = '使用时间: 0:00:00'
  end
  object Button1: TButton
    Left = 608
    Height = 25
    Top = 344
    Width = 75
    Caption = '开始游戏'
    OnClick = Button1Click
    TabOrder = 1
  end
  object Button2: TButton
    Left = 608
    Height = 25
    Top = 375
    Width = 75
    Caption = '计算'
    OnClick = Button2Click
    TabOrder = 2
  end
  object Button3: TButton
    Left = 608
    Height = 25
    Top = 407
    Width = 75
    Caption = '退出游戏'
    OnClick = Button3Click
    TabOrder = 3
  end
  object Label6: TLabel
    Left = 160
    Height = 20
    Top = 407
    Width = 42
    Caption = '结果：'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 262
    Top = 358
  end
end
