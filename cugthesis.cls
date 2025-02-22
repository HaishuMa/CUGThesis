% !TEX TS-program xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-
% vim: set fenc=utf-8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  FileName: cugthesis.cls
%%  Author:   Timozer
%%  E-mail:   zhenyuwang94@gmail.com
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{cugthesis}[2018/03/13 Version 0.1 China University of Geosciences Thesis Template]

\newif\ifcug@doctor\cug@doctorfalse
\newif\ifcug@master\cug@mastertrue  % default the student's degree is master
\newif\ifcug@masterprofulltime\cug@masterprofulltimefalse
\newif\ifcug@masterpronofulltime\cug@masterpronofulltimefalse
\newif\ifcug@bachelor\cug@bachelorfalse

\newif\ifcug@bib@style@sec\cug@bib@style@secfalse

\newif\ifcug@toc@fig@show\cug@toc@fig@showfalse
\newif\ifcug@toc@tab@show\cug@toc@tab@showfalse

\DeclareOption{doctor}{\cug@doctortrue\cug@masterfalse\cug@masterprofulltimefalse\cug@masterpronofulltimefalse\cug@bachelorfalse}
\DeclareOption{master}{\cug@mastertrue\cug@doctorfalse\cug@masterprofulltimefalse\cug@masterpronofulltimefalse\cug@bachelorfalse}
\DeclareOption{masterprofulltime}{\cug@masterprofulltimetrue\cug@doctorfalse\cug@masterfalse\cug@masterpronofulltimefalse\cug@bachelorfalse}
\DeclareOption{masterpronofulltime}{\cug@masterpronofulltimetrue\cug@doctorfalse\cug@masterfalse\cug@masterprofulltimefalse\cug@bachelorfalse}
\DeclareOption{bachelor}{\cug@bachelortrue\cug@doctorfalse\cug@masterfalse\cug@masterprofulltimefalse\cug@masterpronofulltimefalse}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}} % I don't want you to pass options to the ctexbook class

\DeclareOption{bibsec}{\cug@bib@style@sectrue}

\DeclareOption{figtoc}{\cug@toc@fig@showtrue}
\DeclareOption{tabtoc}{\cug@toc@tab@showtrue}
\ProcessOptions\relax

\LoadClass[ scheme=chinese, heading=true, %nofonts,
    12pt, utf8, a4paper, punct, fancyhdr, twoside, openany,
    amstex]{ctexbook}

%%%%%%%%%%%%%%%%%%%%%%% Load Packages %%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{xifthen, xparse, xstring, fancyhdr, etoolbox}

\RequirePackage{amstext, amsmath, amssymb, amsfonts}
\RequirePackage{mathrsfs, bm, mathtools}

\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}

\RequirePackage{array, longtable, makecell, tabu, booktabs, multirow}

\RequirePackage{enumitem} % 修改列表样式

%------------------------------------------
\RequirePackage{cugthesisfont}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{%
    space=auto,
    autoindent=true,
    chapter={%
        afterindent=true,
        pagestyle=cug@pagestyle,
        aftername={\quad},
        format={\centering\sffamily\bfseries\cug@sanhao},
        beforeskip={2ex},
        afterskip={2ex},
        lofskip={0pt},
        lotskip={0pt},
% https://tex.stackexchange.com/questions/121879/remove-spacing-between-per-chapter-figures-in-lof
% list of figures and list of tables reduce the space between chapters
% for ctexbook class, we can use lofskip lotskip to set the space
% \patchcmd{<cmd>}{<search>}{<replace>}{<succes>}{<failure>}
%\patchcmd{\@chapter}{\CTEX@addloflotskip{chapter}}{}{}{} % lof lot
    },
    section={%
        afterindent=true,
        aftername={\quad},
        format={\centering\sffamily\bfseries\cug@sihao},
        beforeskip={1ex},
        afterskip={1ex},
    },
    subsection={%
        afterindent=true,
        aftername={\quad},
        format={\flushleft\sffamily\cug@xiaosi},
        beforeskip={1ex},
        afterskip={1ex},
    },
    subsubsection={%
        afterindent=true,
        format={\flushleft\sffamily\cug@xiaosi},
        beforeskip={1ex},
        afterskip={1ex},
    },
    %paragraph/afterindent=true,
    appendix/numbering = true,
    appendix/name = {附录~}, % {前, 后}
    appendix/number = {\sffamily \Alph{chapter}},
}

