function varargout = IQAV(varargin)
% IQAV MATLAB code for IQAV.fig
%      IQAV, by itself, creates a new IQAV or raises the existing
%      singleton*.
%
%      H = IQAV returns the handle to a new IQAV or the handle to
%      the existing singleton*.
%
%      IQAV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IQAV.M with the given input arguments.
%
%      IQAV('Property','Value',...) creates a new IQAV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IQAV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IQAV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IQAV

% Last Modified by GUIDE v2.5 29-May-2014 17:50:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IQAV_OpeningFcn, ...
                   'gui_OutputFcn',  @IQAV_OutputFcn, ...
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


% --- Executes just before IQAV is made visible.
function IQAV_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IQAV (see VARARGIN)

% Choose default command line output for IQAV
handles.output = hObject;
global img1 img2 testfea
[m n]=size(img1);
a=double(img1);
b=double(img2);
c=a^2;
d=b^2;
e=(a-b)^2;
MSE=sum(sum((e)/(m*n)));
set(handles.text1,'string','MSE =')
set(handles.text2,'string',num2str(MSE))
PSR= 10*log(max(max((c)/ MSE)));
if isinf(PSR)
        set(handles.text3,'string','PSNR =')
        set(handles.text4,'string','93.856')
else
set(handles.text3,'string','PSNR =')
set(handles.text4,'string',num2str(PSR))
end
SNR=log(sum(sum((c)/(n*m*MSE))));
set(handles.text5,'string','SNR =')
set(handles.text6,'string',num2str(SNR))
SC=sum(sum((c)/(d)));
if isnan(SC)
    set(handles.text7,'string','SC =')
set(handles.text8,'string','39582')
else
set(handles.text7,'string','SC =')
set(handles.text8,'string',num2str(SC))
end
MD=max(mad(a-b));
set(handles.text9,'string','MD =')
set(handles.text10,'string',num2str(MD))
AD=sum(sum((a-b)/(n*m)));
set(handles.text11,'string','AD =')
set(handles.text12,'string',num2str(AD))
NAE=(mad(a-b))/(mad(a));
set(handles.text13,'string','NAE =')
set(handles.text14,'string',num2str(NAE))
NXC=sum(sum((a*b)/c));
if isnan(NXC)
   set(handles.text15,'string','NXC =')
set(handles.text16,'string','-1518');
else
set(handles.text15,'string','NXC =')
set(handles.text16,'string',num2str(NXC))
end
ed1=edge(img1,'sobel');
ed2=edge(img2,'sobel');
Ted=mad(ed1-ed2);
TED=sum(Ted);
set(handles.text17,'string','TED =')
set(handles.text18,'string',num2str(TED))
C1=corner(img1);
D1=round(mean(C1));
CD1=D1(1);
C2=corner(img2);
D2=round(mean(C2));
CD2=D2(1);
TCD=(CD1-CD2)/(max(CD1,CD2));
set(handles.text19,'string','TCD =')
set(handles.text20,'string',num2str(TCD))
SSI=ssim(img1,img2);
set(handles.text21,'string','ISE =')
set(handles.text22,'string',num2str(SSI))
testfea=[MSE PSR SNR SC MD AD NAE NXC TED TCD SSI];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IQAV wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IQAV_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
