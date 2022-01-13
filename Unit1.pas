unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdAntiFreezeBase, IdAntiFreeze,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtEmailEnvio: TEdit;
    edtSenha: TEdit;
    edtEmailDestino: TEdit;
    edtAssunto: TEdit;
    btnEnviar: TButton;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdAntiFreeze1: TIdAntiFreeze;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
