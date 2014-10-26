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

% Last Modified by GUIDE v2.5 08-Oct-2014 11:28:39

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
% End initialization code - DO NOT EDIT

import matlab.io.*
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

filetype = getappdata(0,'filetype');
filename = getappdata(0,'filename');
if strcmp(filetype, 'Natural')
    %.hdr
    h = waitbar(0,'Creating HDR image. This process takes a few moments');
    im = imread(filename);
    h = waitbar(1/8,h,'Creating HDR image. This process takes a few moments');
    im_high = im * 1.25;
    h = waitbar(2/8,h,'Creating HDR image. This process takes a few moments');
    im_low = im * .75;
    h = waitbar(3/8,h,'Creating HDR image. This process takes a few moments');
    imwrite(im, 'creating_hdr_mid_img.png');
    h = waitbar(4/8,h,'Creating HDR image. This process takes a few moments');
    imwrite(im_low, 'creating_hdr_low_img.png');
    h = waitbar(5/8,h,'Creating HDR image. This process takes a few moments');
    imwrite(im_high, 'creating_hdr_high_img.png');
    h = waitbar(6/8,h,'Creating HDR image. This process takes a few moments');
    images = {'creating_hdr_low_img.png', 'creating_hdr_mid_img.png', 'creating_hdr_high_img.png'};
    h = waitbar(7/8,h,'Creating HDR image. This process takes a few moments');
    hdrim = makehdr(images, 'ExposureValues', [-1 0 1]);
    %hdrim = hdrread(filename);
    close(h);
    setappdata(0,'im', hdrim);
    imV = hdrim(:);
    set(handles.recommend_field, 'string', 'Recommended .1 - 1');
elseif strcmp(filetype, 'Medical')
    %.dcm
    h = waitbar(0,'Reading Medical image. This process takes a few moments');
    im = dicomread(filename);
    close(h);
    setappdata(0,'im', im);
    imV = im(:);
    set(handles.recommend_field, 'string', 'Recommended .15 - 1');
elseif strcmp(filetype, 'Radar')
    %.mat
    h = waitbar(0,'Reading Radar image. This process takes a few moments');
    im = load(filename);
    close(h);
    setappdata(0,'im', im);
    if isfield(im, 'Data')
        im = im.Data;
    else
        im = im.A;
    end;
    imV = im(:);
    set(handles.recommend_field, 'string', 'Recommended .2 - 1');
elseif strcmp(filetype, 'Telescope')
    %.fits
    imports;
    h = waitbar(0,'Reading Telescope image. This process takes a few moments');
    im = fitsread(filename);
    close(h);
    setappdata(0,'im', im);
    imV = im(:);
    set(handles.recommend_field, 'string', 'Recommended .2 - .9');
end

max_im = max(imV);
min_im = min(imV);
if min_im < 0
    min_im = 0;
end

set(handles.min_pixel_field, 'string', num2str(min_im));
set(handles.max_pixel_field, 'string', num2str(max_im));


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
set(handles.min_lightness_field, 'string', num2str(slider_value));

% --- Executes during object creation, after setting all properties.
function min_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function min_pixel_field_Callback(hObject, eventdata, handles)
% hObject    handle to min_pixel_field (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_pixel_field as text
%        str2double(get(hObject,'String')) returns contents of min_pixel_field as a double


% --- Executes during object creation, after setting all properties.
function min_pixel_field_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_pixel_field (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_pixel_field_Callback(hObject, eventdata, handles)
% hObject    handle to max_pixel_field (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_pixel_field as text
%        str2double(get(hObject,'String')) returns contents of max_pixel_field as a double


% --- Executes during object creation, after setting all properties.
function max_pixel_field_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_pixel_field (see GCBO)
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
set(handles.max_lightness_field, 'string', num2str(slider_value));

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
filetype = getappdata(0, 'filetype');
im = getappdata(0, 'im');
% low_lightness = getappdata(0, 'min_lightness');
low_lightness = get(handles.min_slider, 'Value');
if low_lightness == 0
    low_lightness = 0.0001;
end
% high_lightness = getappdata(0, 'max_lightness');
high_lightness = get(handles.max_slider, 'Value');
import matlab.io.*
if strcmp(filetype, 'Natural')
    %.hdr
    h = waitbar(0,'Tonemapping');
    im1 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 2);
    h = waitbar(.2,h,'Tonemapping');
    im2 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 3);
    h = waitbar(.4,h,'Tonemapping');
    im3 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 4);
    h = waitbar(.6,h,'Tonemapping');
    im4 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 5);
    h = waitbar(.8,h,'Tonemapping');
    im5 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 6);
    close(h);
elseif strcmp(filetype, 'Medical')
    %.dcm
    % Suggested .15-1
    im = dicomread('dcm_1.dcm');
    im = cat(3,double(im),double(im),double(im));
    h = waitbar(0,'Tonemapping');
    im1 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 10);
    h = waitbar(.2,h,'Tonemapping');
    im2 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 100);
    h = waitbar(.4,h,'Tonemapping');
    im3 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 200);
    h = waitbar(.6,h,'Tonemapping');
    im4 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 300);
    h = waitbar(.8,h,'Tonemapping');
    im5 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 400);
    close(h);
elseif strcmp(filetype, 'Radar')
    %.mat
    %suggested .2-1
    if isfield(im, 'Data')
        im = im.Data;
    else
        im = im.A;
    end;
    im = cat(3,im,im,im);
    h = waitbar(0,'Tonemapping');
    im1 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 1);
    h = waitbar(.2,h,'Tonemapping');
    im2 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 3);
    h = waitbar(.4,h,'Tonemapping');
    im3 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 5);
    h = waitbar(.6,h,'Tonemapping');
    im4 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 7);
    h = waitbar(.8,h,'Tonemapping');
    im5 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 9);
    close(h);
elseif strcmp(filetype, 'Telescope')
    %.fits
    % suggested .2-.9
    image = fits.openFile('fits_1.fits');
    im = fits.readImg(image);
    im = transpose(im);
    fits.closeFile(image);
    im = cat(3,im,im,im);
    im = abs(im);
    h = waitbar(0,'Tonemapping');
    im1 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', .5);
    h = waitbar(.2,h,'Tonemapping');
    im2 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 1);
    h = waitbar(.4,h,'Tonemapping');
    im3 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 1.5);
    h = waitbar(.6,h,'Tonemapping');
    im4 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 2);
    h = waitbar(.8,h,'Tonemapping');
    im5 = tonemap(im, 'AdjustLightness', [low_lightness, high_lightness], 'AdjustSaturation', 2.5);
    close(h);
end

setappdata(0, 'tonemap1', im1);
setappdata(0, 'tonemap2', im2);
setappdata(0, 'tonemap3', im3);
setappdata(0, 'tonemap4', im4);
setappdata(0, 'tonemap5', im5);
close;
image_gui;