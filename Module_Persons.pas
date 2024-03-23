unit Module_Persons;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni, DateUtils;

type
  TModulePersons = class(TDataModule)
    QPersons: TUniQuery;
    DSPersons: TDataSource;
    QPersonsInCare: TUniQuery;
    DsPersonsInCare: TDataSource;
    QWorkHistory: TUniQuery;
    DsWorkHistory: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function resetPersons(): string;
    function resetPersonsInMyCare(id: string): string;
    function resetWorkHistory(id: string): string;
  end;

var
  ModulePersons: TModulePersons;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TModulePersons }

function TModulePersons.resetPersons: string;
begin
  with QPersons do
  begin
    Active := false;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

function TModulePersons.resetPersonsInMyCare(id: string): string;
begin
  with QPersonsInCare do
  begin
    Active := false;
    ParamByName('id').Value := id;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

function TModulePersons.resetWorkHistory(id: string): string;
begin
  with QWorkHistory do
  begin
    Active := false;
    ParamByName('id').Value := id;
    Active := true;
    Result := IntToStr(recordcount);
  end;
end;

end.
