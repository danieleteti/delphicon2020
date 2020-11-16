object CustomersDM: TCustomersDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 266
  Width = 405
  object FDConnection1: TFDConnection
    ConnectedStoredUsage = []
    Left = 88
    Top = 64
  end
  object MyQuery: TFDQuery
    Connection = FDConnection1
    Left = 208
    Top = 64
  end
end
