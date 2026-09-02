<img src="https://capsule-render.vercel.app/api?type=waving&color=E64848&height=200&section=header&text=Russel%20Group%20CV&fontColor=ffffff&fontSize=60&animation=fadeIn&fontAlignY=38" width="100%"/>

# $\color[RGB]{250,100,122} Information$

This resume template has been developed with the guidance of coaches at the University of Leeds, ensuring it aligns with the standards set forth by the Russell Group in the United Kingdom.

# $\color[RGB]{250,100,122} Preview$

| <img width="1604" alt="prev" src="preview.jpg"> | <img width="1604" alt="prev2" src="preview_2.jpg"> |
| :---------------------------------------------: | :------------------------------------------------: |

# $\color[RGB]{250,100,122} Getting\ started$

The quickest way is Overleaf — a free online LaTeX editor, so there's nothing to install and edits build as you type. Prefer your own machine? Build it locally with XeLaTeX.

**Option A — Overleaf (easiest)**

Open the [hosted template](https://www.overleaf.com/latex/templates/russelresume/zqnypvvjsfvq), copy it to your account, and edit the files in `content/`. It recompiles on every change.

**Option B — Build locally**

1. Install a LaTeX distribution that includes XeLaTeX — [TeX Live](https://tug.org/texlive/) (Linux/Windows), [MacTeX](https://tug.org/mactex/) (macOS), or [MiKTeX](https://miktex.org/) (Windows).
2. Clone or download this repository.
3. From the project root, build the PDF:

   ```bash
   latexmk -xelatex resume.tex     # produces resume.pdf
   ```

   [`latexmk`](https://ctan.org/pkg/latexmk) just runs LaTeX the right number of times. No `latexmk`? Run `xelatex resume.tex` twice — the second pass resolves page numbers and links.

Only the **Publications** section needs anything extra: it uses BibLaTeX, so the `biber` tool must be present (it ships with TeX Live and MacTeX, and `latexmk` runs it for you). Not using Publications? [Turn it off](#turn-a-section-off) and you won't need `biber` at all.

# $\color[RGB]{250,100,122} Making\ it\ yours$

Everything you edit lives in `content/`. Three things cover most of it:

1. **Your details** — `content/personal-info.tex`: your name, contact details, and links (`\name`, `\email`, `\github`, …). To add a photo, uncomment the `\photo{...}` line and point it at your image (a `profile.png` is included — swap in your own).
2. **Each section's text** — the files in `content/` (one per section). Change the words; keep the commands.
3. **Which sections show, and their order** — the `\input{...}` list near the bottom of `resume.tex`. Comment a line out to hide a section; reorder the lines to reorder the CV.

### Section building blocks

When you edit a section, these are the commands it's built from:

| Section | Wrap the items in | Add each item with |
| --- | --- | --- |
| Personal Profile | `cvparagraph` | plain text |
| Education · Experience · Projects | `cventries` | `\cventry{position}{title}{location}{date}{…}` |
| Bullet points (inside an entry) | `cvitems` | `\item {…}` — plus `\cvtechskills{…}` and `\cvsoftskills{…}` for the labelled skill lines |
| Skills | `cvskills` | `\cvskill{category}{skills}` |
| Languages | `cvlanguages` | `\cvlanguage{language}{proficiency}` |
| Interests | `cvinterests` | `\cvinterest{interest}{description}` |
| Achievements | `cvhonors` | `\cvhonor{award}{event}{location}{date}` |
| Publications | `content/references.bib` | BibTeX entries, cited with `\nocite{...}` |

Two extras for richer entries: `\cvrole{position}{date}` adds another role inside a single `\cventry` (same employer, multiple titles), and `\cvproject{title}{year}{url}` is a lighter project heading with an optional link.

### Example: add a job

```latex
\begin{cventries}
  \cventry
    {Software Engineer}      % position
    {Acme Corp}              % employer
    {London, UK}             % location
    {Jan 2023 – Present}     % dates
    {
      \begin{cvitems}
        \item {Shipped the feature that did the thing, used by N people.}
        \cvtechskills{Python, PostgreSQL, Docker}
        \cvsoftskills{Mentoring, Communication}
      \end{cvitems}
    }
\end{cventries}
```

### Turn a section off

Don't need a section? Comment out its line in `resume.tex`:

```latex
% \input{content/publications.tex}
```

For **Publications** specifically, also comment out `\addbibresource{content/references.bib}` in the preamble — then the build no longer needs `biber`.

### Change the look

- **Highlight colour** — `\colorlet{russell}{russell-black}` in `resume.tex`. Swap in `russell-red`, `russell-skyblue`, `russell-emerald`, … or define your own.
- **Margins** — the `\geometry{...}` line in `resume.tex`.
- **Fonts, sizes, and section styling** — `lib/configs/fonts.tex` and `lib/configs/styles.tex`.

# $\color[RGB]{250,100,122} Structure$

The template is split into a small class loader, a reusable library, and your content:

```
resume.tex              # main file: global config + which sections to include
russell.cls             # thin class that loads everything under lib/
lib/
  configs/              # packages, page layout, colours, fonts, element styles
  commands/             # personal-info setters, utilities, shared structure (\cventry, ...)
  templates/            # section-specific building blocks (skills, achievements, ...)
  fonts/                # bundled font files
content/                # your actual CV data — edit these
  personal-info.tex     # name, contact details, socials
  header.tex            # header invocation
  footer.tex            # footer invocation
  summary.tex, education.tex, experience.tex, projects.tex, skills.tex,
  achievements.tex, publications.tex, interests.tex, languages.tex
  references.bib        # bibliography entries for the Publications section
```

To edit your CV, change the files in `content/`. To restyle the template, edit `lib/`.

# $\color[RGB]{250,100,122} Contribute$

This project is open to contributions of all kinds. Fork the repo, make your changes, and submit a pull request. Every contribution counts!

Thanks for considering contributing to this project. Let's make it awesome together!

# $\color[RGB]{250,100,122} References$

<a href="https://github.com/posquit0/Awesome-CV"><img src="https://raw.githubusercontent.com/posquit0/Awesome-CV/master/icon.png" width="60"/></a>

# $\color[RGB]{250,250,0} Chinese Language Support$

To use Chinese (or other CJK languages) in your resume:

1. Make sure you are compiling with XeLaTeX (not pdfLaTeX).
2. Uncomment the following lines in `lib/configs/packages.tex`:
   ```latex
   % \RequirePackage{xeCJK}
   % \setCJKmainfont{SimSun} % or another installed Chinese font
   ```
   You can change `SimSun` to any Chinese font installed on your system (e.g., `Noto Sans CJK SC`, `Source Han Serif SC`, etc).
3. If you want to use Chinese in your content files, just type Chinese characters directly.
4. If you encounter font errors, ensure the font name matches your system and is available to XeLaTeX.

For more details, see the xeCJK documentation: https://ctan.org/pkg/xecjk

# $\color[RGB]{250,100,122} Credits$

![avatar](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/1484002?v=4&h=50&w=50&fit=cover&mask=circle&maxage=7d)
![avatar](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/26139260?v=4&h=50&w=50&fit=cover&mask=circle&maxage=7d)
![avatar](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/13283410?v=4&h=50&w=50&fit=cover&mask=circle&maxage=7d)

<img src="https://capsule-render.vercel.app/api?type=waving&color=E64848&height=100&section=footer" width="100%"/>
