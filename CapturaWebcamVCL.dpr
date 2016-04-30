program CapturaWebcamVCL;

uses
  Vcl.Forms,
  uCapturaWebcamVCL in 'uCapturaWebcamVCL.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
