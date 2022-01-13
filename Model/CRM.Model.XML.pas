unit CRM.Model.XML;


interface

uses
  System.SysUtils, System.Variants, System.Classes, VCL.Dialogs,
  Xml.xmldom, Xml.XMLIntf,Xml.XMLDoc,
  CRM.Model.Pessoa;

Type
  TCriaXML = Class(TObject)
    XML : TXMLDocument;

    Constructor Create;
    Procedure GerarArquivo(Pessoa:TPessoa);

  End;

Var

CriaXML : TCriaXML;

implementation

{ TCriaXML }

constructor TCriaXML.Create;
begin
  XML := TXMLDocument.Create(nil);

  XML.Active := True;
  XML.Version := '1.0';
  XML.Encoding := 'UTF-8';

end;

procedure TCriaXML.GerarArquivo(Pessoa:TPessoa);
Var
  nodeContato : IXMLNode;
  nodeEndereco: IXMLNode;

begin

  XML := TXMLDocument.Create(nil);

  XML.Active := True;
  XML.Version := '1.0';
  XML.Encoding := 'UTF-8';


  Try
    With Pessoa do
    Begin
      nodeContato := XML.AddChild('Pessoa');
      nodeContato.AddChild('Nome').Text := Nome;
      nodeContato.AddChild('Identidade').Text := Identidade;
      nodeContato.AddChild('CPF').Text := CPF;
      nodeContato.AddChild('Email').Text := Email;
      nodeContato.AddChild('Telefone').Text := Telefone;

      With Endereco do
      Begin
        nodeEndereco := nodeContato.AddChild('Endereco');
        nodeEndereco.AddChild('CEP').Text := CEP;
        nodeEndereco.AddChild('Logradouro').Text := Logradouro;
        nodeEndereco.AddChild('Numero').Text := Numero;
        nodeEndereco.AddChild('Complemento').Text := Complemento;
        nodeEndereco.AddChild('Bairro').Text := Bairro;
        nodeEndereco.AddChild('Cidade').Text := Cidade;
        nodeEndereco.AddChild('Estado').Text := UF;
        nodeEndereco.AddChild('Pais').Text := Pais;

      End;

    End;

    XML.SaveToFile('.\XML.xml');

  Finally
    ShowMessage('XML Criada na pasta raíz, para envio posterior');

  End;

end;

end.