\setlist{labelindent=\parindent, leftmargin=*}
%--------------- Page Layout ---------------
\RequirePackage[a4paper, 
    marginparwidth=0pt, marginparsep=0pt,
    top=3cm, bottom=3cm, left=3cm, right=3cm, 
    headheight=2.5cm, headsep=10pt, footskip=2cm]{geometry}
%-------------------------封面制作---------------------------
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

\def\cug@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{%
        \expandafter\gdef\csname cug@#1\endcsname{##1}
    }
    \csname #1\endcsname{}
}

\cug@define@term{@titlelogo}
\cug@define@term{@entitlelogo}
%\cug@define@term{title}
\cug@define@term{entitle}
\newcommand{\cugthesistitle}[2]{%
    \title{#1}
    \entitle{#2}
}
%\cug@define@term{author}
\cug@define@term{enauthor}
\newcommand{\cugthesisauthor}[2]{%
    \author{#1}
    \enauthor{#2}
}
\cug@define@term{studentid}
\cug@define@term{major}
\cug@define@term{enmajor}
\newcommand{\cugthesismajor}[2]{%
    \major{#1}
    \enmajor{#2}
}
\cug@define@term{degree}
\cug@define@term{endegree}
\newcommand{\cugthesisdegree}[2]{%
    \degree{#1}
    \endegree{#2}
}
\cug@define@term{teacher}
\cug@define@term{supervisor}
\newcommand{\cugthesisteacher}[2]{%
    \teacher{#1}
    \supervisor{#2}
}
\cug@define@term{teachert}
\cug@define@term{supervisort}
\newcommand{\cugthesisteachertwo}[2]{%
    \teachert{#1}
    \supervisort{#2}
}
\cug@define@term{educatingunit}
\ifcug@masterpronofulltime
    \cug@define@term{corporatementor}
\fi
\RequirePackage{zhnumber}
\newcommand{\cugthesisdate}[2]{%
    \date{\zhdigits{#1}年\zhdigits{#2}月}
}
%\cug@define@term{date}
\newcommand{\cug@degree@cn}{硕士}
\newcommand{\cug@degree@en}{Master}
\newcommand{\cug@info@table@majorname}{学科专业}
\newcommand{\cug@info@entable@majorname}{Major}
\newcommand{\cug@degree@name@cn}{%
    \ifx\cug@degree\empty
        \cug@major
    \else
        \cug@degree
    \fi
}
\newcommand{\cug@degree@name@en}{
    \ifx\cug@endegree\empty
        \cug@enmajor
    \else
        \cug@endegree
    \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifcug@doctor
    \@titlelogo{博士学位论文}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Doctor Degree of \cug@degree@name@en} 
    \renewcommand{\cug@degree@cn}{博士}
    \renewcommand{\cug@degree@en}{Ph.D.}
\fi
\ifcug@master
    \@titlelogo{硕士学位论文}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Master Degree of \cug@degree@name@en} 
\fi
\ifcug@masterprofulltime
    \@titlelogo{硕士专业学位论文（全日制）}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Full-Time Master of Professional Degree of \\ \cug@degree@name@en} 
    \renewcommand{\cug@info@table@majorname}{专业学位类型}
    \renewcommand{\cug@info@entable@majorname}{Professional Degree Type}
\fi
\ifcug@masterpronofulltime
    \@titlelogo{硕士专业学位论文（非全日制）}
    \@entitlelogo{A Dissertation Submitted to China University of Geosciences \\ For the Part-Time Master of Professional Degree of \\ \cug@degree@name@en} 
    \renewcommand{\cug@info@table@majorname}{专业学位类型}
    \renewcommand{\cug@info@entable@majorname}{Professional Degree Type}
\fi
\ifcug@bachelor %在这里修改英文页
    \@titlelogo{网络化过程控制系统课程报告}
    \@entitlelogo{A course report Submitted to School of Automation, China University of Geosciences}
    \renewcommand{\cug@degree@cn}{学士}
    \renewcommand{\cug@degree@en}{Bachelor}
\fi

\newcommand{\cug@info@table@item}[2]{
    \makebox[6.5em][s]{#1} & \makebox[8em][l]{#2} & \\
}
\newcommand{\cug@info@table}{%
    \begin{tabular}{clc}
        \cug@info@table@item{姓名:}{\@author}
        \cug@info@table@item{\cug@info@table@majorname:}{\cug@major}
        \cug@info@table@item{指导教师:}{\cug@teacher}
        \ifx\cug@teachert\empty
        \else
            \cug@info@table@item{\phantom{指导教师:}}{\cug@teachert}
        \fi
        \ifcug@masterpronofulltime
            \cug@info@table@item{企业导师:}{\cug@corporatementor}
        \fi
        \cug@info@table@item{培养单位:}{\cug@educatingunit}
    \end{tabular}
}
\newcommand{\cug@info@entable}{% 调整英文信息的宽度{xxem}
    \begin{tabular}{> 
    {\raggedleft}p{.4\textwidth}p{.45\textwidth}p{.15\textwidth}}
        \cug@degree@en\ Candidate:\, & \cug@enauthor &\\
        \cug@info@entable@majorname:\,& \cug@enmajor &\\
        Supervisor:\,& \ifx\cug@supervisort\empty\cug@supervisor\else\multirow[t]{2}{12em}{\cug@supervisor \\\cug@supervisort}\fi &
    \end{tabular}
}

%--------------- Title Page ----------------
\newcommand{\cug@make@title}{
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{center}\leavevmode
            \ifcug@bachelor
                {\cug@sanhao{学校代码: 10491 \hfill 本科生学号: \cug@studentid }}
            \else
                {\cug@sanhao{学校代码: 10491 \hfill 研究生学号: \cug@studentid }}
            \fi
            \vspace*{2\baselineskip}
            {\par \cug@yihao \bfseries 中国地质大学自动化学院\\ \cug@@titlelogo \par} %这里改单位名称
            \vspace*{2.5\baselineskip}
            {\par \cug@erhao \sffamily \bfseries \@title \par} %
            \vfill
            {\cug@sanhao \cug@info@table}
            \vfill
            {\cug@sanhao{\@date}}%
            \vspace*{\baselineskip}
        \end{center}
        % \clearpage %title页后跟一个空白页
        \thispagestyle{empty}
    \end{titlepage}
}
%\renewcommand\arraystretch{1} % 将行距还原

\newcommand{\cug@make@entitle}{%
    % \cleardoublepage  %title页后跟一个空白页
    \setmainfont{Times New Roman}
    \thispagestyle{empty}
    \begin{center}
        \leavevmode
        \vspace*{\baselineskip}
        {\par \cug@sanhao \cug@@entitlelogo \par}
        \vfill
        {\par \cug@erhao \bfseries \cug@entitle \par}
        \vfill
        {\cug@sanhao \cug@info@entable}
        \vfill
        {\cug@sanhao 
            School of Automation \\
            China University of Geosciences \\
            Wuhan 430074 P.R. China
        }
        \vspace*{\baselineskip}
    \end{center}
    \clearpage
    \thispagestyle{empty}
}
\newlength{\oldbaselineskip}
\newcommand{\cug@make@extrapages}[1]{
    \cug@define@term{@extrapages@type}
    \newtoks\@extrapages@content 
    \cug@define@term{@extrapages@signature}
    \ifnum#1=1
        \@extrapages@type{原创性声明}
        \@extrapages@content{ 
            本人郑重声明：本人所呈交的\cug@degree@cn{}学位论文《 \@title 》，是本人在导师的指导下，
            在中国地质大学（武汉）攻读\cug@degree@cn{}学位期间独立进行研究工作所取得的成果。
            论文中除已注明部分外不包含他人已发表或撰写过的研究成果，
            对论文的完成提供过帮助的有关人员已在文中说明并致以谢意。 

            本人所呈交的 \cug@degree@cn{} 学位论文没有违反学术道德和学术规范，没有侵权行为，
            并愿意承担由此而产生的法律责任和法律后果。

        }
        \@extrapages@signature{学位论文作者签名}
    \else 
        \ifnum#1=2
            \@extrapages@type{导师承诺书}
            \@extrapages@content{
                本人郑重承诺：本人所指导的\cug@degree@cn{}学位论文《 \@title 》是在本人的指导下，
                研究生在中国地质大学（武汉）攻读\cug@degree@cn{}学位期间独立进行研究工作所取得的成果，论文由研究生独立完成。 

                研究生所呈交的\cug@degree@cn{}学位论文没有违反学术道德和学术规范，没有侵权行为， 
                并愿意承担由此而产生的与导师相关的责任和后果。 

            }
            \@extrapages@signature{指导老师（签字）}
        \else 
            \ifnum#1=3
                \@extrapages@type{使用授权书}
                \@extrapages@content{
                    本人授权中国地质大学（武汉）可采用影印、缩印、数字化或其它复制手段保存本学位论文；
                    学校可向国家有关部门或机构送交本学位论文的电子版全文，编入有关数据库进行检索、
                    下载及文献传递服务；同意在校园网内提供全文浏览和下载服务。

                    涉密论文解密后适用于本授权书。

                }
                \@extrapages@signature{学位论文作者签名}
            \else
                \ClassError{CUGThesis}{Class Internal Error, In command makeextrapages. I don't know which page to generate.}{}
            \fi
        \fi
    \fi
    \cleardoublepage % 显示空白页
    \vskip \baselineskip
    \ifcug@bachelor
        {\sffamily\bfseries \cug@sanhao{中国地质大学（武汉）本科生学位论文\cug@@extrapages@type}}
    \else
        {\sffamily\bfseries \cug@sanhao{中国地质大学（武汉）研究生学位论文\cug@@extrapages@type}}
    \fi
    \vskip 1.5\baselineskip%%
    { \cug@sihao \the\@extrapages@content }
    \vskip 1.5\baselineskip
    \begin{flushright}
        \cug@sihao
        {\cug@@extrapages@signature: \makebox[4em][l]{}}
        \\
        {\makebox[3.35em][s]{日期:}~\makebox[9em][r]{\qquad 年 \quad 月 \quad 日}}
    \end{flushright}
    \clearpage
}
\newcounter{cug@authorcv@section}
\newcommand{\cugauthorcvsection}[1]{%
    \stepcounter{cug@authorcv@section}
    {\par \sffamily\bfseries \noindent \chinese{cug@authorcv@section}、 #1}\par
}
\newcommand{\cugauthorcvinfoitem}[3]{%
    \hspace{2.6em} \makebox[3em][r]{#1} -- \makebox[3em][l]{#2}\quad  #3；\hfill\par 
}
\newcommand{\cug@make@authorcv}{%
    \cleardoublepage
    \leavevmode 
    \vspace*{\baselineskip}
    {\hfill{\cug@sanhao\sffamily\bfseries 作者简介}\hfill}
    \vspace*{\baselineskip}
    {\setlength{\oldbaselineskip}{\baselineskip}\setlength{\baselineskip}{20pt}
        \input{authorcv}
     \setlength{\baselineskip}{\oldbaselineskip}}
    \cleardoublepage
}

\newtoks\cug@abstract
\newtoks\cug@enabstract
\newtoks\cug@keywords
\newtoks\cug@enkeywords
\newcommand{\cugabstract}[2]{%
    \cug@abstract{#1}
    \cug@enabstract{#2}
}
\newcommand{\cugkeywords}[2]{%
    \cug@keywords{#1}
    \cug@enkeywords{#2}
}

\newcommand{\cug@make@abstract}{%
    % \cleardoublepage  % 加入空白页
    \vspace*{2ex}%
    \begin{center}
    {\sffamily\bfseries\cug@sanhao 摘\quad 要}
    \end{center}\par
    {\cug@xiaosi
    \the\cug@abstract 
    }
    \vskip .5\baselineskip 
    \noindent
    {\cug@xiaosi {\bfseries 关键词：}\hskip0.5em \the\cug@keywords}
    \clearpage 
}
\newcommand{\cug@make@enabstract}{%
    % \cleardoublepage % 加入空白页
    \vspace*{2ex}%
    \begin{center}
    {\sffamily\bfseries\setmainfont{Times New Roman}\cug@sanhao Abstract}
    \end{center}\par
    {\setmainfont{Times New Roman}
    \cug@xiaosi
    \the\cug@enabstract}
    \vskip .5\baselineskip 
    \noindent
    {\setmainfont{Times New Roman}\cug@xiaosi {\bfseries Keywords:}\setmainfont{Times New Roman}\hskip0.5em \the\cug@enkeywords}
    \clearpage 
}
%%%%%%%%%%%%%%%% List of Contents Format %%%%%%%%%%%%%%%%%%
\RequirePackage[titles]{tocloft}
\tocloftpagestyle{empty}
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftchapindent}{0em}
\setlength{\cftsecindent}{1.2\ccwd}
\setlength{\cftsubsecindent}{2.5\ccwd}
\setlength{\cftsubsubsecindent}{3.8\ccwd}
\renewcommand{\cftchapfont}{\cug@sihao}
\renewcommand{\cftsecfont}{\cug@xiaosi}
\renewcommand{\cftsubsecfont}{\cug@xiaosi}
\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------ 目录中的超链接(pdf 文档) ----------------------
\RequirePackage[unicode=true, pdfusetitle,
    bookmarks=true, bookmarksnumbered=false,
    bookmarksopen=false, breaklinks=false,
    pdfborder={0 0 1}, hidelinks=true,
    backref=false, colorlinks=false]{hyperref}
\RequirePackage{url}
\expandafter\def\expandafter\UrlBreaks\expandafter{\UrlBreaks%  save the current one
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j%
    \do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t%
      \do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D%
        \do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N%
          \do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X%
            \do\Y\do\Z\do\*\do\-\do\~\do\'\do\"\do\-}

\fancypagestyle{cug@frontmatter}{%
    \pagestyle{fancy}
    \fancyhf{}
    \fancyfoot[C]{\cug@wuhao \thepage}
    \renewcommand{\headrulewidth}{0pt}
}
\fancypagestyle{cug@pagestyle}{% 每一页的页眉
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CO]{\cug@wuhao 中国地质大学自动化学院: \cug@@titlelogo}
    \fancyhead[RO, LE]{\cug@wuhao \thepage}
    \fancyhead[CE]{\cug@wuhao \@author: \@title}
    \renewcommand{\headrulewidth}{0.4pt}
}
%------ 重新定义 frontmatter, mainmatter, backmatter
\newcommand{\emptymatter}{%
    \clearpage
    \pagestyle{empty}
}

\renewcommand{\frontmatter}{%
    \clearpage
    \pagenumbering{Roman}
	\pagestyle{cug@frontmatter}
}
\renewcommand{\mainmatter}{%
    \clearpage
    \setcounter{chapter}{0}
    \pagenumbering{arabic}
    \pagestyle{cug@pagestyle}
}

\let\cug@appendix = \appendix
\renewcommand{\appendix}{
    \setcounter{chapter}{0}
    \cug@appendix 
    \@mainmattertrue
}

\newcommand{\AddChapter}[1]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{#1}
    \chapter*{#1}
}

\newcommand{\AddChapterNoToc}[1]{%
    \phantomsection
    \chapter*{#1}
}
\newcommand{\cugthesisacknowledgements}{%
    \phantomsection
    \chapter{致谢}
}
\newcommand{\cugthesisbib}[1]{%
    \cleardoublepage 
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    \bibliography{#1}
}

% \RequirePackage{cleveref}
% \cref{label, label, ...}
% \crefrange{}{}
% \cpageref{label, label, ...}
% \cpagerefrange{label}{label}
% maybe i can use cleveref package to solve the problem
% \rmfamily, \sffamily, \ttfamily, \upshape, \itshape, \slshape, \scshape, \bfseries, \mdseries, \lfseries
% tex 中定义命令的语句 \def, \gdef, \edef, \xdef, \gdef -> \global\def
% \def<命令模板>{定义}
% \def\Emph#1{\bf{#1}}
% 排版文件目录树的宏包: dirtree, forest
\renewcommand{\maketitle}{%
    \cug@make@title
    \cug@make@entitle
}
\newcommand{\makeextrapages}{%
    \ifcug@bachelor
        \cug@make@extrapages{1}
    \else
        \cug@make@extrapages{1}
        \cug@make@extrapages{2}
        \cug@make@extrapages{3}
    \fi
}
\newcommand{\makeauthorcv}{%
    \cug@make@authorcv
}
\newcommand{\makeabstract}{%
        \cug@make@abstract
        \cug@make@enabstract
}

\renewcommand{\@cftmaketoctitle}{%
		\addpenalty\@secpenalty
		\vspace*{2ex}%
		\@cftpagestyle
		{\interlinepenalty\@M
		\begin{center}
		{\sffamily\bfseries\cug@sanhao\contentsname}{\cftaftertoctitle}%
		\end{center}
		\cftmarktoc
		\par\nobreak
		\vskip 2ex
		\@afterheading}%
}

\renewcommand{\tableofcontents}{%
	\@cfttocstart
	\par
	\begingroup
	\parindent\z@ \parskip\cftparskip
	\@cftmaketoctitle
	\if@cfttocbibind
	\@cftdobibtoc
	\fi
	\@starttoc{toc}%
	\endgroup
	\@cfttocfinish
}

\renewcommand{\@cftmakeloftitle}{%
		\addpenalty\@secpenalty
		\vspace*{2ex}
		\pagestyle{cug@frontmatter}
		{\interlinepenalty\@M
		\begin{center}
		{\sffamily\bfseries\cug@sanhao\listfigurename}{\cftafterloftitle}
		\end{center}
		\cftmarklof
		\par\nobreak
		\vskip 2ex
		\@afterheading}}
\renewcommand{\listoffigures}{%
		\@cfttocstart
		\par
		\begingroup
		\parindent\z@ \parskip\cftparskip
		\@cftmakeloftitle
		\if@cfttocbibind
		\@cftdobiblof
		\fi
		\@starttoc{lof}%
		\endgroup
		\@cfttocfinish}%
\renewcommand{\@cftmakelottitle}{%
		\addpenalty\@secpenalty
		\vspace*{2ex}
		\pagestyle{cug@frontmatter}
		{\interlinepenalty\@M
		\begin{center}
		{\sffamily\bfseries\cug@sanhao\listtablename}{\cftafterlottitle}
		\end{center}
		\cftmarklot
		\par\nobreak
		\vskip 2ex
		\@afterheading}}
\renewcommand{\listoftables}{%
		\@cfttocstart
		\par
		\begingroup
		\parindent\z@ \parskip\cftparskip
		\@cftmakelottitle
		\if@cfttocbibind
		\@cftdobiblot
		\fi
		\@starttoc{lot}%
		\endgroup
		\@cfttocfinish}%

\renewcommand{\contentsname}{目\quad 录}

\newcommand{\makefrontpages}{% % 创建页面时执行的命令
    \maketitle
    \emptymatter 
    % \makeextrapages 展示一些诚信页面
    % \makeauthorcv 展示cv
    \makeabstract 
    \tableofcontents 
    \thispagestyle{empty}
    \frontmatter 
        \ifcug@toc@fig@show
    	    \listoffigures 
	        \addcontentsline{toc}{chapter}{插 \quad 图}
            \ifcug@toc@tab@show
		        \let\cleardoublepage\relax
		        \let\clearpage\relax
	        \fi
        \fi
	    \ifcug@toc@tab@show
		    \listoftables
		    \addcontentsline{toc}{chapter}{表 \quad 格}
	    \fi
    \clearpage 
    \mainmatter 
}

%%%%%%%%%%%%%%%%%%% 定制列表环境, 让它们看起来更紧凑一些 %%%%%%%%%%%%%%%%%%%%
\setlist[itemize]{parsep=0pt, itemsep=0pt, topsep=0pt, rightmargin=2em, partopsep=2pt}
\setlist[enumerate]{parsep=0pt, itemsep=0pt, topsep=0pt, rightmargin=2em, partopsep=2pt}
\setlist[description]{parsep=0pt, itemsep=0pt, topsep=0pt, rightmargin=2em, partopsep=2pt}
%\AtBeginEnvironment{itemize}{\small}
%\AtBeginEnvironment{enumerate}{\small}
%\AtBeginEnvironment{description}{\small}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% The format of float's caption %%%%%%%%%%%%%%%%%%%%
\RequirePackage{caption}
\captionsetup{labelsep=quad, font={small, rm, singlespacing}, skip=10pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\oldequation=\theequation
\renewcommand{\theequation}{{\cug@wuhao\oldequation}}

% Logo
\NewDocumentCommand{\cugthesis}{}{CUGThesis}
% 参考文献
%\RequirePackage[super, sort&compress]{gbt7714}
\RequirePackage[sort&compress]{natbib}
\ifcug@bib@style@sec
\bibliographystyle{gbt7714-2005-sec}
\else
\bibliographystyle{gbt7714-2005}
\fi
\bibpunct{[}{]}{,}{s}{}{;}
\addtolength{\bibsep}{-1.5ex}
%--------------- Source Code ---------------
\endinput 
