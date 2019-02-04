function varargout = Graf_direitas_vs_inclinadas(varargin)
% GRAF_DIREITAS_VS_INCLINADAS MATLAB code for Graf_direitas_vs_inclinadas.fig
%      GRAF_DIREITAS_VS_INCLINADAS, by itself, creates a new GRAF_DIREITAS_VS_INCLINADAS or raises the existing
%      singleton*.
%
%      H = GRAF_DIREITAS_VS_INCLINADAS returns the handle to a new GRAF_DIREITAS_VS_INCLINADAS or the handle to
%      the existing singleton*.
%
%      GRAF_DIREITAS_VS_INCLINADAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAF_DIREITAS_VS_INCLINADAS.M with the given input arguments.
%
%      GRAF_DIREITAS_VS_INCLINADAS('Property','Value',...) creates a new GRAF_DIREITAS_VS_INCLINADAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Graf_direitas_vs_inclinadas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Graf_direitas_vs_inclinadas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Graf_direitas_vs_inclinadas

% Last Modified by GUIDE v2.5 15-May-2018 08:23:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Graf_direitas_vs_inclinadas_OpeningFcn, ...
                   'gui_OutputFcn',  @Graf_direitas_vs_inclinadas_OutputFcn, ...
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


% --- Executes just before Graf_direitas_vs_inclinadas is made visible.
function Graf_direitas_vs_inclinadas_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Graf_direitas_vs_inclinadas (see VARARGIN)

% Choose default command line output for Graf_direitas_vs_inclinadas
handles.output = hObject;

% % create an axes that spans the whole gui
% ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% % import the background image and show it on the axes
% bg = imread('arquitetura.jpg'); imagesc(bg);
% % prevent plotting over the background and turn the axis off
% set(ah,'handlevisibility','off','visible','off')
% % making sure the background is behind all the other uicontrols
% uistack(ah, 'bottom');


% Update handles structure
guidata(hObject, handles);


% UIWAIT makes Graf_direitas_vs_inclinadas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Graf_direitas_vs_inclinadas_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function graf_direitas_Callback(~, ~, handles)
% hObject    handle to graf_direitas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fin,'Visible','Off');
set(handles.fin,'Enable','Off');

set(handles.im_1,'Visible','Off');
set(handles.im_1,'Enable','Off');
set(handles.im_2,'Visible','Off');
set(handles.im_2,'Enable','Off');
set(handles.im_3,'Visible','Off');
set(handles.im_3,'Enable','Off');
set(handles.im_4,'Visible','Off');
set(handles.im_4,'Enable','Off');
set(handles.ver,'Visible','Off');
set(handles.ver,'Enable','Off');
set(handles.graficos,'Visible','Off');
set(handles.graficos,'Enable','Off');

cla(handles.graf_tab);
legend(handles.graf_tab,'off');
set(handles.inc_1,'Visible','Off');
set(handles.inc_1,'HandleVisibility','Off');
cla(handles.inc_1);
legend(handles.inc_1,'off');

set(handles.inc_2,'Visible','Off');
set(handles.inc_2,'HandleVisibility','Off');
cla(handles.inc_2);
legend(handles.inc_2,'off');


set(handles.title_tab,'Visible','Off');

set(handles.escolha,'Visible','Off');
set(handles.escolha,'Enable','Off');

set(handles.inc,'Visible','Off');
set(handles.inc,'Enable','Off');

set(handles.outro,'Visible','Off');
set(handles.outro,'Enable','Off');

set(handles.text_inc,'Visible','Off');
set(handles.text_inc,'Enable','Off');

set(handles.informa1,'Visible','Off');
set(handles.informa2,'Visible','Off');
set(handles.informa3,'Visible','Off');

set(handles.min,'Visible','Off');
set(handles.min,'Enable','Off');

set(handles.max,'Visible','Off');
set(handles.max,'Enable','Off');

set(handles.inter,'Visible','Off');
set(handles.inter,'Enable','Off');

set(handles.done,'Visible','Off');
set(handles.done,'Enable','Off');

set(handles.tab,'Visible','Off');
set(handles.tab,'Enable','Off');

set(handles.graf_tab,'Visible','Off');
set(handles.graf_tab,'HandleVisibility','Off');

set(handles.title_graf,'Visible','On');

set(handles.graf,'Visible','On');
set(handles.graf,'HandleVisibility','On');

set(handles.inf1,'Visible','On');
set(handles.inf3,'Visible','On');
set(handles.inf2,'Visible','On');

set(handles.text16,'Visible','Off');
set(handles.text16,'Enable','Off');
set(handles.graf_esc,'Visible','Off');
set(handles.graf_esc,'Enable','Off');

set(handles.precisao,'Visible','Off');
set(handles.precisao,'Enable','Off');
set(handles.text_precisao,'Visible','Off');
set(handles.text_precisao,'Enable','Off');

dados_graf=getappdata(0,'dados_graf');

if isempty(dados_graf)==1
else
    Im=dados_graf(:,1);
    graf_Bf=dados_graf(:,2);
    graf_Vw=dados_graf(:,3);
    graf_desloc=dados_graf(:,4);
    graf_Tpc=dados_graf(:,5);
    graf_Zc=dados_graf(:,6);
    graf_Rc=dados_graf(:,7);
    graf_Rl=dados_graf(:,8);
    graf_Mc=dados_graf(:,9);
    
    set(handles.inf1,'String',{'Bf(i) Boca de Flutuação';'\nabla(i) Volume de carena';'\Delta(i) Deslocamento';'\Deltac(i) Deslocamento Unitário'});
    set(handles.inf2,'String',{'Zc(i) Altura do Centro de Impulsão'; 'Rc(i) Raio Metacêntrico Transversal';'Rl(i) Raio Metacêntrico Longitudinal';'Mc(i) Momento de Caimento'});
    set(handles.inf3,'String',{'Navio:';'Comprimento fora-a-fora = 6m';'Boca Máxima = 2m';'Água Salgada: \rho = 1.025 ton/m^{3}'});
    %D = pontal [m]
    %Im = imersões [m]
    %Loa = comprimento fora a fora [m]
    %Aw = Área de Flutuação [m2]
    %Kp = Altura do Polo
    %m_H2O= Massa específica da água salgada: 1025 kg/m3
    %m_esp_casco= Massa específica: 160,185 kg/m3
    %Tpc= deslocamento unitário [Kg/cm3)
    %Zf= Altura do Centro de flutuação [m]
    %Xf= Posição Longitudinal do Centro de Flutuação [m]
    %Zc= Altura do Centro de Impulsão [m]
    %Xf= Posição Longitudinal do Centro de Impulsão [m]
    %Rc= Raio Metacêntrico Transversal
    %Rl= Raio Metacêntrico Longitudinal
    %Mc= Momento de Caimento
    
    
    axes(handles.graf)
    gra=plot(graf_Bf,Im,graf_Vw,Im,graf_desloc,Im,graf_Tpc,Im,graf_Zc,Im,graf_Rc,Im,graf_Rl,Im,graf_Mc,Im);
    gra(1).LineWidth = 1.5;
    gra(2).LineWidth = 1.5;
    gra(3).LineWidth = 1.5;
    gra(4).LineWidth = 1.5;
    gra(5).LineWidth = 1.5;
    gra(6).LineWidth = 1.5;
    gra(7).LineWidth = 1.5;
    gra(8).LineWidth = 1.5;    
    legend('Bf(i) 1cm <> 3m','\nabla(i) 1cm <> 10m^{3}','\Delta(i) 1cm <> 10ton' ,'\Delta_{c}(i) 1cm <> 1ton/cm','Z_{c}(i) 1cm <> 1m','R_{T}(i) 1cm <> 0.1m','R_{L}(i) 1cm <> 105m','M_{c}(i) 1cm <> 1ton*m*cm^{-1}');
    ylabel('Imersão (m)');
    grid on;
