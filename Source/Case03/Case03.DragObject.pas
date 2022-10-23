unit Case03.DragObject;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  LCLType,
  Controls,
  Graphics,
  Buttons,
  ImgList;

type
  TDragObjectEx = class(TDragControlObjectEx)
  private
    _DragImages: TDragImageList;
  protected
    function GetDragImages: TDragImageList; override;
  public
    constructor Create(NewControl: TControl; bmp: TBitmap); reintroduce;
    destructor Destroy; override;
  end;

implementation

{ TDragObjectEx }

constructor TDragObjectEx.Create(NewControl: TControl; bmp: TBitmap);
begin
  inherited Create(NewControl);

  _DragImages := TDragImageList.Create(NewControl);
  AlwaysShowDragImages := true;

  _DragImages.Width := bmp.Width;
  _DragImages.Height := bmp.Height;
  _DragImages.Add(bmp, nil);
  _DragImages.DragHotspot := Point(bmp.Width, bmp.Height);
end;

destructor TDragObjectEx.Destroy;
begin
  _DragImages.Free;
  inherited Destroy;
end;

function TDragObjectEx.GetDragImages: TDragImageList;
begin
  Result := _DragImages;
end;

end.
