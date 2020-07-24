function varargout = AboutProject(varargin)
% ABOUTPROJECT MATLAB code for AboutProject.fig
%      ABOUTPROJECT, by itself, creates a new ABOUTPROJECT or raises the existing
%      singleton*.
%
%      H = ABOUTPROJECT returns the handle to a new ABOUTPROJECT or the handle to
%      the existing singleton*.
%
%      ABOUTPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ABOUTPROJECT.M with the given input arguments.
%
%      ABOUTPROJECT('Property','Value',...) creates a new ABOUTPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AboutProject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AboutProject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AboutProject

% Last Modified by GUIDE v2.5 31-May-2014 11:18:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AboutProject_OpeningFcn, ...
                   'gui_OutputFcn',  @AboutProject_OutputFcn, ...
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


% --- Executes just before AboutProject is made visible.
function AboutProject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AboutProject (see VARARGIN)

% Choose default command line output for AboutProject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AboutProject wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AboutProject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p1=['In this Process we identify the Quality of Agriculture products whether they are GOOD or BAD by using the IAQ(image quality assessment).'];
p3=['Based on "Image Quality Assessment for AGRICULTURE PRODUCTS" IEEE TRANSACTIONS ON IMAGE PROCESSING, VOL. 23, NO. 20, March 2019.'];
p4=['Run the Project Matlab-2019'];
p=strvcat(' ',p1,' ',p3,' ',p4);
set(handles.text1,'string',p);

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
