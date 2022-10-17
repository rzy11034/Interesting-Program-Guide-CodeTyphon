object Case02_FrmMain: TCase02_FrmMain
  Left = 86
  Height = 559
  Top = 85
  Width = 962
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '速算24'
  ClientHeight = 559
  ClientWidth = 962
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
    Height = 82
    Top = 338
    Width = 920
    AutoSize = False
    Caption = '3. 这时系统会计算输入表达式的结果，告诉用户是对还是错了。在弹出的对话框中单击“确定”按钮，如果错了可以再次输入新的表达式，重复上一步。直到您的表达式正确，这时系统会恭喜算对了！'
    WordWrap = True
  end
  object Image1: TImage
    Left = 40
    Height = 200
    Top = 24
    Width = 162
    Stretch = True
  end
  object Image2: TImage
    Left = 210
    Height = 200
    Top = 24
    Width = 162
    Stretch = True
  end
  object Image3: TImage
    Left = 380
    Height = 200
    Top = 24
    Width = 162
    Stretch = True
  end
  object Image4: TImage
    Left = 550
    Height = 200
    Top = 24
    Width = 162
    Stretch = True
  end
  object Label4: TLabel
    Left = 24
    Height = 24
    Top = 430
    Width = 180
    Caption = '在下面输入数学表达式'
  end
  object Edit1: TEdit
    Left = 24
    Height = 32
    Top = 460
    Width = 696
    OnKeyPress = Edit1KeyPress
    TabOrder = 0
    Text = 'Edit1'
  end
  object Label5: TLabel
    Left = 24
    Height = 24
    Top = 509
    Width = 144
    Caption = '使用时间: 0:00:00'
  end
  object Button1: TButton
    Left = 760
    Height = 31
    Top = 430
    Width = 94
    Caption = '开始游戏'
    OnClick = Button1Click
    TabOrder = 1
  end
  object Button2: TButton
    Left = 760
    Height = 31
    Top = 469
    Width = 94
    Caption = '计算'
    OnClick = Button2Click
    TabOrder = 2
  end
  object Button3: TButton
    Left = 760
    Height = 31
    Top = 509
    Width = 94
    Caption = '退出游戏'
    OnClick = Button3Click
    TabOrder = 3
  end
  object Label6: TLabel
    Left = 200
    Height = 24
    Top = 509
    Width = 54
    Caption = '结果：'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 328
    Top = 448
  end
end
