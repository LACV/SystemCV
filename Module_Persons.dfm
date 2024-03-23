object ModulePersons: TModulePersons
  OldCreateOrder = False
  Height = 215
  Width = 318
  object QPersons: TUniQuery
    SQLInsert.Strings = (
      '')
    Connection = ModuleGlobal.UConex
    SQL.Strings = (
      'select'
      #9'*,'
      '    concat(Name,'#39' '#39',Surname,'#39' '#39',SecondSurname) as NameComplete,'
      '    CONCAT('
      '        FLOOR(DATEDIFF(NOW(), Birthdate) / 365), '#39' A'#241'os, '#39','
      
        '        FLOOR((DATEDIFF(NOW(), Birthdate) % 365) / 30), '#39' Meses,' +
        ' '#39','
      '        DATEDIFF(NOW(), Birthdate) % 30, '#39' D'#237'as'#39
      '    ) AS age,'
      
        '    concat(ResidenceAddress,'#39'('#39',CityResidence,'#39')'#39') as addressRes' +
        'idenceT,'
      
        '    if(DrivingLicense=true,concat('#39'Si - Categoria(s): '#39',Category' +
        'License),'#39'No'#39') as LicenseT,'
      '    if(OwnHouse=true,'#39'Si'#39','#39'No'#39') as HouseT'
      'from persons')
    Active = True
    Left = 32
    Top = 11
  end
  object DSPersons: TDataSource
    AutoEdit = False
    DataSet = QPersons
    Left = 32
    Top = 67
  end
  object QPersonsInCare: TUniQuery
    SQLInsert.Strings = (
      '')
    Connection = ModuleGlobal.UConex
    SQL.Strings = (
      'select'
      'Pm.*,concat(P.name,'#39' '#39',P.Surname,'#39' '#39',SecondSurname) as NameT'
      'from personsinmycare Pm'
      'inner join persons P on Pm.IdPersons=P.IdPersons'
      'where Pm.IdPersons=:id')
    Left = 104
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object DsPersonsInCare: TDataSource
    AutoEdit = False
    DataSet = QPersonsInCare
    Left = 104
    Top = 67
  end
  object QWorkHistory: TUniQuery
    SQLInsert.Strings = (
      '')
    Connection = ModuleGlobal.UConex
    SQL.Strings = (
      'select'
      
        'Wh.*,Company,concat(P.name,'#39' '#39',P.Surname,'#39' '#39',SecondSurname) as N' +
        'ameT,'
      'if(MedicalExam=true,'#39'Realizado'#39','#39'No Realizado'#39') as MedicalExemT,'
      'if(State=true,'#39'Activo'#39','#39'Inactivoo'#39') as StateT,'
      
        'if(State=false,if(ExitMedicalExam=true,'#39'Relizado'#39','#39'No Relizado'#39')' +
        ','#39'Empleado Laborando'#39') as ExitMedicalExemT'
      'from workhistory Wh'
      'inner join persons P on Wh.IdPersons=P.IdPersons'
      'inner join company C on Wh.idCompany=C.idCompany'
      'where Wh.IdPersons=:id')
    Left = 208
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object DsWorkHistory: TDataSource
    AutoEdit = False
    DataSet = QWorkHistory
    Left = 208
    Top = 67
  end
end
