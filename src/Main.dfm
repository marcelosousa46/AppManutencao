object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Foo'
  ClientHeight = 634
  ClientWidth = 1319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1319
    Height = 29
    ButtonHeight = 25
    Caption = 'ToolBar1'
    TabOrder = 0
    ExplicitWidth = 1062
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 89
      Height = 25
      Caption = 'Dataset Copy'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 89
      Top = 0
      Width = 104
      Height = 25
      Caption = 'Threads'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button4: TButton
      Left = 193
      Top = 0
      Width = 128
      Height = 25
      Caption = 'Exceptions/Performance'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      Left = 321
      Top = 0
      Width = 96
      Height = 25
      Caption = 'Streams'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 417
      Top = 0
      Width = 136
      Height = 25
      Caption = 'Dataset Loop'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 120
    object Operaes1: TMenuItem
      Caption = 'Opera'#231#245'es'
      object DatasetCopy1: TMenuItem
        Caption = 'Dataset Copy'
        OnClick = DatasetCopy1Click
      end
      object hreads1: TMenuItem
        Caption = 'Threads'
        OnClick = hreads1Click
      end
      object ExceptionsPerformance1: TMenuItem
        Caption = 'Exceptions/Performance'
        OnClick = ExceptionsPerformance1Click
      end
      object Streams1: TMenuItem
        Caption = 'Streams'
        OnClick = Streams1Click
      end
      object DatasetLoop1: TMenuItem
        Caption = 'Dataset Loop'
        OnClick = DatasetLoop1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
