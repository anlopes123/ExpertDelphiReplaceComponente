unit UnitFormReplaceComponent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXCtrls, ToolsAPI;

type
  TFormReplaceComponent = class(TForm)
    SearchBox1: TSearchBox;
    OpenDialog1: TOpenDialog;
    procedure SearchBox1InvokeSearch(Sender: TObject);
  private
    { Private declarations }
    function retornaIotaFormEdito(vIotaEdito: IOTAEditor; vIotaModule: IOTAModule): IOTAFormEditor;
  public
    { Public declarations }

  end;

var
  FormReplaceComponent: TFormReplaceComponent;

implementation

{$R *.dfm}

{ TFormReplaceComponent }


function TFormReplaceComponent.retornaIotaFormEdito(
  vIotaEdito: IOTAEditor; vIotaModule: IOTAModule): IOTAFormEditor;
var i: Integer;
    Editor: IOTAEditor;
begin
  for I := 0 to vIotaModule.ModuleFileCount - 1 do
  begin
    Editor:= vIotaModule.ModuleFileEditors[i];
    if Supports(Editor, IOTAFormEditor, Result) then
    begin
      Exit;
    end;
  end;
  Result:= nil;
end;

procedure TFormReplaceComponent.SearchBox1InvokeSearch(Sender: TObject);
var vStrings: TStringList;
    ModuleServices: IOTAModuleServices;
    vIotaModule: IOTAModule;
    vIotaEditor: IOTAEditor;
    vIotaFormEditor: IOTAFormEditor;
    vIotaComponet: IOTAComponent;
    vIotaPackageService: IOTAPAckageServices;

begin
  if OpenDialog1.Execute then
  begin
    try
     vStrings:= TStringList.Create;
     SearchBox1.Text:= OpenDialog1.FileName;
     vStrings.Add(SearchBox1.Text);
    if Supports(BorlandIDEServices, IOTAModuleServices, ModuleServices) then
    begin
      vIotaModule:= (BorlandIDEServices as IOTAModuleServices).OpenModule(SearchBox1.Text);
      if Assigned(vIotaModule) then
      begin
         //vIotaModule.Show;
         vIotaPackageService:= (BorlandIDEServices as IOTAPAckageServices).
         vIotaFormEditor:= retornaIotaFormEdito(vIotaEditor, vIotaModule);
         if Assigned(vIotaFormEditor) then
         begin
          vIotaComponet:=  vIotaFormEditor.FindComponent('QuickRep');
          if Assigned(vIotaComponet) then
             ShowMessage(vIotaComponet.GetComponentType)
          else
             ShowMessage('vIotaComponente not found');
         end
         else
           ShowMessage('IotaFormEditor not suported');
      end;
    end;

    finally
      FreeAndNil(vStrings);
    end;
  end;
end;

end.
