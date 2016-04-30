object Form1: TForm1
  Left = 505
  Top = 168
  Caption = 'Captura de Webcam!'
  ClientHeight = 532
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 469
    Width = 64
    Height = 13
    Caption = 'Preview Rate'
  end
  object Label2: TLabel
    Left = 329
    Top = 469
    Width = 31
    Height = 13
    Caption = 'Arqivo'
  end
  object pnlWebcam: TPanel
    Left = 24
    Top = 8
    Width = 426
    Height = 329
    BevelOuter = bvNone
    Caption = 'Webcam N'#227'o Conectada!'
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 1
  end
  object btnConectar: TButton
    Left = 32
    Top = 360
    Width = 90
    Height = 25
    Caption = 'Conectar'
    TabOrder = 0
    OnClick = btnConectarClick
  end
  object btnDesconectar: TButton
    Left = 136
    Top = 360
    Width = 90
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 2
    OnClick = btnDesconectarClick
  end
  object btnGravarVideo: TButton
    Left = 344
    Top = 360
    Width = 90
    Height = 25
    Caption = 'Gravar Video'
    TabOrder = 3
    OnClick = btnGravarVideoClick
  end
  object btnGravarImagem: TButton
    Left = 240
    Top = 360
    Width = 90
    Height = 25
    Caption = 'Gravar Imagem'
    TabOrder = 4
    OnClick = btnGravarImagemClick
  end
  object btnConfigurar: TButton
    Left = 136
    Top = 416
    Width = 90
    Height = 25
    Caption = 'Configurar'
    TabOrder = 5
    OnClick = btnConfigurarClick
  end
  object btnParar: TButton
    Left = 344
    Top = 416
    Width = 90
    Height = 25
    Caption = 'Parar'
    TabOrder = 6
    OnClick = btnPararClick
  end
  object spnedtRate: TSpinEdit
    Left = 24
    Top = 488
    Width = 98
    Height = 22
    MaxValue = 30
    MinValue = 1
    TabOrder = 7
    Value = 1
    OnChange = spnedtRateChange
  end
  object edtFileName: TEdit
    Left = 329
    Top = 488
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '"C:\Teste.avi"'
  end
  object chkbPreview: TCheckBox
    Left = 24
    Top = 420
    Width = 97
    Height = 17
    Caption = 'Preview'
    TabOrder = 9
    OnClick = chkbPreviewClick
  end
  object SaveDialog1: TSaveDialog
    Left = 416
    Top = 304
  end
end
