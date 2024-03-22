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
      '    *,'
      '    concat(Name,'#39' '#39',Surname,'#39' '#39',SecondSurname) as NameComplete,'
      '    CONCAT('
      '        FLOOR(DATEDIFF(NOW(), Birthdate) / 365), '#39' A'#241'os, '#39','
      
        '        FLOOR((DATEDIFF(NOW(), Birthdate) % 365) / 30), '#39' Meses,' +
        ' '#39','
      '        DATEDIFF(NOW(), Birthdate) % 30, '#39' D'#237'as'#39
      '    ) AS age'
      'from persons')
    Active = True
    Left = 32
    Top = 11
  end
  object DSPersons: TDataSource
    DataSet = QPersons
    Left = 32
    Top = 67
  end
end
