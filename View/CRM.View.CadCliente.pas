unit CRM.View.CadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  acPNG, Vcl.Buttons;

type
  Tfrm_CadCliente = class(TFrame)
    pnl_DadosUsuario: TPanel;
    pnl_DadosEndereco: TPanel;
    Image1: TImage;
    pnl_CadCliente: TPanel;
    pnl_UserName: TPanel;
    shp_userName: TShape;
    pnl_CPF: TPanel;
    shp_CPF: TShape;
    edt_CPF: TEdit;
    edt_Nome: TEdit;
    pnl_Identidade: TPanel;
    shp_Identidade: TShape;
    edt_Identidade: TEdit;
    pnl_CEP: TPanel;
    shp_CEP: TShape;
    edt_CEP: TEdit;
    pnl_email: TPanel;
    shp_email: TShape;
    edt_email: TEdit;
    pnl_Telefone: TPanel;
    shp_Telefone: TShape;
    edt_Telefone: TEdit;
    Panel1: TPanel;
    Shape1: TShape;
    edt_Logradouro: TEdit;
    Panel2: TPanel;
    Shape2: TShape;
    edt_numero: TEdit;
    Panel3: TPanel;
    Shape3: TShape;
    edt_Bairro: TEdit;
    Panel4: TPanel;
    Shape4: TShape;
    edt_Complemento: TEdit;
    Panel5: TPanel;
    Shape5: TShape;
    edt_cidade: TEdit;
    Panel6: TPanel;
    Shape6: TShape;
    edt_Estado: TEdit;
    Panel7: TPanel;
    Shape7: TShape;
    edt_pais: TEdit;
    Panel8: TPanel;
    Panel12: TPanel;
    Shape11: TShape;
    Edit11: TEdit;
    btn_enviarEmail: TButton;
    lbl_emailDestino: TLabel;
    btn_BuscaCep: TButton;
    procedure btn_BuscaCepClick(Sender: TObject);
    procedure btn_enviarEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

Uses
  CRM.Controller.Endereco,
  CRM.Model.XML,
  CRM.Model.Pessoa;

procedure Tfrm_CadCliente.btn_BuscaCepClick(Sender: TObject);
begin
  BuscaDados(edt_CEP.Text);
end;

procedure Tfrm_CadCliente.btn_enviarEmailClick(Sender: TObject);
Var
  Pessoa : TPessoa;
  XML : TCriaXML;
begin
  Pessoa := TPessoa.Create;
  XML := TCriaXML.Create;

  Try
    With Pessoa do
    Begin
      Nome := edt_Nome.Text;
      Identidade := edt_Identidade.Text;
      CPF := edt_CPF.Text;
      Email := edt_Email.Text;
      Telefone := edt_Telefone.Text;

      With Endereco do
      Begin
        CEP := edt_CEP.Text;
        Logradouro := edt_Logradouro.Text;
        Numero := edt_Numero.Text;
        Complemento := edt_Complemento.Text;
        Bairro := edt_Bairro.Text;
        Cidade := edt_Cidade.Text;
        UF := edt_Estado.Text;
        Pais := edt_Pais.Text

      End;

    End;
  Finally
   Try
     XML.GerarArquivo(Pessoa);
   Finally
     Pessoa.Free;
     XML.Free;
   End;
  End;

end;

end.
