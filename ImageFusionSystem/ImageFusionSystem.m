function varargout = ImageFusionSystem(varargin)
% IMAGEFUSIONSYSTEM MATLAB code for ImageFusionSystem.fig
%      IMAGEFUSIONSYSTEM, by itself, creates a new IMAGEFUSIONSYSTEM or raises the existing
%      singleton*.
%      H = IMAGEFUSIONSYSTEM returns the handle to a new IMAGEFUSIONSYSTEM or the handle to
%      the existing singleton*.
%
%      IMAGEFUSIONSYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEFUSIONSYSTEM.M with the given input arguments.
%
%      IMAGEFUSIONSYSTEM('Property','Value',...) creates a new IMAGEFUSIONSYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageFusionSystem_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageFusionSystem_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageFusionSystem

% Last Modified by GUIDE v2.5 01-Sep-2015 20:58:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ImageFusionSystem_OpeningFcn, ...
    'gui_OutputFcn',  @ImageFusionSystem_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ImageFusionSystem is made visible.
function ImageFusionSystem_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageFusionSystem (see VARARGIN)

% Choose default command line output for ImageFusionSystem
handles.output = hObject;
handles.index = 1;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ImageFusionSystem wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ImageFusionSystem_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectA.
function selectA_Callback(hObject, eventdata, handles)

[Fa , Pa] = uigetfile('*.*' , 'ÇëÑ¡ÔñÍ¼Ïñ');
stra = [Pa Fa];
IMA = imread(stra);
handles.IMA = IMA;
axes(handles.imageA)

imshow(IMA);

guidata(hObject,handles);
% --- Executes on button press in selectB.
function selectB_Callback(hObject, eventdata, handles)

[Fb , Pb] = uigetfile('*.*' , 'ÇëÑ¡ÔñÍ¼Ïñ');
strb =[Pb Fb];
IMB = imread(strb);
handles.IMB = IMB;
axes(handles.imageB)
imshow(IMB);

guidata(hObject,handles);

function SelectM_SelectionChangeFcn(hObject, eventdata, handles)

set(handles.label , 'String', '');
set(handles.VAG , 'String', '');
set(handles.VMI , 'String', '');
set(handles.VQF , 'String', '');
set(handles.VSF , 'String', '');
switch get(hObject , 'Tag')
    case 'StreeableF'
        index = 1;
    case 'DWT'
        index = 2;
    case 'PCA'
        index = 3;
    case 'PLT'
        index = 4;
    case 'PCNN'
        index = 5;
end
handles.index  = index;
guidata(hObject , handles);
% --- Executes on button press in AG.
function Run_Callback(hObject, eventdata, handles)

% stra =handles.stra;
% strb =handles.strb;

axes(handles.imageF);
if  handles.index == 1
    %    set(handles.runlabel , 'String' , 'ÈÚºÏÖÐ  ÇëÉÔºò¡­¡­');
   [OUT , O] = StreeableF(handles.IMA , handles.IMB);
 
    imshow(OUT);
    
end

if handles.index == 2
    [OUT , O] = DWT(handles.IMA , handles.IMB);
    imshow(OUT);
end

if handles.index == 3
    [OUT  , O] = PCA(handles.IMA , handles.IMB);
    imshow(OUT);
end

if handles.index == 4
    [OUT , O] = PLT(handles.IMA , handles.IMB);
    imshow(OUT);
end

if handles.index == 5
    [OUT , O] = PCNN(handles.IMA , handles.IMB);
    imshow(OUT);
end

if  get(handles.AG, 'Value');
    Vag = AG(O);
    set(handles.VAG , 'String', Vag);
end

if  get(handles.SF, 'Value');
    set(handles.VSF , 'String', 'vsf');
end

if  get(handles.MI, 'Value');
    Vmi = MIF(handles.IMA , handles.IMB , O );
    set(handles.VMI , 'String', Vmi);
end

if  get(handles.QF, 'Value');
    Vqf = QF(handles.IMA , handles.IMB , O);
    set(handles.VQF , 'String', Vqf);
end


set(handles.label , 'String', '¹§Ï²   ÈÚºÏ³É¹¦£¡');


%  set(handles.runlabel , 'String' , '¿ªÊ¼');
guidata(hObject , handles);
function AG_Callback(hObject, eventdata, handles)
% hObject    handle to AG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AG


% --- Executes on button press in SF.
function SF_Callback(hObject, eventdata, handles)
% hObject    handle to SF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SF


% --- Executes on button press in MI.
function MI_Callback(hObject, eventdata, handles)
% hObject    handle to MI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MI


% --- Executes on button press in QF.
function QF_Callback(hObject, eventdata, handles)
% hObject    handle to QF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of QF


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox2.
function listbox2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.


% --- Executes during object creation, after setting all properties.


% --- Executes during object creation, after setting all properties.


% --- Executes on button press in Run.


% --- Executes during object creation, after setting all properties.
function imageF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate imageF


% --- Executes when selected object is changed in SelectM.

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Run.


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Run.
function Run_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function imageA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate imageA


% --- Executes during object creation, after setting all properties.
function imageB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imageB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate imageB


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SD.
function SD_Callback(hObject, eventdata, handles)
% hObject    handle to SD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SD
