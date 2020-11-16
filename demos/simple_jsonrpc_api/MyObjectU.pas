// ***************************************************************************
//
// Delphi MVC Framework
//
// Copyright (c) 2010-2020 Daniele Teti and the DMVCFramework Team
//
// https://github.com/danieleteti/delphimvcframework
//
// ***************************************************************************
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// *************************************************************************** }

unit MyObjectU;

interface

uses
  JsonDataObjects,
  System.Generics.Collections,
  Data.DB,
  FireDAC.Comp.Client;

type

  TMyObject = class
  private
    function GetCustomersDataset: TFDMemTable;
  public
    function Subtract(Value1, Value2: Integer): Integer;
    function ReverseString(const aString: string;
      const aUpperCase: Boolean): string;
    function GetCustomers(FilterString: string): TDataset;
  end;

implementation

uses
  System.SysUtils, System.StrUtils;

function TMyObject.GetCustomers(FilterString: string): TDataset;
var
  lMT: TFDMemTable;
begin
  lMT := GetCustomersDataset;
  try
    if not FilterString.IsEmpty then
    begin
      lMT.Filter := FilterString;
      lMT.Filtered := True;
    end;
    lMT.First;
    Result := lMT;
  except
    lMT.Free;
    raise;
  end;
end;

function TMyObject.GetCustomersDataset: TFDMemTable;
var
  lMT: TFDMemTable;
begin
  lMT := TFDMemTable.Create(nil);
  try
    lMT.FieldDefs.Clear;
    lMT.FieldDefs.Add('Code', ftInteger);
    lMT.FieldDefs.Add('Name', ftString, 20);
    lMT.Active := True;
    lMT.AppendRecord([1, 'Ford']);
    lMT.AppendRecord([2, 'Ferrari']);
    lMT.AppendRecord([3, 'Lotus']);
    lMT.AppendRecord([4, 'FCA']);
    lMT.AppendRecord([5, 'Hyundai']);
    lMT.AppendRecord([6, 'De Tomaso']);
    lMT.AppendRecord([7, 'Dodge']);
    lMT.AppendRecord([8, 'Tesla']);
    lMT.AppendRecord([9, 'Kia']);
    lMT.AppendRecord([10, 'Tata']);
    lMT.AppendRecord([11, 'Volkswagen']);
    lMT.AppendRecord([12, 'Audi']);
    lMT.AppendRecord([13, 'Skoda']);
    lMT.First;
    Result := lMT;
  except
    lMT.Free;
    raise;
  end;
end;

function TMyObject.ReverseString(const aString: string;
  const aUpperCase: Boolean): string;
begin
  Result := System.StrUtils.ReverseString(aString);
  if aUpperCase then
    Result := Result.ToUpper;
end;

function TMyObject.Subtract(Value1, Value2: Integer): Integer;
begin
  Result := Value1 - Value2;
end;

end.
