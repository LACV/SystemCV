unit Frm_WorkHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TFrmWorkHistory = class(TForm)
    DBGView: TDBGrid;
    PnCabezal: TPanel;
    Separador: TImage;
    LbBuscar: TLabel;
    separador2: TImage;
    BtnNew: TButton;
    EdtBuscar: TEdit;
    BtnEdit: TButton;
    dbName: TDBMemo;
    PnCrud: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label59: TLabel;
    LbAdmissionDate: TLabel;
    Label60: TLabel;
    EdtCargo: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
    EdtCodPerson: TEdit;
    EdtCod: TEdit;
    EdtMonth: TEdit;
    EdtYear: TEdit;
    EdtDay: TEdit;
    RbMedicalExam: TRadioGroup;
    RbState: TRadioGroup;
    Label8: TLabel;
    EdtCompany: TEdit;
    BtnCompanyList: TButton;
    Label54: TLabel;
    EdtCodCompany: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtYear2: TEdit;
    EdtMonth2: TEdit;
    EdtDay2: TEdit;
    LbRetirementDate: TLabel;
    RbExitMedicalExam: TRadioGroup;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit21: TDBEdit;
    GroupBox2: TGroupBox;
    Label33: TLabel;
    Label36: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    GroupBox3: TGroupBox;
    Label62: TLabel;
    Label66: TLabel;
    Label69: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    GroupBox4: TGroupBox;
    Label71: TLabel;
    Label76: TLabel;
    Label78: TLabel;
    Label80: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label32: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox5: TGroupBox;
    Label65: TLabel;
    Label70: TLabel;
    Label72: TLabel;
    Edit4: TEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBMemo1: TDBMemo;
    GroupBox6: TGroupBox;
    Label35: TLabel;
    Label67: TLabel;
    Button2: TButton;
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCompanyListClick(Sender: TObject);
    procedure EdtYearChange(Sender: TObject);
    procedure RbStateClick(Sender: TObject);
    procedure EdtMonthChange(Sender: TObject);
    procedure EdtDayChange(Sender: TObject);
    procedure EdtYear2Change(Sender: TObject);
    procedure EdtMonth2Change(Sender: TObject);
    procedure EdtDay2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWorkHistory: TFrmWorkHistory;

implementation

{$R *.dfm}

uses Module_Global, Module_Persons, Frm_Company, Frm_Person;

procedure TFrmWorkHistory.BtnCancelClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(false, PnCrud, DBGView, BtnEdit,
    BtnNew, Self);
end;

procedure TFrmWorkHistory.BtnCompanyListClick(Sender: TObject);
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

procedure TFrmWorkHistory.BtnEditClick(Sender: TObject);
var
  dateOfBD: string;
  ComponentDate: TArray<string>;
begin
  with ModulePersons.QWorkHistory do
  begin
    if recordcount > 0 then
    begin
      EdtCod.Text := FieldByName('idWorkHistory').AsString;

      ComponentDate := FrmPerson.SplitString(FieldByName('DateAdmission')
        .AsString, '/');

      EdtYear.Text := ComponentDate[2];
      EdtMonth.Text := ComponentDate[1];
      EdtDay.Text := ComponentDate[0];

      if FieldByName('State').AsBoolean then
        RbState.ItemIndex := 0
      else
        RbState.ItemIndex := 1;

      if not(FieldByName('State').AsBoolean) then
      begin
        ComponentDate := FrmPerson.SplitString(FieldByName('RetirementDate')
          .AsString, '/');
        EdtYear2.Text := ComponentDate[2];
        EdtMonth2.Text := ComponentDate[1];
        EdtDay2.Text := ComponentDate[0];
        EdtYear2.Enabled := true;
        EdtMonth2.Enabled := true;
        EdtDay2.Enabled := true;

        RbExitMedicalExam.Enabled := true;

        if FieldByName('ExitMedicalExam').AsBoolean then
          RbExitMedicalExam.ItemIndex := 0
        else
          RbExitMedicalExam.ItemIndex := 1;
      end;

    end;

    if FieldByName('MedicalExam').AsBoolean then
      RbMedicalExam.ItemIndex := 0
    else
      RbMedicalExam.ItemIndex := 1;

    EdtCodCompany.Text := FieldByName('idCompany').AsString;
    EdtCompany.Text := FieldByName('Company').AsString;
    EdtCargo.Text := FieldByName('PositionCompany').AsString;

    ModuleGlobal.activateDeactivate(true, PnCrud, DBGView, BtnEdit,
      BtnNew, Self);
  end;

