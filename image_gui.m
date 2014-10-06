function varargout = image_gui(varargin)
% IMAGE_GUI MATLAB code for image_gui.fig
%      IMAGE_GUI, by itself, creates a new IMAGE_GUI or raises the existing
%      singleton*.
%
%      H = IMAGE_GUI returns the handle to a new IMAGE_GUI or the handle to
%      the existing singleton*.
%
%      IMAGE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_GUI.M with the given input arguments.
%
%      IMAGE_GUI('Property','Value',...) creates a new IMAGE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_gui

% Last Modified by GUIDE v2.5 06-Oct-2014 12:23:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @image_gui_OutputFcn, ...
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


% --- Executes just before image_gui is made visible.
function image_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_gui (see VARARGIN)

% Choose default command line output for image_gui
handles.output = hObject;
imshow(getappdata(0, 'tonemap1'), 'parent', handles.image_1);
imshow(getappdata(0, 'tonemap2'), 'parent', handles.image_2);
imshow(getappdata(0, 'tonemap3'), 'parent', handles.image_3);
imshow(getappdata(0, 'tonemap4'), 'parent', handles.image_4);
imshow(getappdata(0, 'tonemap5'), 'parent', handles.image_5);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function save_callback(axes_handle)
img = getimage(axes_handle);
[filename, pathname] = uiputfile('*.png', 'Save As');
if pathname == 0 %check if user canceled the dialog box
    return;
else
    name = fullfile(pathname, filename);
    imwrite(img , name, 'png');
end


% --- Executes on button press in save_button_1.
function save_button_1_Callback(hObject, eventdata, handles)
% hObject    handle to save_button_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_callback(handles.image_1);

% --- Executes on button press in save_button_4.
function save_button_4_Callback(hObject, eventdata, handles)
% hObject    handle to save_button_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_callback(handles.image_4);

% --- Executes on button press in save_button_2.
function save_button_2_Callback(hObject, eventdata, handles)
% hObject    handle to save_button_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_callback(handles.image_2);

% --- Executes on button press in save_button_3.
function save_button_3_Callback(hObject, eventdata, handles)
% hObject    handle to save_button_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_callback(handles.image_3);

% --- Executes on button press in save_button_5.
function save_button_5_Callback(hObject, eventdata, handles)
% hObject    handle to save_button_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_callback(handles.image_5);