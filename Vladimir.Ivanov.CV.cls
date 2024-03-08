\ProvidesClass{template}[]
\LoadClass[10pt,letterpaper]{article}

\usepackage[parfill]{parskip}                       %% Remove paragraph indentation
\usepackage{array}                                  %% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen}                                 %% Required for ifthenelse statements
\usepackage{marvosym}                               %% Required for MarVoSym font symbols
\usepackage{graphicx}                               %% Required for picture inline
\usepackage[pdfborder={0 0 0}]{hyperref}
\usepackage[left=0.3in,top=0.3in,right=0.3in,bottom=0.3in]{geometry}
\usepackage{csquotes}
\usepackage[spanish]{babel}
\usepackage{fontawesome5}

\pagestyle{empty}                                   %% Comment out to suppress page numbers
\setcounter{page}{1}
\pagenumbering{arabic}

%%%%  HEADER COMMANDS  %%%%

\def \name #1 {\def\@name{#1}}                      %% Defines the \name command to set name
\def \@name {}                                      %% Sets \@name to empty by default

\def \addressSep {$\diamond$}                       %% Set default address separator to a diamond

\let \@addressone \relax                            %% One or two address lines can be specified
\let \@addresstwo \relax

\def \address #1 {                                  %% \address command can be used to set the first and second address (optional)
    \@ifundefined{@addressone}
        {\def \@addressone {#1}}
            {\def \@addresstwo {#1}}
}

\def \printaddress #1 {                             %% \printaddress is used to style an address line (given as input)
    \begingroup
        \def \\ {\addressSep\ }
        \centerline {#1}
    \endgroup
    \par
    \addressskip
}

\def \printname {                                   %% \printname is used to print the name as a page header
    \begingroup
        \hfil {
            \namesize\bf \@name
        }
        \hfil
        \nameskip\break
    \endgroup
}

%%%%  PRINT HEAD LINES  %%%%

\let\ori@document=\document
\renewcommand{\document} {
    \ori@document                                   %% Begin document
    \printname                                      %% Print the name specified with \name
    \@ifundefined{@addressone}{} {                  %% Print the first address if specified
        \printaddress{\@addressone}
    }
    \@ifundefined{@addresstwo}{} {                  %% Print the second address if specified
        \printaddress{\@addresstwo}
    }
}

%%%%  SECTION FORMATTING  %%%%

%% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1] {                      %% 1 input argument: section name
    \sectionskip
    \MakeUppercase{\bf #1}                          %% Section title
    \sectionlineskip
    \hrule                                          %% Horizontal line
    \medskip
    \begin{list}{} {                                %% List for each individual item in the section
        \setlength{\leftmargin}{1.0em}              %% Margin within the section
    }
    \item[]
}{\end{list}}

%%%%  EXPERIENCE FORMATTING  %%%%

\newenvironment{rCompany}[6] {
    {\bf #1} \ifthenelse{\equal{#2}{}} {:} {(\href{http://#2}{#2}):} {#3} \hfill {#4} \\
    {\em #5} \hfill {#6}
    \smallskip
    \begin{list}{$\cdot$}{\leftmargin=0em}          %% \cdot used for bullets, no indentation
    \itemsep -0.6em \vspace{-0.5em}                 %% Compress items in list together for aesthetics
}{\end{list}\vspace{0.5em}}                         %% Some space after the list of bullet points

%%%% SUMMARY FORMATTING %%%%

\newenvironment{rItemize} {
    \smallskip
    \begin{list}{$\bullet$}{\leftmargin=1.0em}      %% \bullet used for bullets
    \itemsep -0.6em \vspace{-0.5em}                 %% Compress items in list together for aesthetics
}{\end{list}}                                       %% Some space after the list of bullet points

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge}                                %% Size of the name at the top of the document
\def\addressskip{\smallskip}                        %% The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip}                    %% The space above the horizontal line for each section
\def\nameskip{\medskip}                             %% The space after your name at the top
\def\sectionskip{\smallskip}                        %% The space after the heading section