end;

procedure TFrmWorkHistory.BtnNewClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(true, PnCrud, DBGView, BtnEdit, BtnNew, Self);
end;

procedure TFrmWorkHistory.BtnSaveClick(Sender: TObject);
var
  Fields, Values: TStringList;
  results: boolean;
  table, idTable: string;
begin
  if (EdtCodCompany.Text = '') or (EdtCargo.Text = '') or
    ((LbAdmissionDate.Caption = '0000-00-00') or
    (LbAdmissionDate.Caption = 'false')) then
  begin
    ShowMessage('Los Campos con (*) son Obligatorios.');
  end
  else
  begin
    // we group the fields and values for the query
    Fields := TStringList.Create;
    Values := TStringList.Create;

    table := 'workhistory';
    idTable := 'idWorkHistory';

    Fields.Add('DateAdmission');
    Fields.Add('PositionCompany');
    Fields.Add('MedicalExam');
    Fields.Add('RetirementDate');
    Fields.Add('State');
    Fields.Add('IdPersons');
    Fields.Add('idCompany');

    Values.Add(LbAdmissionDate.Caption);
    Values.Add(EdtCargo.Text);
    case RbMedicalExam.ItemIndex = 0 of
      true:
        Values.Add('1');
      false:
        Values.Add('0');
    end;
    Values.Add(LbRetirementDate.Caption);
    case RbState.ItemIndex = 0 of
      true:
        Values.Add('1');
      false:
        Values.Add('0');
    end;
    Values.Add(EdtCodPerson.Text);
    Values.Add(EdtCodCompany.Text);

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
          ShowMessage('¡ Mistake ! Unexpected.');
      end;

      ModulePersons.resetWorkHistory(EdtCodPerson.Text);
      activateDeactivate(false, PnCrud, DBGView, BtnEdit, BtnNew, Self);
    end;
  end;
end;

procedure TFrmWorkHistory.EdtDay2Change(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear2.Text, EdtMonth2.Text, EdtDay2.Text,
    _date, _age);
  LbRetirementDate.Caption := _date;
end;

procedure TFrmWorkHistory.EdtDayChange(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear.Text, EdtMonth.Text, EdtDay.Text, _date, _age);
  LbAdmissionDate.Caption := _date;
end;

procedure TFrmWorkHistory.EdtMonth2Change(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear2.Text, EdtMonth2.Text, EdtDay2.Text,
    _date, _age);
  LbRetirementDate.Caption := _date;
end;

procedure TFrmWorkHistory.EdtMonthChange(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear.Text, EdtMonth.Text, EdtDay.Text, _date, _age);
  LbAdmissionDate.Caption := _date;
end;

procedure TFrmWorkHistory.EdtYear2Change(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear2.Text, EdtMonth2.Text, EdtDay2.Text,
    _date, _age);
  LbRetirementDate.Caption := _date;
end;

procedure TFrmWorkHistory.EdtYearChange(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear.Text, EdtMonth.Text, EdtDay.Text, _date, _age);
  LbAdmissionDate.Caption := _date;
end;

procedure TFrmWorkHistory.FormActivate(Sender: TObject);
begin
  ModulePersons.resetWorkHistory(EdtCodPerson.Text);
  EdtBuscar.SetFocus();
end;

procedure TFrmWorkHistory.RbStateClick(Sender: TObject);
begin
  if RbState.ItemIndex = 1 then
  begin
    EdtYear2.Enabled := true;
    EdtMonth2.Enabled := true;
    EdtDay2.Enabled := true;
    LbRetirementDate.Enabled := true;
    RbExitMedicalExam.Enabled := true;
  end
  else
  begin
    EdtYear2.Enabled := false;
    EdtMonth2.Enabled := false;
    EdtDay2.Enabled := false;
    LbRetirementDate.Enabled := false;
    RbExitMedicalExam.Enabled := false;
    RbExitMedicalExam.Buttons[0].Checked := false;

    EdtYear2.clear;
    EdtMonth2.clear;
    EdtDay2.clear;
  end;

end;

end.
