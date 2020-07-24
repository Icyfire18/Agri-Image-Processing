function varargout = Classifierparameter(varargin)
% CLASSIFIERPARAMETER MATLAB code for Classifierparameter.fig
%      CLASSIFIERPARAMETER, by itself, creates a new CLASSIFIERPARAMETER or raises the existing
%      singleton*.
%
%      H = CLASSIFIERPARAMETER returns the handle to a new CLASSIFIERPARAMETER or the handle to
%      the existing singleton*.
%
%      CLASSIFIERPARAMETER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLASSIFIERPARAMETER.M with the given input arguments.
%
%      CLASSIFIERPARAMETER('Property','Value',...) creates a new CLASSIFIERPARAMETER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Classifierparameter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Classifierparameter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Classifierparameter

% Last Modified by GUIDE v2.5 31-May-2014 13:41:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Classifierparameter_OpeningFcn, ...
                   'gui_OutputFcn',  @Classifierparameter_OutputFcn, ...
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


% --- Executes just before Classifierparameter is made visible.
function Classifierparameter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Classifierparameter (see VARARGIN)

% Choose default command line output for Classifierparameter
handles.output = hObject;
p1=['>> It is Classifier Performance Graph'];
p2=['>> C.rate (Correct rate)'];
p3=['>> E.rate (Error rate)'];
p4=['>> Sens (Sensitivity)'];
p5=['>> Speci(Specificity)'];
p6=['>>PPV (Positive Predictive Value)'];
p7=['>> NPV (Negative Predictive Value)' ];
p8=['>> PV (Prevalence)'];
p=strvcat(p1,' ',p2,' ',p3,' ',p4,' ',p5,' ',p6,' ',p7,' ',p8);
set(handles.text1,'string',p);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Classifierparameter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Classifierparameter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
