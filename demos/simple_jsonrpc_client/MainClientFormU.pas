unit MainClientFormU;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Net.HttpClientComponent,
  Vcl.StdCtrls,
  System.Net.URLClient,
  System.Net.HttpClient,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  MVCFramework.JSONRPC.Client;

type
  TMainForm = class(TForm)
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable1Code: TIntegerField;
    FDMemTable1Name: TStringField;
    GroupBox1: TGroupBox;
    edtValue1: TEdit;
    edtValue2: TEdit;
    btnSubstract: TButton;
    edtResult: TEdit;
    edtReverseString: TEdit;
    btnReverseString: TButton;
    edtReversedString: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    btnSubtractWithNamedParams: TButton;
    Edit3: TEdit;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    edtFilter: TEdit;
    edtGetCustomers: TButton;
    DBGrid1: TDBGrid;
    procedure btnSubstractClick(Sender: TObject);
    procedure btnReverseStringClick(Sender: TObject);
    procedure edtGetCustomersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSubtractWithNamedParamsClick(Sender: TObject);
  private
  const
    RPC_ENDPOINT = '/myobjectrpc';
  var
    FExecutor: IMVCJSONRPCExecutor;
    // FExecutor2: IMVCJSONRPCExecutor;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.Generics.Collections,
  MVCFramework.JSONRPC,
  MVCFramework.Serializer.JsonDataObjects,
  JsonDataObjects,
  MVCFramework.Serializer.Commons,
  MVCFramework.Commons,
  MVCFramework.Serializer.Defaults,
  MVCFramework.DataSet.Utils,
  // BusinessObjectsU,
  System.Math,
  System.Rtti;

{$R *.dfm}

procedure TMainForm.btnReverseStringClick(Sender: TObject);
var
  lReq: IJSONRPCRequest;
  lResp: IJSONRPCResponse;
begin
  lReq := TJSONRPCRequest.Create;
  lReq.Method := 'reversestring';
  lReq.RequestID := Random(1000);
  lReq.Params.AddByName('aString', edtReverseString.Text);
  lReq.Params.AddByName('aUpperCase', CheckBox1.Checked);
  lResp := FExecutor.ExecuteRequest(RPC_ENDPOINT, lReq);
  edtReversedString.Text := lResp.Result.AsString;
end;

procedure TMainForm.btnSubstractClick(Sender: TObject);
var
  lReq: IJSONRPCRequest;
  lResp: IJSONRPCResponse;
begin
  lReq := TJSONRPCRequest.Create;
  lReq.Method := 'subtract';
  lReq.RequestID := Random(1000);
  lReq.Params.Add(StrToInt(edtValue1.Text));
  lReq.Params.Add(StrToInt(edtValue2.Text));
  lResp := FExecutor.ExecuteRequest(RPC_ENDPOINT, lReq);
  edtResult.Text := lResp.Result.AsInteger.ToString;
end;

procedure TMainForm.btnSubtractWithNamedParamsClick(Sender: TObject);
var
  lReq: IJSONRPCRequest;
  lResp: IJSONRPCResponse;
begin
  lReq := TJSONRPCRequest.Create;
  lReq.Method := 'subtract';
  lReq.RequestID := Random(1000);
  lReq.Params.AddByName('Value1', StrToInt(Edit1.Text));
  lReq.Params.AddByName('Value2', StrToInt(Edit2.Text));
  lResp := FExecutor.ExecuteRequest(RPC_ENDPOINT, lReq);
  Edit3.Text := lResp.Result.AsInteger.ToString;
end;

procedure TMainForm.edtGetCustomersClick(Sender: TObject);
var
  lReq: IJSONRPCRequest;
  lResp: IJSONRPCResponse;
begin
  FDMemTable1.Active := False;
  lReq := TJSONRPCRequest.Create(Random(1000), 'getcustomers');
  lReq.Params.AddByName('FilterString', edtFilter.Text);
  lResp := FExecutor.ExecuteRequest(RPC_ENDPOINT, lReq);
  FDMemTable1.Active := True;
  FDMemTable1.LoadFromTValue(lResp.Result);
  FDMemTable1.First;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FExecutor := TMVCJSONRPCExecutor.Create('http://localhost:8080');
end;

end.
