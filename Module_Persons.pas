unit Module_Persons;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, Uni;

type
  TModulePersons = class(TDataModule)
    QPersons: TUniQuery;
    DSPersons: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function resetPersons(): string;
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

end.
