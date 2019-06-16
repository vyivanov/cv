\ProvidesClass{template}[]
\LoadClass[10pt,letterpaper]{article}

\usepackage[parfill]{parskip}                       %% Remove paragraph indentation
\usepackage{array}                                  %% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen}                                 %% Required for ifthenelse statements
\usepackage{marvosym}                               %% Required for MarVoSym font symbols
\usepackage{graphicx}                               %% Required for picture inline
\usepackage[pdfborder={0 0 0}]{hyperref}
\usepackage[left=0.5in,top=0.4in,right=0.5in,bottom=0.5in]{geometry}
\usepackage{csquotes}
\usepackage[spanish]{babel}
\usepackage{fontawesome}

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
    \medskip
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
        \setlength{\leftmargin}{1.5em}              %% Margin within the section
    }
    \item[]
}{\end{list}}

%%%%  EXPERIENCE FORMATTING  %%%%

\newenvironment{rCompany}[4] {                      %% 4 input arguments: company name, year(s) employed, job title and location
    {\bf #1} \hfill {#2}                            %% Bold company name and date on the right
    \ifthenelse{\equal{#3}{}}                       %% If the third argument is not specified, don't print the job title and location line
    {}
    {\\{\em #3} \hfill {#4}}                        %% Italic job title and location
    \smallskip
    \begin{list}{$\cdot$}{\leftmargin=0em}          %% \cdot used for bullets, no indentation
    \itemsep -0.5em \vspace{-0.5em}                 %% Compress items in list together for aesthetics
}{\end{list}\vspace{0.5em}}                         %% Some space after the list of bullet points

\newenvironment{rItemize} {
    \medskip
    \begin{list}{$\cdot$}{\leftmargin=0em}          %% \cdot used for bullets, no indentation
    \itemsep -0.5em \vspace{-0.5em}                 %% Compress items in list together for aesthetics
}{\end{list}\vspace{0.5em}}                         %% Some space after the list of bullet points

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE}                               %% Size of the name at the top of the document
\def\addressskip{\smallskip}                        %% The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip}                      %% The space above the horizontal line for each section
\def\nameskip{\bigskip}                             %% The space after your name at the top
\def\sectionskip{\medskip}                          %% The space after the heading section

