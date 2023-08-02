object Case07_FrmMain: TCase07_FrmMain
  Left = 86
  Height = 517
  Top = 85
  Width = 908
  Caption = 'Case07_FrmMain'
  ClientHeight = 517
  ClientWidth = 908
  Position = poDesktopCenter
  LCLVersion = '8.0'
  object DBGrid1: TDBGrid
    Left = 0
    Height = 435
    Top = 8
    Width = 592
    Color = clWindow
    Columns = <>
    DataSource = DataSource1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Height = 25
    Top = 464
    Width = 75
    Caption = 'Button1'
    OnClick = Button1Click
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 112
    Height = 25
    Top = 464
    Width = 192
    TabOrder = 2
  end
  object Button2: TButton
    Left = 424
    Height = 25
    Top = 464
    Width = 75
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 600
    Height = 434
    Top = 8
    Width = 294
    Lines.Strings = (
      'Memo1'
    )
    ScrollBars = ssAutoBoth
    TabOrder = 4
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 544
    Top = 72
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF8
    Properties.Strings = (
      'RawStringEncoding=DB_CP'
    )
    AutoCommit = False
    Port = 0
    Database = 'C:\Bus.DB'
    Protocol = 'sqlite'
    Left = 152
    Top = 96
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Transaction = ZTransaction1
    SQL.Strings = (
      'SELECT *'
      'FROM  bus'
    )
    Params = <>
    Left = 152
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 288
    Top = 168
  end
  object ZTransaction1: TZTransaction
    Connection = ZConnection1
    Left = 288
    Top = 96
  end
  object ZSQLMonitor1: TZSQLMonitor
    MaxTraceCount = 100
    OnTrace = ZSQLMonitor1Trace
    Left = 440
    Top = 168
  end
end
