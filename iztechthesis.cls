\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iztechthesis}[2026/03/01 IZTECH Master's Thesis Class]

% --- Base Class: 12pt, A4 ---
\LoadClass[12pt, a4paper, oneside]{report}

% --- Essential Packages ---
\RequirePackage{mathptmx} % Times New Roman
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[shorthands=off, turkish, english]{babel}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{indentfirst}
\RequirePackage{textcase}

% --- Name Overrides (Forces exact IZTECH Titles) ---
\addto\captionsenglish{%
  \renewcommand{\contentsname}{TABLE OF CONTENTS}%
  \renewcommand{\listfigurename}{LIST OF FIGURES}%
  \renewcommand{\listtablename}{LIST OF TABLES}%
  \renewcommand{\bibname}{REFERENCES}%
}

% --- Margins (Section 2.2) ---
\RequirePackage[
    a4paper,
    left=3.5cm,
    right=2.5cm,
    top=2.5cm,
    bottom=2.5cm,
    footskip=0.5cm
]{geometry}

% --- Spacing & Indentation (Section 2.4) ---
\RequirePackage{setspace}
% Standard 1.5 spacing as on the guide's own pages: 0.73 cm between baselines of 12-point text,
% the 1.5-line spacing of Times New Roman (setspace's own \onehalfspacing gives only 0.64 cm)
\renewcommand{\onehalfspacing}{\setstretch{1.43}}
\onehalfspacing
\setlength{\parindent}{1.27cm}
\setlength{\parskip}{0pt}

% --- Page Breaks (Section 2.8): two lines of a paragraph at each page edge, no word split across pages ---
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000
\brokenpenalty=10000
% Section 2.2: a line that cannot be broken well is set loosely rather than run into the margin
\setlength{\emergencystretch}{3em}

% --- Reduced Sizes (Section 2.3): text in tables, figures and appendices is at least 9 points ---
\renewcommand{\scriptsize}{\@setfontsize\scriptsize\@ixpt{11}}
\renewcommand{\tiny}{\@setfontsize\tiny\@ixpt{11}}

% --- Pagination (Section 2.9) ---
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfootoffset[R]{0.5cm}
\fancyfoot[R]{\thepage}

\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfootoffset[R]{0.5cm}
    \fancyfoot[R]{\thepage}
}

% --- Float & Equation Spacing (Section 3.2.2 & 3.2.3) ---
\setlength{\intextsep}{2\baselineskip}
\setlength{\textfloatsep}{2\baselineskip}
\setlength{\floatsep}{3\baselineskip}

\AtBeginDocument{
    % 2x1.5 spacing (Section 3.2.3): one blank 1.5-spaced line between the text and an equation
    \setlength{\abovedisplayskip}{\baselineskip}
    \setlength{\belowdisplayskip}{\baselineskip}
    \setlength{\abovedisplayshortskip}{\baselineskip}
    \setlength{\belowdisplayshortskip}{\baselineskip}
}

% --- Footnotes Formatting (Section 3.2.5) ---
% Guide: footnotes sit at the bottom of the page they are referenced on,
% indented 1 cm from the left text margin, under a broken line of 20 characters
% (5 cm), single spaced, in 10 points. \footnotesize is exactly 10 pt at this
% class's 12 pt base, so it is the correct size command here.
%
% \footnoterule is executed in internal vertical mode. \hspace expands to
% \hskip, a horizontal command, which makes TeX start a paragraph and leave
% vertical mode -- after which \hrule (vertical-mode only) raises
% "You can't use `\hrule' here except with leaders". \rule is a box instead of
% a TeX primitive rule, so it is safe in horizontal mode; wrapping the whole
% thing in an \hbox keeps the surrounding \kern values in vertical mode.
\renewcommand{\footnoterule}{%
  \kern-3pt%
  \hbox to \textwidth{\hspace*{1cm}\rule{5cm}{0.4pt}\hfil}%
  \kern2.6pt%
}

% \hspace* rather than \hspace: unstarred horizontal space is discardable at a
% line break, which would drop the required 1 cm indent on the first line.
\renewcommand\@makefntext[1]{%
    \singlespacing\footnotesize%
    \noindent\hspace*{1cm}\@thefnmark\hspace*{0.5em}#1%
}

% Guide: footnotes are "sequential ... for the entire thesis". The report class
% resets the counter at every \chapter, which would restart numbering in each
% chapter, so the reset is removed here.
\RequirePackage{chngcntr}
\counterwithout{footnote}{chapter}

\interfootnotelinepenalty=10000

% --- Quotation Formatting (Section 3.2.4) ---
\renewenvironment{quote}{%
  \list{}{\rightmargin\leftmargin}%
  \singlespacing
  \footnotesize
  \item\relax
}{%
  \endlist
}

% --- TOC, LOF, LOT Formatting ---
\RequirePackage[titles]{tocloft}
\renewcommand{\cftchapdotsep}{\cftdotsep}

% As on the guide's own contents and figure pages: a blank line before each chapter entry only
\setlength{\cftbeforechapskip}{0.73cm}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforefigskip}{0pt}
\setlength{\cftbeforetabskip}{0pt}