end


% --------------------------------------------------------------------
function tab_direitas_Callback(~, ~, handles)
% hObject    handle to tab_direitas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fin,'Visible','Off');
set(handles.fin,'Enable','Off');

set(handles.precisao,'Visible','On');
set(handles.precisao,'Enable','On');
set(handles.text_precisao,'Visible','On');
set(handles.text_precisao,'Enable','On');

cla(handles.graf);
legend('off')

set(handles.im_1,'Visible','Off');
set(handles.im_1,'Enable','Off');
set(handles.im_2,'Visible','Off');
set(handles.im_2,'Enable','Off');
set(handles.im_3,'Visible','Off');
set(handles.im_3,'Enable','Off');
set(handles.im_4,'Visible','Off');
set(handles.im_4,'Enable','Off');
set(handles.ver,'Visible','Off');
set(handles.ver,'Enable','Off');
set(handles.graficos,'Visible','Off');
set(handles.graficos,'Enable','Off');

cla(handles.graf_tab);
legend(handles.graf_tab,'off');
set(handles.inc_1,'Visible','Off');
set(handles.inc_1,'HandleVisibility','Off');
cla(handles.inc_1);
legend(handles.inc_1,'off');

set(handles.inc_2,'Visible','Off');
set(handles.inc_2,'HandleVisibility','Off');
cla(handles.inc_2);
legend(handles.inc_2,'off');


set(handles.title_tab,'Visible','On');
set(handles.title_tab,'String','Tabela de Carenas Direitas');

set(handles.escolha,'Visible','Off');
set(handles.escolha,'Enable','Off');

set(handles.inc,'Visible','Off');
set(handles.inc,'Enable','Off');

set(handles.outro,'Visible','Off');
set(handles.outro,'Enable','Off');

set(handles.text_inc,'Visible','Off');
set(handles.text_inc,'Enable','Off');

set(handles.tab, 'Data', {})
set(handles.tab, 'ColumnName', {})

set(handles.informa1,'Visible','On');
set(handles.informa1,'String','Introduza a imersão minima [m]:');

set(handles.informa2,'Visible','On');
set(handles.informa2,'String','Introduza a imersão máxima [m]:');

set(handles.informa3,'Visible','On');
set(handles.informa3,'String','Introduza o intervalo para cada imersão [m]:');

set(handles.min,'String','0.05');
set(handles.max,'String','0.75');
set(handles.inter,'String','0.035');

set(handles.min,'Visible','On');
set(handles.min,'Enable','On');

set(handles.max,'Visible','On');
set(handles.max,'Enable','On');

set(handles.inter,'Visible','On');
set(handles.inter,'Enable','On');

set(handles.done,'Visible','On');
set(handles.done,'Enable','On');

set(handles.tab,'Visible','On');
set(handles.tab,'Enable','On');

set(handles.graf_tab,'Visible','On');
set(handles.graf_tab,'HandleVisibility','On');

set(handles.title_graf,'Visible','Off');

set(handles.graf,'Visible','Off');
set(handles.graf,'HandleVisibility','Off');

set(handles.inf1,'Visible','Off');
set(handles.inf3,'Visible','Off');
set(handles.inf2,'Visible','Off');

set(handles.text16,'Visible','On');
set(handles.text16,'Enable','On');
set(handles.text16,'String','Selecione qual a imersão a ser mostrada no gráfico:');

set(handles.graf_esc,'Visible','On');
set(handles.graf_esc,'Enable','On');


dados_tab=getappdata(0,'dados_tab');
colunas=getappdata(0,'colunas');
if isempty(dados_tab)==1
else
    set(handles.tab,'Data',dados_tab);
    set(handles.tab, 'ColumnName', colunas)
    Im=getappdata(0,'Im');
    
%Desenhar Área secção acima da imersão maxima defenida
Im1=(Im(1,1):(((1-Im(1,1)))/2000):1)';
for j=1:size(Im1,1)
        Bft(j,1)= boca_vent_sup_en (Im1(j,1));
end

if Im(1,1)==0
    Im2=0;
else
    Im2=(0:Im(1,1)/500:Im(1,1))';
end


for j=1:size(Im2,1)
        Bft2(j,1)= boca_vent_sup_en (Im2(j,1));
end

x_gr=[-1.5 1.5];
y_gr=[Im(1,1) Im(1,1)];


axes(handles.graf_tab)
plot(-(Bft/2),Im1,'r',-(Bft2/2),Im2,'b',(Bft/2),Im1,'r',(Bft2/2),Im2,'b',x_gr,y_gr,'b');
axis([-1.5 1.5 -0.5 1.5]);
title('Secção transversal de flutuacão');
xlabel('Boca de Flutuação [m]');
ylabel('Imersão (m)');
grid on;
legend('Linha do casco','Linha de Água');

set(handles.graf_esc,'String',Im);
set(handles.graf_esc,'Value',1)
end

function min_Callback(~, ~, ~)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min as text
%        str2double(get(hObject,'String')) returns contents of min as a double


% --- Executes during object creation, after setting all properties.
function min_CreateFcn(hObject, ~, ~)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_Callback(~, ~, ~)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max as text
%        str2double(get(hObject,'String')) returns contents of max as a double


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, ~, ~)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inter_Callback(~, ~, ~)
% hObject    handle to inter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inter as text
%        str2double(get(hObject,'String')) returns contents of inter as a double


