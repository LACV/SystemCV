unit HomeFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmHome = class(TForm)
    MenuBase: TMainMenu;
    Archivo1: TMenuItem;
    MCompany: TMenuItem;
    N3: TMenuItem;
    Configuracion: TMenuItem;
    ServerConfig: TMenuItem;
    ComConfig: TMenuItem;
    N1: TMenuItem;
    MUsuarios: TMenuItem;
    CambiarPass: TMenuItem;
    AdministradordeUsuarios: TMenuItem;
    N2: TMenuItem;
    CambiarUsuario: TMenuItem;
    About: TMenuItem;
    MARL: TMenuItem;
    MEPS: TMenuItem;
    MAFP: TMenuItem;
    MCCF: TMenuItem;
    MPerson: TMenuItem;
    procedure MCompanyClick(Sender: TObject);
    procedure MEPSClick(Sender: TObject);
    procedure MARLClick(Sender: TObject);
    procedure MAFPClick(Sender: TObject);
    procedure MCCFClick(Sender: TObject);
    procedure MPersonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHome: TFrmHome;

implementation

{$R *.dfm}

uses Frm_Company, Frm_AFP, Frm_ARL, Frm_CCF, Frm_EPS, Frm_Person,
  Form_PersonsInCare;

procedure TFrmHome.MAFPClick(Sender: TObject);
begin
  try
    FrmAFP := TFrmAFP.Create(Application);

    with FrmAFP do
    begin
      ShowModal;
    end;

  finally
    FreeAndNil(FrmAFP);
  end;
end;

procedure TFrmHome.MARLClick(Sender: TObject);
begin
  try
    FrmARL := TFrmARL.Create(Application);

    with FrmARL do
    begin
      ShowModal;
    end;

  finally
    FreeAndNil(FrmARL);
  end;
end;

procedure TFrmHome.MCCFClick(Sender: TObject);
begin
  try
    FrmCCF := TFrmCCF.Create(Application);

    with FrmCCF do
    begin
      ShowModal;
    end;

  finally
    FreeAndNil(FrmCCF);
  end;
end;

procedure TFrmHome.MCompanyClick(Sender: TObject);
begin
  try
    FrmCompany := TFrmCompany.Create(Application);

    with FrmCompany do
    begin
      ShowModal;
    end;

  finally
    FreeAndNil(FrmCompany);
  end;
end;

procedure TFrmHome.MEPSClick(Sender: TObject);
begin
  try
    FrmEPS := TFrmEPS.Create(Application);

    with FrmEPS do
    begin
      ShowModal;
    end;

  finally
    FreeAndNil(FrmEPS);
  end;
end;

procedure TFrmHome.MPersonClick(Sender: TObject);
begin
  try
    FrmPerson := TFrmPerson.Create(Application);

    with FrmPerson do
    begin
      ShowModal;
    end;

  finally
    FreeAndNil(FrmPerson);
  end;
end;

end.
