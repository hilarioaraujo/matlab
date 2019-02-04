function varargout = LF_GUI(varargin)
%LF_GUI MATLAB code file for LF_GUI.fig
%      LF_GUI, by itself, creates a new LF_GUI or raises the existing
%      singleton*.
%
%      H = LF_GUI returns the handle to a new LF_GUI or the handle to
%      the existing singleton*.
%
%      LF_GUI('Property','Value',...) creates a new LF_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to LF_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      LF_GUI('CALLBACK') and LF_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in LF_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LF_GUI

% Last Modified by GUIDE v2.5 01-Nov-2017 19:18:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LF_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LF_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before LF_GUI is made visible.
function LF_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for LF_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LF_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LF_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'data',zeros(5,5));
a=get(hObject,'Value');
if a
    
%1)Extração dos dados do Excel
%TEMPERATURA
%Posição:S79 30.00 W002 30.00 0-4500m
[~,Temp_50_90]=xlsread('Dados.xlsx','B8:B27');
Temp_50_90=str2num(cell2mat(Temp_50_90));

[P_50_90]=xlsread('Dados.xlsx','A8:A27');


%SALINIDADE 
%Posição:S79 30.00 W002 30.00 0-4500m
[~,Sal_50_90]=xlsread('Dados.xlsx','B36:B55');
for i=1:20
tudo(i)=str2num(Sal_50_90{i});
end
Sal_50_90=tudo';
%2)Cálculo da Velocidade do som e da densidade
Vel_50_90=zeros(20,1);
Den_50_90=zeros(20,1);
for i=1:20
    Sal_50_90(i)
    Temp_50_90(i)
    P_50_90(i)
    aux1=Velocidade_som(Sal_50_90(i),Temp_50_90(i),P_50_90(i));
    
    aux2= Densidade(Sal_50_90(i),Temp_50_90(i),P_50_90(i));
    
    Vel_50_90(i)=aux1;
    Den_50_90(i)=aux2;
end

%4)Compilação final
Dados_50_90=[P_50_90, Temp_50_90, Sal_50_90,Vel_50_90,Den_50_90];


set(handles.uitable1,'data',Dados_50_90);

%5)Gráficos
axes(handles.axes1);
p1=plot(Temp_50_90,P_50_90,'r');
set(p1,'Tag','1p1')
hold on
grid on
xlabel('Temperatura (ºC)');
ylabel('Imersão (dbar)');
title('Temperatura vs Imersão');

axes(handles.axes2);
p2=plot(Sal_50_90,P_50_90,'r');
set(p2,'Tag','1p2')
hold on
grid on
xlabel('Salinidade (UPS)');
title('Salinidade vs Imersão');

axes(handles.axes3);
p3=plot(Vel_50_90,P_50_90,'r');
set(p3,'Tag','1p3')
hold on
grid on
xlabel('Velocidade do som (m/s)');
title('Velocidade do som vs Imersão');

axes(handles.axes4);
p3=plot(Den_50_90,P_50_90,'r');
set(p3,'Tag','1p3')
hold on
grid on
xlabel('Densidade (Kg/m3)');
title('Densidade vs Imersão');

else
    ind1=findobj('Tag','1p1');
    ind2=findobj('Tag','1p2');
    ind3=findobj('Tag','1p3');
    ind4=findobj('Tag','1p4');
    if ~isempty(ind1)
        set(ind1,'Visible','off')
    end
    if ~isempty(ind2)
        set(ind2,'Visible','off')
    end
    if ~isempty(ind3)
        set(ind3,'Visible','off')
    end
    if ~isempty(ind4)
        set(ind4,'Visible','off')
    end
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Posição:N40 30.00 W128 30.00 0-4500m
set(handles.uitable1,'data',zeros(5,5));
a=get(hObject,'Value');
if a
[ Temp_40_50]=xlsread('Dados.xlsx','D8:D27');

% Temp_40_50=str2num(cell2mat(Temp_40_50));

[P_40_50]=xlsread('Dados.xlsx','C8:C27');



%Posição:N40 30.00 W128 30.00 0-4500m
[~,Sal_40_50]=xlsread('Dados.xlsx','D36:D55');
for i=1:20
tudo(i)=str2num(Sal_40_50{i});
end
Sal_40_50=tudo';




