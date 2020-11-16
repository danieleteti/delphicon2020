program SimpleJSONRPCAPI_VCL_Client;

uses
  Vcl.Forms,
  MainClientFormU in 'MainClientFormU.pas' {MainForm};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
