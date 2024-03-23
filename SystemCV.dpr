program SystemCV;

uses
  Vcl.Forms,
  HomeFrm in 'HomeFrm.pas' {FrmHome},
  Module_Global in 'Module_Global.pas' {ModuleGlobal: TDataModule},
  Module_Basic in 'Module_Basic.pas' {ModuleBasic: TDataModule},
  Frm_Company in 'Frm_Company.pas' {FrmCompany},
  Frm_EPS in 'Frm_EPS.pas' {FrmEPS},
  Frm_ARL in 'Frm_ARL.pas' {FrmARL},
  Frm_AFP in 'Frm_AFP.pas' {FrmAFP},
  Frm_CCF in 'Frm_CCF.pas' {FrmCCF},
  Frm_Person in 'Frm_Person.pas' {FrmPerson},
  Module_Persons in 'Module_Persons.pas' {ModulePersons: TDataModule},
  Frm_City in 'Frm_City.pas' {FrmCitys},
  Form_PersonsInCare in 'Form_PersonsInCare.pas' {FrmPersonsInCare},
  Frm_Affiliations in 'Frm_Affiliations.pas' {FrmAffiliations},
  Frm_WorkHistory in 'Frm_WorkHistory.pas' {FrmWorkHistory};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmHome, FrmHome);
  Application.CreateForm(TModuleGlobal, ModuleGlobal);
  Application.CreateForm(TModuleBasic, ModuleBasic);
  Application.CreateForm(TModulePersons, ModulePersons);
  Application.CreateForm(TFrmPersonsInCare, FrmPersonsInCare);
  Application.CreateForm(TFrmAffiliations, FrmAffiliations);
  Application.CreateForm(TFrmWorkHistory, FrmWorkHistory);
  Application.Run;
end.
