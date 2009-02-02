unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel;

type
  TfrmAbout = class(TForm)
    OKButton: TButton;
    imgLogo: TImage;
    lblTitle: TLMDLabel;
    VersionInfo: TLMDLabel;
    LMDLabel1: TLMDLabel;
    LMDLabel2: TLMDLabel;
    lblUrl: TLMDLabel;
    procedure lblURLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GetBuildInfo( var v1, v2, v3, v4 : Word );
    function GetBuildInfoString: string;
  end;

var
  frmAbout: TfrmAbout;

implementation

uses Main;

{$R *.dfm}

{ ---------------------------------------------------------------------------- }

procedure TfrmAbout.lblURLClick(Sender: TObject);
begin
   frmMain.BrowseURL1.URL := lblUrl.Caption;
   frmMain.BrowseURL1.Execute;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmAbout.GetBuildInfo( var v1, v2, v3, v4 : Word );
var
  VerInfoSize: DWord;
  VerInfo: Pointer;
  VerValueSize: DWord;
  VerValue: PVSFixedFileInfo;
  Dummy: DWord;
begin
  VerInfoSize := GetFileVersionInfoSize( PChar( Application.ExeName ), dummy );
  GetMem( VerInfo, VerInfoSize );
  GetFileVersionInfo( PChar( Application.ExeName ), 0, VerInfoSize, VerInfo );
  VerQueryValue( VerInfo, '\', Pointer( VerValue ), VerValueSize );
  with VerValue^ do
  begin
    v1 := dwFileVersionMS shr 16;
    v2 := dwFileVersionMS and $FFFF;
    v3 := dwFileVersionLS shr 16;
    v4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem( VerInfo, VerInfoSize );
end;

{ ---------------------------------------------------------------------------- }

function TfrmAbout.GetBuildInfoString: string;
var
  v1, v2, v3, v4: Word;
begin
  GetBuildInfo( v1, v2, v3, v4 );
  Result := Format( '%d.%d.%d.%d', [v1,v2,v3,v4] );
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  VersionInfo.Caption := 'Version ' + AppVersion;
end;

{ ---------------------------------------------------------------------------- }

end.

