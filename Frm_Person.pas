unit Frm_Person;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

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
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    EdtBlancura: TEdit;
    EdtPulimiento: TEdit;
    EdtRendimientoPilada: TEdit;
    EdtGranoPartidoBlanco: TEdit;
    EdtIp: TEdit;
    GBBiologicas: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    EdtVariedad: TEdit;
    EdtOlor: TEdit;
    EdtColor: TEdit;
    GBInfBasic: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    EdtLote: TEdit;
    EdtProveedor: TEdit;
    EdtFecha: TEdit;
    EdtPesoMuestra: TEdit;
    GBEmergency: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    EdtGranoDanado: TEdit;
    EdtGranoCentroBlanco: TEdit;
    EdtGranoYeso: TEdit;
    EdtGranoRojo: TEdit;
    GBMilitary: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    EdtMezclaIM: TEdit;
    EdtBlancuraI: TEdit;
    EdtIntegralPartido: TEdit;
    PnDer: TPanel;
    Label30: TLabel;
    Label34: TLabel;
    LbGuardo: TLabel;
    BtnCancel: TButton;
    BtnSave: TButton;
    EdtCod: TEdit;
    Edit1: TEdit;
    Label8: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Edit2: TEdit;
    Label56: TLabel;
    Label57: TLabel;
    Edit3: TEdit;
    Label58: TLabel;
    Label59: TLabel;
    Edit4: TEdit;
    Label60: TLabel;
    Label13: TLabel;
    Edit5: TEdit;
    Label14: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPerson: TFrmPerson;

implementation

{$R *.dfm}

end.
