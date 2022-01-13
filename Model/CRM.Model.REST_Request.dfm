object frm_restRequest: Tfrm_restRequest
  Left = 0
  Top = 0
  Caption = 'Request'
  ClientHeight = 219
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RESTClient1: TRESTClient
    BaseURL = 'http://viacep.com.br/ws/'
    Params = <>
    Left = 67
    Top = 56
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'numCep'
      end
      item
        Kind = pkURLSEGMENT
        Name = 'Formato'
        Value = 'json'
      end>
    Resource = '{numCEP}/json'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 227
    Top = 56
  end
  object RESTResponse1: TRESTResponse
    Left = 144
    Top = 56
  end
end
