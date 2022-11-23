object Case07_FrmMain: TCase07_FrmMain
  Left = 86
  Height = 621
  Top = 85
  Width = 846
  Caption = 'Case07_FrmMain'
  ClientHeight = 621
  ClientWidth = 846
  OnCreate = FormCreate
  Position = poDesktopCenter
  LCLVersion = '7.9'
  object Button1: TButton
    Left = 240
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button1'
    OnClick = Button1Click
    TabOrder = 0
  end
  object DBNavigator1: TDBNavigator
    Left = 240
    Height = 25
    Top = 392
    Width = 241
    BevelOuter = bvNone
    ChildSizing.EnlargeHorizontal = crsScaleChilds
    ChildSizing.EnlargeVertical = crsScaleChilds
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclLeftToRightThenTopToBottom
    ChildSizing.ControlsPerLine = 100
    ClientHeight = 25
    ClientWidth = 241
    DataSource = DataSource1
    Options = []
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 17
    Height = 340
    Top = 14
    Width = 807
    Color = clWindow
    Columns = <>
    DataSource = DataSource1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 264
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button2'
    OnClick = Button2Click
    TabOrder = 3
  end
  object Button3: TButton
    Left = 288
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button3'
    OnClick = Button3Click
    TabOrder = 4
  end
  object Button4: TButton
    Left = 312
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button4'
    OnClick = Button4Click
    TabOrder = 5
  end
  object Button5: TButton
    Left = 336
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button5'
    OnClick = Button5Click
    TabOrder = 6
  end
  object Button6: TButton
    Left = 360
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button6'
    OnClick = Button6Click
    TabOrder = 7
  end
  object Button7: TButton
    Left = 384
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button7'
    OnClick = Button7Click
    TabOrder = 8
  end
  object Button8: TButton
    Left = 408
    Height = 25
    Top = 424
    Width = 26
    Caption = 'Button8'
    OnClick = Button8Click
    TabOrder = 9
  end
  object Button9: TButton
    Left = 432
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button9'
    OnClick = Button9Click
    TabOrder = 10
  end
  object Button10: TButton
    Left = 456
    Height = 25
    Top = 424
    Width = 24
    Caption = 'Button10'
    OnClick = Button10Click
    TabOrder = 11
  end
  object SQLite3Connection1: TSQLite3Connection
    Connected = True
    LoginPrompt = False
    DatabaseName = 'C:\test.sql'
    KeepConnection = False
    Transaction = SQLTransaction1
    AlwaysUseBigint = False
    Left = 280
    Top = 64
  end
  object SQLQuery1: TSQLQuery
    IndexName = 'DEFAULT_ORDER'
    MaxIndexesCount = 4
    FieldDefs = <    
      item
        Name = 'ID'
        DataType = ftAutoInc
        Precision = -1
      end    
      item
        Name = 'Number'
        DataType = ftInteger
        Precision = -1
      end    
      item
        Name = 'Name'
        DataType = ftString
        Precision = -1
        Size = 20
      end>
    Database = SQLite3Connection1
    Transaction = SQLTransaction1
    SQL.Strings = (
      'SELECT  t.id, t.number, t.name'
      'FROM  test t'
    )
    UpdateSQL.Strings = (
      'update "Test"'
      'set'
      '  "Test"."ID" = :ID,'
      '  "Test"."Name" = :Name,'
      '  "Test"."Number" = :Number'
      'where'
      '   ("Test"."ID" = :OLD_ID)'
      ''
    )
    Left = 280
    Top = 144
    object SQLQuery1ID: TAutoIncField
      FieldKind = fkData
      FieldName = 'ID'
      Index = 0
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = True
    end
    object SQLQuery1Number: TLongintField
      FieldKind = fkData
      FieldName = 'Number'
      Index = 1
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
    object SQLQuery1Name: TStringField
      FieldKind = fkData
      FieldName = 'Name'
      Index = 2
      LookupCache = False
      ProviderFlags = [pfInUpdate, pfInWhere]
      ReadOnly = False
      Required = False
    end
  end
  object DataSource1: TDataSource
    DataSet = SQLQuery1
    OnStateChange = DataSource1StateChange
    Left = 392
    Top = 144
  end
  object SQLTransaction1: TSQLTransaction
    Active = True
    Database = SQLite3Connection1
    Left = 392
    Top = 64
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 549
    Top = 386
  end
end
