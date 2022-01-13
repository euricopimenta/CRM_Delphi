unit CRM.Controller.Endereco;

interface
Uses
  System.SysUtils, System.Variants, System.Classes, VCL.Dialogs,
  Crm.Model.REST_Request;

Procedure BuscaDados(CEP:String);


implementation

uses
  Crm.View.MainMenu;


{ TEndereco }
procedure BuscaDados(CEP:String);
var
  Request : Tfrm_restRequest;
begin

  Request := Tfrm_restRequest.Create(nil);
  //ShowMessage('Buscando dados, aguarde');


  Try
    With Request.buscaCep(CEP)do
    Begin

      With frm_MainMenu.frm_CadCliente1 do
      Begin
        edt_Logradouro.Text := Logradouro;
        edt_Bairro.Text := Bairro;
        edt_cidade.Text := Cidade;
        edt_Estado.Text := UF;
        edt_Complemento.Text := Complemento;
        edt_pais.Text := 'Brasil';
      End;

    End;
  Except
    ShowMessage('Erro ao buscar CEP');
    Exit
  End;

  Request.Free;

end;

end.
