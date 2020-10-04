object fThreads: TfThreads
  Left = 0
  Top = 0
  Caption = 'Threads'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 32
    Width = 185
    Height = 57
    Caption = ' Intervalo de tempo'
    TabOrder = 0
    object edIntervalo: TEdit
      Left = 12
      Top = 19
      Width = 90
      Height = 21
      Alignment = taRightJustify
      TabOrder = 0
      Text = '0'
    end
  end
  object btIniciar: TButton
    Left = 232
    Top = 49
    Width = 75
    Height = 25
    Caption = '&Iniciar'
    TabOrder = 1
    OnClick = btIniciarClick
  end
end
