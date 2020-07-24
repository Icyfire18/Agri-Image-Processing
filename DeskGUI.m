function varargout = DeskGUI(varargin)
% DESKGUI MATLAB code for DeskGUI.fig
%      DESKGUI, by itself, creates a new DESKGUI or raises the existing
%      singleton*.
%
%      H = DESKGUI returns the handle to a new DESKGUI or the handle to
%      the existing singleton*.
%
%      DESKGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DESKGUI.M with the given input arguments.
%
%      DESKGUI('Property','Value',...) creates a new DESKGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DeskGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DeskGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DeskGUI

% Last Modified by GUIDE v2.5 28-Mar-2019 15:57:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DeskGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DeskGUI_OutputFcn, ...
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
% --- Executes just before DeskGUI is made visible.
function DeskGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DeskGUI (see VARARGIN)
% Choose default command line output for DeskGUI
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes DeskGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = DeskGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% a = imread('icon\a.jpg');
% b=imresize(a,0.4);
% set(handles.input, 'CData', b);
% a = imread('icon\e.jpg');
% b=imresize(a,0.4);
% set(handles.exit, 'CData', b);
% a = imread('icon\h.jpg');
% b=imresize(a,0.4);
% set(handles.help, 'CData', b);
% a = imread('icon\p.jpg');
% b=imresize(a,0.2);
% set(handles.Process, 'CData', b);
% 
% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
AboutProject
% --- Executes on button press in Process.
function Process_Callback(hObject, eventdata, handles)
% hObject    handle to Process (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
InputProcess
% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help
% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
