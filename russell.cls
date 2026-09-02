%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{russell}[2017/02/05 v1.6.1 russell Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%                Load configuration, commands, and templates from lib/
%-------------------------------------------------------------------------------
% Configuration: packages, page layout, colours, fonts, and element styles.
\input{lib/configs/packages.tex}
\input{lib/configs/layout.tex}
\input{lib/configs/colors.tex}
\input{lib/configs/fonts.tex}
\input{lib/configs/styles.tex}

% Commands: personal-information setters, utility helpers, and the shared
% structural building blocks (\makecvheader, \cvsection, \cventry, ...).
\input{lib/commands/personal-info.tex}
\input{lib/commands/utilities.tex}
\input{lib/commands/structure.tex}

% Templates: the section-specific building blocks. Add a file here and it
% becomes available to the content sections. Languages and Interests alias the
% Skills constructs, so skills.tex must load before them.
\input{lib/templates/achievements.tex}
\input{lib/templates/skills.tex}
\input{lib/templates/languages.tex}
\input{lib/templates/interests.tex}
\input{lib/templates/experience.tex}
\input{lib/templates/projects.tex}
\input{lib/templates/cover-letter.tex}
\input{lib/templates/publications.tex}
