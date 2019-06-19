function varargout = NumClsfyDemo(varargin)
% NUMCLSFYDEMO MATLAB code for NumClsfyDemo.fig
%      NUMCLSFYDEMO, by itself, creates a new NUMCLSFYDEMO or raises the existing
%      singleton*.
%
%      H = NUMCLSFYDEMO returns the handle to a new NUMCLSFYDEMO or the handle to
%      the existing singleton*.
%
%      NUMCLSFYDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMCLSFYDEMO.M with the given input arguments.
%
%      NUMCLSFYDEMO('Property','Value',...) creates a new NUMCLSFYDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NumClsfyDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NumClsfyDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NumClsfyDemo

% Last Modified by GUIDE v2.5 20-Dec-2016 17:13:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NumClsfyDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @NumClsfyDemo_OutputFcn, ...
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


% --- Executes just before NumClsfyDemo is made visible.
function NumClsfyDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NumClsfyDemo (see VARARGIN)

% Choose default command line output for NumClsfyDemo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NumClsfyDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NumClsfyDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% ������Ҫ����
axis([0 240 0 240]);     % �趨ͼ�᷶Χ
global ButtonDown pos1;  %��������ȫ�ֱ���  
ButtonDown =[];  
pos1=[];  
clc;

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%��갴���¼���Ӧ  
global ButtonDown pos1;  
if(strcmp(get(gcf,'SelectionType'),'normal'))%�ж���갴�µ����ͣ�mormalΪ���  
    ButtonDown=1;  
    pos1=get(handles.axes1,'CurrentPoint');%��ȡ������������λ��  
end  

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%����˶��¼�����Ӧ  
global ButtonDown pos1;  
if ButtonDown == 1  
    pos = get(handles.axes1, 'CurrentPoint');%��ȡ��ǰλ��  
    line([pos1(1, 1) pos(1, 1)], [pos1(1, 2) pos(1, 2)], 'marker', '.', 'markerSize',20, 'LineStyle', '-','LineWidth', 8,'Color', 'Black');%����  
    pos1 = pos;%����  
end  

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%��갴��̧�����Ӧ�¼�  
global ButtonDown;  
ButtonDown = 0;  


% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ���浽Ŀ¼
[f,p]=uiputfile({'*.bmp'},'�����ļ�');
str=strcat(p,f);
px=getframe(handles.axes1);
curImg = frame2im(px);
imwrite(curImg,str,'bmp')

% --- Executes on button press in clearbutton.
function clearbutton_Callback(hObject, eventdata, handles)
% hObject    handle to clearbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;      % ����ؼ�����ʾ

% --- Executes on button press in classifybutton.
function classifybutton_Callback(hObject, eventdata, handles)
% hObject    handle to classifybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% ģ��ƥ�䷨
strSample = 'pattern.mat';
px=getframe(handles.axes1);
curImg = frame2im(px);
curFea = GetFeature(curImg,5,5);

yLabel = NearTemplet(strSample, curFea);

y = yLabel-1;
fprintf('��д����д����ʶ��Ϊ��%d\n',y);
h=warndlg(strcat('��д����д����ʶ��Ϊ��' ,num2str(y)),'ʶ����','modal');
