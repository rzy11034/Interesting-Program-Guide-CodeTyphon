object Case05_FrmMain: TCase05_FrmMain
  Left = 86
  Height = 542
  Top = 85
  Width = 850
  BorderStyle = bsSingle
  Caption = '多媒体播放器'
  ClientHeight = 522
  ClientWidth = 850
  Menu = MainMenu1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  Position = poScreenCenter
  LCLVersion = '7.9'
  object Panel1: TPanel
    Left = 0
    Height = 434
    Top = 26
    Width = 850
    Align = alClient
    ParentColor = False
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Height = 22
    Top = 500
    Width = 850
    Panels = <    
      item
        Width = 96
      end    
      item
        Width = 120
      end    
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Height = 26
    Top = 0
    Width = 850
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 1
      Top = 2
      Action = ActionExit
    end
    object ToolButton2: TToolButton
      Left = 24
      Top = 2
      Action = ActionOpen
    end
    object ToolButton3: TToolButton
      Left = 47
      Height = 22
      Top = 2
      Caption = 'ToolButton3'
      Style = tbsDivider
    end
    object ToolButton4: TToolButton
      Left = 52
      Top = 2
      Action = ActionPlay
    end
    object ToolButton5: TToolButton
      Left = 75
      Top = 2
      Action = ActionPause
    end
    object ToolButton6: TToolButton
      Left = 98
      Top = 2
      Action = ActionStop
    end
    object ToolButton7: TToolButton
      Left = 121
      Height = 22
      Top = 2
      ImageIndex = 5
      Style = tbsDivider
    end
    object ToolButton8: TToolButton
      Left = 126
      Top = 2
      Action = ActionRecord
    end
  end
  object Panel2: TPanel
    Left = 0
    Height = 40
    Top = 460
    Width = 850
    Align = alBottom
    BevelOuter = bvNone
    ClientHeight = 40
    ClientWidth = 850
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
    object TrackBarVideoPosition: TTrackBar
      Left = 0
      Height = 40
      Top = 0
      Width = 626
      Max = 100
      Position = 0
      TickMarks = tmBoth
      Align = alClient
      OnMouseUp = TrackBarVideoPositionMouseUp
      TabOrder = 0
    end
    object TrackBarAudioVolume: TTrackBar
      Left = 670
      Height = 40
      Top = 0
      Width = 180
      Frequency = 4
      Max = 100
      Min = 1
      OnChange = TrackBarAudioVolumeChange
      Position = 1
      TickMarks = tmTopLeft
      Align = alRight
      TabOrder = 1
    end
    object SpeedButton1: TSpeedButton
      Left = 626
      Height = 40
      Top = 0
      Width = 44
      Align = alRight
      Color = clNone
      Images = ImageList2
      ImageIndex = 1
      OnClick = SpeedButton1Click
    end
  end
  object VLCPlayer: TLCLVLCPlayer
    AudioDelay = -1
    AudioVolume = -1
    AudioMuted = False
    Channel = -1
    Chapter = -1
    FitWindow = False
    FullScreenMode = False
    UseEvents = False
    Left = 179
    Top = 96
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 410
    Top = 96
  end
  object MainMenu1: TMainMenu
    Images = ImageList1
    Left = 102
    Top = 96
    object MenuItem1: TMenuItem
      Action = ActionMedia
      object MenuItem2: TMenuItem
        Action = ActionOpen
      end
      object Separator1: TMenuItem
        Caption = '-'
      end
      object MenuItem3: TMenuItem
        Action = ActionExit
      end
    end
    object MenuItem4: TMenuItem
      Action = ActionContral
      object MenuItem5: TMenuItem
        Action = ActionPlay
      end
      object MenuItem6: TMenuItem
        Action = ActionPause
      end
      object MenuItem7: TMenuItem
        Action = ActionStop
      end
      object Separator2: TMenuItem
        Caption = '-'
      end
      object MenuItem8: TMenuItem
        Action = ActionRecord
      end
    end
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 38
    Top = 96
    object ActionOpen: TAction
      Category = '控制'
      Caption = '打开(&O)'
      ImageIndex = 1
      OnExecute = ActionOpenExecute
      ShortCut = 16463
    end
    object ActionExit: TAction
      Category = '控制'
      Caption = '退出(&Q)'
      ImageIndex = 0
      OnExecute = ActionExitExecute
    end
    object ActionMedia: TAction
      Category = '控制'
      Caption = '媒体(&M)'
      OnExecute = ActionMediaExecute
    end
    object ActionContral: TAction
      Category = '控制'
      Caption = '控制(&C)'
      OnExecute = ActionContralExecute
    end
    object ActionPlay: TAction
      Category = '控制'
      Caption = '播放(&L)'
      ImageIndex = 3
      OnExecute = ActionPlayExecute
    end
    object ActionStop: TAction
      Category = '控制'
      Caption = '停止(&S)'
      ImageIndex = 5
      OnExecute = ActionStopExecute
    end
    object ActionPause: TAction
      Category = '控制'
      Caption = '暂停(&P)'
      ImageIndex = 2
      OnExecute = ActionPauseExecute
    end
    object ActionRecord: TAction
      Category = '控制'
      Caption = '录音(&R)'
      ImageIndex = 4
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 243
    Top = 96
  end
  object ImageList1: TImageList
    Left = 320
    Top = 96
    Bitmap = {
      4C7A060000001000000010000000B10900000000000078DADD980D58CCD91EC7
      FFCB65F5D8AB17BB14A9A6D821B5CA884AEC6EB5EE122B76515D62D71AEEC386
      F2B65A2283E1F6CA8856AB9A6A7A514A6F1BC9D2506C2FB4A2D64DE91DEB6645
      2A5ADF7BCEBF69F6AF6666D97BEF735FE6793ECF73E637E773CEEF9CF33BFF67
      660030E8C5C2FE46FCC5C6AE9FAE9CB2CE7F156189C9BCCF16F637E643455F2E
      8BFAE99BCDB10888F3DED0DC16930C9CFF1EC827C85281CD5FDE6973B50A942D
      EAAF6FA6CA9D3F803F75A2E5F906D7A5C0AEFD406A06507913A820A491B63804
      7013028209171AE7FD81EFC075DDFB0DE7998D4A6B32B5AAC6FB335BF1D95F80
      B0A3C0A3C7406B2B200907567A01333E6A83E9841A188F3CD1ECD64F9FD7E34F
      D2DD1CF747C352E88DC887606A0D12929F233206686C029A9B81EC53C0D7C7BA
      306EE22DD2E73C068F2C86F5904DF1DD6B1E357AE8B0CC8E01DAA7C10CCA4474
      1C11C82BE86007AAAA81EA1A202BE7291B0B08A90533301303754E435BEF64C7
      C2D7468D9931C8D9B39FF61930FD126135258FED7734B219C34DCA71A1A00DE7
      E56D18617A0D492977F1FCF92FB098984BFA2681792307CEAF3B2DB31FBC7027
      A3150D8609C7BA8DD758DFEEBD22BCF1961CFC0925E0BF53022DDD73B07BF732
      FB99977709E97B88E41A0B5BAD05FE7683E7ED6006FA935800366CE9F6EDDFBF
      82A1232FC1707431469A1541D7A0808C59C27EE6BDA98CF4158319E00BBBC12E
      3B5D74A72F610649494EB17070BCC4F63926BD87B78CAEC2E8EDEB18F5763986
      92BD3D167D87FD6CCA743998D7C8FC037663A68EDDD295230C4CB575539ED0FD
      1B322C1F7109F7D97E19D98FB0C6FB01A105E959AD6C2C3AF62E06E9E481D14A
      C3EB5A11EDC211066C2D4D335A1F35C4B08CEC531139A39B90CADAD1D505E58B
      B6A362DB31DAA21C6F1A5E407FBD424CD1FF42DA73FE3EE6BA8696634FD6F1DE
      A985B55D3D162DED226300577FE8464A4E7A9167172C2655437F4C05C69824D6
      FB98EB19716B709D156FB2EDA4DCDBF61F025B76D03307EAEA818646E0DBDCEE
      988D5317AC2D326FAF9DC09BACEA0E7C65A7336A89E3AE6F7C36D43E4C21355F
      4DFC5AE2A766917DF7A97BE8F1FEAE63DBEC758C7EEB1EEE71D1E3899738BA1F
      58FFD997A104B1A793C79ED97ABCDFF2FE1DB4B4DCDB9B774286B80011D20E8B
      909F9584B6C7AD962FEB179E4AD99B2E3D889FEE347AD0F7A7E3A3E5A5F25C44
      EC5E8BCE8E27DA45D7CA2189CB7A81A89367515E5D1FA66ABCDBE5E5F2285F21
      24ABE7A3B3BD4DFB50420EE26FDE45567B3B4E3EE944DC0320F27A23A419E750
      59DBB8B7B79F12E42BA7AED24F3A85F89FDB91AE702907C9236067FE4D047E13
      0D9124A29BE0C3D81220417543D30BCF2EEAC73DE850BA47EF915AA90296DFE8
      8B973453859FA4F4A3EB5A21C92A8024ED1CBB0F810411E5A8ECD73C288187B0
      91E4D2DED9A9BD3B3C1A61773A1079EF19C417AB109C5D0411796EA962CB8F80
      0FC9C32DB31ADB0FC7A0A3F329EB4B9A3B20A92273279EC2FEEF2AF045AFBCDD
      C91D9A4F1E3F33CE3D85CDF19FF0C15A3172F22FA0EB975FB44547C81E5D7F82
      BD853508C928841F593BD7F728053E3CFF0C8E79ED989C4EEEB06F243CF71C41
      4BEB63F61E507FCFE53A488EE722E0FBDBF052788BAF92390B8099C4B5CD6C87
      754A3B0CC26E6394FB7624920BD9F9F469B71F7C047BF27F40686A3EBE22737B
      FED0EDB9C8BB609FDDEDF1135A30EC50150C374660F68AD5A86B6850D6EFC6A0
      3084C49FC2D2D41B60243D946160680174C467A123CAC208BF64F0367D0DDEC2
      F5F00B8940CBCF0F95BE373987E5BB0E60D95611E6AFDD8139CBBCE0F8C9124C
      7572C1381B7BF0C65A63F8483E74F4864147C7108585450EFFDAFBD9A224DC6B
      368EAF7742B2B73368FB59FD1986D23BCE705EE4BD12A9700AAABE8B454D412A
      685B5D9CEBC7AE98C405B7CE7C83E6B233A06D75714DFEDFB225A45F6E1F9F1B
      D7E4DFCC3A88A62BA7FAF8DCB8463F23144DA5DFF6F539714DFE8FE9C12A7D6E
      5CA39F16A8DAE7C435FA27F6A9F639714D7EE571914A9F1BD7E45724EE445349
      761F9F1BD7E8C7FBA1A938ABAFCF896BCC9FCEA3C2E7C6B9BE5468AB2466850D
      2A92C5A8BD9802DA5617E7FA47D6B92A895C351D972336A1246E37685B5D9CEB
      73EF2FE9DB93377595F7B7779CEBFF27BE13686261881BFE599F929C13F4BBC6
      5910E801971C4F7CE0FB213C8F7DFECA63B8EEFF04360F16C1B66C2E1C429DE0
      E0330DDEB20D2F3DCEECBD7321B8EB0A41ED4C086E3943906ECF8E41F3C9ADCC
      C54BF9F5B3587762F9341641B100D323EDD931687EB5F76BA0D1A7F356BECB62
      7DC11A13E5E3596C6463F0DE5607BCB7FE5DCDBEC29D56E2C0FAD6196360B1D3
      0C662EA6309F3316A9392734FA3467D6CD33C7F820538C5D3A1A264EC6F0DEBB
      F6A5D64FE7343FFA36C6AE1AC37A7F123ABFF4FECFF29F05733F3EEBD15C8B8B
      8B5FA906ECD7D8B3EB141DF2FF5DF5B7789F3BF9CDD080FFB67BF9BF42F9953A
      26512A67FCB6C520282C06C1E131D8BE2F0C5109E94CD1D56B1ADDCA8A3A26E2
      C0194676B410D7CB1A50DFD48CFAE666DCB8D180A8A83C84842531A5D7AFABF5
      43833298159F442122F0321EDE7F8EF6474007E1D1DF8198B0522C710B87FFBE
      68B5FEE4F1DB616B74101B3CCE223DB60A39A9B7909B568DF4B85BF05D7611F6
      266130E2AD515B1B9606BB603E300CB38CD3B065911CFBBCBEC75FD716C177F1
      45CC31CB027FE04118E86E56EB4F350EC5B437E330573F07CB2DF2B14650802F
      265D82D0528E8F0DF2E0304C0A53FD1DEAEFAEE030E61A6560A9C925785B9560
      ABCD35F812365897E273E322CC364983E5383FB5BE24308759EE928895E3E538
      EC7C1FB2F98F9030FF31BE9ED182D5E697E03953067F71BCDAFD2BABAC60F604
      24301BDD33103CFB26A23D1A10FBE7461CF8A80A1BDDB2E12792310557AF68AC
      81E28A6B4CC8A1138CE7C76158BF20093E0B8EC373DE11EC0F4E662E5E2DFDBF
      BB2F526991E9B66DE59B85C2E2CDEEEE67C5AEAEA7C52E2E392FE0E8F8ADD8C1
      215B6C6575426C6212231E3A344448BE3AE8527C7DCB367FFAE979B8BACAE1E8
      7816B6B6A7616D9DC9326E5C96121E2F05FAFAC731644804FDAFAA85B802EAD3
      79A92B10007C3E60447E951918BC888E0E88D7062DADBBC4CDA3FF55517F01C1
      94E64CF2635DDA6FD020B228A6371D849F0935845482887E07A26B10D0F5D29C
      E9BCEADD1EBF822023F82A7DBA3F74AD344FCD6E33A1F8157CAECBF5C3FBF8E4
      5C7AF9AADC1AB53E3D9FBE3ED7EDF1E57D7C5A1B7C7E1ABBF79ADD8A9EB37BC1
      A775456B839EAF6AAFC7A5B9672A7C6FA54F6B72F87099A236B87D7B902BE6CD
      E4ECFDAF3EADE7EE9A9429D616AE98838B4801F5840ABA7D6DED2061773DD39A
      1429C6EF8D772F57D853BF02C53D1228DE0B5F12DAD799D67FCF3D54B405AF00
      EBFE03297A336B
    }
  end
  object ImageList2: TImageList
    Height = 32
    Width = 32
    Left = 712
    Top = 408
    Bitmap = {
      4C7A020000002000000020000000960200000000000078DAED97B18FCC5110C7
      BF21E12804399C8EE4824A444481E63ADDE92855A794FB0FB4C2251A0A0A0ACE
      FDDE6FB942684970CEE5E2DCFE767F8B251A7B48905C4184C4CFCC667EF2EEE5
      F75B57ECBCDDE21593BCCC7BFBFBCCCE9B9937936519B220415629CD9BD89418
      3CAB1964963CF6C136066B897DDF61B7C5079F3813C2FB523718169D173EF14E
      0BEB572DC28865933A9FD8C788F19339B41E737CA2CA6FDCC62EFAFE67E14C14
      DC4957F8CD07585F8F7181BEB564C5D512F9FA13AF39EE38FEB4F8C4395F14D7
      6D89F091F3AE242657F03917E98EE617EF62BB7B9675BC5794AFF9FF4E621CB1
      6C3A2ADF6F75C809973F27FE4A6C1B78CD3A393FB75A3FFECFBFEEFE0B836DF4
      1FABA26FA477B0D3D5D17A488B5F60C31B5AA79DD8DDE6E736D0FDA5561C35CB
      D8BEF87C173EF8B6FFEB8EFFCB6CD08A3FF679514C96E51FE79C5377FDE45FA7
      FA63F4EB0FD75FB1A165715B64B397FADBEBF7A75FDFDF7EE83FFAA1FFEA87FE
      B3D7FD77902041C2FC1FE6FFF2F747FA9F1F24AF48AEA45338E8F3FD65BEE39B
      3FB51837660C36F8EA3F9895547028897091F6BECBEF66B80FF6DD7F2D1AECA5
      FDB762C3A3EC1CD6F89EFFA5EFFD20FDFDB8F6FCCFFEE2D85B98C666EB0E8FB7
      63C16079FE1E362ACEFF76FC3D27EE3A6BEF495B1FE394E6FCD798C21E9E37E5
      DECE5A3E1893F315EDF997626954F666731DE5C47ED1BDD4E673BCC8DE72AEAB
      DEC216D17DEB059FFCBF55745FB5F9698413AEFF897F40740B9AFC6A05FBF29A
      B322FE629C91F3B1E2FC6FE7DF6C51FE914D2735E7FF1ACFEC112E97D59FA2B7
      4873FE4F26B1E3DF774BEAAFD6FB23B1F04ECE3D2C7B7FBAF9FE727DA77387A9
      CE5ECD7F47F2F4F524067BD07FFCA6F3D7DE5FC780AFFE4B7A8E94CE5CA2F77F
      7798FF83042996BF9E3B5432
    }
  end
end
