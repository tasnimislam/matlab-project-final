get_selected=get(handles.uibuttongroup1,'SelectedObject');
get_stringpart=get(get_selected,'String');
idx=str2num(get_stringpart);
global t;
global y;
global eqn;
f = fit(t',y',char(eqn(idx)));
plot(f,t,y);
%madarchod
