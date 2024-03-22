unit Module_Basic;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni;

type
  TModuleBasic = class(TDataModule)
    QCompany: TUniQuery;
    DSCompany: TDataSource;
    QEPS: TUniQuery;
    DSEPS: TDataSource;
    QARL: TUniQuery;
    DSARL: TDataSource;
    QAFP: TUniQuery;
    DSAFP: TDataSource;
    QCCF: TUniQuery;
    DSCCF: TDataSource;
    QCity: TUniQuery;
    DSCity: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function resetCompany(): string;
    function resetEPS(): string;
    function resetARl(): string;
    function resetAFP(): string;
    function resetCCF(): string;
    function resetCity(): string;
  end;

var
  ModuleBasic: TModuleBasic;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Module_Global;

{$R *.dfm}
{ TModuleCompany }

function TModuleBasic.resetCompany: string;
begin
  with QCompany do
  begin
    Active := false;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

function TModuleBasic.resetAFP: string;
begin
  with QAFP do
  begin
    Active := false;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

function TModuleBasic.resetARl: string;
begin
  with QARL do
  begin
    Active := false;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

function TModuleBasic.resetCCF: string;
begin
  with QCCF do
  begin
    Active := false;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

function TModuleBasic.resetCity: string;
begin
  with QCity do
  begin
    Active := false;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

function TModuleBasic.resetEPS: string;
begin
  with QEPS do
  begin
    Active := false;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

end.
