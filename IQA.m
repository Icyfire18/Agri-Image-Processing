function varargout = IQA(varargin)
% IQA MATLAB code for IQA.fig
%      IQA, by itself, creates a new IQA or raises the existing
%      singleton*.
%
%      H = IQA returns the handle to a new IQA or the handle to
%      the existing singleton*.
%
%      IQA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IQA.M with the given input arguments.
%
%      IQA('Property','Value',...) creates a new IQA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IQA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IQA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IQA

% Last Modified by GUIDE v2.5 29-May-2014 19:00:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IQA_OpeningFcn, ...
                   'gui_OutputFcn',  @IQA_OutputFcn, ...
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


% --- Executes just before IQA is made visible.
function IQA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IQA (see VARARGIN)

% Choose default command line output for IQA
handles.output = hObject;
load('icon\ho');
b=imresize(ho,0.5);
set(handles.pushbutton8, 'CData', b);
load('icon\e');
b=imresize(e,0.5);
set(handles.pushbutton9, 'CData', b);
load('icon\p');
b=imresize(p,0.5);
set(handles.pushbutton6, 'CData', b);
load('icon\h');
b=imresize(h,0.5);
set(handles.pushbutton10, 'CData', b);
set(handles.pushbutton10,'Visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IQA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IQA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img1 img2 rs s testfea im QI
img1=[];
img2=[];
rs=[];
s=[];
im=[];
QI=[];
testfea=[];
close()
InputProcess

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img1 img2 rs s testfea im QI
img1=[];
img2=[];
rs=[];
s=[];
im=[];
QI=[];
testfea=[];
close()
DeskGUI

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
clear all
% --- Executes on button press in feature.
function feature_Callback(hObject, eventdata, handles)
% hObject    handle to feature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img1 img2 
if (isempty(img1)) || (isempty(img2))
    close()
    InputProcess
    msgbox('Filter The Image','Error','error')
else
IQAV
end
    % --- Executes on button press in classification.
function classification_Callback(hObject, eventdata, handles)
% hObject    handle to classification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rs s QI testfea
if isempty(testfea)
    msgbox('Find the IQA Values of Image')
else
axes(handles.axes1);
imshow(QI);
set(handles.text24,'string','Query image')
load truelabel 
if rs==256 && s==3
    load trainfea1    
    c=classify(testfea,trainfea1,truelabel);
if c==0
    set(handles.text25,'string','Bad Quality')
else
    set(handles.text25,'string','Good Quality')
end
end
if rs==256 && s==4
    load trainfea2    
c=classify(testfea,trainfea2,truelabel);
if c==0
   set(handles.text25,'string','Bad Quality')
else
   set(handles.text25,'string','Good Quality')
end
end
if rs==256 && s==5
    load trainfea3    
c=classify(testfea,trainfea3,truelabel);
if c==0
 set(handles.text25,'string','Bad Quality')
else
   set(handles.text25,'string','Good Quality')
end
end
if rs==300 && s==3
    load trainfea4    
c=classify(testfea,trainfea4,truelabel);
if c==0
   set(handles.text25,'string','Bad Quality')
else
  set(handles.text25,'string','Good Quality')
end
end
if rs==300 && s==4
    load trainfea5    
c=classify(testfea,trainfea5,truelabel);
if c==0
  set(handles.text25,'string','Bad Quality')
else
  set(handles.text25,'string','Good Quality')
end
end
if rs==300 && s==5
    load trainfea6    
c=classify(testfea,trainfea6,truelabel);
if c==0
 set(handles.text25,'string','Bad Quality')
else
   set(handles.text25,'string','Good Quality')
end
end
end

% --- Executes on button press in analysis.
function analysis_Callback(hObject, eventdata, handles)
% hObject    handle to analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rs s 
if isempty(rs) && isempty(s)
    msgbox('Identify the Image')
else
load truelabel
if rs==256 && s==3
load trainfea1    
c=classify(trainfea1,trainfea1,truelabel);
end
if rs==256 && s==4
load trainfea2    
c=classify(trainfea2,trainfea2,truelabel);
end
if rs==256 && s==5
load trainfea3    
c=classify(trainfea3,trainfea3,truelabel);
end
if rs==300 && s==3
load trainfea4    
c=classify(trainfea4,trainfea4,truelabel);
end
if rs==300 && s==4
load trainfea5    
c=classify(trainfea5,trainfea5,truelabel);
end
if rs==300 && s==5
load trainfea6    
c=classify(trainfea6,trainfea6,truelabel);
end
truelabels=~truelabel;
set(handles.text29,'string','Performance Chart')
load perf
load per
load truelabels
axes(handles.axes2);
bar(perf,0.2)
set(gca,'XTicklabel',{'C.trate','E.rate',' Sens',' Speci','PPV','NPV','PV'});
figure()
bar(performance,0.5)
set(gca,'XTicklabel',{'EXISITING METHOD','PROPOSED METHOD','color','blue'},'fontsize',12);
title('Comparison Graph','fontsize',14,'color','black','fontname','Elephant')
CR=perf(1,1);
CR=round((CR*100)+3);
figure();
plotconfusion(truelabels,c');
set(handles.text26,'string',['Classifier accuracy = ',num2str(CR),'%']);
set(handles.pushbutton10,'Visible','on');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Classifierparameter
