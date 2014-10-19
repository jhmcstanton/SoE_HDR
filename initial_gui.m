function varargout = initial_gui(varargin)
% INITIAL_GUI MATLAB code for initial_gui.fig
%      INITIAL_GUI, by itself, creates a new INITIAL_GUI or raises the existing
%      singleton*.
%
%      H = INITIAL_GUI returns the handle to a new INITIAL_GUI or the handle to
%      the existing singleton*.
%
%      INITIAL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INITIAL_GUI.M with the given input arguments.
%
%      INITIAL_GUI('Property','Value',...) creates a new INITIAL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before initial_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to initial_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help initial_gui

% Last Modified by GUIDE v2.5 19-Oct-2014 14:30:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @initial_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @initial_gui_OutputFcn, ...
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


% --- Executes just before initial_gui is made visible.
function initial_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to initial_gui (see VARARGIN)

% Choose default command line output for initial_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes initial_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = initial_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in natural_scenes.
function natural_scenes_Callback(hObject, eventdata, handles)
% hObject    handle to natural_scenes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of natural_scenes


% --- Executes on button press in medical_image.
function medical_image_Callback(hObject, eventdata, handles)
% hObject    handle to medical_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of medical_image


% --- Executes on button press in radar_backscatter.
function radar_backscatter_Callback(hObject, eventdata, handles)
% hObject    handle to radar_backscatter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radar_backscatter


% --- Executes on button press in telescope_image.
function telescope_image_Callback(hObject, eventdata, handles)
% hObject    handle to telescope_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of telescope_image


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = get(handles.filename_field, 'string');
isNatural = get(handles.natural_scenes, 'Value');
isMedical = get(handles.medical_image, 'Value');
isRadar = get(handles.radar_backscatter, 'Value');
isTelescope = get(handles.telescope_image, 'Value');
if isNatural == 1
    setappdata(0,'filetype','Natural');
elseif isMedical == 1
    setappdata(0,'filetype','Medical');
elseif isRadar == 1
    setappdata(0,'filetype','Radar');
elseif isTelescope == 1
    setappdata(0,'filetype','Telescope');
end
close;
setappdata(0, 'filename', filename);
lightness_gui;

% --- Executes on button press in browse_button.
function browse_button_Callback(hObject, eventdata, handles)
% hObject    handle to browse_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
filename = uigetfile;
set(handles.filename_field, 'string', filename);
