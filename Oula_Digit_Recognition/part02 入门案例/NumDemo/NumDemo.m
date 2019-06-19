function varargout = NumDemo(varargin)
% NUMDEMO MATLAB code for NumDemo.fig
%      NUMDEMO, by itself, creates a new NUMDEMO or raises the existing
%      singleton*.
%
%      H = NUMDEMO returns the handle to a new NUMDEMO or the handle to
%      the existing singleton*.
%
%      NUMDEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMDEMO.M with the given input arguments.
%
%      NUMDEMO('Property','Value',...) creates a new NUMDEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NumDemo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NumDemo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NumDemo

% Last Modified by GUIDE v2.5 18-Mar-2019 16:18:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NumDemo_OpeningFcn, ...
                   'gui_OutputFcn',  @NumDemo_OutputFcn, ...
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


% --- Executes just before NumDemo is made visible.
function NumDemo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NumDemo (see VARARGIN)

% Choose default command line output for NumDemo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NumDemo wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axis([0 240 0 240]);

% --- Outputs from this function are returned to the command line.
function varargout = NumDemo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
clc;

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ButtonDown pos1
if strcmp(get(gcf,'SelectionType'), 'normal')
    ButtonDown = 1;
    pos1 = get(handles.axes1, 'CurrentPoint');
    %disp(pos1);
end

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ButtonDown pos1
if (ButtonDown == 1)
    pos = get(handles.axes1, 'CurrentPoint');
    line([pos1(1,1) pos(1,1)], [pos1(1,2) pos(1,2)],'LineStyle','-', 'LineWidth',8, 'color','black','marker','.','markerSize',20);
    pos1 = pos;
end

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ButtonDown
ButtonDown = 0;


% --- Executes on button press in pushbuttonSave.
function pushbuttonSave_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f, p] = uiputfile({'*.bmp'}, 'save image file');
str = strcat(p, f);
px = getframe(handles.axes1);
curImg = frame2im(px);
imwrite(curImg, str, 'bmp');

% --- Executes on button press in pushbuttonClear.
function pushbuttonClear_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
strSample = 'pattern.mat';
px = getframe(handles.axes1);
curImg = frame2im(px);
curFea = GetFeature(curImg, 5, 5);