\setlength{\cftsecindent}{2em}
\setlength{\cftsubsecindent}{4em}
\setlength{\cftsubsubsecindent}{6em}
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}

\cftsetpnumwidth{2.0em}
\cftsetrmarg{5.5em}

\renewcommand{\cfttoctitlefont}{\hfill\normalfont\fontsize{16}{19.2}\bfseries\MakeTextUppercase}
\renewcommand{\cftaftertoctitle}{\hfill}
% The first contents entry follows the heading directly, without the blank line before chapters
\AtBeginDocument{\addtocontents{toc}{\protect\vspace{-0.73cm}}}

% Regular weight for chapter-level entries, as on the guide's own contents page
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}

\renewcommand{\cftchappresnum}{CHAPTER }
\renewcommand{\cftchapaftersnum}{.}
\settowidth{\cftchapnumwidth}{CHAPTER 10.\quad}

\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}

\renewcommand{\cftfigpresnum}{Figure }
\renewcommand{\cftfigaftersnum}{.}
\newlength{\myfigtmp}
\settowidth{\myfigtmp}{Figure 10.10.\quad}
\setlength{\cftfignumwidth}{\myfigtmp}

\renewcommand{\cfttabpresnum}{Table }
\renewcommand{\cfttabaftersnum}{.}
\newlength{\mytabtmp}
\settowidth{\mytabtmp}{Table 10.10.\quad}
\setlength{\cfttabnumwidth}{\mytabtmp}

% Safely redefining the List commands to inject the bold/underlined column headers
\renewcommand{\listoffigures}{%
    \clearpage
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
    {\leftskip 0pt\rightskip\@tocrmarg\parfillskip -\rightskip\parindent 0pt\relax
    \textbf{\underline{Figure}}\hfill\hb@xt@\@pnumwidth{\hfil\textbf{\underline{Page}}}\par}%
    % The guide's list has no extra space between the figures of two chapters
    {\let\addvspace\@gobble\@starttoc{lof}}%
}

\renewcommand{\listoftables}{%
    \clearpage
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
    {\leftskip 0pt\rightskip\@tocrmarg\parfillskip -\rightskip\parindent 0pt\relax
    \textbf{\underline{Table}}\hfill\hb@xt@\@pnumwidth{\hfil\textbf{\underline{Page}}}\par}%
    {\let\addvspace\@gobble\@starttoc{lot}}%
}

% --- Headings Formatting (Section 3.2.1) ---
\RequirePackage{titlesec}
% Headings keep 1.5 spacing in the single-spaced appendices, so they look the same everywhere
\titleformat{\chapter}[display]
  {\normalfont\setstretch{1.43}\fontsize{16}{19.2}\bfseries\centering}
  {\MakeTextUppercase{\chaptertitlename}\ \thechapter}
  {1\baselineskip}
  {\fontsize{16}{19.2}\MakeTextUppercase}
% Measured on the guide's own pages: the first heading line at the top margin, its baseline
% 3.03 cm from the top edge, the title 2x1.5 lines below it and the text 1.81 cm below the title
\titlespacing*{\chapter}{0pt}{-24.4pt}{31pt}

% 2x1.5 spacing around headings, measured on the guide's pages: 1.65 cm between the baselines
% of the text above and the heading, 1.63 cm between the heading and the text below
\titleformat{\section}
  {\normalfont\fontsize{14}{16.8}\bfseries}
  {\thesection.}{1em}{}
\titlespacing*{\section}{0pt}{23pt plus 3pt minus 2pt}{25.5pt}

\titleformat{\subsection}
  {\normalfont\fontsize{14}{16.8}\bfseries}
  {\thesubsection.}{1em}{}
