function varargout = Digit_Recognition(varargin)
% DIGIT_RECOGNITION MATLAB code for Digit_Recognition.fig
%      DIGIT_RECOGNITION, by itself, creates a new DIGIT_RECOGNITION or raises the existing
%      singleton*.
%
%      H = DIGIT_RECOGNITION returns the handle to a new DIGIT_RECOGNITION or the handle to
%      the existing singleton*.
%
%      DIGIT_RECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGIT_RECOGNITION.M with the given input arguments.
%
%      DIGIT_RECOGNITION('Property','Value',...) creates a new DIGIT_RECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Digit_Recognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Digit_Recognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Digit_Recognition

% Last Modified by GUIDE v2.5 25-Mar-2019 14:55:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Digit_Recognition_OpeningFcn, ...
                   'gui_OutputFcn',  @Digit_Recognition_OutputFcn, ...
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


% --- Executes just before Digit_Recognition is made visible.
function Digit_Recognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Digit_Recognition (see VARARGIN)

% Choose default command line output for Digit_Recognition
cla(handles.axes1);
handles.output = hObject;
global Button_Down Pos1 Pos2
Button_Down=[];
Pos1=[];
Pos2=[];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Digit_Recognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Digit_Recognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f, p] = uiputfile({'*.bmp'}, 'save image file');
str = strcat(p, f);
if ~isempty(str)
px = getframe(handles.axes1);
curImg = frame2im(px);
imwrite(curImg, str, 'bmp');
end
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
px = getframe(handles.axes1);
Cur_Img = frame2im(px);
%Cur_Img = rgb2gray(Cur_Img);
if sum(sum(Cur_Img))/numel(Cur_Img)/255==1
    msg = msgbox('Nothing!!','提示','modal');
    
    amsg = get( msg, 'CurrentAxes' );
    cmsg = get( amsg, 'Children' );
    set( cmsg, 'FontSize', 12 );

    msgh = findall(0, 'Tag','MessageBox' );
    boxPosition = get(msg,'position');
    textPosition = get(msgh, 'position'); 
    set(msgh, 'position', [boxPosition(3).*0.5 textPosition(2) textPosition(3)]);
    set(msgh, 'HorizontalAlignment', 'center');
else
    %Cur_Img=My_Reverse(Cur_Img);
    Result=Oula_Dis(Cur_Img,5,5,10,10);
    Result=Result+'A';
    msg = msgbox(char(Result),'提示','modal');
    
    amsg = get( msg, 'CurrentAxes' );
    cmsg = get( amsg, 'Children' );
    set( cmsg, 'FontSize', 12 );

    msgh = findall(0, 'Tag','MessageBox' );
    boxPosition = get(msg,'position');
    textPosition = get(msgh, 'position'); 
    set(msgh, 'position', [boxPosition(3).*0.5 textPosition(2) textPosition(3)]);
    set(msgh, 'HorizontalAlignment', 'center');
    
end 
% --- Executes on mouse press over axes background.


% --- Executes on mouse press over axes background.


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.

function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Button_Down Pos1;
if strcmp(get(gcf,'SelectionType'),'normal')
    Pos1=get(handles.axes1,'CurrentPoint');
    if Pos1(1,1)>=0 &&Pos1(1,1)<=1&&Pos1(1,2)>=0&&Pos1(1,2)<=1
        Button_Down=1;
    end
end


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Button_Down Pos1 Pos2;
if Button_Down==1
    Pos2=get(handles.axes1,'CurrentPoint');
    if Pos2(1,1)>=0&&Pos2(1,1)<=1&&Pos2(1,2)>=0&&Pos2(1,2)<=1
    line([Pos1(1,1) Pos2(1,1)], [Pos1(1,2) Pos2(1,2)],'LineStyle','-', 'LineWidth',8, 'color','black','marker','.','markerSize',25);
    %animatedline([Pos1(1,1) Pos2(1,1)],[Pos1(1,2) Pos2(1,2)],'Color','black','LineWidth',8);
    end
    Pos1=Pos2;
end
% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Button_Down 
Button_Down=0;


% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;