% --- Executes during object creation, after setting all properties.
function inter_CreateFcn(hObject, ~, ~)
% hObject    handle to inter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in done.
function done_Callback(~, ~, handles)
% hObject    handle to done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Descrição das Variáveis:
    %Bmax = Boca máxima [m]
    %Bf = Boca de Flutuação [m]
    %D = pontal [m]
    %Im = imersões [m]
    %Loa = comprimento fora a fora [m]
    %Aw = Área de Flutuação [m2]
    %Aw = Área da secção transversal(método analítico) [m]
    %Asec_traz = Área da secção transversal (regra dos trapézios) [m]
    %erro = Erro da aproximação da área da secção transversal [%]
    %Kp = Altura do Polo
    %m_H2O= Massa específica da água salgada: 1.025 ton/m3
    %m_esp_casco= Massa específica: 160,185 kg/m3
    %Tpc= deslocamento unitário [ton/cm-1)
    %Zf= Altura do Centro de flutuação [m]
    %Xf= Posição Longitudinal do Centro de Flutuação [m]
    %Zc= Altura do Centro de Impulsão [m]
    %Xc= Posição Longitudinal do Centro de Impulsão [m]
    %Rt= Raio Metacêntrico Transversal [m]
    %Rl= Raio Metacêntrico Longitudinal [m]
    %Mt= Altura do Metacentro Transversal [m]
    %Ml= Altura do Metacentro longitudinal [m]
    %Mc= Momento de Caimento [ton*m*cm^{-1}


%Definição das Variáveis:
    m_H2O=1.025;
    m_esp_casco=160.185;
    Bmax=2;
    D=1;
    Loa=6;
    KP=0.42;
    Zconves=1;
%------------------------------------------------------------------------
%------------------------------------------------------------------------

im_min=str2num(get(handles.min,'String'));
im_max=str2num(get(handles.max,'String'));
im_inter=str2num(get(handles.inter,'String'));

%Calcular as imersões desde 0.05m até 0.75m com uma média de acrecimo de
%0.035m
Im=(im_min:im_inter:im_max)';
pr=(str2double(get(handles.precisao,'String')))/100;

%Bf é dada pela equação Bf=Bmax/D*Im

%Apartir de imersoes=0.5, boca transversal = 
for i=1:size(Im,1)
        Bf(i,1)= boca_vent_sup_en (Im(i,1));
        Aw(i,1) = Loa* Bf(i,1);            
        Asec(i,1) = area_seccao_vent_sup_en (Im(i,1),Bmax, Bf(i,1));
        
        yn=(-1:pr:1)';
        
        for jk=1:size(yn,1)     
            [ Zcasco(jk,1) ] = z_casco( yn(jk,1) );  %calcula o Zn do casco em função da boca
        end
        
        [ Asec_traz(i,1) ] = area_seccao_transversal_trapezio( yn,Im(i,1),Zcasco,Zconves,0,Im(i,1) );
        
        erro(i,1)=(abs((Asec(i,1)-Asec_traz(i,1)))/Asec(i,1))*100;
        Vw(i,1)=Asec(i,1)*Loa;
        desloc(i,1)=m_H2O*Vw(i,1);
        Tpc(i,1)=(Aw(i,1)*m_H2O)/100;
        Zf(i,1)=Im(i,1);
        Xf(i,1)=0;
        Zc(i,1)= y_centro_carena( Im(i,1) );
        Zc_trapz(i,1)=Im(i,1)-(1/3)*((Im(i,1)/2)+(Vw(i,1)/Aw(i,1)));
        Xc(i,1)=0;
        Rt(i,1)=((Loa/12)*Bf(i,1)^3)/Vw(i,1);
        Rl(i,1)=((Bf(i,1)/12)*Loa^3)/Vw(i,1);
        Mt(i,1)=Zc(i,1)+Rt(i,1);
        Ml(i,1)=Zc(i,1)+Rl(i,1);
        Mc(i,1)=(desloc(i,1)*Rl(i,1))/(100*Loa);

        
end

%Fator de escala - para mostrar no gráfico de carenas direiras
graf_Bf=Bf/3;
graf_Vw=Vw/10;
graf_desloc=desloc/10;
graf_Tpc=Tpc/1;
graf_Zc=Zc/1;
graf_Rt=Rt/3;
graf_Rl=Rl/105;
graf_Mc=Mc/1;

dados_graf=[Im, graf_Bf, graf_Vw, graf_desloc, graf_Tpc, graf_Zc, graf_Rt, graf_Rl, graf_Mc];
    
colunas={'Imersão [m]', 'Boca de Flutuação [m]','Área de Flutuação [m^{2}]','Área da secção transversal [m^{2}]','Área da secção transversal (trapz) [m^{2}]','Erro Aproximação da área [%]','Volume de Carena [m^{3}]','Deslocamento [ton/m^{3}]','Deslocamento unitário [ton/cm^{-1}]','Altura do Centro de flutuação [m]','Posição Longitudinal do Centro de Flutuação [m]','Altura do Centro de Impulsão [m]','Altura do Centro de Impulsão com R. Trapézios [m]','Posição Longitudinal do Centro de Impulsão [m]','Raio Metacêntrico Transversal [m]','Raio Metacêntrico Longitudinal [m]','Altura do Metacentro Transversal [m]', 'Altura do Metacentro longitudinal [m]',' Momento de Caimento [ton*m*cm^{-1}]'};    
dados_tab=[Im, Bf,Aw, Asec,Asec_traz,erro,Vw,desloc,Tpc,Zf,Xf,Zc,Zc_trapz,Xc,Rt,Rl,Mt,Ml,Mc];
set(handles.tab,'Data',dados_tab);
set(handles.tab,'ColumnName',colunas);

%Desenhar Área secção acima da imersão maxima defenida
Im1=(Im(1,1):(((1-Im(1,1)))/2000):1)';
for j=1:size(Im1,1)
        Bft(j,1)= boca_vent_sup_en (Im1(j,1));
end

if Im(1,1)==0
    Im2=0;
else
    Im2=(0:Im(1,1)/500:Im(1,1))';
end


for j=1:size(Im2,1)
        Bft2(j,1)= boca_vent_sup_en (Im2(j,1));
end

x_gr=[-1.5 1.5];
y_gr=[im_min im_min];


axes(handles.graf_tab)
plot(-(Bft/2),Im1,'r',-(Bft2/2),Im2,'b',(Bft/2),Im1,'r',(Bft2/2),Im2,'b',x_gr,y_gr,'b');
axis([-1.5 1.5 -0.5 1.5]);
title('Secção transversal de flutuacão');
xlabel('Boca de Flutuação [m]');
ylabel('Imersão (m)');
grid on;
legend('Linha do casco','Linha de Água');


set(handles.graf_esc,'String',Im);
set(handles.graf_esc,'Value',1)

setappdata(0,'Im',Im);
setappdata(0,'Bft',Bft);
setappdata(0,'Im2',Im2);
setappdata(0,'Bft2',Bft2);
setappdata(0,'Bf',Bf);
setappdata(0,'dados_tab',dados_tab);
setappdata(0,'colunas',colunas);
setappdata(0,'dados_graf',dados_graf);




% --- Executes on selection change in escolha.
function escolha_Callback(hObject, eventdata, handles)
% hObject    handle to escolha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns escolha contents as cell array
%        contents{get(hObject,'Value')} returns selected item from escolha
esc=get(handles.escolha,'Value');
if esc==4
    set(handles.outro,'Visible','On');
    set(handles.outro,'Enable','On');
else
    set(handles.outro,'Visible','Off');
    set(handles.outro,'Enable','Off');
end


% --- Executes during object creation, after setting all properties.
function escolha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to escolha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function tab_inclinadas_Callback(hObject, eventdata, handles)
% hObject    handle to tab_inclinadas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fin,'Visible','Off');
set(handles.fin,'Enable','Off');

