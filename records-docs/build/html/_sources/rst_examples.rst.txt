==========================================
RST (reStructuredText) 语法示例
==========================================
::

    ==========================================
    RST (reStructuredText) 语法示例
    ==========================================

这里展示一些常用的RST语法. 黄色的块内是源代码, 紧接着的是渲染后的内容.
详细的用法可以参考:

1. .. raw:: html

        <a href="http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html"><b>reStructuredText Primer</b></a>
2. `Quick reStructuredText <http://docutils.sourceforge.net/docs/user/rst/quickref.html>`_
3. `ReStructuredText介绍 <https://docutils-zh-cn.readthedocs.io/zh_CN/latest/user/rst/quickstart.html>`_
4. .. raw:: html

        <a href="https://zh-sphinx-doc.readthedocs.io/en/latest/rest.html"><b>reStructuredText 简介</b></a>
5. `reStructuredText标记规范 <https://docutils-zh-cn.readthedocs.io/zh_CN/latest/ref/rst/restructuredtext.html>`_
6. .. raw:: html

        <a href="https://github.com/seayxu/CheatSheet/blob/master/files/reStructuredText-Quick-Syntax.md"><b>reStructuredText快速入门</b></a>

.. 为了展示内部链接
.. _top-reference-label:

文本样式
=====================
::

    1. *斜体*
    2. 前后需要 **空格** 才有 **加粗** 效果
    3. ``行内代码``

    分割符

    ------------

    分割符是水平的横线，是由>4个的 ``-`` 组成，需要添加换行.

1. *斜体*
2. 前后需要 **空格** 才有 **加粗** 效果
3. ``行内代码``

分割符

------------

分割符是水平的横线，是由>4个的 ``-`` 组成，需要添加换行.

标题
=====================
::

    标题
    =====================
    不同等级的标题, 不是根据符号区分, 而是根据出现的顺序自动parsing.

    二级标题
    --------------------
    上面这个是二级标题

    三级标题
    ^^^^^^^^^^^^^^^^^^^^
    使用其他符号 ``= - ` : ' " ~ ^ _  *  + # < >`` 也可以

不同等级的标题, 不是根据符号区分, 而是根据出现的顺序自动parsing.

二级标题
--------------------
上面这个是二级标题

三级标题
^^^^^^^^^^^^^^^^^^^^
使用其他符号 ``= - ` : ' " ~ ^ _  *  + # < >`` 也可以

段落
=====================
::

    空一行是表示新起一个段落. 段落之间间距较大, 若是有关联的换行, 考虑 **列表** .

        可以使用缩进, 表示缩进的段落

            可以连续使用缩进

空一行是表示新起一个段落. 段落之间间距较大, 若是有关联的换行, 考虑 **列表** .

    可以使用缩进, 表示缩进的段落

        可以连续使用缩进

列表
=====================

有序列表
--------------------------
::

    1. 枚举的类型有:

        a. 阿拉伯数组: 1, 2, 3 ...
        b. 大小写字母: A-Z 或 a-z
        c. 大小写罗马字母: I, II, III, iV, ... 或 i, ii, iii, iv ...
    2. 使用 **#** 自动生成枚举序号, 可以从任一数字开始

        4. xxx
        #. yyy
        #. zzz

1. 枚举的类型有:

    a. 阿拉伯数组: 1, 2, 3 ...
    b. 大小写字母: A-Z 或 a-z
    c. 大小写罗马字母: I, II, III, iV, ... 或 i, ii, iii, iv ...
2. 使用 **#** 自动生成枚举序号, 可以从任一数字开始

    4. xxx
    #. yyy
    #. zzz

无序列表
-----------------------
::

    * 可以使用 ``* + -`` 表示
    * xxx

        * 没有空一行的话, xxx会加粗; 反之不会
        * 缩进表示二级列表
    * Again一级列表, 不需要空行

* 可以使用 ``* + -`` 表示
* xxx

    * 没有空一行的话, xxx会加粗; 反之不会
    * 缩进表示二级列表
* Again一级列表, 不需要空行

块 (Blocks)
=====================

文本块 (Literal Blocks)
------------------------
::

    ::

        上面的源代码部分就是采用文本块的形式呈现的
        注意::下面要空一行

::

    上面的源代码部分就是采用文本块的形式呈现的
    注意::下面要空一行

