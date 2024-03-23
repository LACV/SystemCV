unit Frm_Affiliations;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmAffiliations = class(TForm)
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
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label59: TLabel;
    LbBirthDate: TLabel;
    Label60: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LbAge: TLabel;
    EdtId: TEdit;
    EdtName: TEdit;
    BtnSave: TButton;
    BtnCancel: TButton;
    EdtCodPerson: TEdit;
    EdtCod: TEdit;
    EdtMonth: TEdit;
    EdtYear: TEdit;
    EdtDay: TEdit;
    EdtRelationship: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAffiliations: TFrmAffiliations;

implementation

{$R *.dfm}

uses Module_Global, Module_Persons, Module_Basic;

end.
