.. My-Records documentation master file, created by
   sphinx-quickstart on Sun Jan  6 12:30:48 2019.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. raw:: html

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-129775907-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
        dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-129775907-1');
    </script>

Welcome to My-Records!
======================================

记录一些平时遇到的问题和解决方案. 欢迎在 `Github <https://github.com/xinntao/open-docs>`_ 贡献.

.. toctree::
   :numbered:
   :maxdepth: 1
   :caption: 安装

   Ubuntu实验环境配置 (PyTorch) <installation/lab_env>
   Ubuntu安装软件 (Matlab) <installation/ubuntu_software>

.. toctree::
   :numbered:
   :maxdepth: 1
   :caption: Contents:

   Sphinx自动生成文档 <sphinx_doc>
   RST (reStructuredText) 语法示例 <rst_examples>

.. toctree::
   :numbered:
   :maxdepth: 1
   :caption: 其他:

   loss的问题[TODO] <loss>

.. 注释
   Indices and tables
   ==================

   * :ref:`genindex`
   * :ref:`modindex`
   * :ref:`search`
