% --------------------------------------------------
% 國立暨南國際大學碩博士論文模板
% National Chi Nan University (NCNU) Thesis Template
% --------------------------------------------------
% Version       : 1.0
% Author        : Eric <ncnu110356511@gmail.com>
% Repository    : https://github.com
% Document      : https://
% Last Updated  : 2025.02.01

% --------------------------------------------------
% 01 類別宣告（Class Declaration）
% --------------------------------------------------

% 告知編譯器當前的 LaTeX 版本
% Must indicate what's the release of LaTeX we are using.
\NeedsTeXFormat{LaTeX2e}

% 定義類別名稱與敘述
% Define the name and description of class.
\ProvidesClass{ncnuThesis}[2025/01/16 v1.0 NCNU Thesis Template]

% --------------------------------------------------
% 02 基礎設定（Basic Settings）
% --------------------------------------------------

% [引入套件]
% Include required packages for basic settings.

\RequirePackage{kvdefinekeys, kvsetkeys, kvoptions}
\RequirePackage{iftex}
\RequirePackage{ifthen}

% [定義變數]
% Define essential variables.

% 變數: 路徑
% Variables: Path
\newcommand{\ncnu@path@font}{./fonts/english/}
\newcommand{\ncnu@path@cjkfont}{./fonts/chinese/}

% 變數: 中文翻譯
% Variables: Translation (Chinese)
\newcommand{\ncnu@verificationletter@zh}{口試委員審定書}
\newcommand{\ncnu@tableofcontents@zh}{目次}
\newcommand{\ncnu@listoffigures@zh}{圖目次}
\newcommand{\ncnu@listoftables@zh}{表目次}
\newcommand{\ncnu@denotation@zh}{符號列表}
\newcommand{\ncnu@bibliography@zh}{參考文獻}
\newcommand{\ncnu@acknowledgement@zh}{致謝詞}
\newcommand{\ncnu@abstract@zh}{摘要}
\newcommand{\ncnu@keyword@zh}{關鍵字：}
\newcommand{\ncnu@kwsymbol@zh}{、}
\newcommand{\ncnu@appendix@zh}{附錄}
\newcommand{\ncnu@figurename@zh}{圖}
\newcommand{\ncnu@tablename@zh}{表}

\newcommand{\ncnu@titlechapter@zh}{第\CJKnumber{\thechapter}章}
\newcommand{\ncnu@titlechaptertoc@zh}{第\CJKnumber{\thecontentslabel}章}

% 變數: 英文翻譯
% Variables: Translation (English)
\newcommand{\ncnu@verificationletter@en}{Verification Letter from the Oral Examination Committee}
\newcommand{\ncnu@tableofcontents@en}{Contents}
\newcommand{\ncnu@listoffigures@en}{List of Figures}
\newcommand{\ncnu@listoftables@en}{List of Tables}
\newcommand{\ncnu@denotation@en}{Denotation}
\newcommand{\ncnu@bibliography@en}{References}
\newcommand{\ncnu@acknowledgement@en}{Acknowledgements}
\newcommand{\ncnu@abstract@en}{Abstract}
\newcommand{\ncnu@keyword@en}{Keywords:~}
\newcommand{\ncnu@kwsymbol@en}{,~}
\newcommand{\ncnu@appendix@en}{Appendix}
\newcommand{\ncnu@figurename@en}{Figure}
\newcommand{\ncnu@tablename@en}{Table}

\newcommand{\ncnu@titlechapter@en}{Chapter~\thechapter}
\newcommand{\ncnu@titlechaptertoc@en}{Chapter~\thecontentslabel}

% 變數: 版面設定
% Variables: Layouts
\newcommand{\ncnu@geometry@main}{top=3cm, bottom=3cm, left=3cm, right=3cm}
\newcommand{\ncnu@geometry@cover}{top=3cm, bottom=3cm, left=3cm, right=3cm}

\newcommand{\ncnu@tocvspace}{1em}
\newcommand{\ncnu@tocchaptersize@zh}{4.5em}
\newcommand{\ncnu@tocchaptersize@en}{5.5em}

\newcommand{\ncnu@tocsecindent@zh}{1.5em}
\newcommand{\ncnu@tocsecnumwidth@zh}{3.0em}
\newcommand{\ncnu@tocsubsecindent@zh}{3.0em}
\newcommand{\ncnu@tocsubsecnumwidth@zh}{3.0em}

