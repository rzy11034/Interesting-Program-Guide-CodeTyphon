object Case07_FrmMain: TCase07_FrmMain
  Left = 86
  Height = 621
  Top = 85
  Width = 846
  Caption = 'Case07_FrmMain'
  ClientHeight = 621
  ClientWidth = 846
  Position = poDesktopCenter
  LCLVersion = '7.9'
  object DBText1: TDBText
    Left = 135
    Height = 17
    Top = 68
    Width = 48
  end
  object Sqlite3Dataset1: TSqlite3Dataset
    Left = 272
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = Sqlite3Dataset1
    Left = 196
    Top = 260
  end
end
