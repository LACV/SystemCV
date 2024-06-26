unit Frm_AFP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmAFP = class(TForm)
    DBGView: TDBGrid;
    PnCabezal: TPanel;
    Separador: TImage;
    LbBuscar: TLabel;
    separador2: TImage;
    BtnNew: TButton;
    EdtBuscar: TEdit;
    BtnEdit: TButton;
    PnCrud: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    EdtName: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
    EdtCod: TEdit;
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure EdtBuscarChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAFP: TFrmAFP;

implementation

{$R *.dfm}

uses Module_Basic, Module_Global;

procedure TFrmAFP.BtnCancelClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(false, PnCrud, DBGView, BtnEdit,
    BtnNew, Self);
end;

procedure TFrmAFP.BtnEditClick(Sender: TObject);
begin
  with ModuleBasic.QAFP do
  begin
    if recordcount > 0 then
    begin
      EdtCod.Text := FieldByName('idAfp').AsString;
      EdtName.Text := FieldByName('Afp').AsString;

      ModuleGlobal.activateDeactivate(true, PnCrud, DBGView, BtnEdit,
        BtnNew, Self);
    end;
  end;
end;

procedure TFrmAFP.BtnNewClick(Sender: TObject);
begin
  ModuleGlobal.activateDeactivate(true, PnCrud, DBGView, BtnEdit, BtnNew, Self);
end;

procedure TFrmAFP.BtnSaveClick(Sender: TObject);
var
  Fields, Values: TStringList;
  results: boolean;
  table, idTable: string;
begin
  if (EdtName.Text = '') then
  begin
    ShowMessage('Los Campos con (*) son Obligatorios.');
  end
  else
  begin
    // we group the fields and values for the query
    Fields := TStringList.Create;
    Values := TStringList.Create;

    table := 'afp';
    idTable := 'idAfp';

    Fields.Add('Afp');

    Values.Add(EdtName.Text);

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

      ModuleBasic.resetAFP();
      activateDeactivate(false, PnCrud, DBGView, BtnEdit, BtnNew, Self);
    end;
  end;
end;

procedure TFrmAFP.EdtBuscarChange(Sender: TObject);
begin
  with ModuleBasic.QAFP do
  begin
    FilterOptions := [foCaseInsensitive];
    Filter := 'Afp like ' + QuotedStr('%' + EdtBuscar.Text + '%');
    Filtered := true;
  end;
end;

procedure TFrmAFP.FormActivate(Sender: TObject);
begin
  ModuleBasic.resetAFP();
  EdtBuscar.SetFocus();
end;

end.
