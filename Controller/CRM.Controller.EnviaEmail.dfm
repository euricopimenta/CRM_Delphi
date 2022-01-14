object frmEnviaEmail: TfrmEnviaEmail
  Left = 0
  Top = 0
  Caption = 'Envio de Email'
  ClientHeight = 137
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IdSMTP1: TIdSMTP
    IOHandler = SSLHandler
    SASLMechanisms = <>
    Left = 160
    Top = 32
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    FromList = <
      item
      end>
    Priority = mpHigh
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 216
    Top = 32
  end
  object SSLHandler: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 24
    Top = 28
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 112
    Top = 32
  end
end