代码块
------------------------
::

    .. code-block:: python
        :linenos:

        def my_function():
            print('just a test', 8 // 2)
            print 8/2

linenos可以打开line number.

.. code-block:: python
    :linenos:

    def my_function():
        print('just a test', 8 // 2)
        print 8/2

文档测试块 (Doctest Blocks)
-----------------------------------------
文档测试块是交互式的Python会话，以 ``>>>`` 开始，一个空行结束。

>>> print('This is a doctest block.')
This is a doctest block.

注解, 提示块
------------------------
::

    .. note::
        这是注解. note会执行(替换下面的#号), 但是单纯的文本块::不会.

        4. xxx
        #. yyy
        #. zzz

    块都支持缩进显示:

        .. Tip:: 这里是缩进的提示内容.

.. note::
    这是注解. note会执行(替换下面的#号), 但是单纯的文本块::不会.

    4. xxx
    #. yyy
    #. zzz

块都支持缩进显示:

    .. Tip:: 这里是缩进的提示内容.

行块 (Line Blocks)
--------------------
::

    下面是行块内容：
    | 和缩进的区别
    | 间距是行距

    而缩进:

        缩进的间距是段落间距.

        上面这个间距很大.

行块使用 ``|``, 前后各有一个空格.

下面是行块内容：
 | 和缩进的区别
 | 间距是行距

而缩进:

    缩进的间距是段落间距.

    上面这个间距很大.

数学公式块
-----------------
::

    .. math::
        \ell(x, y) = L = \{l_1,\dots,l_N\}^\top, \quad
        l_n = \left( x_n - y_n \right)^2.

*Latex* 格式.

.. math::
    \ell(x, y) = L = \{l_1,\dots,l_N\}^\top, \quad
    l_n = \left( x_n - y_n \right)^2.

插入链接
=====================
::

    1. 外部链接
        详细内容请参考 `reStructuredText Primer <http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_.
    2. 内部链接
        回到Section - :ref:`top-reference-label`.
    3. 隐式超链接
        标题、脚注和引用参考会自动生成超链接地址. 隐式链接到 `块 (Blocks)`_.

1. 外部链接
    详细内容请参考 `reStructuredText Primer <http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_.
2. 内部链接
    回到Section - :ref:`top-reference-label`.
3. 隐式超链接
    标题、脚注和引用参考会自动生成超链接地址. 隐式链接到 `块 (Blocks)`_.

插入图片
=====================

.. figure:: http://s14.sinaimg.cn/middle/9dc4c475gbb076ca6e63d
    :height: 200 px
    :width: 200 px
    :alt: a short description of the image, displayed by applications that cannot display images
    :align: center

    This is the caption of the figure (a simple paragraph).
..
    .. sidebar:: Sidebar Title
    :subtitle: Optional Sidebar Subtitle

    Subsequent indented lines comprise
    the body of the sidebar, and are
    interpreted as body elements.

插入表格
=====================
对表格的支持总体不是很好.

1. 简单表格. 来自 `Open-ReID <https://cysu.github.io/open-reid/examples/benchmarks.html>`_ 的例子.
::

    ========= ============ ======== ============ ========== ==============
    Net       Loss         Mean AP  CMC allshots CMC cuhk03 CMC market1501
    ========= ============ ======== ============ ========== ==============
    Inception Triplet      N/A      N/A          N/A        N/A
    Inception Softmax      65.8     48.6         73.2       71.0
    Inception OIM          71.4     56.0         77.7       76.5
    ResNet-50 Triplet      **80.7** **67.9**     **84.3**   **85.0**
    ResNet-50 Softmax      62.7     44.6         70.8       69.0
    ResNet-50 OIM          72.5     58.2         77.5       79.2
    ========= ============ ======== ============ ========== ==============

渲染效果:

    ========= ============ ======== ============ ========== ==============
    Net       Loss         Mean AP  CMC allshots CMC cuhk03 CMC market1501
    ========= ============ ======== ============ ========== ==============
    Inception Triplet      N/A      N/A          N/A        N/A
    Inception Softmax      65.8     48.6         73.2       71.0
    Inception OIM          71.4     56.0         77.7       76.5
    ResNet-50 Triplet      **80.7** **67.9**     **84.3**   **85.0**
    ResNet-50 Softmax      62.7     44.6         70.8       69.0
    ResNet-50 OIM          72.5     58.2         77.5       79.2
    ========= ============ ======== ============ ========== ==============

2. 网格表. 可以使用 `Tables Generator <https://www.tablesgenerator.com/text_tables>`_ 来生成. 但是center不是很容易.
::

    +------------------------+------------+----------+----------+
    | Header row, column 1   | Header 2   | Header 3 | Header 4 |
    | (header rows optional) |            |          |          |
    +========================+============+==========+==========+
    | body row 1, column 1   | column 2   | column 3 | column 4 |
    +------------------------+------------+----------+----------+
    | body row 2             | Cells may span columns.          |
    +------------------------+------------+---------------------+
    | body row 3             | Cells may  | - Table cells       |
    +------------------------+ span rows. | - contain           |
    | body row 4             |            | - body elements.    |
    +------------------------+------------+---------------------+

渲染效果:

    +------------------------+------------+----------+----------+
    | Header row, column 1   | Header 2   | Header 3 | Header 4 |
    | (header rows optional) |            |          |          |
    +========================+============+==========+==========+
    | body row 1, column 1   | column 2   | column 3 | column 4 |
    +------------------------+------------+----------+----------+
    | body row 2             | Cells may span columns.          |
    +------------------------+------------+---------------------+
    | body row 3             | Cells may  | - Table cells       |
    +------------------------+ span rows. | - contain           |
    | body row 4             |            | - body elements.    |
    +------------------------+------------+---------------------+

引用/脚注
=====================
::

    Lorem ipsum [#f1]_ dolor sit amet ... [#xx]_

    .. 仅仅用来显示References这几个字
    .. rubric:: References

    .. [#f1] Text of the first footnote.
    .. [#xx] Text of the second footnote.

Lorem ipsum [#f1]_ dolor sit amet ... [#xx]_

.. 仅仅用来显示References这几个字
.. rubric:: References

.. [#f1] Text of the first footnote.
.. [#xx] Text of the second footnote.

注释
=====================
注释以 .. 开头，后面接注释内容. 多行时每行需要对齐.

:Created: 2019/01/06
