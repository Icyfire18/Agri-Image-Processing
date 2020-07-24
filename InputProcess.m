
function varargout = InputProcess(varargin)
% INPUTPROCESS MATLAB code for InputProcess.fig
%      INPUTPROCESS, by itself, creates a new INPUTPROCESS or raises the existing
%      singleton*.
%
%      H = INPUTPROCESS returns the handle to a new INPUTPROCESS or the handle to
%      the existing singleton*.
%
%      INPUTPROCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INPUTPROCESS.M with the given InputProcess arguments.
%
%      INPUTPROCESS('Property','Value',...) creates a new INPUTPROCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InputProcess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InputProcess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InputProcess

% Last Modified by GUIDE v2.5 31-May-2014 13:17:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InputProcess_OpeningFcn, ...
                   'gui_OutputFcn',  @InputProcess_OutputFcn, ...
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


% --- Executes just before InputProcess is made visible.
function InputProcess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InputProcess (see VARARGIN)

% Choose default command line output for InputProcess
handles.output = hObject;
load('icon\n');
b=imresize(n,0.5);
set(handles.next, 'CData', b);
load('icon\ho');
b=imresize(ho,0.5);
set(handles.home, 'CData', b);
% set(handles.home, 'CData', double(imread('icon\ho.png'))/255);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InputProcess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InputProcess_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in home.
function home_Callback(hObject, eventdata, handles)
% hObject    handle to home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
DeskGUI

% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
IQA

% --- Executes on selection change in size.
function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns size contents as cell array
%        contents{get(hObject,'Value')} returns selected item from size
global m n  rs img1 im
if isempty(im) 
    msgbox('Convert to Gray','Error','error')
else
a=get(handles.size,'value');
switch a
    case 1
    img1=imresize(im,[256 256]);
    [m,n]=size(img1);
    siz=[m;n];
    rs=256;
    axes(handles.axes2);
    imshow(img1);
    set(handles.text8,'string','Resize image')
    set(handles.text4,'string','Filter the Image')
    set(handles.text2,'string','Size of Resized Gray image')
    set(handles.text3,'string',num2str(siz));
    case 2
     img1=imresize(im,[300 300]);
      [m,n]=size(img1);
      siz=[m;n];
      rs=300;
     axes(handles.axes2);
     imshow(img1);
     set(handles.text8,'string','Resize image')
     set(handles.text4,'string','Filter the Image')
     set(handles.text2,'string','Size of Resized Gray image')
    set(handles.text3,'string',num2str(siz));
end
end




% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Filter.
function Filter_Callback(hObject, eventdata, handles)
% hObject    handle to Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Filter
global img1 img2 s
if isempty(img1) 
    msgbox('Resize The Image','Error','error')
else
b=get(handles.Filter,'value');
switch b
    case 1
        G=fspecial('gaussian',[3 3],0.5);
        img2=imfilter(img1,G);
        axes(handles.axes2);
        imshow(img2)
        set(handles.text2,'string','Gaussian Filter')
        c=[3 3];
        s=3;
        set(handles.text3,'string',num2str(c))
    case 2
        G=fspecial('gaussian',[4 4],0.5);
        img2=imfilter(img1,G);
        axes(handles.axes2);
        imshow(img2)
        set(handles.text2,'string','Gaussian Filter')
        c=[4 4];
        s=4;
        set(handles.text3,'string',num2str(c))
    case 3
        G=fspecial('gaussian',[5 5],0.5);
        img2=imfilter(img1,G);
        axes(handles.axes2);
        imshow(img2)
        set(handles.text2,'string','Gaussian Filter')
        c=[5 5];
        s=5;
        set(handles.text3,'string',num2str(c))
end
set(handles.text8,'string','Filtered image')
set(handles.text4,'string','Go to Identification Process')
end
% --- Executes during object creation, after setting all properties.
function Filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QI m n k im
cla 
[f p ]=uigetfile('Queryimage\*.jpg','Select the query image');
if isequal(f,0) || isequal(p,0)
   msgbox('Load again','ERROR','error');
else
QI=imread([p f]);
axes(handles.axes1);
imshow(QI);
set(handles.text1,'string','Query image')
[m,n,k]=size(QI);
siz=[m;n];
if k==3
        set(handles.text4,'string','Convert to Gray image')
else
    im=QI;
         set(handles.text4,'string','Change the Size of image')
         axes(handles.axes2);
         imshow(im);
         set(handles.text8,'string','Gray image')
end
set(handles.text2,'string','Size of Query image')
set(handles.text3,'string',num2str(siz));
end
% --- Executes on button press in iqa.
function iqa_Callback(hObject, eventdata, handles)
% hObject    handle to iqa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QI k im
if isempty(QI)
    msgbox('Load the Image','Error','error')
else
if k==3
    im=rgb2gray(QI);
    set(handles.text4,'string','Resize The Gray image')
    axes(handles.axes2);
    imshow(im);
    set(handles.text8,'string','Gray image')
else
     msgbox('It is Gray image','ERROR','error');
end
end


% --- Executes during object creation, after setting all properties.
function home_CreateFcn(hObject, eventdata, handles)
% hObject    handle to home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
