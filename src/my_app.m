function varargout = my_app(varargin)
% MY_APP MATLAB code for my_app.fig
%      MY_APP, by itself, creates a new MY_APP or raises the existing
%      singleton*.
%
%      H = MY_APP returns the handle to a new MY_APP or the handle to
%      the existing singleton*.
%
%      MY_APP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_APP.M with the given input arguments.
%
%      MY_APP('Property','Value',...) creates a new MY_APP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before my_app_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to my_app_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help my_app

% Last Modified by GUIDE v2.5 28-Oct-2022 01:23:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @my_app_OpeningFcn, ...
                   'gui_OutputFcn',  @my_app_OutputFcn, ...
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


% --- Executes just before my_app is made visible.
function my_app_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to my_app (see VARARGIN)

% Choose default command line output for my_app
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes my_app wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = my_app_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in b_enrol.
function b_enrol_Callback(hObject, eventdata, handles)
% hObject    handle to b_enrol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
enrol

% --- Executes on button press in b_authen.
function b_authen_Callback(hObject, eventdata, handles)
% hObject    handle to b_authen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename2, pathname2] = ...
    uigetfile('*.tif','Select second fingerprint', ...
    'FVC2002\DB1_B');
set(handles.t_f, 'string', [pathname2 filename2]);

% --- Executes on button press in b_clr_screen.
function b_clr_screen_Callback(hObject, eventdata, handles)
% hObject    handle to b_clr_screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%cla(handles.input_img);
arrayfun(@cla,findall(0,'type','axes'));
set(handles.t_f, 'string', '');
set(handles.t_input, 'string', '');
set(handles.t_binarized, 'string', '');
set(handles.t_thinned, 'string', '');
set(handles.t_minutiae, 'string', '');
set(handles.t_content, 'string', '');
set(handles.b_authenticate, 'string', 'Authenticate');

% --- Executes on button press in b_clr_database.
function b_clr_database_Callback(hObject, eventdata, handles)
% hObject    handle to b_clr_database (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%fig = uifigure;
selection = questdlg('All data will be delete', ...
	'Clear DB', ...
	'OK','Cancel','');
	%'Dessert Menu')
switch selection
    case 'OK'
       cleardatabase;
    case 'Cancel'
        return
end

% --- Executes on button press in b_exit.
function b_exit_Callback(hObject, eventdata, handles)
% hObject    handle to b_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();


function t_f_Callback(hObject, eventdata, handles)
% hObject    handle to t_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_f as text
%        str2double(get(hObject,'String')) returns contents of t_f as a double


% --- Executes during object creation, after setting all properties.
function t_f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b_select_img.
function b_select_img_Callback(hObject, eventdata, handles)
% hObject    handle to b_select_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename2, pathname2] = ...
    uigetfile('*.tif','Select fingerprint', ...
    'FVC2002\DB1_B');
set(handles.t_f, 'string', [pathname2 filename2]);

% --- Executes on button press in b_authenticate.
function b_authenticate_Callback(hObject, eventdata, handles)
% hObject    handle to b_authenticate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.t_content, 'string', '');
drawnow();
path = get(handles.t_f, 'string');
img1 = imread(path);

axes(handles.input_img); % Only needed if you have multiple axes.
imshow(img1); set(handles.t_input, 'string', 'Input'); %title('Input'); 

fprintf(['>> Beginning extraction process\n']);
set(handles.t_content, 'string', 'Extracting minutiae...');
drawnow();
[inp_minutiae, thinned, binim, minutiae_img] = ext_finger(img1, 1);

axes(handles.binarized_img);
imshow(binim); set(handles.t_binarized, 'string', 'Filtered and Binarized Image')

axes(handles.thinned_img);
imshow(thinned); set(handles.t_thinned, 'string', 'Thinned Image');

axes(handles.minutiae_img);
imshow(minutiae_img); set(handles.t_minutiae, 'string', 'Minutiae')

fprintf(['done!\n']);



fprintf(['>> Comparing against database... ']);
set(hObject, 'string', 'Comparing against database... ');
drawnow();
load database person minutiae

uniq = unique(minutiae(:, 1),'stable');
r = size(uniq(:, :));
k = size(minutiae(:, :));
uniq = table2struct(uniq);
uniq = struct2cell(uniq);

first = minutiae(:, 1);
first = table2struct(first);
first = struct2cell(first);
s = 0;

for i=1:r
    temp_struct = struct('X', [], 'Y', [], 'Type', [], 'Angle', [],'S1', [], 'S2', []);
    for j=1:k
        % build temporary structure of minutiae pertaining to a fingerprint
        if strcmp(uniq(i), first(j))
            p = size(temp_struct);
            if p==0
                temp_struct = table2struct(minutiae(j, 2:7));
            else
                temp_struct = [temp_struct; table2struct(minutiae(j, 2:7))];
            end;
        end;
    end;
        
    % getting match score
    temp_struct = transpose(cell2mat(struct2cell(temp_struct)));
    if s==0
        s = match(inp_minutiae, temp_struct);
    else
        s = horzcat(s, match(inp_minutiae, temp_struct));
    end;
        
end;

maxim = max(s);
len = length(s);
for i=1:len
    if s(i)==maxim
        break;
    end;
end;


if (maxim<1) 
    fprintf(['>> No match found for given fingerprint.\n']);
    set(handles.t_content, 'string', 'No match found.');
    drawnow();
else
    x = round(i/2);
    name = char(struct2cell(table2struct(person(x, 1))));
    fprintf(['done!\n>> Found fingerprint! Welcome ' name '!\n']);
    set(handles.t_content, 'string', ['Authenticated, hello ' name '!']);
    drawnow();
end;

set(hObject, 'string', 'Authenticate');
