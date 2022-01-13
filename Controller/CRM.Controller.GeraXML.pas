unit CRM.Controller.GeraXML;

interface
Uses
  System.Classes, CRM.Model.XML, CRM.Model.Pessoa;

Type
  TGeraXML = Class
    Procedure getPessoa(Pessoa:TPessoa);
  End;
Var
  GeraXML : TGeraXML;
  XML : TCriaXML;



implementation
Procedure getPessoa(Pessoa:TPessoa);
Begin
 XML.GerarArquivo(Pessoa);
End;

end.
