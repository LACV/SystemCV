unit Form_PersonsInCare;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TFrmPersonsInCare = class(TForm)
    DBGView: TDBGrid;
    PnCabezal: TPanel;
    Separador: TImage;
    LbBuscar: TLabel;
    separador2: TImage;
    BtnNew: TButton;
    EdtBuscar: TEdit;
    BtnEdit: TButton;
    PnCrud: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    EdtId: TEdit;
    EdtName: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
    EdtCodPerson: TEdit;
    EdtCod: TEdit;
    dbName: TDBMemo;
    Label59: TLabel;
    LbBirthDate: TLabel;
    EdtMonth: TEdit;
    EdtYear: TEdit;
    Label60: TLabel;
    EdtDay: TEdit;
    Label3: TLabel;
    EdtRelationship: TEdit;
    Label4: TLabel;
    LbAge: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure EdtYearChange(Sender: TObject);
    procedure EdtMonthChange(Sender: TObject);
    procedure EdtDayChange(Sender: TObject);
    procedure EdtBuscarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPersonsInCare: TFrmPersonsInCare;

implementation

{$R *.dfm}

uses Module_Global, Module_Persons, Frm_Person;

procedure TFrmPersonsInCare.BtnCancelClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(false, PnCrud, DBGView, BtnEdit,
    BtnNew, Self);
end;

procedure TFrmPersonsInCare.BtnEditClick(Sender: TObject);
var
  dateOfBD: string;
  ComponentesFecha: TArray<string>;
begin
  with ModulePersons.QPersonsInCare do
  begin
    if recordcount > 0 then
    begin
      EdtCod.Text := FieldByName('idPersonCare').AsString;
      EdtId.Text := FieldByName('Identification').AsString;
      EdtName.Text := FieldByName('Name').AsString;

      dateOfBD := FieldByName('Birts').AsString;
      ComponentesFecha := FrmPerson.SplitString(dateOfBD, '/');

      EdtYear.Text := ComponentesFecha[2];
      EdtMonth.Text := ComponentesFecha[1];
      EdtDay.Text := ComponentesFecha[0];

      EdtRelationship.Text := FieldByName('Relationship').AsString;

      ModuleGlobal.activateDeactivate(true, PnCrud, DBGView, BtnEdit,
        BtnNew, Self);
    end;

  end;
end;

procedure TFrmPersonsInCare.BtnNewClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(true, PnCrud, DBGView, BtnEdit, BtnNew, Self);
end;

procedure TFrmPersonsInCare.BtnSaveClick(Sender: TObject);
var
  Fields, Values: TStringList;
  results: boolean;
  table, idTable: string;
begin
  if (EdtId.Text = '') or (EdtName.Text = '') then
  begin
    ShowMessage('Los Campos con (*) son Obligatorios.');
  end
  else
  begin
    // we group the fields and values for the query
    Fields := TStringList.Create;
    Values := TStringList.Create;

    table := 'personsinmycare';
    idTable := 'idPersonCare';

    Fields.Add('Name');
    Fields.Add('Birts');
    Fields.Add('Identification');
    Fields.Add('Relationship');
    Fields.Add('IdPersons');

    Values.Add(EdtName.Text);
    Values.Add(LbBirthDate.Caption);
    Values.Add(EdtId.Text);
    Values.Add(EdtRelationship.Text);
    Values.Add(EdtCodPerson.Text);

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

      ModulePersons.resetPersonsInMyCare(EdtCodPerson.Text);
      activateDeactivate(false, PnCrud, DBGView, BtnEdit, BtnNew, Self);
    end;
  end;
end;

procedure TFrmPersonsInCare.EdtBuscarChange(Sender: TObject);
begin
  with ModulePersons.QPersonsInCare do
  begin
    FilterOptions := [foCaseInsensitive];
    Filter := 'Name like ' + QuotedStr('%' + EdtBuscar.Text + '%') + ' or ' +
      'Identification like ' + QuotedStr('%' + EdtBuscar.Text + '%');
    Filtered := true;
  end;
end;

procedure TFrmPersonsInCare.EdtDayChange(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear.Text, EdtMonth.Text, EdtDay.Text, _date, _age);
  LbBirthDate.Caption := _date;
  LbAge.Caption := _age;
end;

procedure TFrmPersonsInCare.EdtMonthChange(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear.Text, EdtMonth.Text, EdtDay.Text, _date, _age);
  LbBirthDate.Caption := _date;
  LbAge.Caption := _age;
end;

procedure TFrmPersonsInCare.EdtYearChange(Sender: TObject);
begin
  FrmPerson.updateDate(EdtYear.Text, EdtMonth.Text, EdtDay.Text, _date, _age);
  LbBirthDate.Caption := _date;
  LbAge.Caption := _age;
end;

procedure TFrmPersonsInCare.FormActivate(Sender: TObject);
begin
  ModulePersons.resetPersonsInMyCare(EdtCodPerson.Text);
  EdtBuscar.SetFocus();
end;

end.
