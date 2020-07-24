function varargout = help(varargin)
% HELP MATLAB code for help.fig
%      HELP, by itself, creates a new HELP or raises the existing
%      singleton*.
%
%      H = HELP returns the handle to a new HELP or the handle to
%      the existing singleton*.
%
%      HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HELP.M with the given input arguments.
%
%      HELP('Property','Value',...) creates a new HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help help

% Last Modified by GUIDE v2.5 23-May-2014 14:06:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @help_OpeningFcn, ...
                   'gui_OutputFcn',  @help_OutputFcn, ...
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


% --- Executes just before help is made visible.
function help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to help (see VARARGIN)

% Choose default command line output for help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes help wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p1=['>> Select the Process Button'];
p2=['>> The Input Gui Will open'];
p3=['>> Then Give the Input(Query) Image'];
p4=['>> If image is RGB, convert it in Gray Scale'];
p5=['>> Change the image size'];
p6=['>> Then use Gaussion filter to filter the image'];
p7=['>> Go to Identification Process by press the Next icon'];
p8=['>> Press IQA(Image Quality Accement Process) Button'];
p9=['>> Then identify the image is "GOOD" or "BAD"'];
p10=['>> Then It can be used for further reference.'];
p=strvcat(p1,' ',p2,' ',p3,' ',p4,' ',p5,' ',p6,' ',p7,' ',p8,' ',p9,' ',p10);
set(handles.text1,'string',p);

% Get default command line output from handles structure
varargout{1} = handles.output;
