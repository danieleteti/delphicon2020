object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'JSON-RPC 2.0 Client'
  ClientHeight = 604
  ClientWidth = 842
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 842
    Height = 604
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Invoking Plain PODO'
      object GroupBox1: TGroupBox
        Left = 3
        Top = 22
        Width = 815
        Height = 174
        Caption = 'Simple Types'
        TabOrder = 0
        object edtValue1: TEdit
          Left = 17
          Top = 32
          Width = 32
          Height = 21
          TabOrder = 0
          Text = '42'
        end
        object edtValue2: TEdit
          Left = 55
          Top = 32
          Width = 26
          Height = 21
          TabOrder = 1
          Text = '10'
        end
        object btnSubstract: TButton
          Left = 87
          Top = 30
          Width = 100
          Height = 25
          Caption = 'Subtract'
          TabOrder = 2
          OnClick = btnSubstractClick
        end
        object edtResult: TEdit
          Left = 193
          Top = 32
          Width = 27
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
        object edtReverseString: TEdit
          Left = 17
          Top = 80
          Width = 88
          Height = 21
          TabOrder = 4
          Text = 'Daniele Teti'
        end
        object btnReverseString: TButton
          Left = 111
          Top = 78
          Width = 109
          Height = 25
          Caption = 'Reverse String'
          TabOrder = 5
          OnClick = btnReverseStringClick
        end
        object edtReversedString: TEdit
          Left = 320
          Top = 80
          Width = 131
          Height = 21
          ReadOnly = True
          TabOrder = 6
        end
        object CheckBox1: TCheckBox
          Left = 226
          Top = 82
          Width = 88
          Height = 17
          Caption = 'As Uppercase'
          TabOrder = 7
        end
        object Edit1: TEdit
          Left = 17
          Top = 136
          Width = 32
          Height = 21
          TabOrder = 8
          Text = '42'
        end
        object Edit2: TEdit
          Left = 55
          Top = 136
          Width = 26
          Height = 21
          TabOrder = 9
          Text = '10'
        end
        object btnSubtractWithNamedParams: TButton
          Left = 87
          Top = 134
          Width = 160
          Height = 25
          Caption = 'Subtract (named params)'
          TabOrder = 10
          OnClick = btnSubtractWithNamedParamsClick
        end
        object Edit3: TEdit
          Left = 253
          Top = 136
          Width = 27
          Height = 21
          ReadOnly = True
          TabOrder = 11
        end
      end
      object PageControl2: TPageControl
        Left = 3
        Top = 202
        Width = 815
        Height = 367
        ActivePage = TabSheet3
        TabOrder = 1
        object TabSheet3: TTabSheet
          Caption = 'Get DataSet'
          ExplicitWidth = 296
          object edtFilter: TEdit
            Left = 3
            Top = 5
            Width = 184
            Height = 21
            TabOrder = 0
          end
          object edtGetCustomers: TButton
            Left = 193
            Top = 3
            Width = 91
            Height = 25
            Caption = 'Get Customers'
            TabOrder = 1
            OnClick = edtGetCustomersClick
          end
          object DBGrid1: TDBGrid
            Left = 3
            Top = 34
            Width = 279
            Height = 302
            DataSource = DataSource1
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 767
    Top = 184
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 767
    Top = 328
    object FDMemTable1Code: TIntegerField
      FieldName = 'Code'
    end
    object FDMemTable1Name: TStringField
      FieldName = 'Name'
    end
  end
end