set(handles.precisao,'Visible','On');
set(handles.precisao,'Enable','On');
set(handles.text_precisao,'Visible','On');
set(handles.text_precisao,'Enable','On');

set(handles.im_1,'Visible','Off');
set(handles.im_1,'Enable','Off');
set(handles.im_2,'Visible','Off');
set(handles.im_2,'Enable','Off');
set(handles.im_3,'Visible','Off');
set(handles.im_3,'Enable','Off');
set(handles.im_4,'Visible','Off');
set(handles.im_4,'Enable','Off');
set(handles.ver,'Visible','Off');
set(handles.ver,'Enable','Off');
set(handles.graficos,'Visible','Off');
set(handles.graficos,'Enable','Off');

cla(handles.graf_tab);
cla(handles.graf);
legend(handles.graf_tab,'off');
set(handles.inc_1,'Visible','Off');
set(handles.inc_1,'HandleVisibility','Off');
cla(handles.inc_1);
legend(handles.inc_1,'off');

set(handles.inc_2,'Visible','Off');
set(handles.inc_2,'HandleVisibility','Off');
cla(handles.inc_2);
legend(handles.inc_2,'off');


set(handles.title_tab,'Visible','On');
set(handles.title_tab,'String','Tabela de Carenas Inclinadas');

set(handles.informa1,'Visible','On');
set(handles.informa1,'String','Ângulo Mínimo [º]:');

set(handles.informa2,'Visible','On');
set(handles.informa2,'String','Ângulo Máximo [º]:');

set(handles.informa3,'Visible','On');
set(handles.informa3,'String','Intervalo para cada ângulo [º]:');

set(handles.text_inc,'Visible','On');
set(handles.text_inc,'Enable','On');

set(handles.min,'Visible','On');
set(handles.min,'Enable','On');
set(handles.min,'String','5');

set(handles.max,'Visible','On');
set(handles.max,'Enable','On');
set(handles.max,'String','85');

set(handles.inter,'Visible','On');
set(handles.inter,'Enable','On');
set(handles.inter,'String','5');

set(handles.done,'Visible','off');
set(handles.done,'Enable','off');

set(handles.tab,'Visible','On');
set(handles.tab,'Enable','On');

set(handles.escolha,'Visible','On');
set(handles.escolha,'Enable','On');

escol={0.2333;0.45;0.7;'Outra'};
set(handles.escolha,'String',escol);

set(handles.tab, 'Data', {})
set(handles.tab, 'ColumnName', {})

set(handles.inc,'Visible','On');
set(handles.inc,'Enable','On');

set(handles.outro,'Visible','Off');
set(handles.outro,'Enable','Off');

set(handles.graf_tab,'Visible','On');
set(handles.graf_tab,'HandleVisibility','On');

set(handles.title_graf,'Visible','Off');

set(handles.graf,'Visible','Off');
set(handles.graf,'HandleVisibility','Off');

set(handles.inf1,'Visible','Off');
set(handles.inf3,'Visible','Off');
set(handles.inf2,'Visible','Off');

set(handles.text16,'Visible','On');
set(handles.text16,'Enable','On');
set(handles.text16,'String','Selecione qual o ângulo de inclinação a ser mostrada no gráfico:');

set(handles.graf_esc,'Visible','On');
set(handles.graf_esc,'Enable','On');

colunas_inc=getappdata(0,'colunas_inc');
dados_tab_inc=getappdata(0,'dados_tab_inc');

if isempty(dados_tab_inc)==1
else
    
    set(handles.tab,'Data',dados_tab_inc);
    set(handles.tab, 'ColumnName', colunas_inc);
    grau_deg=getappdata(0,'grau_deg');
    set(handles.graf_esc,'String',grau_deg)
    yn=getappdata(0,'yn');
    Zcasco=getappdata(0,'Zcasco');
    linha_bk=getappdata(0,'linha_bk');
    axes(handles.graf_tab)
    plot(yn,linha_bk(:,1),'b',yn, Zcasco,'r');
    axis([-1.5 1.5 -0.5 1.5]);
    title('Secção transversal de flutuacão');
    xlabel('Boca de Flutuação [m]');
    ylabel('Imersão (m)');
    grid on;
    legend(['Linha de Água com inclinação ' num2str(grau_deg(1,1)) 'º'],'Lina do casco');
    set(handles.graf_esc,'Value',1)
end




% --------------------------------------------------------------------
function graf_inclinadas_Callback(hObject, eventdata, handles)
% hObject    handle to graf_inclinadas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fin,'Visible','On');
set(handles.fin,'Enable','On');

set(handles.precisao,'Visible','On');
set(handles.precisao,'Enable','On');
set(handles.text_precisao,'Visible','On');
set(handles.text_precisao,'Enable','On');

set(handles.title_tab,'Visible','On');
set(handles.title_tab,'String','Gráficos de Carenas Inclinadas');

cla(handles.graf_tab);
set(handles.graf_tab,'Visible','On');
set(handles.graf_tab,'HandleVisibility','On');
legend off

