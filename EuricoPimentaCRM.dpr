program EuricoPimentaCRM;

uses
  Vcl.Forms,
  CRM.View.MainMenu in 'View\CRM.View.MainMenu.pas' {frm_MainMenu},
  CRM.View.CadCliente in 'View\CRM.View.CadCliente.pas' {frm_CadCliente: TFrame},
  Vcl.Themes,
  Vcl.Styles,
  CRM.Model.REST_Request in 'Model\CRM.Model.REST_Request.pas' {frm_restRequest},
  CRM.Controller.Endereco in 'Controller\CRM.Controller.Endereco.pas',
  CRM.Model.XML in 'Model\CRM.Model.XML.pas',
  CRM.Model.Pessoa in 'Model\CRM.Model.Pessoa.pas',
  CRM.Model.Endereco in 'Model\CRM.Model.Endereco.pas',
  CRM.Controller.EnviaEmail in 'Controller\CRM.Controller.EnviaEmail.pas' {frmEnviaEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(Tfrm_MainMenu, frm_MainMenu);
  Application.Run;
end.
