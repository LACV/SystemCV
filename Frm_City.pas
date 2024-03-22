unit Frm_City;

interface

uses
  Frm_Person, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmCitys = class(TForm)
    PnCabezal: TPanel;
    Separador: TImage;
    LbBuscar: TLabel;
    separador2: TImage;
    EdtBuscar: TEdit;
    DBGVista: TDBGrid;
    procedure DBGVistaDblClick(Sender: TObject);
    procedure EdtBuscarChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCitys: TFrmCitys;

implementation

{$R *.dfm}

uses Module_Basic;

procedure TFrmCitys.DBGVistaDblClick(Sender: TObject);
begin
  // cargamos los datos al formulario
  if DBGVista.SelectedIndex <> -1 then
  begin
    if Assigned(FrmPerson.LastButtonActivated) then
    begin
      with FrmPerson do
      begin
        if LastButtonActivated = BtnCityBirthList then
        begin
          with ModuleBasic.QCity do
          begin
            EdtCityBirth.Text := FieldByName('City').AsString;
            EdtDepartamentBirth.Text := FieldByName('Department').AsString;
          end;

          FrmCitys.Close;
        end
        else if LastButtonActivated = BtnExpeditionList then
        begin
          with ModuleBasic.QCity do
          begin
            EdtExpedition.Text := FieldByName('City').AsString + '(' +
              FieldByName('Department').AsString + ')';
          end;

          FrmCitys.Close;
        end
        else if LastButtonActivated = BtnCityResidenceList then
        begin

          with ModuleBasic.QCity do
          begin
            EdtCityResidence.Text := FieldByName('City').AsString + '(' +
              FieldByName('Department').AsString + ')';
          end;


          FrmCitys.Close;
        end;
      end;
    end;
  end;
end;

procedure TFrmCitys.EdtBuscarChange(Sender: TObject);
begin
  with ModuleBasic do
  begin
    QCity.FilterOptions := [foCaseInsensitive];
    QCity.Filter := 'City like' + QuotedStr('%' + EdtBuscar.Text + '%');
    QCity.Filtered := True;
  end;
end;

procedure TFrmCitys.FormActivate(Sender: TObject);
begin
  ModuleBasic.resetCity();
  EdtBuscar.SetFocus();
end;

end.