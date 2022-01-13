function MultimodeCouplingSiN700x2200TE = importComsolTable(filename, dataLines)
%IMPORTFILE Import data from a text file
%  MULTIMODECOUPLINGSIN700X2200TE = IMPORTFILE(FILENAME) reads data from
%  text file FILENAME for the default selection.  Returns the data as a
%  table.
%
%  MULTIMODECOUPLINGSIN700X2200TE = IMPORTFILE(FILE, DATALINES) reads
%  data for the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  MultimodeCouplingSiN700x2200TE = importfile("Y:\Users\Johann\ParametricAmplifier\MultimodeCoupling\MultimodeCoupling_SiN_700x2200_TE.txt", [6, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 26-Jul-2021 17:40:05

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [6, Inf];
end

%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 3);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["VarName1", "Model", "StraightWaveguide_MultimodeCouplingmph"];
opts.VariableTypes = ["double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% Import the data
MultimodeCouplingSiN700x2200TE = table2array(readtable(filename, opts));

end