function varargout = lightness_gui(varargin)
% LIGHTNESS_GUI MATLAB code for lightness_gui.fig
%      LIGHTNESS_GUI, by itself, creates a new LIGHTNESS_GUI or raises the existing
%      singleton*.
%
%      H = LIGHTNESS_GUI returns the handle to a new LIGHTNESS_GUI or the handle to
%      the existing singleton*.
%
%      LIGHTNESS_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIGHTNESS_GUI.M with the given input arguments.
%
%      LIGHTNESS_GUI('Property','Value',...) creates a new LIGHTNESS_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lightness_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lightness_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lightness_gui

% Last Modified by GUIDE v2.5 06-Oct-2014 12:52:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lightness_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @lightness_gui_OutputFcn, ...
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

display(getappdata(0, 'filename'));
% End initialization code - DO NOT EDIT


% --- Executes just before lightness_gui is made visible.
function lightness_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lightness_gui (see VARARGIN)

% Choose default command line output for lightness_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lightness_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lightness_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function min_slider_Callback(hObject, eventdata, handles)
% hObject    handle to min_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slider_value = get(hObject,'Value');
setappdata(0, 'min_lightness', slider_value);
set(handles.min_lightness_field, 'String', num2str(slider_value));

% --- Executes during object creation, after setting all properties.
function min_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function max_slider_Callback(hObject, eventdata, handles)
% hObject    handle to max_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slider_value = get(hObject,'Value');
setappdata(0, 'max_lightness', slider_value);
set(handles.max_lightness_field, 'String', num2str(slider_value));

% --- Executes during object creation, after setting all properties.
function max_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in ok_button2.
function ok_button2_Callback(hObject, eventdata, handles)
% hObject    handle to ok_button2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Status, 'String', 'Loading HDR Image');
disp('Loading HDR image')
filename = getappdata(0, 'filename');
hdrim = hdrread(filename);
low_lightness = getappdata(0, 'min_lightness');
high_lightness = getappdata(0, 'max_lightness');
set(handles.Status, 'String', 'Tonemapping...');
disp('Tonemapping')
im1 = tonemap(hdrim, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', .5);
im2 = tonemap(hdrim, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 1);
im3 = tonemap(hdrim, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 1.5);
im4 = tonemap(hdrim, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 2);
im5 = tonemap(hdrim, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 2.5);
set(handles.Status, 'String', 'storing tonemapped images...');
disp('storing tonemapped images')
setappdata(0, 'tonemap1', im1);
setappdata(0, 'tonemap2', im2);
setappdata(0, 'tonemap3', im3);
setappdata(0, 'tonemap4', im4);
setappdata(0, 'tonemap5', im5);
set(handles.Status, 'String', 'launching selection interface');
disp('launching selection interface')
close;
image_gui;
