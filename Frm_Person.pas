unit Frm_Person;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, DateUtils;

type
  TFrmPerson = class(TForm)
    DBGView: TDBGrid;
    PnCabezal: TPanel;
    Separador: TImage;
    LbBuscar: TLabel;
    separador2: TImage;
    BtnNew: TButton;
    EdtBuscar: TEdit;
    BtnEdit: TButton;
    PnCrud: TPanel;
    PanelGlobal: TPanel;
    GBAPersonal: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    EdtCityResidence: TEdit;
    EdtResidenceAddress: TEdit;
    EdtNPhone: TEdit;
    GBBiologicas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    GBInfBasic: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    EdtName: TEdit;
    EdtPSurName: TEdit;
    EdtSSuerName: TEdit;
    EdtIdentification: TEdit;
    GBEmergency: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    EdtNPhoneE: TEdit;
    EdtAddressE: TEdit;
    EdtNamesSurNames: TEdit;
    EdtGranoRojo: TEdit;
    GBMilitary: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    EdtNMilitary: TEdit;
    EdtmilitaryDistrict: TEdit;
    PnDer: TPanel;
    Label30: TLabel;
    Label34: TLabel;
    LbGuardo: TLabel;
    BtnCancel: TButton;
    BtnSave: TButton;
    EdtCod: TEdit;
    EdtExpedition: TEdit;
    Label8: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    EdtCityBirth: TEdit;
    Label56: TLabel;
    Label57: TLabel;
    EdtDepartamentBirth: TEdit;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BtnExpeditionList: TButton;
    BtnCityBirthList: TButton;
    EdtYear: TEdit;
    EdtMonth: TEdit;
    EdtDay: TEdit;
    LbBirthDate: TLabel;
    CBGender: TComboBox;
    CbClassMilitary: TComboBox;
    BtnCityResidenceList: TButton;
    CbEducationLevel: TComboBox;
    CbCivilStatus: TComboBox;
    CbBloodType: TComboBox;
    LbAge: TLabel;
    RbHose: TRadioGroup;
    RbConduccion: TRadioGroup;
    Label2: TLabel;
    Label16: TLabel;
    EdtNLicense: TEdit;
    Label17: TLabel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label67: TLabel;
    GroupBox2: TGroupBox;
    Label31: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label61: TLabel;
    GroupBox3: TGroupBox;
    Label62: TLabel;
    Label66: TLabel;
    Label69: TLabel;
    GroupBox4: TGroupBox;
    Label71: TLabel;
    Label76: TLabel;
    Label78: TLabel;
    Label80: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnExpeditionListClick(Sender: TObject);
    procedure BtnCityBirthListClick(Sender: TObject);
    procedure BtnCityResidenceListClick(Sender: TObject);
    procedure EdtYearChange(Sender: TObject);
    procedure EdtMonthChange(Sender: TObject);
    procedure EdtDayChange(Sender: TObject);
    procedure CBGenderChange(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure RbConduccionClick(Sender: TObject);
  private
    FLastButtonActivated: TButton;
    { Private declarations }
    procedure openCityList();
    procedure updateDate();
    function DaysInMonth(const Year, Month: Word): Word;
  public
    { Public declarations }
    property LastButtonActivated: TButton read FLastButtonActivated
      write FLastButtonActivated;
  end;

var
  FrmPerson: TFrmPerson;

implementation

{$R *.dfm}

uses Module_Global, Frm_City, Module_Persons, Module_Basic;

procedure TFrmPerson.BtnCancelClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(false, PnCrud, DBGView, BtnEdit,
    BtnNew, Self);
end;

procedure TFrmPerson.BtnCityBirthListClick(Sender: TObject);
begin
  FLastButtonActivated := BtnCityBirthList;
  openCityList();
end;

procedure TFrmPerson.BtnCityResidenceListClick(Sender: TObject);
begin
  FLastButtonActivated := BtnCityResidenceList;
  openCityList();
end;

procedure TFrmPerson.BtnExpeditionListClick(Sender: TObject);
begin
  FLastButtonActivated := BtnExpeditionList;
  openCityList();
end;

procedure TFrmPerson.BtnNewClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(true, PnCrud, DBGView, BtnEdit, BtnNew, Self);
  PnCrud.Height := 535;
end;

procedure TFrmPerson.BtnSaveClick(Sender: TObject);
var
  Fields, Values: TStringList;
  results: boolean;
  table, idTable: string;
begin
  if (EdtName.Text = '') or (EdtPSurName.Text = '') or (EdtSSuerName.Text = '')
    or (EdtIdentification.Text = '') or (EdtExpedition.Text = '') or
    (EdtCityBirth.Text = '') or ((LbBirthDate.Caption = '0000-00-00') or
    (LbBirthDate.Caption = 'false')) then
  begin
    ShowMessage('Los Campos del Grupo de Datos ' + GBInfBasic.Caption +
      ' (*) son Obligatorios.');
  end
  else if (CBGender.ItemIndex = -1) or (CbBloodType.ItemIndex = -1) then
  begin
    ShowMessage('Los Campos del Grupo de Datos ' + GBBiologicas.Caption +
      ' (*) son Obligatorios.');
  end
  else if (CBGender.ItemIndex = 0) and (EdtNMilitary.Text = '') or
    (EdtmilitaryDistrict.Text = '') or (CbClassMilitary.ItemIndex = -1) then
  begin
    ShowMessage('Los Campos del Grupo de Datos ' + GBMilitary.Caption +
      ' (*) son Obligatorios.');
    ShowMessage('gender1');
  end
  else if (EdtCityResidence.Text = '') or (EdtResidenceAddress.Text = '') or
    (EdtNPhone.Text = '') or (CbEducationLevel.ItemIndex = -1) or
    (CbCivilStatus.ItemIndex = -1) or (RbHose.ItemIndex = -1) then
  begin
    ShowMessage('Los Campos del Grupo de Datos ' + GBAPersonal.Caption +
      ' (*) son Obligatorios.');
  end
  else if (RbConduccion.ItemIndex = 0) and (EdtNLicense.Text = '') then
  begin

    ShowMessage('Los Campos del Grupo de Datos ' + GBAPersonal.Caption +
      ' (*) son Obligatorios.');

  end
  else if (EdtNamesSurNames.Text = '') or (EdtNPhoneE.Text = '') or
    (EdtAddressE.Text = '') then
  begin
    ShowMessage('Los Campos del Grupo de Datos ' + GBEmergency.Caption +
      ' (*) son Obligatorios.');
  end
  else
  begin
    // we group the fields and values for the query
    Fields := TStringList.Create;
    Values := TStringList.Create;

    table := 'persons';
    idTable := 'IdPersons';

    Fields.Add('Name');
    Fields.Add('Surname');
    Fields.Add('SecondSurname');
    Fields.Add('identification');
    Fields.Add('expedition');
    Fields.Add('Birthdate');
    Fields.Add('CityBirth');
    Fields.Add('DepartmetBirth');
    Fields.Add('Gender');
    Fields.Add('BloodType');
    Fields.Add('MilitaryCard');
    Fields.Add('MilitaryCardClass');
    Fields.Add('District');
    Fields.Add('DrivingLicense');
    Fields.Add('CategoryLicense');
    Fields.Add('CityResidence');
    Fields.Add('ResidenceAddress');
    Fields.Add('OwnHouse');
    Fields.Add('NCellPhone');
    Fields.Add('EducationLevel');
    Fields.Add('CivilStatus');
    Fields.Add('NameContact');
    Fields.Add('PhoneContact');
    Fields.Add('AnddressContact');

    Values.Add(EdtName.Text);
    Values.Add(EdtPSurName.Text);
    Values.Add(EdtSSuerName.Text);
    Values.Add(EdtIdentification.Text);
    Values.Add(EdtExpedition.Text);
    Values.Add(LbBirthDate.Caption);
    Values.Add(EdtCityBirth.Text);
    Values.Add(EdtDepartamentBirth.Text);
    Values.Add(CBGender.Text);
    Values.Add(CbBloodType.Text);
    Values.Add(EdtNMilitary.Text);
    Values.Add(CbClassMilitary.Text);
    Values.Add(EdtmilitaryDistrict.Text);
    case RbConduccion.ItemIndex = 0 of
      true:
        Values.Add('1');
      false:
        Values.Add('0');
    end;
    Values.Add(EdtNLicense.Text);
    Values.Add(EdtCityResidence.Text);
    Values.Add(EdtResidenceAddress.Text);
    case RbHose.ItemIndex = 0 of
      true:
        Values.Add('1');
      false:
        Values.Add('0');
    end;
    Values.Add(EdtNPhone.Text);
    Values.Add(CbEducationLevel.Text);
    Values.Add(CbCivilStatus.Text);
    Values.Add(EdtNamesSurNames.Text);
    Values.Add(EdtNPhoneE.Text);
    Values.Add(EdtAddressE.Text);

    with ModuleGlobal do
    begin
      case EdtCod.Text = '' of
        true:
          begin
            // New data
            results := insertUpdateData(Fields, Values, table, '', '');
          end;
        false:
          begin
            // Edit data
            results := insertUpdateData(Fields, Values, table,
              EdtCod.Text, idTable);
          end;
      end;

      case results of
        true:
          ShowMessage('Success Saving Record.');
        false:
          ShowMessage('� Mistake ! Unexpected.');
      end;

      ModulePersons.resetPersons();
      activateDeactivate(false, PnCrud, DBGView, BtnEdit, BtnNew, Self);
    end;

  end;
end;

procedure TFrmPerson.CBGenderChange(Sender: TObject);
begin

  if CBGender.ItemIndex = 0 then
  begin
    GBMilitary.Enabled := true;
  end
  else
  begin
    GBMilitary.Enabled := false;
    CbClassMilitary.ItemIndex := -1;
    EdtNMilitary.Clear;
    EdtmilitaryDistrict.Clear
  end;
end;

function TFrmPerson.DaysInMonth(const Year, Month: Word): Word;
begin
  case Month of
    1, 3, 5, 7, 8, 10, 12:
      Result := 31;
    4, 6, 9, 11:
      Result := 30;
    2:
      begin
        if IsLeapYear(Year) then
          Result := 29
        else
          Result := 28;
      end;
  else
    Result := 0;
  end;
end;

procedure TFrmPerson.EdtDayChange(Sender: TObject);
begin
  updateDate();
end;

procedure TFrmPerson.EdtMonthChange(Sender: TObject);
begin
  updateDate();
end;

procedure TFrmPerson.EdtYearChange(Sender: TObject);
begin
  updateDate();
end;

procedure TFrmPerson.openCityList;
begin
  try
    FrmCitys := TFrmCitys.Create(Application);

    with FrmCitys do
    begin
      ShowModal;
    end;

  finally
    ModuleBasic.QCity.Filter := '';
    FreeAndNil(FrmCitys);
  end;
end;

procedure TFrmPerson.RbConduccionClick(Sender: TObject);
begin
  case RbConduccion.ItemIndex of
    0:
      EdtNLicense.Enabled := true;
  else
    EdtNLicense.Enabled := false;
  end;
end;

procedure TFrmPerson.updateDate;
var
  Year, Month, Day: Integer;
  BirthDate, Today: TDateTime;
  AgeYears, AgeMonths, AgeDays: Integer;
begin
  if TryStrToInt(EdtYear.Text, Year) and TryStrToInt(EdtMonth.Text, Month) and
    TryStrToInt(EdtDay.Text, Day) then
  begin
    if (Year >= 1) and (Year <= 9999) and (Month >= 1) and (Month <= 12) and
      (Day >= 1) and (Day <= DaysInMonth(Year, Month)) then
    begin
      // Build date of birth
      BirthDate := EncodeDate(Year, Month, Day);

      // Get current date
      Today := Date;

      // Calculate the difference of years, months and days
      AgeYears := YearOf(Today) - Year;
      AgeMonths := MonthOf(Today) - Month;
      AgeDays := DayOf(Today) - Day;

      // Adjust the years and months if necessary
      if AgeDays < 0 then
      begin
        Dec(AgeMonths);
        AgeDays := AgeDays + DaysInMonth(YearOf(Today), MonthOf(Today));
      end;
      if AgeMonths < 0 then
      begin
        Dec(AgeYears);
        AgeMonths := AgeMonths + 12;
      end;

      // Display date of birth in yyyy-mm-dd format
      LbBirthDate.Caption := Format('%4.4d-%2.2d-%2.2d', [Year, Month, Day]);

      // Show age in years, months and days
      LbAge.Caption := Format('%d A�os, %d Meses, %d D�as',
        [AgeYears, AgeMonths, AgeDays]);
    end
    else
    begin
      LbBirthDate.Caption := 'False';
      LbAge.Caption := '0 A�os 0 Meses 0 D�as';
    end;
  end
  else
  begin
    LbBirthDate.Caption := '0000-00-00';
    LbAge.Caption := '0 A�os 0 Meses 0 D�as';
  end;
end;

end.