set(handles.inc_1,'Visible','On');
set(handles.inc_1,'HandleVisibility','On');
set(handles.inc_2,'Visible','On');
set(handles.inc_2,'HandleVisibility','On');

set(handles.escolha,'Visible','Off');
set(handles.escolha,'Enable','Off');

set(handles.im_1,'Visible','On');
set(handles.im_1,'Enable','On');
set(handles.im_2,'Visible','On');
set(handles.im_2,'Enable','On');
set(handles.im_3,'Visible','On');
set(handles.im_3,'Enable','On');

im_4_save=getappdata(0,'im_4_save');
if isempty(im_4_save)
else
    set(handles.im_4,'Visible','On');
    set(handles.im_4,'Enable','On');
    set(handles.im_4,'String',['Imersão ' num2str(im_4_save)]);
end

set(handles.ver,'Visible','On');
set(handles.ver,'Enable','On');
set(handles.graficos,'Visible','On');
set(handles.graficos,'Enable','On');

set(handles.inc,'Visible','Off');
set(handles.inc,'Enable','Off');

set(handles.outro,'Visible','Off');
set(handles.outro,'Enable','Off');

set(handles.text_inc,'Visible','Off');
set(handles.text_inc,'Enable','Off');

set(handles.informa1,'Visible','Off');
set(handles.informa2,'Visible','Off');
set(handles.informa3,'Visible','Off');

set(handles.min,'Visible','Off');
set(handles.min,'Enable','Off');

set(handles.max,'Visible','Off');
set(handles.max,'Enable','Off');

set(handles.inter,'Visible','Off');
set(handles.inter,'Enable','Off');

set(handles.done,'Visible','Off');
set(handles.done,'Enable','Off');

set(handles.tab,'Visible','Off');
set(handles.tab,'Enable','Off');

set(handles.title_graf,'Visible','Off');

set(handles.graf,'Visible','Off');
set(handles.graf,'HandleVisibility','Off');
cla(handles.graf);

set(handles.inf1,'Visible','Off');
set(handles.inf3,'Visible','Off');
set(handles.inf2,'Visible','Off');

set(handles.text16,'Visible','Off');
set(handles.text16,'Enable','Off');
set(handles.graf_esc,'Visible','Off');
set(handles.graf_esc,'Enable','Off');

axes(handles.inc_1)
title('Braço de Estabilidade');
xlabel('Angulo de Adornamento [º]');
ylabel('GZ [m]');
grid on;
        
axes(handles.inc_2)
title('Binário Endireitante');
xlabel('Angulo de Adornamento [º]');
ylabel('BE [ton - m]');
grid on;

axes(handles.graf_tab)
title('Curvas Cruzadas de Estabilidade');
xlabel('Deslocamento \Delta [ton]');
ylabel('PZp [m]');
grid on;
axis auto


% --- Executes on button press in inc.
function inc_Callback(hObject, eventdata, handles)
% hObject    handle to inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
esc=get(handles.escolha,'Value');
escol=get(handles.escolha,'String');

if esc==4
    z=str2double(get(handles.outro,'String'));
    setappdata(0,'im_4_save',z)
else
    z=str2double(escol(esc));
end


KP=0.42;
LOA=6;
m_H2O=1.025;
Bmax=2;
KG=0.54663; %Altura do Centro de Gravidade
PG=KG-KP;
Zconves=1; %coordenada z que é a linha de convés
grau_min=str2num(get(handles.min,'String'));
grau_max=str2num(get(handles.max,'String'));
grau_inter=str2num(get(handles.inter,'String'));

pr=(str2double(get(handles.precisao,'String')))/100;

grau_deg=(grau_min:grau_inter:grau_max)';

