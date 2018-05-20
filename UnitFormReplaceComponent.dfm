object FormReplaceComponent: TFormReplaceComponent
  Left = 0
  Top = 0
  Caption = 'Trocar Componete'
  ClientHeight = 405
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SearchBox1: TSearchBox
    Left = 24
    Top = 16
    Width = 369
    Height = 21
    TabOrder = 0
    Text = 'SearchBox1'
    OnInvokeSearch = SearchBox1InvokeSearch
  end
  object OpenDialog1: TOpenDialog
    Left = 216
    Top = 208
  end
end
