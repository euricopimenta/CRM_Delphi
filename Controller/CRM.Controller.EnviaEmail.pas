unit CRM.Controller.EnviaEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdAntiFreezeBase, IdAntiFreeze,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdAttachmentFile,
  Vcl.StdCtrls, CRM.Model.XML, CRM.Model.Pessoa;

type
  TfrmEnviaEmail = class(TForm)
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    IdAntiFreeze1: TIdAntiFreeze;
    Procedure EnviaEmail(Pessoa:TPessoa ;Destinatario:String);
    Procedure SetMensagem(Pessoa : TPessoa);
    Function bodyBuilder(Pessoa:TPessoa):TStringlist; // Biirrllll !

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnviaEmail : TfrmEnviaEmail;
  CriaXML : TCriaXML;

implementation

{$R *.dfm}

{ TfrmEnviaEmail }


procedure TfrmEnviaEmail.EnviaEmail(Pessoa:TPessoa ; Destinatario: String);
begin



  Try
  	SSLHandler.SSLOptions.Method := sslvTLSv1_2;
  	SSLHandler.SSLOptions.Mode := sslmClient;


    IdSMTP1.UseTLS := utUseImplicitTLS;
    IdSMTP1.AuthType := satDefault;
    IdSMTP1.Port := 465;
    IdSMTP1.Host := 'smtp.gmail.com';
    IdSMTP1.Username:= 'crmeurico@gmail.com';
		IdSMTP1.Password := 'cicvkbbpnuceijnh';
    IdMessage1.Recipients.EMailAddresses := Destinatario;


    setMensagem(Pessoa); // Prepara Menssagem e Anexos

    Screen.Cursor:= crHourGlass;

    try
    if not IdSMTP1.Connected then
			IdSMTP1.Connect;
      IdSMTP1.Authenticate;
      IdSMTP1.Send(IdMessage1);

    Except on E : Exception do
      Begin
        Showmessage('Vish '+ E.Message);
        Exit
      End;

    end;

  Finally
    IdSMTP1.Disconnect;
    Screen.Cursor:= crDefault;

  End;

  ShowMessage('(-_o)v   Sucesso !');

end;

procedure TfrmEnviaEmail.SetMensagem(Pessoa:TPessoa);
begin
    IdMessage1.MessageParts.Clear;
    IdMessage1.From.Address := 'crmeurico@gmail.com';
    IdMessage1.Subject:= 'Ficha cadastral: '+ Pessoa.Nome;


    //Texto da Mensagem
    IdMessage1.Body := BodyBuilder(Pessoa);
    IdMessage1.ContentType:='multipart/mixed';

    //IdMessage1.ContentType := 'text/html';

    IdMessage1.AttachmentEncoding := 'MIME';

    //Anexo
    CriaXML := TCriaXML.Create;
    CriaXML.GerarArquivo(Pessoa); //Cria Arquivo
    CriaXML.Free;

    if FileExists('./XML.XML') then
    begin
      //Setar Anexo
      TIdAttachmentFile.Create(IdMessage1.MessageParts, './XML.XML');
      IdMessage1.MessageParts.Items[0].FileName := 'Dados do Contato.XML';

    end;
end;

function TfrmEnviaEmail.bodyBuilder(Pessoa:TPessoa): TStringlist;
var
  Lines : TStringlist;
begin
  With Pessoa do
  Begin
  Lines := TStringList.Create;
    Lines.add('Nome : '  + Nome);
		Lines.add('Identidade : '  + Identidade);
		Lines.add('CPF : '  + CPF);
		Lines.add('Email : '  + Email);
		Lines.add('Telefone : '  + Telefone);
	  Lines.Add(EmptyStr);
    With Endereco do
    Begin
      Lines.add('CEP : '  + CEP);
      Lines.add('Logradouro : '  + Logradouro);
      Lines.add('Número : '  + Numero);
      Lines.add('Complemento : '  + Complemento);
      Lines.add('Bairro : '  + Bairro);
      Lines.add('Cidade : '  + Cidade);
      Lines.add('Estado : '  + UF);
      Lines.add('País : '  + Pais);
    End;
    Lines.Add(EmptyStr);
    Lines.add('Dados em arquivo XML no anexo');
  End;

  Result := Lines

end;

end.