for i=1:size(grau_deg,1)         %tan(90= infinito, logo teremos de adapatar esse grau para um valor muito próximo
    if abs(grau_deg(i,1))==90
        grau_deg(i,1)=89;
        a=msgbox('O vetor de ângulos de estabilidade que pretende inclui o 90º. Note que tan(90º)=infinito, pelo que o angulo de 90º será substituido por 89º.');
        waitfor(a)
    elseif abs(grau_deg(i,1))==270
        a=msgbox('O vetor de ângulos de estabilidade que pretende inclui o 270º. Note que tan(270º)=infinito, pelo que o angulo de 90º será substituido por 269º.');
        waitfor(a)
        grau_deg(i,1)=269;
    else
    end
end

grau=deg2rad(grau_deg);
yn=(-1:pr:1)';



for i=1:size(yn,1)     
[ Zcasco(i,1) ] = z_casco( yn(i,1) );  %calcula o Zn do casco em função da boca
end



for i=1:size(grau,1)
    bk=z;
    di=1;
   [ As0 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,0,bk);
   
    while di==1 
        [ Asi,Zn,Znlimite ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,grau(i,1),bk );
        dif=Asi-As0;

        if dif>=pr %diminuir bk
            delta_bk=pr;
            bk=bk-delta_bk;
            
        elseif dif<=-pr %aumentar bk
            delta_bk=pr;
            bk=bk+delta_bk;
            
        elseif abs(dif)<pr %parar ciclo
            Area_sec_i(i,1)=Asi;
            bk_final(i,1)=bk;
            di=0;
        end


    end
    for jk=1:size(yn,1)
        calc_M_Lc(jk,1)=Zn(jk,1)*yn(jk,1);
        calc_M_Lb(jk,1)=Zn(jk,1)*((Znlimite(jk,1)+Zcasco(jk,1))/2);
    end
    
    linha_bk(:,i)=Znlimite;
    M_Lc(i,1)=trapz(yn,calc_M_Lc);
    Yc(i,1)=abs(M_Lc(i,1)/Area_sec_i(i,1));
    M_Lb(i,1)=trapz(yn,calc_M_Lb);
    Zc(i,1)=abs(M_Lb(i,1)/Area_sec_i(i,1));
    P_Z0(i,1)=Yc(i,1)*cos(grau(i,1))+Zc(i,1)*sin(grau(i,1))-KP*sin(grau(i,1));
    GZ(i,1)= P_Z0(i,1)-PG*sin(grau(i,1)); %P abaixo do centro de gravidade (-)
    desl_inc(i,1)=Area_sec_i(i,1)*LOA*m_H2O;
    BE(i,1)=desl_inc(i,1)*GZ(i,1);
end
dados_tab_inc=[grau_deg,bk_final,Area_sec_i,Zc,Yc,P_Z0,GZ,desl_inc,BE];
colunas_inc={'Graus [º]','Bk [m]','Área da Secção transversal [m^{2}','Altura do Centro de Impulsão [m]','Posição Longitudinal do Centro de Impulsão [m]','Braço de Estabilidade - Pz0 [m]','Braço de Estabilidade - GZ [m]','Deslocamento [ton/m^{3}]','Binário Endireitante [ton/m]'};
set(handles.tab,'ColumnName',colunas_inc);

setappdata(0,'dados_tab_inc',dados_tab_inc);
setappdata(0,'yn',yn);
setappdata(0,'linha_bk',linha_bk);
setappdata(0,'grau_deg',grau_deg);
setappdata(0,'Zcasco',Zcasco);
setappdata(0,'colunas_inc',colunas_inc);
setappdata(0,'dados_tab_inc',dados_tab_inc);

set(handles.tab,'Data',dados_tab_inc);
set(handles.graf_esc,'String',grau_deg)
set(handles.graf_esc,'Value',1)

axes(handles.graf_tab)
plot(yn,linha_bk(:,1),'b',yn, Zcasco,'r');
axis([-1.5 1.5 -0.5 1.5]);
title('Secção transversal de flutuacão');
xlabel('Boca de Flutuação [m]');
ylabel('Imersão (m)');
grid on;
legend(['Linha de Água com inclinação ' num2str(grau_deg(1,1)) 'º'],'Linha do casco');





function outro_Callback(hObject, eventdata, handles)
% hObject    handle to outro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of outro as text
%        str2double(get(hObject,'String')) returns contents of outro as a double


% --- Executes during object creation, after setting all properties.
function outro_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in graf_esc.
function graf_esc_Callback(hObject, eventdata, handles)
% hObject    handle to graf_esc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graf_esc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graf_esc

escol_graf=str2num(get(handles.graf_esc,'String'));

nr=get(handles.graf_esc,'Value');

dados_tab=getappdata(0,'dados_tab');
grau_deg=getappdata(0,'grau_deg');



if isnan(dados_tab)
    
else
    if size(escol_graf,1)==size(dados_tab(:,1),1)
        Im=getappdata(0,'Im');

        Im1=(Im(nr,1):(((1-Im(nr,1)))/20):1)';
        for j=1:size(Im1,1)
                Bft(j,1)= boca_vent_sup_en (Im1(j,1));
        end

        Im2=(0:Im(nr,1)/500:Im(nr,1))';
        for j=1:size(Im2,1)
                Bft2(j,1)= boca_vent_sup_en (Im2(j,1));
        end

        x_gr=[-1.5 1.5];
        y_gr=[Im(nr,1) Im(nr,1)];


        axes(handles.graf_tab)
        plot(-(Bft/2),Im1,'r',-(Bft2/2),Im2,'b',(Bft/2),Im1,'r',(Bft2/2),Im2,'b',x_gr,y_gr,'b');
        axis([-1.5 1.5 -0.5 1.5]);
        title('Secção transversal de flutuacão');
        xlabel('Boca de Flutuação [m]');
        ylabel('Imersão (m)');
        grid on;
        legend('Linha do casco','Linha de Água');

    elseif isnan(grau_deg)
        return;
    
    else   
          if size(escol_graf,1)==size(grau_deg,1)
                yn=getappdata(0,'yn');
                Zcasco=getappdata(0,'Zcasco');
                linha_bk=getappdata(0,'linha_bk');
                axes(handles.graf_tab)
                plot(yn,linha_bk(:,nr),'b',yn, Zcasco,'r');
                axis([-1.5 1.5 -0.5 1.5]);
                title('Secção transversal de flutuacão');
                xlabel('Boca de Flutuação [m]');
                ylabel('Imersão (m)');
                grid on;
                legend(['Linha de Água com inclinação ' num2str(grau_deg(nr,1)) 'º'],'Linha do casco');
         end
    end
    
end




% --- Executes during object creation, after setting all properties.
function graf_esc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graf_esc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in im_1.
function im_1_Callback(hObject, eventdata, handles)
% hObject    handle to im_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of im_1


% --- Executes on button press in im_2.
function im_2_Callback(hObject, eventdata, handles)
% hObject    handle to im_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of im_2


% --- Executes on button press in im_3.
function im_3_Callback(hObject, eventdata, handles)
% hObject    handle to im_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of im_3


% --- Executes on button press in im_4.
function im_4_Callback(hObject, eventdata, handles)
% hObject    handle to im_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of im_4


% --- Executes on button press in ver.
function ver_Callback(hObject, eventdata, handles)
% hObject    handle to ver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
KP=0.42;
LOA=6;
m_H2O=1.025;
Bmax=2;
KG=0.54663; %Altura do Centro de Gravidade
PG=KG-KP;
Zconves=1; %coordenada z que é a linha de convés

axes(handles.inc_1);
hold off;
axes(handles.inc_2);
hold off;
axes(handles.graf_tab);
hold off;

grau_min=str2num(get(handles.min,'String'));
grau_max=str2num(get(handles.max,'String'));
grau_inter=str2num(get(handles.inter,'String'));

pr=(str2double(get(handles.precisao,'String')))/100;

im_1=get(handles.im_1,'Value');
im_2=get(handles.im_2,'Value');
im_3=get(handles.im_3,'Value');
im_4=get(handles.im_4,'Value');
a=msgbox('O progama irá calcular todos os dados para as imersões selecionadas. Note que o programa irá usar métodos numéricos, como tal poderá demorar algum tempo. Depois de clicar em OK, o processo irá iniciar-se. Aguarde até os gráficos serem mostrados. Obrigado.');
waitfor(a);
yn=(-1:pr:1)';
for i=1:size(yn,1)     
[ Zcasco(i,1) ] = z_casco( yn(i,1) );  %calcula o Zn do casco em função da boca
end

grau_deg=(grau_min:grau_inter:grau_max)';
for i=1:size(grau_deg,1)         %tan(90= infinito, logo teremos de adapatar esse grau para um valor muito próximo
    if abs(grau_deg(i,1))==90
        grau_deg(i,1)=89;
        a=msgbox('O vetor de ângulos de estabilidade que pretende inclui o 90º. Note que tan(90º)=infinito, pelo que o angulo de 90º será substituido por 89º.');
        waitfor(a)
    elseif abs(grau_deg(i,1))==270
        a=msgbox('O vetor de ângulos de estabilidade que pretende inclui o 270º. Note que tan(270º)=infinito, pelo que o angulo de 90º será substituido por 269º.');
        waitfor(a)
        grau_deg(i,1)=269;
    else
    end
end
grau=deg2rad(grau_deg);

if im_1==1
        for i=1:size(grau,1)
            z=0.2333;
            bk=z;
            di=1;
           [ As0 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,0,bk);

            while di==1 
                [ Asi,Zn1,Znlimite1 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,grau(i,1),bk );
                dif=Asi-As0;

                if dif>=pr %diminuir bk
                    delta_bk=pr;
                    bk=bk-delta_bk;

                elseif dif<=-pr %aumentar bk
                    delta_bk=pr;
                    bk=bk+delta_bk;

                elseif abs(dif)<pr %parar ciclo
                    Area_sec_1(i,1)=Asi;
                    di=0;
                end


            end
            for jk=1:size(yn,1)
                calc_M_Lc1(jk,1)=Zn1(jk,1)*yn(jk,1);
                calc_M_Lb1(jk,1)=Zn1(jk,1)*((Znlimite1(jk,1)+Zcasco(jk,1))/2);
            end
            M_Lc1(i,1)=trapz(yn,calc_M_Lc1);
            Yc1(i,1)=abs(M_Lc1(i,1)/Area_sec_1(i,1));
            M_Lb1(i,1)=trapz(yn,calc_M_Lb1);
            Zc1(i,1)=abs(M_Lb1(i,1)/Area_sec_1(i,1));
            P_Z01(i,1)=Yc1(i,1)*cos(grau(i,1))+Zc1(i,1)*sin(grau(i,1))-KP*sin(grau(i,1));
            GZ1(i,1)= P_Z01(i,1)-PG*sin(grau(i,1)); %P abaixo do centro de gravidade (-)
            desl_inc1(i,1)=Area_sec_1(i,1)*LOA*m_H2O;
            BE1(i,1)=desl_inc1(i,1)*GZ1(i,1);
        end
        axes(handles.inc_1)
        plot(grau_deg,GZ1,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all
        
        axes(handles.inc_2)
        plot(grau_deg,BE1,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all
end

if im_2==1
        for i=1:size(grau,1)
            z=0.45;
            bk=z;
            di=1;
           [ As0 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,0,bk);

            while di==1 
                [ Asi,Zn2,Znlimite2 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,grau(i,1),bk );
                dif=Asi-As0;

                if dif>=pr %diminuir bk
                    delta_bk=pr;
                    bk=bk-delta_bk;

                elseif dif<=-pr %aumentar bk
                    delta_bk=pr;
                    bk=bk+delta_bk;

                elseif abs(dif)<pr %parar ciclo
                    Area_sec_2(i,1)=Asi;
                    di=0;
                end


            end
            for jk=1:size(yn,1)
                calc_M_Lc2(jk,1)=Zn2(jk,1)*yn(jk,1);
                calc_M_Lb2(jk,1)=Zn2(jk,1)*((Znlimite2(jk,1)+Zcasco(jk,1))/2);
            end
            M_Lc2(i,1)=trapz(yn,calc_M_Lc2);
            Yc2(i,1)=abs(M_Lc2(i,1)/Area_sec_2(i,1));
            M_Lb2(i,1)=trapz(yn,calc_M_Lb2);
            Zc2(i,1)=abs(M_Lb2(i,1)/Area_sec_2(i,1));
            P_Z02(i,1)=Yc2(i,1)*cos(grau(i,1))+Zc2(i,1)*sin(grau(i,1))-KP*sin(grau(i,1));
            GZ2(i,1)= P_Z02(i,1)-PG*sin(grau(i,1)); %P abaixo do centro de gravidade (-)
            desl_inc2(i,1)=Area_sec_2(i,1)*LOA*m_H2O;
            BE2(i,1)=desl_inc2(i,1)*GZ2(i,1);
        end
        axes(handles.inc_1)
        plot(grau_deg,GZ2,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all
        
        axes(handles.inc_2)
        plot(grau_deg,BE2,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all
end

if im_3==1
        for i=1:size(grau,1)
            z=0.7;
            bk=z;
            di=1;
           [ As0 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,0,bk);

            while di==1 
                [ Asi,Zn3,Znlimite3 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,grau(i,1),bk );
                dif=Asi-As0;

                if dif>=pr %diminuir bk
                    delta_bk=pr;
                    bk=bk-delta_bk;

                elseif dif<=-pr %aumentar bk
                    delta_bk=pr;
                    bk=bk+delta_bk;

                elseif abs(dif)<pr %parar ciclo
                    Area_sec_3(i,1)=Asi;
                    di=0;
                end


            end
            for jk=1:size(yn,1)
                calc_M_Lc3(jk,1)=Zn3(jk,1)*yn(jk,1);
                calc_M_Lb3(jk,1)=Zn3(jk,1)*((Znlimite3(jk,1)+Zcasco(jk,1))/2);
            end
            M_Lc3(i,1)=trapz(yn,calc_M_Lc3);
            Yc3(i,1)=abs(M_Lc3(i,1)/Area_sec_3(i,1));
            M_Lb3(i,1)=trapz(yn,calc_M_Lb3);
            Zc3(i,1)=abs(M_Lb3(i,1)/Area_sec_3(i,1));
            P_Z03(i,1)=Yc3(i,1)*cos(grau(i,1))+Zc3(i,1)*sin(grau(i,1))-KP*sin(grau(i,1));
            GZ3(i,1)= P_Z03(i,1)-PG*sin(grau(i,1)); %P abaixo do centro de gravidade (-)
            desl_inc3(i,1)=Area_sec_3(i,1)*LOA*m_H2O;
            BE3(i,1)=desl_inc3(i,1)*GZ3(i,1);
        end
        axes(handles.inc_1)
        plot(grau_deg,GZ3,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all
        
        axes(handles.inc_2)
        plot(grau_deg,BE3,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all        
end

if im_4==1
        z=getappdata(0,'im_4_save');
        for i=1:size(grau,1)
            bk=z;
            di=1;
           [ As0 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,0,bk);

            while di==1 
                [ Asi,Zn4,Znlimite4 ] = area_seccao_transversal_trapezio( yn,z,Zcasco,Zconves,grau(i,1),bk );
                dif=Asi-As0;

                if dif>=pr %diminuir bk
                    delta_bk=pr;
                    bk=bk-delta_bk;

                elseif dif<=-pr %aumentar bk
                    delta_bk=pr;
                    bk=bk+delta_bk;

                elseif abs(dif)<pr %parar ciclo
                    Area_sec_4(i,1)=Asi;
                    di=0;
                end


            end
            for jk=1:size(yn,1)
                calc_M_Lc4(jk,1)=Zn4(jk,1)*yn(jk,1);
                calc_M_Lb4(jk,1)=Zn4(jk,1)*((Znlimite4(jk,1)+Zcasco(jk,1))/2);
            end
            M_Lc4(i,1)=trapz(yn,calc_M_Lc4);
            Yc4(i,1)=abs(M_Lc4(i,1)/Area_sec_4(i,1));
            M_Lb4(i,1)=trapz(yn,calc_M_Lb4);
            Zc4(i,1)=abs(M_Lb4(i,1)/Area_sec_4(i,1));
            P_Z04(i,1)=Yc4(i,1)*cos(grau(i,1))+Zc4(i,1)*sin(grau(i,1))-KP*sin(grau(i,1));
            GZ4(i,1)= P_Z04(i,1)-PG*sin(grau(i,1)); %P abaixo do centro de gravidade (-)
            desl_inc4(i,1)=Area_sec_4(i,1)*LOA*m_H2O;
            BE4(i,1)=desl_inc4(i,1)*GZ4(i,1);

        end
        axes(handles.inc_1)
        plot(grau_deg,GZ4,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all
        
        axes(handles.inc_2)
        plot(grau_deg,BE4,'DisplayName',['Imersão ' num2str(z) 'm']);
        legend('show');
        hold all        
        
end

im_total=im_1+im_2+im_3+im_4;
if im_total<2
    a=msgbox('Selecionou apenas uma imersão! O Gráfico de Carenas Inclinadas não será mostrado, terá de selecionar mais que uma imersão!');
    waitfor(a);
else

    for j=1:size(grau_deg,1)
        im1=im_1;
        im2=im_2;
        im3=im_3;
        im4=im_4;
        
        for i=1:im_total
            if im1==1
                deslo_graf(j,i)=desl_inc1(j,1);
                PZ_graf(j,i)=P_Z01(j,1);
                im1=0;
            else
                if im2==1
                deslo_graf(j,i)=desl_inc2(j,1);
                PZ_graf(j,i)=P_Z02(j,1);
                im2=0;

                else
                    if im3==1
                    deslo_graf(j,i)=desl_inc3(j,1);
                    PZ_graf(j,i)=P_Z03(j,1);
                    im3=0;
                    
                    else
                    deslo_graf(j,i)=desl_inc4(j,1);
                    PZ_graf(j,i)=P_Z04(j,1);
                    im4=0;
                    end
                end
            end
        end
        
        axes(handles.graf_tab);
        plot(deslo_graf(j,:),PZ_graf(j,:) ,'DisplayName',['Ângulo de Adornamento ' num2str(grau_deg(j,1)) 'º']);
        legend('show');
        hold all    
    end
        
end

axes(handles.inc_1)
title('Braço de Estabilidade');
xlabel('Angulo de Adornamento [º]');
ylabel('GZ [m]');
grid on;
        
axes(handles.inc_2)
title('Binário Endireitante');
xlabel('Angulo de Adornamento [º]');
ylabel('BE [ton - m]');
grid on;

axes(handles.graf_tab)
title('Curvas Cruzadas de Estabilidade');
xlabel('Deslocamento \Delta [ton]');
ylabel('PZp [m]');
grid on;
axis auto
    



function precisao_Callback(hObject, eventdata, handles)
% hObject    handle to precisao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of precisao as text
%        str2double(get(hObject,'String')) returns contents of precisao as a double


% --- Executes during object creation, after setting all properties.
function precisao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to precisao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function guardar_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dados_tab=getappdata(0,'dados_tab');
dados_tab_inc=getappdata(0,'dados_tab_inc');

a_gaurd=isempty(dados_tab)+isempty(dados_tab_inc);

if a_gaurd==0
    a=msgbox('O dados referentes ás Carenas Direitas e às Carenas Inclinadas será gravado num excel.');
    waitfor(a);
    colunas=getappdata(0,'colunas');
    colunas_inc=getappdata(0,'colunas_inc');
    [filename, pathname] = uiputfile('*.xls', 'Escolha a pasta onde pretende guardar o excel','Vent_sup.xls');
    waitfor(a);
    guard=[pathname '/' filename];
    carenas_direitas_excel=[colunas;num2cell(dados_tab)];
    [status,message] = xlswrite(guard,carenas_direitas_excel,'Carenas Direitas');
    if status==1
        a=msgbox('Os dados foram guardados com sucesso!');
        waitfor(a);
    else
        a=msgbox(message);
        waitfor(a);
    end
    esc=get(handles.escolha,'Value');
    escol=get(handles.escolha,'String');
    carenas_inclinadas_excel=[colunas_inc;num2cell(dados_tab_inc)];
    [status,message] = xlswrite(guard,carenas_inclinadas_excel,['Carenas Inclinadas ' cell2mat(escol(esc))]);
    if status==1
        a=msgbox('Os dados das Carenas Inclinadas foram guardados com sucesso!');
        waitfor(a);
    else
        a=msgbox(message.message);
        waitfor(a);
    end
else
    
    if isempty(dados_tab)==0
        a=msgbox('O dados referentes ás Carenas Direitas será gravado num excel.');
        waitfor(a);
        colunas=getappdata(0,'colunas');
        [filename, pathname] = uiputfile('*.xls', 'Escolha a pasta onde pretende guardar o excel');
        waitfor(a);
        guard=[pathname '/' filename];
        carenas_direitas_excel=[colunas;num2cell(dados_tab)];
        [status,message] = xlswrite(guard,carenas_direitas_excel,'Carenas Direitas');
        if status==1
            a=msgbox('Os dados foram guardados com sucesso!');
            waitfor(a);
        else
            a=msgbox(message.message);
            waitfor(a);
        end

    elseif isempty(dados_tab_inc)==0
        a=msgbox('O dados referentes ás Carenas Inclinadas será gravado num excel.');
        waitfor(a);
        colunas_inc=getappdata(0,'colunas_inc');
        [filename, pathname] = uiputfile('*.xls', 'Escolha a pasta onde pretende guardar o excel');
        guard=[pathname '/' filename];
        carenas_inclinadas_excel=[colunas_inc;num2cell(dados_tab_inc)];
        esc=get(handles.escolha,'Value');
        escol=get(handles.escolha,'String');
        [status,message] = xlswrite(guard,carenas_inclinadas_excel,['Carenas Inclinadas' escol(esc)]);
        
        if status==1
            a=msgbox('Os dados das Carenas Inclinadas foram guardados com sucesso!');
            waitfor(a);
        else
            a=msgbox(message);
            waitfor(a);
        end        
    end
end


    
