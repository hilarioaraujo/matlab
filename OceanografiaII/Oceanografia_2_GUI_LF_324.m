function varargout = Oceanografia_2_GUI_LF_324(varargin)
% OCEANOGRAFIA_2_GUI_LF_324 MATLAB code for Oceanografia_2_GUI_LF_324.fig
%      OCEANOGRAFIA_2_GUI_LF_324, by itself, creates a new OCEANOGRAFIA_2_GUI_LF_324 or raises the existing
%      singleton*.
%
%      H = OCEANOGRAFIA_2_GUI_LF_324 returns the handle to a new OCEANOGRAFIA_2_GUI_LF_324 or the handle to
%      the existing singleton*.
%
%      OCEANOGRAFIA_2_GUI_LF_324('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OCEANOGRAFIA_2_GUI_LF_324.M with the given input arguments.
%
%      OCEANOGRAFIA_2_GUI_LF_324('Property','Value',...) creates a new OCEANOGRAFIA_2_GUI_LF_324 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Oceanografia_2_GUI_LF_324_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Oceanografia_2_GUI_LF_324_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Oceanografia_2_GUI_LF_324

% Last Modified by GUIDE v2.5 05-Mar-2018 23:59:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Oceanografia_2_GUI_LF_324_OpeningFcn, ...
                   'gui_OutputFcn',  @Oceanografia_2_GUI_LF_324_OutputFcn, ...
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


% --- Executes just before Oceanografia_2_GUI_LF_324 is made visible.
function Oceanografia_2_GUI_LF_324_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Oceanografia_2_GUI_LF_324 (see VARARGIN)

% Choose default command line output for Oceanografia_2_GUI_LF_324
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Oceanografia_2_GUI_LF_324 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Oceanografia_2_GUI_LF_324_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function lat_Callback(hObject, eventdata, handles)
% hObject    handle to lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lat as text
%        str2double(get(hObject,'String')) returns contents of lat as a double


% --- Executes during object creation, after setting all properties.
function lat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vel_vento_Callback(hObject, eventdata, handles)
% hObject    handle to vel_vento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vel_vento as text
%        str2double(get(hObject,'String')) returns contents of vel_vento as a double


% --- Executes during object creation, after setting all properties.
function vel_vento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vel_vento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rumo_Callback(hObject, eventdata, handles)
% hObject    handle to rumo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rumo as text
%        str2double(get(hObject,'String')) returns contents of rumo as a double


% --- Executes during object creation, after setting all properties.
function rumo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rumo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
min=str2double(get(handles.min,'String'));
max=str2double(get(handles.max,'String'));
intervalo=str2double(get(handles.intervalo,'String'));
lat=str2double(get(handles.lat,'String'));
vel_vento=str2double(get(handles.vel_vento,'String'));
rumo=str2double(get(handles.rumo,'String'));
densidade_ar=str2double(get(handles.densidade_ar,'String'));
densidade_agua=str2double(get(handles.densidade_agua,'String'));
lat_ns=get(handles.lat_ns,'Value');


[ esp_cam ] = espessura_camada( lat,vel_vento );
[transp_kg, coriolis] = transporte_kg (lat, densidade_ar, vel_vento);
[transp_m3] = transporte_m3 (transp_kg, densidade_agua);

im=-(min:(((max-min)/(intervalo-1))):max)';

for i=1:size(im,1)
    [comp_transv_u(i,1) , v0] = componente_transv_u( im(i,1),vel_vento, esp_cam, coriolis, lat_ns );
    [comp_long_v(i,1)] = componente_long_v( im(i,1), esp_cam, v0 );
    [ int_vent(i,1) ] = intensidade_vento( comp_transv_u(i,1), comp_long_v(i,1) );
    [ ang_rel(i,1)] = angulo_relativo( comp_transv_u(i,1),comp_long_v(i,1) );
    [ dir_vent(i,1) ] = direcao_vento( ang_rel(i,1),rumo );
    
end

dados=[im, int_vent, round(dir_vent), round(ang_rel), round(comp_transv_u,4), round(comp_long_v,4)];
set(handles.tabela,'Data',dados);

axes(handles.axes1)
plot(int_vent,im,'g-o');
title('Velocidade do Vento vs Imersão');
xlabel('Velocidade (m/s)');
ylabel('Imersão (m)');
grid on;


axes(handles.axes2)
plot(comp_transv_u,im,'b-o',comp_long_v,im,'r-o');
legend('Componente transversal','Componente longitudinal','Location','southeast');
title('Componentes (u e v) vs Imersão');
xlabel('Componentes (m/s)');
ylabel('Imersão (m)');
grid on;







set(handles.espessura,'String',esp_cam);
set(handles.transp_kg,'String',transp_kg);
set(handles.transp_m3,'String',transp_m3);



function min_Callback(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min as text
%        str2double(get(hObject,'String')) returns contents of min as a double


% --- Executes during object creation, after setting all properties.
function min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function intervalo_Callback(hObject, eventdata, handles)
% hObject    handle to intervalo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intervalo as text
%        str2double(get(hObject,'String')) returns contents of intervalo as a double


% --- Executes during object creation, after setting all properties.
function intervalo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intervalo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_Callback(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max as text
%        str2double(get(hObject,'String')) returns contents of max as a double


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function densidade_ar_Callback(hObject, eventdata, handles)
% hObject    handle to densidade_ar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of densidade_ar as text
%        str2double(get(hObject,'String')) returns contents of densidade_ar as a double


% --- Executes during object creation, after setting all properties.
function densidade_ar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to densidade_ar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function densidade_agua_Callback(hObject, eventdata, handles)
% hObject    handle to densidade_agua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of densidade_agua as text
%        str2double(get(hObject,'String')) returns contents of densidade_agua as a double


% --- Executes during object creation, after setting all properties.
function densidade_agua_CreateFcn(hObject, eventdata, handles)
% hObject    handle to densidade_agua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lat_ns.
function lat_ns_Callback(hObject, eventdata, handles)
% hObject    handle to lat_ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lat_ns contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lat_ns


% --- Executes during object creation, after setting all properties.
function lat_ns_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lat_ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
