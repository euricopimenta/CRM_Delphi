unit CRM.Controller.XML;

interface
Uses
  System.SysUtils, System.Variants, System.Classes, VCL.Dialogs,
  CRM.Model.XML, CRM.Model.Pessoa;
Type
  TControllerXML = Class
    XML : TCriaXML;
    Pessoa : TPessoa;

    Constructor Create ;
    Destructor Destroy ; Override;
  End;

implementation

{ TControllerXML }

constructor TControllerXML.Create;
begin
   XML := TCriaXML.Create;
   XML.GerarArquivo(Pessoa);
end;

destructor TControllerXML.Destroy;
begin
  XML.Free;
  inherited;
end;

end.
