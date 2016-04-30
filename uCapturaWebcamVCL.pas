unit uCapturaWebcamVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    btnConectar: TButton;
    pnlWebcam: TPanel;
    btnDesconectar: TButton;
    btnGravarVideo: TButton;
    btnGravarImagem: TButton;
    btnConfigurar: TButton;
    btnParar: TButton;
    spnedtRate: TSpinEdit;
    edtFileName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    chkbPreview: TCheckBox;
    SaveDialog1: TSaveDialog;
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure chkbPreviewClick(Sender: TObject);
    procedure spnedtRateChange(Sender: TObject);
    procedure btnGravarImagemClick(Sender: TObject);
    procedure btnGravarVideoClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
  private
    { Private declarations }
    HWndCaptura: HWnd;
  public
    { Public declarations }
  end;

  function capCreateCaptureWindowA(lpszWindowName: PCHAR; dwStyle: longint;
  x: integer; y: integer; nWidth: integer; nHeight: integer; ParentWin: HWnd;
  nId: integer): HWnd;
stdcall external 'AVICAP32.DLL';
//function CalculaDobro(Valor: Integer): Integer;stdcall;external 'TTDLL.dll' name 'dobro';

{ Mensagem base }
const WM_CAP_START = WM_USER;
{ Conectar a WebCam }
const WM_CAP_DRIVER_CONNECT = WM_CAP_START + 10;
{ Desconectar a WebCam }
const WM_CAP_DRIVER_DISCONNECT = WM_CAP_START + 11;
{ Preview }
const WM_CAP_SET_PREVIEW = WM_CAP_START + 50;
{ Configurar frames por segundo }
const WM_CAP_SET_PREVIEWRATE = WM_CAP_START + 52;


var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnConectarClick(Sender: TObject);
begin
  HWndCaptura := capCreateCaptureWindowA(
    'Windows Video API no Delphi',
    WS_CHILD or WS_VISIBLE, pnlWebCam.Left,   pnlWebCam.Top,
    pnlWebCam.Width, pnlWebCam.Height, pnlWebCam.Handle, 0);

  if HWndCaptura <> 0 then
  begin
    try
      SendMessage(HWndCaptura, WM_CAP_DRIVER_CONNECT, 0, 0);
      SendMessage(HWndCaptura, WM_CAP_SET_PREVIEWRATE, 1000 div    spnedtRate.Value , 0);
      SendMessage(HWndCaptura, WM_CAP_SET_PREVIEW, Ord(chkbPreview.Checked), 0);
      btnDesconectar.Enabled := True;
      btnConectar.Enabled := False;
      btnConfigurar.Enabled := True;
      btnGravarImagem.Enabled := True;
      btnGravarVideo.Enabled := True;
      btnParar.Enabled := True;
    except
      raise;
    end;
end
  else
  begin
    MessageDlg ('Erro ao conectar ao driver da câmera!',mtError, [mbok], 0);
    btnDesconectar.Enabled := False;
    btnConectar.Enabled := True;
    btnGravarImagem.Enabled := False;
    btnGravarVideo.Enabled := False;
    btnParar.Enabled := False;
    end;


end;


procedure TForm1.btnConfigurarClick(Sender: TObject);
begin
  if HWndCaptura <> 0 then
  SendMessage(HWndCaptura,WM_CAP_START +41, 0, 0);
end;

procedure TForm1.btnDesconectarClick(Sender: TObject);
begin
   if HWndCaptura <> 0 then
  begin
   SendMessage(HWndCaptura, WM_CAP_DRIVER_DISCONNECT, 0, 0);
   btnDesconectar.Enabled := False;
   btnConectar.Enabled := True;
   btnGravarImagem.Enabled := False;
   btnGravarVideo.Enabled := False;
   btnConfigurar.Enabled := False;
   btnParar.Enabled := False;
  end;
end;

procedure TForm1.btnGravarImagemClick(Sender: TObject);
begin
  if HWndCaptura <> 0 then
  begin
    SaveDialog1.DefaultExt := 'bmp';
    SaveDialog1.Filter := 'Arquivo Bitmap (*.bmp)|*.bmp';
    if SaveDialog1.Execute then
      SendMessage(HWndCaptura, WM_CAP_START +25, 0,
        longint(pchar(SaveDialog1.FileName)));
  end;
end;

procedure TForm1.btnGravarVideoClick(Sender: TObject);
begin
   if HWndCaptura <> 0 then
  begin
   // SendMessage(HWndCaptura, WM_CAP_FILE_SET_CAPTURE_FILEA, 0,
  //    Longint(pchar(edtFileName.Text)));
  //  SendMessage(HWndCaptura, WM_CAP_SEQUENCE, 0, 0);
  end;
end;

procedure TForm1.btnPararClick(Sender: TObject);
begin
 // if HWndCaptura <> 0 then
  //  SendMessage(HWndCaptura, WM_CAP_STOP, 0, 0);
end;

procedure TForm1.chkbPreviewClick(Sender: TObject);
begin
    if HWndCaptura <> 0 then
    SendMessage(HWndCaptura, WM_CAP_SET_PREVIEW,
    Ord(chkbPreview.Checked), 0);
end;

procedure TForm1.spnedtRateChange(Sender: TObject);
begin
    if HWndCaptura <> 0 then
    SendMessage(HWndCaptura, WM_CAP_SET_PREVIEWRATE, 1000 div spnedtRate.Value, 0);
end;

end.
