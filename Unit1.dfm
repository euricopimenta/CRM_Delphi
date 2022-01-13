object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 439
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtEmailEnvio: TEdit
    Left = 8
    Top = 56
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'Email Envio'
  end
  object edtSenha: TEdit
    Left = 223
    Top = 56
    Width = 114
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'sdsdsd'
  end
  object edtEmailDestino: TEdit
    Left = 8
    Top = 110
    Width = 209
    Height = 21
    TabOrder = 2
    Text = 'Enviar para'
  end
  object edtAssunto: TEdit
    Left = 8
    Top = 83
    Width = 329
    Height = 21
    TabOrder = 3
    Text = 'Assunto'
  end
  object btnEnviar: TButton
    Left = 223
    Top = 110
    Width = 114
    Height = 22
    Caption = 'Chama !'
    TabOrder = 4
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 424
    Top = 56
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 480
    Top = 56
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 424
    Top = 112
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 368
    Top = 112
  end
end
