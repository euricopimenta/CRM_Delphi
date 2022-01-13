unit CRM.Model.REST_Request;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, REST.Client,System.JSON,
  Data.Bind.Components, Data.Bind.ObjectScope,CRM.Model.Endereco;

type

  Tfrm_restRequest = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;

   // Constructor Create;
    Destructor Destroy ; Override;

  private
    { Private declarations }
  public
    { Public declarations }
     Function buscaCep (numCEP : String): TEndereco;

  end;

var
  frm_restRequest: Tfrm_restRequest;
  Endereco : TEndereco;

implementation

{$R *.dfm}


{ Tfrm_restRequest }

Function Tfrm_restRequest.buscaCep(numCEP: String):TEndereco;
Var
  Obj : TJSONObject;
begin

  Endereco := TEndereco.Create;
  Try
    RESTRequest1.Params.ParameterByName('numcep').Value := numCEP;

  Except on E : Exception do
    ShowMessage(E.Message);

  End;

  Try
    RESTRequest1.Execute ;
    Obj := RESTResponse1.JSONValue as TJsonObject;
  Finally

    With Endereco do  //Preencher Objeto
    Begin
      Logradouro := obj.Values['logradouro'].Value;
      Bairro := obj.Values['bairro'].Value;
      Cidade := obj.Values['localidade'].Value;
      UF := obj.Values['uf'].Value;
      Complemento := obj.Values['complemento'].Value;

    End;

    Result := Endereco;
  End;
end;





destructor Tfrm_restRequest.Destroy;
begin
  Endereco.Free;
  inherited;
end;

end.
