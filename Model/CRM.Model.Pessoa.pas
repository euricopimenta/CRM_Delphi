unit CRM.Model.Pessoa;

interface
uses
  System.Classes,
  CRM.Model.Endereco;

Type
  TPessoa = Class
    Nome : String;
    Identidade : String;
    CPF : String;
    Email : String;
    Telefone : String;
    Endereco : TEndereco;

    Constructor Create;
    Destructor Destroy ; Override;
  End;

implementation

{ TPessoa }


constructor TPessoa.Create;
begin
  Endereco := TEndereco.Create;
end;

destructor TPessoa.Destroy;
begin
  Endereco.Free;

  inherited;
end;

end.
