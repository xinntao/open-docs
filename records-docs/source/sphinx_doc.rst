=====================
Sphinx自动生成文档
=====================
**Created** : 2019/01/06;

使用Python的 `Sphinx <http://www.sphinx-doc.org/en/master/>`_ 自动生成文档. 一个完整的工具链: Sphinx + GitHub + Read the Docs: 用Sphinx生成文档，GitHub托管文档，再导入到Read the Docs (或个人主页).

有两个应用场景:

    1. 记录一些知识点, 比如这个Doc; 编写教程等 (可以Release到个人主页, github page).
    2. 自动为代码生成Docs (可以免费发布到 `Read the Docs <https://readthedocs.org/>`_ ).

安装配置Sphinx
=====================
1. ``pip install sphinx sphinx-autobuild sphinx_rtd_theme``
2. 在需要的目录下, 比如[records-docs], run ``sphinx-quickstart``
3. 填写交互信息, 基本只要回车, 修改了以下几个项目: (之后还可以 ``source/conf.py`` 中修改配置)

    >>> Separate source and build directories (y/n) [n]: y
    >>> Project name: My-Records
    >>> Author name(s): Xintao Wang
    >>> Project language [en]: zh  # 使用中文
    >>> todo: write "todo" entries that can be shown or hidden on build (y/n) [n]: y
    >>> mathjax: ... [n]: y  # 支持Latex数学公式
    >>> githubpages: create .nojekyll file to publish the document on GitHub pages (y/n) [n]: y

    .. note::
        github pages默认使用Jekyll, 不会使用下划线 underscore (_) 开头的文件, 因此在 ``_static`` 下的js文件等都无法被访问到. 需要在根目录中添加一个空的.nojekyll file来turn off Jekyll.

4. 修改成经典主题 **sphinx_rtd_theme**

    ``pip install sphinx_rtd_theme``

    修改 ``source/conf.py``:

    .. code-block:: python

        # html_theme = 'alabaster'
        html_theme = "sphinx_rtd_theme"

5. 支持 **markdown**

    ``pip install recommonmark``

    修改 ``source/conf.py``:

    .. code-block:: python

        from recommonmark.parser import CommonMarkParser
        source_parsers = {
            '.md': CommonMarkParser,
        }
        source_suffix = ['.rst', '.md']

6. Run ``make html``, 进入 ``build/html`` 用浏览器打开 ``index.html``, 就能看到结果了.

其他配置
=====================
支持中文搜索
--------------------
Sphinx的搜索是JSON文件支持的. 当运行Sphinx生成文档时, 程序会对现有网页内容进行分词, 然后生成相应的 *工具* 和 *索引* ``searchtools.js`` 和 ``searchindex.js``. 具体和语言相关的源文件在比如 ``/home/xtwang/anaconda3/lib/python3.6/site-packages/sphinx/search/zh.py``, 从中我们可以看到中文使用 `jieba <https://github.com/fxsjy/jieba>`_ 分词. 若要支持中文, 则 ``source/conf.py`` 要设置 ``language = 'zh'``.

.. note::
    1. 注意语言不要设置成'zh-CN', 不然无法支持中文搜索
    2. 因为是通过简单的 **分词** 达到搜索的目的, 所以在搜索的时候注意关键词, 比如 ``托管文档`` 查不到, 可能因为它不是一个常见的词, 而以 ``托管 文档`` 就可以缓解

将网页发布到个人主页
--------------------
如果直接将doc的source和build文件放在github.io(个人主页)目录下, 会出现冗长的url问题, 像 xxx.io/records/build/html/index.html.

在github.io目录下又增加了一个repo - githubio-docs, 专门存放源文件.
github.io和githubio-docs分开用github管理, 不干扰. 通过脚本, 在编译后把需要的网页从githubio-docs拷贝到github.io中.

.. code-block:: sh

    #!/bin/bash
    # Compile
    echo $'******* Step 1 ********\nCompile ...'
    make html

    # Copy to release files
    echo $'\n******* Step 2 ********\nCopy the html to githubio.records ...'
    cp -r build/html/* ../../records

.. note::
    1. build目录中只需要把 ``html`` copy发布即可
    ::

        build
        ├── doctrees
        └── html
            ├── _sources
            ├── _static
            ├── index.html
            └── others

    2. 这个问题应该还有其他 `高级方法 <https://daler.github.io/sphinxdoc-test/includeme.html>`_.

TODO - 为项目代码自动注释
==============================================

参考
=====================

**安装**

1. `使用ReadtheDocs托管文档 <https://www.xncoding.com/2017/01/22/fullstack/readthedoc.html>`_

**其他项目文档参考**

1. `Open-ReID <https://cysu.github.io/open-reid/index.html#>`_
2. `mmcv <https://mmcv.readthedocs.io/en/latest/>`_
3. `基于Sphinx的技术文档开发教程 <https://doclikecode.readthedocs.io/zh_CN/latest/index.html>`_