Vel_40_50=zeros(20,1);
Den_40_50=zeros(20,1);
for i=1:20
    aux3=Velocidade_som(Sal_40_50(i),Temp_40_50(i),P_40_50(i));
    aux4= Densidade(Sal_40_50(i),Temp_40_50(i),P_40_50(i));
    Vel_40_50(i)=aux3;
    Den_40_50(i)=aux4;
    
end


Dados_40_50=[P_40_50, Temp_40_50, Sal_40_50,Vel_40_50,Den_40_50];
set(handles.uitable1,'data',Dados_40_50);

%5)Gráficos
axes(handles.axes1);
p1=plot(Temp_40_50,P_40_50,'b');
set(p1,'Tag','1p1')
hold on
grid on
xlabel('Temperatura (ºC)');
ylabel('Imersão (dbar)');
title('Temperatura vs Imersão');

axes(handles.axes2);
p2=plot(Sal_40_50,P_40_50,'b');
set(p2,'Tag','1p2')
hold on
grid on
xlabel('Salinidade (UPS)');
title('Salinidade vs Imersão');

axes(handles.axes3);
p3=plot(Vel_40_50,P_40_50,'b');
set(p3,'Tag','1p3')
hold on
grid on
xlabel('Velocidade do som (m/s)');
title('Velocidade do som vs Imersão');

axes(handles.axes4);
p3=plot(Den_40_50,P_40_50,'b');
set(p3,'Tag','1p3')
hold on
grid on
xlabel('Densidade (Kg/m3)');
title('Densidade vs Imersão');

else
    ind1=findobj('Tag','1p1');
    ind2=findobj('Tag','1p2');
    ind3=findobj('Tag','1p3');
    ind4=findobj('Tag','1p4');
    if ~isempty(ind1)
        set(ind1,'Visible','off')
    end
    if ~isempty(ind2)
        set(ind2,'Visible','off')
    end
    if ~isempty(ind3)
        set(ind3,'Visible','off')
    end
    if ~isempty(ind4)
        set(ind4,'Visible','off')
    end
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%1)Extração dos dados atualizados

Updt_Table=get(handles.uitable1,'Data');
Updt_P=Updt_Table(:,1);
Updt_T=Updt_Table(:,2);
Updt_S=Updt_Table(:,3);

    
    
%2)Cálculo da Velocidade do som com a função Velocidade_som

Updt_V=zeros(numel(Updt_P),1);
Updt_D=zeros(numel(Updt_P),1);
for i=1:numel(Updt_P)
    aux5=Velocidade_som(Updt_S(i),Updt_T(i),Updt_P(i));
    aux6= Densidade(Updt_S(i),Updt_T(i),Updt_P(i));
    Updt_V(i)=aux5;
    Updt_D(i)=aux6;
    
end
size(Updt_P,2)

%4)Tabela dados 
Updt_Table_final=[Updt_P,Updt_T,Updt_S,Updt_V,Updt_D];
set(handles.uitable1,'data',Updt_Table_final);

%5)Gráficos
axes(handles.axes1);
p1=plot(Updt_T,Updt_P,'b');
set(p1,'Tag','1p1')
hold on
grid on
xlabel('Temperatura (ºC)');
ylabel('Imersão (dbar)');
title('Temperatura vs Imersão');

axes(handles.axes2);
p2=plot(Updt_S,Updt_P,'b');
set(p2,'Tag','1p2')
hold on
grid on
xlabel('Salinidade (UPS)');
title('Salinidade vs Imersão');

axes(handles.axes3);
p3=plot(Updt_V,Updt_P,'b');
set(p3,'Tag','1p3')
hold on
grid on
xlabel('Velocidade do som (m/s)');
title('Velocidade do som vs Imersão');

axes(handles.axes4);
p3=plot(Updt_D,Updt_P,'b');
set(p3,'Tag','1p3')
hold on
grid on
xlabel('Densidade (Kg/m3)');
title('Densidade vs Imersão');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

nzeros=get(handles.edit1,'String');

set(handles.uitable1,'data',zeros(str2num(nzeros),5));


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
