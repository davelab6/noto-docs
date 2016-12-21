
# Authoring Guidelines for the Noto fonts documentation

## About

The Noto fonts documentation is generated from a Github wiki via the [Mkdocs](http://www.mkdocs.org/) static site generator. MkDocs is a super-simple engine written in Python that takes Markdown files and converts them into a HTML site. The conversion can be extended via Python plugins.

## Structure

The documentation has two forms: the **source form**, which is a Github wiki, and the **target form** which is an HTML site.

### Target: Noto docs

* https://twardoch.github.io/noto-docs/ — the user-facing HTML version of the documentation
* https://github.com/twardoch/noto-docs/tree/master/docs — the `docs/` subfolder of the Noto docs repo, for managing the HTML version

### Source: Noto docs wiki

The Noto fonts wiki is the source of the documentation, and can be edited and accessed in two ways:

* https://github.com/twardoch/noto-docs/wiki — for reading and in-browser editing on Github.com
* https://github.com/twardoch/noto-docs.wiki.git — as the git repo that you should clone inside the `srcdocs/` folder of your local Noto docs repo.

## Authoring guidelines

The source form of the docs exists as a Github wiki, which is a [Gollum](https://github.com/gollum/gollum)-based wiki system, or, more specifically, the [Github Wiki system](https://help.github.com/articles/about-github-wikis/) which is a simplified version of Gollum.

Authors should write the wiki pages in [Markdown](https://help.github.com/articles/markdown-basics/) with the [Github Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/) (GFM) extensions, and the extensions made possible by the extension modules listed below.

You can [add wiki pages via the online Github interface](https://help.github.com/articles/adding-wiki-pages-via-the-online-interface/) if possible.

If you add pages in your local repo, follow the file-naming convention for structured titles (see below).

All `.md` documents in the wiki repo must be in the main folder.

The wiki repo can be cloned locally with

```sh
git clone https://github.com/twardoch/noto-docs.wiki.git wiki
```

If you’re planning to be building the docs, you should clone the repo inside the `srcdocs/` folder of your local Noto docs repo.

You’ll get `wiki` folder with the source wiki structure (Markdown files in the main folder, images in the `img` folder). If you’re working locally, remember to **commit regularly** as others may also be working!

### Contents of each wiki page

The titles of the wiki articles (pages) that you assign in the wiki are called **systematic titles**. Each wiki page needs a systematic title, and that title should be brief and standardized. Don’t use special characters like `&` or `/` in the systematic titles! The systematic titles must be used exactly as they are written when making links to wiki pages from other wiki pages.

The systematic title of a wiki page, the filename in which the Markdown file of the page is stored, and links to this page are synchornized, for example:
* a wiki page has the systematic title `Editing OpenType features`
* that page is as the file `Editing-OpenType-features.md`
* that page and can be linked to as `[[Editing OpenType features]]`

Each wiki page should start with a blank line followed by the **display title** of the page, written in a special format:

```markdown

# {Markdown-basename} Full title of the page

```

The display title is the first heading that will appear on the page. It can be different from the systematic title, more descriptive. The portion `Markdown-basename` is optional — it should be the filename of the Markdown file (without the .md extension) in which the page is stored. This is portion in {} will be used to create HTML ids and anchors in the table of contents.

For example, if the systematic title of a page is `Merging Noto fonts` then that page could start with (remember about the blank lines before and after!):

```markdown

# {Merging-Noto-fonts} Merging multiple Noto fonts into a larger one

```

### Splitting large pages into modules

When your wiki page is growing large, consider reformatting that page into a **superpage**.

A superpage (just a fancy name we use) is a normal wiki page but it **includes** the contents of other wiki pages using the syntax: `{` followed by `!` followed by the `file-name.md` followed by `!}`. For easier editing, you can split up a large page into smaller pages (**module pages**), and then make that large page a superpage which includes the module pages.

When the documentation is built, all module pages are fully included into the superpage so that superpage forms one long HTML page. But it's easier to work and organize the editing process if you edit the module pages. Also, a module can be included in several pages, i.e. reused.

### TOC

If your page is longer and has additional structure, or if it's a superpage, you should include the code:

```markdown
[TOC]
```

right after the blank line that follows the full page title. The docs system will auto-generate an in-page table of contents (also including the contents of the included module pages).

### Manual line breaks

Markdown will merge subsequent lines into one if they end with no space or just one space. If you want to include a manual line break, end the line with **two spaces**.

### Images

Images should be added in a local Github repo, into the `img` subfolder of the wiki. You can pick the filenames for the images yourself, and pick them reasonably. User lowercase only, and dashes (-).

Small images which are in the `img` subfolder of the wiki should be inserted as follows: `![title](img/filename.png)` . (If you don't want to provide a title, use `![](img/filename.png)` .

Larger images should also include a caption:
```markdown
![title](img/filename.png)
:  Caption for the image
```
for example:
```markdown
![Noto fonts family map](img/noto-fonts-family-map.png)
:  Noto fonts family map
```

* External images should be inserted as follows: `![title](url.png)` (with the caption formatted as above).

### Links

* Internal links to other wiki pages should be added like this: `[[systematic page title]]`
* External WWW links should be added like this: `[title](url)`
* To force an external link to open in a new browser window, use `[title](url){: target="_blank" }`

### Callout boxes

The [admonition](https://pythonhosted.org/Markdown/extensions/admonition.html) module allows us to insert callout boxes for things like **Note** or **Important**. We should start using those, although there currently is no special formatting for them in the manual theme (I'll address that). The syntax is:
```markdown
!!! warning "Experimental feature"
    This is an experimental feature which is not yet fully supported.
```
And it will render:
```html
<div class="admonition warning">
<p class="admonition-title">Experimental feature</p>
<p>This is an experimental feature which is not yet fully supported.</p>
</div>
```

The **danger** is the callout type. We should use one of the following: *note, tip, important, warning*.

### Supplying HTML IDs and classes

* The [attr_list](https://pythonhosted.org/Markdown/extensions/attr_list.html) Markdown extension allows us to supply HTML IDs and classes easily using an `{: }` syntax that **follows** some Markdown text.

* But please use this **sparingly** and only after we've agreed on some conventions. For block elements, the `{: }` portion should be put as the last line, for example:
```markdown
This is a paragraph.
{: #an_id .a_class }
```
The above results in the following HTML output:
```html
<p id="an_id" class="a_class">This is a paragraph.</p>
```

### Hand-written HTML

Authors can use **practically all of HTML** — it won’t be rendered in the wiki but will in the final docs. So please be careful and don’t use it much!

### Extension modules used in the documentation

In addition to standard Markdown and GFM, we can use the following extension syntax which will **not** be previewable in the wiki, but **will** be visible in the published docs:

  * [`toc`](https://pythonhosted.org/Markdown/extensions/toc.html) for in-page tables of contents using the code
  ```markdown
  [TOC]
  ```
  * [`smarty`](https://pythonhosted.org/Markdown/extensions/smarty.html) for smart quotes
  * [`tables`](https://pythonhosted.org/Markdown/extensions/tables.html) for tables
  * [`fenced_code`](https://pythonhosted.org/Markdown/extensions/fenced_code_blocks.html) for inline code blocks
  * [`attr_list`](https://pythonhosted.org/Markdown/extensions/attr_list.html) for implicit HTML formatting using the syntax
  ```markdown
  {: #someid .someclass somekey='some value' }
  ```
  * [`admonition`](https://pythonhosted.org/Markdown/extensions/admonition.html) for "callout boxes"
  * [`footnotes`](https://pythonhosted.org/Markdown/extensions/footnotes.html)
  * `[markdown_include.include`](https://github.com/cmacmackin/markdown-include) for including files
  * [`mdx_sections`](https://github.com/jessedhillon/mdx_sections) for the HTML id generation
  ```markdown
  # {html-id,html-class} Title
  ```
  * [`meta`](https://pythonhosted.org/Markdown/extensions/meta_data.html) for page metadata
  * `mdx_wikilink` and `mdx_figcaption` from [`mdx_steroids`](https://github.com/twardoch/markdown-steroids) for Github Wiki link support in form of `[[Page Title]]` → `[Page Title](Page-Title.md)` and for figures with captions

We can enable additional [standard](https://pythonhosted.org/Markdown/extensions/) and [3rd-party](https://github.com/waylan/Python-Markdown/wiki/Third-Party-Extensions) extensions for the MkDocs Markdown processor — but note that they won't be rendered in the wiki but only in the published manual.

# Publishing guidelines

This section mostly covers the process of converting the wiki into the final online manual.

## Structure

On your local machine, create a folder `noto-docs-dev`. Inside that folder do:
  ```sh
  git clone https://github.com/twardoch/noto-docs noto-docs
  cd noto-docs/
  sh ./tools/install.command
  ```
This will install the Python requirements and also clone the `noto-docs.wiki` repo inside of the `srcdocs/` folder within the `noto-docs` repo. Note that we are not using Git submodules because Github does not support them for creating wikis.

## mkdocs.yml

The **[`noto-docs/srcdocs/mkdocs.yml`](srcdocs/mkdocs.yml)** file contains the **table of contents** of the final docs, and some configuration settings for the MkDocs engine. This is a [YAML](https://en.wikipedia.org/wiki/YAML) file, and should be written according to the [MkDocs guide](http://www.mkdocs.org/user-guide/writing-your-docs/) and [MkDocs config](http://www.mkdocs.org/user-guide/configuration/).

**Extremely important**: The `pages` section of `mkdocs.yml` must be updated to get the site navigation of the docs, and to convert all documents. **Only** the `.md` documents mentioned in the `mkdocs.yml` will be converted — not the entire wiki! This is a bit cumbersome, but on the other hand, it’ll allow us to really structure multiple documentations, not just one.

## The MkDocs building system

Mkdocs uses a [very simple structure](http://www.mkdocs.org/user-guide/writing-your-docs/). It's possible to output the docs using different themes, including a [super-simple theme](http://www.mkdocs.org/user-guide/styling-your-docs/). It's possible to deploy the output into GitHub Pages which will be [immediately hosted](http://www.mkdocs.org/user-guide/deploying-your-docs/).

### Noto MkDocs theme

The https://github.com/twardoch/noto-mkdocs-theme repo holds the development version of a **Noto MkDocs theme**. Clone it next to the `noto-docs` folder so in your `noto-docs-dev` folder you have two:
```
noto-docs-dev/
- noto-docs/
- noto-mkdocs-theme/
```

### Building the docs

Navigate to the `noto-docs/` folder and run:
```sh
./tools/build.command
```
and in the `docs/` folder you’ll have the final docs.

### Building and pushing the

Navigate to the `noto-docs/` folder and run:
```sh
./tools/build-push-all.command
```
and https://twardoch.github.io/noto-docs/ will have the final docs.

### Some useful tools

* [to markdown](https://domchristie.github.io/to-markdown/) — online HTML to Markdown converter
* [HTML minifier](http://www.willpeavy.com/minifier/) — online HTML minifier
* [HTML table converter](http://truben.no/table/beta/) — online table converter that can input HTML tables and output Markdown tables, works best with minified(!) HTML table code, so use above minifer first