\titlespacing*{\subsection}{0pt}{23pt plus 3pt minus 2pt}{25.5pt}

\titleformat{\subsubsection}
  {\normalfont\fontsize{14}{16.8}\bfseries}
  {\thesubsubsection.}{1em}{}
\titlespacing*{\subsubsection}{0pt}{23pt plus 3pt minus 2pt}{25.5pt}

% Captions are 12 points like the text (Section 2.3) and may be single spaced (Section 2.4)
\RequirePackage[font={normalsize,singlespacing}, labelfont=bf, labelsep=period]{caption}
\captionsetup{skip=1.5\baselineskip}

% --- Appendices Formatting (Section 3.3.2) ---
\renewcommand{\appendix}{
    \clearpage
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \renewcommand{\@chapapp}{APPENDIX}
    \renewcommand{\thechapter}{\Alph{chapter}}

    \addtocontents{toc}{\protect\vspace{\cftbeforechapskip}}
    \addtocontents{toc}{\noindent APPENDICES\par}

    \addtocontents{toc}{\protect\renewcommand{\protect\cftchappresnum}{APPENDIX }}
    \addtocontents{toc}{\protect\settowidth{\protect\cftchapnumwidth}{APPENDIX W.\quad}}

    \singlespacing
}

% --- SAFE Variables ---
\newcommand{\thesistitle}[1]{\def\TheThesisTitle{#1}}
\newcommand{\thesistitleTR}[1]{\def\TheThesisTitleTR{#1}}
\newcommand{\authorname}[1]{\def\TheAuthorName{#1}}
\newcommand{\authorsurname}[1]{\def\TheAuthorSurname{#1}}
\newcommand{\department}[1]{\def\TheDepartment{#1}}
\newcommand{\degree}[1]{\def\TheDegree{#1}}
\newcommand{\submissiondate}[1]{\def\TheSubmissionDate{#1}}
\newcommand{\examdate}[1]{\def\TheExamDate{#1}}
\newcommand{\supervisor}[2]{\def\TheSupervisorName{#1}\def\TheSupervisorDept{#2}}
\newcommand{\cosupervisor}[2]{\def\TheCoSupervisorName{#1}\def\TheCoSupervisorDept{#2}}
\newcommand{\headofdept}[1]{\def\TheHeadOfDept{#1}}
\newcommand{\dean}[1]{\def\TheDean{#1}}
\newcommand{\setmemberone}[2]{\def\MemberOneName{#1}\def\MemberOneDept{#2}}
\newcommand{\setmembertwo}[2]{\def\MemberTwoName{#1}\def\MemberTwoDept{#2}}
\newcommand{\setmemberthree}[2]{\def\MemberThreeName{#1}\def\MemberThreeDept{#2}}
\newcommand{\setmemberfour}[2]{\def\MemberFourName{#1}\def\MemberFourDept{#2}}
\newcommand{\setmemberfive}[2]{\def\MemberFiveName{#1}\def\MemberFiveDept{#2}}

% --- Title Page ---
\renewcommand{\maketitle}{
    \begin{titlepage}
        \singlespacing
        \centering
        % Every line of the sample title page (Figure 3.1) is bold
        \bfseries
        \vspace*{3\baselineskip}
        {\fontsize{18}{21.6}\selectfont \textbf{\MakeUppercase{\TheThesisTitle}}\par}
        \vspace{10\baselineskip plus 0pt minus 2\baselineskip}
        {\fontsize{14}{16.8}\selectfont
        A Thesis Submitted to\\
        the Graduate School of Engineering and Sciences of\\
        İzmir Institute of Technology\\
        in Partial Fulfillment of the Requirements for the Degree of\par}
        % Figure 3.1 marks only four vertical gaps on the title page: 3x before
        % the title, 10x after it, 4x before "by", and 7x before the date. The
        % degree and program lines sit closer to the submitted-to block than a
        % full 4x, so these two use 2x -- at 4x the date was pushed to ~94% of
        % the page height against ~86% in the sample.
        \vspace{2\baselineskip plus 0pt minus 1\baselineskip}
        {\fontsize{14}{16.8}\selectfont
        \textbf{\MakeUppercase{\TheDegree}}\par}
        \vspace{2\baselineskip plus 0pt minus 1\baselineskip}
        {\fontsize{14}{16.8}\selectfont
        in \TheDepartment\par}
        % 4x single spacing before "by" -- explicitly marked in Figure 3.1.
        \vspace{4\baselineskip plus 0pt minus 1\baselineskip}
        {\fontsize{14}{16.8}\selectfont
        by\\
        \textbf{\TheAuthorName\ \MakeUppercase{\TheAuthorSurname}}\par}
        \vspace{7\baselineskip plus 0pt minus 1\baselineskip}
        {\fontsize{14}{16.8}\selectfont
        \TheSubmissionDate\\
        İZMİR\par}
    \end{titlepage}
}

% --- Approval Page ---
\newcommand{\committeeline}[2]{%
    \vspace{1.1cm}
    \noindent\begin{minipage}{\textwidth}
        \raggedright
        \rule{7cm}{0.4pt}\\
        \textbf{#1}\\
        #2
    \end{minipage}\par
}

\newcommand{\makeapprovalpage}{
    \newpage
    \begingroup
    \thispagestyle{empty}
    \singlespacing
    % The sample approval page breaks lines rather than justifying or hyphenating them
    \raggedright
    \hyphenpenalty=10000

    \noindent We approve the thesis of \textbf{\TheAuthorName\ \MakeUppercase{\TheAuthorSurname}}\par
    \vspace{1\baselineskip}
    \noindent \textbf{Examining Committee Members:}\par

    \@ifundefined{MemberOneName}{}{\committeeline{\MemberOneName}{\MemberOneDept}}
    \@ifundefined{MemberTwoName}{}{\committeeline{\MemberTwoName}{\MemberTwoDept}}
    \@ifundefined{MemberThreeName}{}{\committeeline{\MemberThreeName}{\MemberThreeDept}}
    \@ifundefined{MemberFourName}{}{\committeeline{\MemberFourName}{\MemberFourDept}}
    \@ifundefined{MemberFiveName}{}{\committeeline{\MemberFiveName}{\MemberFiveDept}}

    \vspace{0.8cm}
    \noindent
    \begin{minipage}[t]{7cm}
        \strut
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{7cm}
        \textbf{\TheExamDate}
    \end{minipage}
    \par

    \vspace{0.8cm}
    \noindent
    \begin{minipage}[t]{7cm}
        \raggedright
        \rule{7cm}{0.4pt}\\
        \textbf{\TheSupervisorName}\\
        Supervisor, \TheSupervisorDept
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{7cm}
        \@ifundefined{TheCoSupervisorName}{}{%
            \raggedright
            \rule{7cm}{0.4pt}\\
            \textbf{\TheCoSupervisorName}\\
            Co-Supervisor, \TheCoSupervisorDept
        }
    \end{minipage}

    \vspace{2cm}
    \noindent
    \begin{minipage}[t]{7cm}
        \raggedright
        \rule{7cm}{0.4pt}\\
        \textbf{\TheHeadOfDept}\\
        Head of the Department of \TheDepartment
    \end{minipage}%
    \hfill
    \begin{minipage}[t]{7cm}
        \raggedright
        \rule{7cm}{0.4pt}\\
        \textbf{\TheDean}\\
        Dean of the Graduate School of\\
        Engineering and Sciences
    \end{minipage}
    \par\endgroup
    \newpage
}

% --- Abstract & Özet Formatting ---
% Figure 3.3: one 1.5-spaced line between the heading, the title and the text; the pages
% before the table of contents are not listed in it, as on the guide's own contents page
\newcommand{\abstracttitle}[1]{%
    \vspace{-\baselineskip}%
    {\centering\singlespacing\mdseries\fontsize{14}{16.8}\selectfont \MakeUppercase{#1}\par}%
    \vspace{\baselineskip}%
}

\newenvironment{abstractenv}{
    \newpage
    \chapter*{ABSTRACT}
    \abstracttitle{\TheThesisTitle}
    \onehalfspacing
}{
    \newpage
}

\newenvironment{ozetenv}{
    \newpage
    \selectlanguage{turkish}%
    \chapter*{ÖZET}
    \abstracttitle{\TheThesisTitleTR}
    \onehalfspacing
}{
    \selectlanguage{english}%
    \newpage
}

% Figure 3.4: two 1.5-spaced lines below the heading, which the chapter heading spacing gives
\newenvironment{acknowledgmentsenv}{
    \newpage
    \chapter*{ACKNOWLEDGMENTS}
    \thispagestyle{empty}
    \onehalfspacing
}{
    \newpage
}
