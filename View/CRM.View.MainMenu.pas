unit CRM.View.MainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  CRM.View.CadCliente;

type
  Tfrm_MainMenu = class(TForm)
    pnl_Forms: TPanel;
    imgList_BtnEffects: TImageList;
    pnl_OpcoesMenu: TPanel;
    btn_CadCliente: TButton;
    btn_Sair: TButton;
    pnl_TituloFrame: TPanel;
    lbl_TituloFrame: TLabel;
    frm_CadCliente1: Tfrm_CadCliente;
    procedure btn_SairClick(Sender: TObject);
    procedure frm_CadCliente1btn_BuscaCepClick(Sender: TObject);
    procedure frm_CadCliente1btn_enviarEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_MainMenu: Tfrm_MainMenu;

implementation

{$R *.dfm}

procedure Tfrm_MainMenu.btn_SairClick(Sender: TObject);
begin
  Showmessage('Até mais !');
  MessageDlg('Encerrar o programa ?',mtConfirmation,mbYesNo,0);
end;

procedure Tfrm_MainMenu.frm_CadCliente1btn_BuscaCepClick(Sender: TObject);
begin
  frm_CadCliente1.btn_BuscaCepClick(Sender);

end;

procedure Tfrm_MainMenu.frm_CadCliente1btn_enviarEmailClick(Sender: TObject);
Begin
  frm_CadCliente1.btn_enviarEmailClick(Sender);
end;

end.