\newcommand{\ncnu@tocsecindent@en}{2.5em}
\newcommand{\ncnu@tocsecnumwidth@en}{3.0em}
\newcommand{\ncnu@tocsubsecindent@en}{3.0em}
\newcommand{\ncnu@tocsubsecnumwidth@en}{3.0em}

% [定義命令]
% Define essential commands.

% 命令: 錯誤訊息
% Command: Error and Warning Messages
%
\newcommand{\ncnu@error}[1]{
  \ClassError{ntuthesis}{#1}{}
}

\newcommand{\ncnu@warning}[1]{
  \ClassWarning{ntuthesis}{#1}
}

% 命令: 鍵值設定
% Command: Key Value Options
%
\SetupKeyvalOptions{
  family=ntu,
  prefix=ncnu@,
  setkeys=\kvsetkeys
}

\newcommand{\ntusetup}{
  \kvsetkeys{ntu}
}

\newcommand{\ncnu@define@key}[1]{
  \kvsetkeys{ncnu@key}{#1}
}

\kv@set@family@handler{ncnu@key}{%
  \@namedef{ncnu@#1@@name}{#1}%
  \def\ncnu@@default{}%
  \def\ncnu@@choices{}%
  \kv@define@key{ncnu@value}{name}{%
    \@namedef{ncnu@#1@@name}{##1}%
  }%
  \kv@define@key{ncnu@value}{code}{%
    \@namedef{ncnu@#1@@code}{##1}%
  }%
  \@namedef{ncnu@#1@@check}{}%
  \@namedef{ncnu@#1@@code}{}%
  \@namedef{ncnu@#1@@hook}{%
    \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
      \@nameuse{ncnu@#1@@code}%
    \else
      \AtEndOfClass{%
        \@nameuse{ncnu@#1@@code}%
      }%
    \fi
  }%
  \kv@define@key{ncnu@value}{choices}{%
    \def\ncnu@@choices{##1}%
    \@namedef{ncnu@#1@@reset}{}%
    \@namedef{ncnu@#1@@check}{%
      \@ifundefined{%
        ifncnu@\@nameuse{ncnu@#1@@name}@\@nameuse{ncnu@\@nameuse{ncnu@#1@@name}}%
      }{%
        \ncnu@error{Invalid value "#1 = \@nameuse{ncnu@\@nameuse{ncnu@#1@@name}}"}%
      }%
      \@nameuse{ncnu@#1@@reset}%
      \@nameuse{ncnu@\@nameuse{ncnu@#1@@name}@\@nameuse{ncnu@\@nameuse{ncnu@#1@@name}}true}%
    }%
  }%
  \kv@define@key{ncnu@value}{default}{%
    \def\ncnu@@default{##1}%
  }%
  \kvsetkeys{ncnu@value}{#2}%
  \@namedef{ncnu@\@nameuse{ncnu@#1@@name}}{}%
  \kv@set@family@handler{ncnu@choice}{%
    \ifx\ncnu@@default\@empty
      \def\ncnu@@default{##1}%
    \fi
    \expandafter\newif\csname ifncnu@\@nameuse{ncnu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname ncnu@#1@@reset\endcsname{%
      \@nameuse{ncnu@\@nameuse{ncnu@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{ncnu@choice}{\ncnu@@choices}%
  \expandafter\let\csname ncnu@\@nameuse{ncnu@#1@@name}\endcsname\ncnu@@default
  \expandafter\ifx\csname ncnu@\@nameuse{ncnu@#1@@name}\endcsname\@empty\else
    \@nameuse{ncnu@#1@@check}%
    \@nameuse{ncnu@#1@@hook}%
  \fi
  \kv@define@key{ntu}{#1}{%
    \@namedef{ncnu@\@nameuse{ncnu@#1@@name}}{##1}%
    \@nameuse{ncnu@#1@@check}%
    \@nameuse{ncnu@#1@@hook}%
  }%
}

\newcommand\ncnu@option@hook[2]{
  \expandafter\g@addto@macro\csname ncnu@#1@@code\endcsname{#2}
}

% 命令: 鍵值陣列使用
% Command: Retrieve the array value with key-value pair.
%
\newcommand\ncnu@clist@use[2]{%
  \def\ncnu@@tmp{}%
  \kv@set@family@handler{ncnu@clist}{%
    \ifx\ncnu@@tmp\@empty
      \def\ncnu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \kvsetkeys@expandafter{ncnu@clist}{#1}%
}

% 命令: 日期格式
% Commands: Data Formating
%
\newcommand{\ncnu@format@date}[2]{%
  \edef\ncnu@@date{#2}%
  \def\ncnu@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\ncnu@@process@date\ncnu@@date\@nil
}
\newcommand\ncnu@date@zh@short[3]{\zhdigits{#1}年\zhnumber{#2}月}
\newcommand\ncnu@date@zh@digit[3]{\the\numexpr#1-1911\relax~年~\number#2~月~\number#3~日}
\newcommand\ncnu@date@zh@digit@short[3]{\the\numexpr#1-1911\relax~年~\number#2~月}
%\newcommand\ncnu@date@en@short[3]{\monthname[#2], #1}  % 英文月年之間無逗號
\newcommand\ncnu@date@en@short[3]{#2/#1} 
%\newcommand\ncnu@date@en@short[3]{\monthname[#2] #1}   % 英文月年之間有逗號

\newcommand{\ncnu@setgeometry}[1]{\expandafter\newgeometry\expandafter{#1}}

% --------------------------------------------------
% 03 編譯檢查（Compile Checking）
% --------------------------------------------------

\ifXeTeX\else
  \ncnu@error{XeLaTeX is required to compile this document.}
\fi

% --------------------------------------------------
% 04 論文設定（Document Configs）
% --------------------------------------------------

% [文檔選項]
% Configs from options
%
\ncnu@define@key{
  degree = {
    choices = {
      master,
      doctor,
    },
    default = master,
    name    = degreeset
  },
  language = {
    choices = {
      chinese,
      english,
    },
    default = chinese,
  },
  fontset = {
    choices = {
      default,
      system,
      overleaf,
      template,
    },
    default = default,
  },
  watermark = {
    choices = {
      true,
      false,
    },
    default = true,
  },
  doi = {
    choices = {
      true,
      false,
    },
    default = true,
  },
}

% [設定檔案]
% Configs from ntusetup.tex
%
\ncnu@define@key{
  university = {
    default = {國立臺灣大學},
  },
  university* = {
    default = {National Taiwan University},
    name    = university@en,
  },
  college = {
    default = {工學院},
  },
  college* = {
    default = {College of Engineering},
    name    = college@en,
  },
  institute = {
    default = {工業工程學研究所},
  },
  institute* = {
    default = {Institute of Industrial Engineering},
    name    = institute@en,
  },
  title = {
    default = {論文標題},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {論文作者},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  ID = {
    default = {學號},
  },
  advisor = {
    default = {指導教授},
  },
  advisor* = {
    default = {Name of supervisor},
    name    = advisor@en,
  },
  DOI = {
    default = {DOI Number},
  },
  keywords = {
    default = {關鍵字},
  },
  keywords* = {
    default = {Keywords},
    name    = keywords@en,
  },
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  oral-date = {
    name    = oraldate,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
}

% --------------------------------------------------
% 06 選項設定（Options Settings）
% --------------------------------------------------

% 繼承類別選項（將未定義的傳給基礎文檔）
% Option Declaration (pass tundefined options to father class)
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{report}
}

% 處理選項並載入基礎文檔
% Terminates the options processing and loads the basic class.
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper, 12pt]{report}


% 根據設定值賦值變數
% Assign variables according to configs.
\ifthenelse{\equal{\ncnu@degreeset}{master}}{
  \newcommand{\ncnu@degree}{碩士}
  \newcommand{\ncnu@degree@en}{Master}
  \newcommand{\ncnu@type}{論文}
  \newcommand{\ncnu@type@en}{Thesis}
}

\ifthenelse{\equal{\ncnu@degreeset}{doctor}}{
  \newcommand{\ncnu@degree}{博士}
  \newcommand{\ncnu@degree@en}{Doctoral}
  \newcommand{\ncnu@type}{論文}
  \newcommand{\ncnu@type@en}{Dissertation}
}

\ifthenelse{\equal{\ncnu@language}{chinese}}{
  % 設定中文
  \newcommand{\ncnu@titlechapter}{\ncnu@titlechapter@zh}
  \newcommand{\ncnu@titlechaptertoc}{\ncnu@titlechaptertoc@zh}
  \newcommand{\ncnu@tocchaptersize}{\ncnu@tocchaptersize@zh}
  \newcommand{\ncnu@tocsectionindent}{\ncnu@tocsectionindent@zh}
  \newcommand{\ncnu@tocsubsectionindent}{\ncnu@tocsubsectionindent@zh}
  \newcommand{\ncnu@acknowledgement}{\ncnu@acknowledgement@zh}
  \newcommand{\ncnu@tableofcontents}{\ncnu@tableofcontents@zh}
  \newcommand{\ncnu@listoffigures}{\ncnu@listoffigures@zh}
  \newcommand{\ncnu@listoftables}{\ncnu@listoftables@zh}
  \newcommand{\ncnu@denotation}{\ncnu@denotation@zh}
  \newcommand{\ncnu@verificationletter}{\ncnu@verificationletter@zh}
  \newcommand{\ncnu@bibliography}{\ncnu@bibliography@zh}
  \newcommand{\ncnu@appendix}{\ncnu@appendix@zh}
  \newcommand{\ncnu@figurename}{\ncnu@figurename@zh}
  \newcommand{\ncnu@tablename}{\ncnu@tablename@zh}

  % 設定單位
  \newcommand{\ncnu@tocsecindent}{\ncnu@tocsecindent@zh}
  \newcommand{\ncnu@tocsecnumwidth}{\ncnu@tocsecnumwidth@zh}
  \newcommand{\ncnu@tocsubsecindent}{\ncnu@tocsubsecindent@zh}
  \newcommand{\ncnu@tocsubsecnumwidth}{\ncnu@tocsubsecnumwidth@zh}
}

\ifthenelse{\equal{\ncnu@language}{english}}{
  % 設定英文
  \newcommand{\ncnu@titlechapter}{\ncnu@titlechapter@en}
  \newcommand{\ncnu@titlechaptertoc}{\ncnu@titlechaptertoc@en}
  \newcommand{\ncnu@tocchaptersize}{\ncnu@tocchaptersize@en}
  \newcommand{\ncnu@tocsectionindent}{\ncnu@tocsectionindent@en}
  \newcommand{\ncnu@tocsubsectionindent}{\ncnu@tocsubsectionindent@en}
  \newcommand{\ncnu@acknowledgement}{\ncnu@acknowledgement@en}
  \newcommand{\ncnu@tableofcontents}{\ncnu@tableofcontents@en}
  \newcommand{\ncnu@listoffigures}{\ncnu@listoffigures@en}
  \newcommand{\ncnu@listoftables}{\ncnu@listoftables@en}
  \newcommand{\ncnu@denotation}{\ncnu@denotation@en}
  \newcommand{\ncnu@verificationletter}{\ncnu@verificationletter@en}
  \newcommand{\ncnu@bibliography}{\ncnu@bibliography@en}
  \newcommand{\ncnu@appendix}{\ncnu@appendix@en}
  \newcommand{\ncnu@figurename}{\ncnu@figurename@en}
  \newcommand{\ncnu@tablename}{\ncnu@tablename@en}

  % 設定單位
  \newcommand{\ncnu@tocsecindent}{\ncnu@tocsecindent@en}
  \newcommand{\ncnu@tocsecnumwidth}{\ncnu@tocsecnumwidth@en}
  \newcommand{\ncnu@tocsubsecindent}{\ncnu@tocsubsecindent@en}
  \newcommand{\ncnu@tocsubsecnumwidth}{\ncnu@tocsubsecnumwidth@en}
}

% --------------------------------------------------
% 07 載入套件 (Include Packages)
% --------------------------------------------------

% [載入套件]
% - ifthen                      條件判斷支持
% - xparse                      定義命令
% - xeCJK                       排版中日韓(CJK)字符
% - indentfirst                 首行縮進
% - fontspec                    設定中英文字體
% - xcolor                      設定顏色
% - geometry                    設定版面大小
% - titlesec                    設定章節格式
% - titletoc, tocloft           設定目錄格式
% - fancyhdr                    設定頁首頁尾
% - ulem, CJKulem               下劃線、雙下劃線與波浪紋效果
% - setspace                    設定行距（標題內文分別設定）
% - graphicx                    插入圖片
% - tikz                        繪圖
% - eso-pic                     插入圖片於文字下方
% - pdfpages                    插入 pdf 檔案
% - tabularx                    插入表格
% - booktabs                    改善表格設置
% - array                       調整表格高度
% - longtable                   支援跨頁長表格
% - diagbox                     插入表格反斜線
% - multirow                    合併儲存格
% - amsmath, amsthm, amssymb    引入 AMS 數學環境
% - datetime                    日期格式轉換
% - CJKnumb                     中文數字轉換
% - fp, calc                    計算功能
% - hyperref                    超連結
% - paralist                    列表環境
% - footmisc                    自訂腳註符號
% - caption, subcaption         插入圖片、表格標題
% - natbib                      參考文獻
%
\RequirePackage{xparse}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{titletoc, tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
\RequirePackage{pdfpages}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{diagbox}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{datetime}
\RequirePackage{CJKnumb}
\RequirePackage{fp, calc}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{paralist}
\RequirePackage{footmisc}
\RequirePackage{caption}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{lastpage}  % 引入 lastpage 套件，顯示總頁數
\usepackage{listings} %引用程式碼

% --------------------------------------------------
% 10 套件設定 (Package Settings)
% --------------------------------------------------

% [圖表目錄]
\graphicspath{{./figures/}}

% [文章排版]
%
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setlength{\parskip}{10pt} %
\setlength{\parindent}{2em}

% [字體設定]
% - \setmainfont{}          	襯線字體
% - \setsansfont{}          	非襯字體
% - \setmonofont{}          	等寬字體
% - \setCJKmainfont{}			中文襯線字體
% - \setCJKsansfont{}			中文非襯字體
% - \setCJKmonofont{}			中文等寬字體
%

\ifthenelse{\equal{\ncnu@fontset}{default}}{
  \setmainfont{Times New Roman}[
    Path = \ncnu@path@font ,
    Extension = .ttf ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic, ]
  \setCJKmainfont{BiauKai}[
    Path = \ncnu@path@cjkfont ,
    Extension = .ttf , ]
}

\ifthenelse{\equal{\ncnu@fontset}{template}}{
  \setmainfont{Times New Roman}[
    Path = \ncnu@path@font ,
    Extension = .ttf ,
    BoldFont = *-Bold ,
    ItalicFont = *-Italic ,
    BoldItalicFont = *-BoldItalic, ]
  \setCJKmainfont{BiauKai}[
    Path = \ncnu@path@cjkfont ,
    Extension = .ttf ,
    BoldFont = Kaiti-Black, ]
}

\ifthenelse{\equal{\ncnu@fontset}{overleaf}}{
  \setmainfont{Times New Roman}
  \setsansfont{Droid Sans}
  \setmonofont{Courier New}
  \setCJKmainfont{AR PL KaitiM Big5}
  \setCJKsansfont{AR PL KaitiM Big5}
  \setCJKmonofont{AR PL KaitiM Big5}
}

% [顏色設定]
%

% [版面大小]
%
\RequirePackage{geometry}
\geometry{
  top=3cm,                % inner=3cm
  bottom=3cm,
  left=3cm,               % inner=3cm
  right=3cm               % outer=3cm
}

% [連結設定]
%
\hypersetup{
  %colorlinks=false, %colorlinks=true,
  %linkcolor=black, 
  %filecolor=gray,
  %anchorcolor=blue,
  %citecolor=blue
}

% [目錄格式]
%
\addtocontents{toc}                                         % 修改目錄樣式
%{~\hfill\textbf{Page}\par}
{}
{}
{}

% \titlecontents{標題名稱}[左間距]{標題格式}{標題內容}{無序號標題}{指引線與頁碼}[下間距]
\titlecontents{chapter}[0em]                                % 修改目錄樣式
{\addvspace{0.5em}\normalsize\bfseries\protect}
{\fboxrule=0pt\fboxsep=0pt\framebox[\ncnu@tocchaptersize][l]{\ncnu@titlechaptertoc}}
{}
{\hfill\contentspage}

\setlength{\cftbeforesecskip}{8pt}                          % 修改目錄間距
\setlength{\cftbeforesubsecskip}{8pt}

\setcounter{tocdepth}{3}                                    % 設定目錄深度
\setcounter{secnumdepth}{3}                                 % 設定編號深度

% \cftsetindents{entry}{indent}{numwidth}
\cftsetindents{section}{\ncnu@tocsecindent}{\ncnu@tocsecnumwidth}
\cftsetindents{subsection}{\ncnu@tocsubsecindent}{\ncnu@tocsubsecnumwidth}

% [頁首頁尾]
%

% [標題格式]
% 載入套件包 titlesec 設定各層標題格式
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - shape: 設定段落形狀，可選參數有 hang, block, display
% - format: 定義標題外觀，如：位置、字體大小粗細…
% - label: 定義標籤前綴標號
% - sep: 定義標號與標題內容間隔距離
% - before: 標題內容前增加文字
% - after: 標題內容後增加文字
%
\titleformat{\chapter}                      % 設置 Chapter 格式
{\centering \LARGE \bfseries}               % 定義 format \Huge
{\ncnu@titlechapter}              		        % 定義 label
{1em}                                       % 定義 sep
{}                                          % before
\titlespacing{\chapter}{0pt}{-2em}{1em}
%\titlespacing*{\section}{0em}{1em}{2em}
%\titlespacing*{\section}{左邊距}{標題上方的間距}{標題下方的間距}

% [圖表標題]
%
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\captionsetup{}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{skip=6bp}

% [引用格式]
%
\renewcommand\thesubfigure{~(\alph{subfigure})}

% --------------------------------------------------
% 08 自訂命令（Custom Commands）
% --------------------------------------------------

% [添加路徑]
\newcommand\appendgraphicspath[1]{
  \g@addto@macro\Ginput@path{#1}
}

% [中文縮進]
% - \Eindent                    縮進
% - \Enoindent                  不縮進
%

% 獲取並定義 CJK 字符寬度
\newcommand{\ncnu@CJKChar@size}{\hskip \f@size \p@}
\newdimen{\ncnu@CJKChar@size@dimen}
\settowidth{\ncnu@CJKChar@size@dimen}{\ncnu@CJKChar@size\CJKglue}

% 定義命令
\newcommand{\CJKsetfontspace}{
  \settowidth\ncnu@CJKChar@size@dimen{\ncnu@CJKChar@size\CJKglue}
  \ifthenelse{\parindent=0pt}{\relax}{\parindent2\ncnu@CJKChar@size@dimen}
}

% 縮進
\newcommand{\Eindent}{
  \CJKsetfontspace\parindent2\ncnu@CJKChar@size@dimen
}

% 不縮進
\newcommand{\Enoindent}{
  \parident\z@
}

% [插入浮水印]
% - \makewatermark{#1}{#2}      生成浮水印
%   #1 Opacity                  設置透明度
%   #2 Logo Path                校徽路徑
%
\newcommand{\makewatermark}[2]{
  \AddToShipoutPicture{
    \put(0,0){
      \parbox[b][\paperheight]{\paperwidth}{
        \vfill
        \centering
        \begin{tikzpicture}[remember picture, overlay]
          \coordinate (WM) at ([xshift=-4.325cm, yshift=-4.325cm] current page.north east);
          \node [scale=1] at (WM) {\includegraphics[width=3.65cm, height=3.65cm]{#2}};
          \filldraw [fill=white, opacity=1-\the\numexpr#1] (current page.north east) rectangle (current page.south west);
        \end{tikzpicture}
      \vfill
}}}}

% [插入數位識別]
% - \InsertDOI{#1}              生成數位識別碼
%   #1 DOI Code                 數位識別碼
%\def\firstpage{1}
\newcommand{\insertdoi}[1]{
  \AddToShipoutPicture{
    \AtPageUpperLeft{
      \fboxrule=0pt\fboxsep=0pt\framebox[\paperwidth][r]{
      \raisebox{-\paperheight}{
      \put(\LenToUnit{-1cm},\LenToUnit{1cm}){
      \fboxrule=0pt\fboxsep=0pt\framebox[0pt][r]{
        \href{http://dx.doi.org/#1}{doi:#1}
}}}}}}}


% [程式樣式]
% see https://www.sharelatex.com/learn/Code_listing
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{codebgcolor}{rgb}{0.95,0.95,0.92}

% [程式碼樣式設置]
\lstset{
  frame=single,
  backgroundcolor=\color{codebgcolor},
  commentstyle=\color{codegreen},
  keywordstyle=\color{blue},
  numberstyle=\footnotesize\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\small\setstretch{1.0},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=t,
  caption={\protect\filename@parse{\lstname}\protect\filename@base\text{.}\protect‌​\filename@ext}, 
  keepspaces=true,
  xleftmargin=1cm,
  numbers=left,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=4,
}

% [生成封面]
% Generate the cover page
%
\newcommand{\makecover}{
  \ncnu@setgeometry{\ncnu@geometry@cover}
  \pagenumbering{gobble}
  \begin{titlepage}
    \begin{singlespace}
      \begin{center}
        \fontsize{18}{27}\selectfont        
        \ncnu@university\ncnu@institute\par %\\ \ncnu@college\\

        \ncnu@degree\ncnu@type\par

        \vfill
        \ncnu@title\par\ncnu@title@en\par
        \vfill

        指導教授：\ncnu@advisor 博士

        研究生：\ncnu@author\par 

        中華民國~\ncnu@format@date{\ncnu@date@zh@digit@short}{\ncnu@date}\par
      \end{center}
    \end{singlespace}
  \end{titlepage}

  % 清除頁碼
  \clearpage
  \restoregeometry
}


% [生成口委審定書]
% Generate the verification letter page
%
\newcommand{\makeverification}{
  %\cleardoublepage
  \phantomsection
  \ncnu@setgeometry{\ncnu@geometry@main}
  \thispagestyle{empty}
  \pagenumbering{gobble}
  %\pagenumbering{roman} % 開啟口委審定書 頁碼控制(羅馬數字)
  %\addcontentsline{toc}{chapter}{\ncnu@verificationletter} % 不顯示在目錄中

  \begin{singlespace}
    %  口委審定書標題 (24, 36) (26, 39)
    %  論文題目 (20, 30)
    \begin{center}
      \fontsize{20}{30}\selectfont %24 36
      {\ncnu@university}{\ncnu@degree}{\ncnu@type}考試審定書\par

      \vfill

      \fontsize{14}{18}\selectfont %20 30
      {\ncnu@institute}\par
      %\fontsize{16}{24}\selectfont
      研究生{\ncnu@author}所提之論文\par

      \vfill
  
      {\ncnu@title}\par
      {\ncnu@title@en}\par      

      經本委員會審查，符合碩士學位論文標準。

    \end{center}
    % 口委審定書內容 (16, 24)    
  \end{singlespace}

  \vfill

  \fontsize{14}{20}\selectfont %20 30
  學位考試委員會
  \vspace{2em}
  \begin{center}

    {\hspace*{4em}}\rule{5cm}{1pt}委員兼召集人

    \rule{5cm}{1pt}委員

    \rule{5cm}{1pt}委員

    \vfill
    
    中華民國~\ncnu@format@date{\ncnu@date@zh@digit@short}{\ncnu@date}\par
  \end{center}


  % 恢復預設板型
  \clearpage  
  \restoregeometry
}


% [生成目次]
% Generate table of contents page.
%
\renewcommand{\contentsname}{\huge \vspace*{-\topskip} \centerline{\ncnu@tableofcontents}}
\newcommand{\maketableofcontents}{
  \clearpage  % 改為 \clearpage，避免插入空白頁 \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\ncnu@tableofcontents}
  \vspace*{-2cm}  
  \tableofcontents
}


\renewcommand{\listtablename}{\huge \vspace*{-\topskip} \centerline{\ncnu@listoftables}}
\newcommand{\makelistoftables}{  
  \clearpage  % 改為 \clearpage，避免插入空白頁 \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\ncnu@listoftables}
  \renewcommand{\numberline}{\tablename~\oldnumberline}
  \vspace*{-2cm}  
  \listoftables
}

\let\oldnumberline\numberline
\renewcommand{\listfigurename}{\huge \vspace*{-\topskip} \centerline{\ncnu@listoffigures}}
\newcommand{\makelistoffigures}{
  \clearpage  % 改為 \clearpage，避免插入空白頁 \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\ncnu@listoffigures}
  \renewcommand{\numberline}{\figurename~\oldnumberline}
  \vspace*{-2cm}  
  \listoffigures
}

% [正文開始]
% \mainmatter
%
\newcommand{\mainmatter}{
  \clearpage  % 改為 \clearpage，避免插入空白頁 \cleardoublepage
  \ncnu@setgeometry{\ncnu@geometry@main}
  \pagenumbering{arabic}
  \fontsize{12}{18}\selectfont %18
}

% [參考文獻]
% \refmatter
%
\newcommand{\refmatter}{
  \clearpage  % 改為 \clearpage，避免插入空白頁 \cleardoublepage
  \phantomsection
  \renewcommand{\bibname}{\ncnu@bibliography}
  \addcontentsline{toc}{chapter}{\ncnu@bibliography}
}

% [附錄]
% \appendix{NUM}{TITLE}
%
\renewcommand{\appendix}[2]{
  \chapter*{\ncnu@appendix~{#1}~---~#2}
  \phantomsection
  \addcontentsline{toc}{chapter}{\ncnu@appendix~{#1}~---~#2}
  \setcounter{section}{0}
  \renewcommand{\thechapter}{#1}
}

% --------------------------------------------------
% 09 自訂環境（Custom Environments）
% --------------------------------------------------

% [符號列表]
% Denotation Environment
%
\newenvironment{denotation}[1][2.5cm]{
\chapter*{\centering \ncnu@denotation}
\addcontentsline{toc}{chapter}{\ncnu@denotation}
\noindent
\begin{list}{}{
  \renewcommand\makelabel[1]{##1\hfill}
  \setlength{\labelwidth}{#1}                     % 符號欄寬度
  \setlength{\labelsep}{0.5cm}                    % 標籤與列表文字距離 0.5
  \setlength{\itemindent}{0cm}                    % 標籤縮進
  \setlength{\leftmargin}{\labelwidth+\labelsep}  % 標籤左邊界
  \setlength{\rightmargin}{0cm}                   % 標籤右邊界
  \setlength{\parsep}{0cm}                        % 段落間距
  \setlength{\itemsep}{18pt}                      % 標籤間距
  \setlength{\listparindent}{0cm}                 % 段落縮進
  \setlength{\topsep}{0pt}                        % 標籤與上文距離
}}{\end{list}}

% [誌謝環境]
% Acknowledgement Environment
%
\newenvironment{acknowledgement}{  
  \clearpage
  \chapter*{\centering \ncnu@acknowledgement}
  \addcontentsline{toc}{chapter}{\ncnu@acknowledgement}
  %\fontsize{12}{18}\selectfont %18
}

% [摘要環境]
% Abstract Environment
%
\renewenvironment{abstract}{
  \clearpage % 改為 \clearpage，避免插入空白頁 \cleardoublepage  
  \fontsize{12}{18}\selectfont %18  

  \noindent 論文名稱：\ncnu@title \\
  \noindent 校院系：\ncnu@university\ncnu@college\ncnu@institute \hfill 頁數：\pageref{LastPage} \\    
  \noindent 畢業時間：中華民國~\ncnu@format@date{\ncnu@date@zh@digit@short}{\ncnu@date} \hfill 學位別：\ncnu@degree \\  
  \noindent 研究生：\ncnu@author \hfill 指導教授：\ncnu@advisor 博士
  
  % 調整空間，確保標題不會被推上去
  \vspace{2em}  

  \begin{center}
      {\LARGE \textbf{\ncnu@abstract@zh}}  % 調整大小，可用 \Huge, \LARGE, \Large
  \end{center}

  \addcontentsline{toc}{chapter}{\ncnu@abstract@zh}

}{
  %\bigbreak
  %關鍵字
  \vspace{2em} 
  \noindent \textbf{\ncnu@keyword@zh}
  \ncnu@clist@use{\ncnu@keywords}{\ncnu@kwsymbol@zh}
}

\newenvironment{abstract*}{
  \clearpage  % 改為 \clearpage，避免插入空白頁 \cleardoublepage    
  \fontsize{12}{24}\selectfont %24
  %\chapter*{\centering \ncnu@abstract@en}

  \noindent Title of Thesis: \ncnu@title@en \\
  \noindent Name of Institute: \ncnu@institute@en, ~\ncnu@college@en, ~\ncnu@university@en \hfill Pages: \pageref{LastPage} \\    
  \noindent Graduation Time: \ncnu@format@date{\ncnu@date@en@short}{\ncnu@date} \hfill Degree: \ncnu@degree@en \\  
  \noindent Student Name: \ncnu@author@en \hfill Advisor Name: Dr.~\ncnu@advisor@en
  
  % 調整空間，確保標題不會被推上去
  \vspace{2em}  

  \begin{center}
      {\LARGE \textbf{\ncnu@abstract@en}}  % 調整大小，可用 \Huge, \LARGE, \Large
  \end{center}
  
  \addcontentsline{toc}{chapter}{\ncnu@abstract@en}

}{
  %\bigbreak
  \vspace{2em} 
  \noindent \textbf{\ncnu@keyword@en}
  \ncnu@clist@use{\ncnu@keywords@en}{\ncnu@kwsymbol@en}
}

% --------------------------------------------------
% 10 文檔處理（Document Processing）
% --------------------------------------------------

% 根據設定決定是否添加浮水印
% Insert watermark according to the config.
%
%\ifthenelse{\equal{\ncnu@watermark}{false}}{\makewatermark{0.25}{seal}}{}

% 根據設定決定是否添加數位標識
% Insert DOI according to the config.
%
\ifthenelse{\equal{\ncnu@doi}{true}}{\insertdoi{\ncnu@DOI}}{}

% 設定行距
% 1.2：1.5 倍行距
% 1.6：2.0 倍行距
\setstretch{1.2} %1.5

% 套用翻譯
\renewcommand{\figurename}{\ncnu@figurename}
\renewcommand{\tablename}{\ncnu@tablename}
%\pdfencrypt true