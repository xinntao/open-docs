==========================================
Ubuntu实验环境配置 (PyTorch)
==========================================
**Created** : 2019/01/07; **Modified** : 2019/01/29

可以按照以下的流程来配置Lab机器.

一些基本命令
==========================================
1. 查看Ubuntu版本: ``cat /etc/issue``
2. apt更新

    * ``sudo apt-get update``
    * ``sudo apt-get upgrade``
    * ``sudo apt-get autoremove --purge``
3. 其他apt相关

    * 查看已经安装的 ``apt list --installed``
    * 搜索软件列表 ``apt-cache search nvidia``

tmux开启鼠标键盘控制
==========================================
``setw -g mouse on`` OR ``setw -g mode-mouse on``

安装Anaconda
==========================================
* ``wget ...``
* ``bash ...``, 不需要sudo权限
* ``conda update --all``

检查Nvidia Driver
==========================================
关于cuda不同版本对driver最低version的要求, 参见 `nvidia doc - Table 1 <https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html>`_.
**CUDA 10.0.130 >= 410.48**

1. 若需要update driver:

    a. 通过 **apt-get** 安装

        * ``sudo add-apt-repository ppa:graphics-drivers/ppa`` **+** ``sudo apt-get update``
        * 搜索列表, 查看是否有需要的版本 ``apt-cache search nvidia``
        * 安装 ``sudo apt-get install nvidia-410``
    #. 若apt-get安装失败, 可以通过 **cuda.run文件自带的driver安装**, 注意在这之前可能需要

        * 卸载已有的cuda, ``apt list --installed``, ``sudo apt-get --purge autoremove packagename``
        * 可能需要禁用lightdm服务, ``sudo service lightdm stop``
        * 若有问题, 请参考晖哥的 `安装指南 <https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07#install-cuda>`_

2. 可以添加一些配置, 提高性能. These commands can be added to ``/etc/rc.local`` for executing at system boot. (Lab的机器都已经有了)

    .. code-block:: sh

        sudo nvidia-smi -pm 1
        sudo nvidia-smi -e 0

3. 确认是否成功 ``nvidia-smi``.

安装cuda 10.0
==========================================
下载.run文件安装  ``sudo bash .run``, 列一些选项:

    | >>> Do you *accept* the previously read EULA?
    | accept/decline/quit: **accept**
    | >>> Install NVIDIA Accelerated Graphics *Driver* for Linux-x86_64 410.48?
    | (y)es/(n)o/(q)uit: **no**
    | >>> Install the *CUDA* 10.0 Toolkit?
    | (y)es/(n)o/(q)uit: **yes**
    | >>> Enter Toolkit *Location*
    | [ default is /usr/local/cuda-10.0 ]:
    | >>> Do you want to install a *symbolic link* at /usr/local/cuda?
    | (y)es/(n)o/(q)uit: **no**
    | >>> Install the CUDA 10.0 *Samples*?
    | (y)es/(n)o/(q)uit: **no**

.. note::
    若有补丁, ``sudo bash cuda_9.1.85.1_linux.run``. (目前cuda10还没有)

安装cudnn
==========================================
**cuda10对应7.4.2**, 安装cudnn只要copy即可:

.. code-block:: sh

    sudo cp -r cuda/lib64/* /usr/local/cuda-10.0/lib64/
    sudo cp -r cuda/include/* /usr/local/cuda-10.0/include/

新建Anaconda环境 - pt1
==========================================
``conda create -n pt1 python=3.7``

修改pt1启动环境:

1. **activate**

    a. ``mkdir -p ~/anaconda3/envs/pt1/etc/conda/activate.d``
    #. ``cd ~/anaconda3/envs/pt1/etc/conda/activate.d``
    #. ``vim activate.sh``

    写入以下内容:

    ::

        #!/bin/sh
        ORIGINAL_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
        ORIGINAL_PATH=$PATH
        ORIGINAL_CPATH=$CPATH
        export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64:/usr/local/cuda-10.0/extras/CUPTI/lib64:/lib/nccl/cuda-10.0:$LD_LIBRARY_PATH
        export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}
        export CPATH=/usr/local/cuda-10.0/include${CPATH:+:${CPATH}}
        # (option) export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/libnccl.so:$LD_LIBRARY_PATH
        # you can find the nccl path by ``find /usr -name '*nccl*'``

    d. ``chmod +x activate.sh``

2. **deactivate**

    a. ``mkdir -p ~/anaconda3/envs/pt1/etc/conda/deactivate.d``
    #. ``cd ~/anaconda3/envs/pt1/etc/conda/deactivate.d``
    #. ``vim deactivate.sh``

    ::

        #!/bin/sh
        export LD_LIBRARY_PATH=$ORIGINAL_LD_LIBRARY_PATH
        unset ORIGINAL_LD_LIBRARY_PATH
        export PATH=$ORIGINAL_PATH
        unset ORIGINAL_PATH
        export ORIGINAL_CPATH=$ORIGINAL_CPATH
        unset ORIGINAL_CPATH

    d. ``chmod +x deactivate.sh``

安装PyTorch
==========================================
参见 `官网 <https://pytorch.org/>`_ 命令 (要确定安装的pytorch版本, 以及cuda版本), e.g. ``conda install pytorch torchvision cuda100 -c pytorch``

验证:

.. code-block:: python

    python
    import torch
    print(torch.__version__)
    print(torch.version.cuda)
    print(torch.backends.cudnn.version())
    print(torch.cuda.is_available())

安装Python依赖
==========================================
cv2, lmdb, tensorboardX

``pip install opencv-python lmdb tensorboardX``

拷贝Github项目
==========================================
1. 创建ssh key

    * ``ssh-keygen -t rsa -C "xxx@126.com"``
    * ``vim ~/.ssh/id_rsa.pub``
    * 在github上添加ssh key

2. 设置git命令

    .. code-block:: sh

        git config --global user.name "xinntao"
        git config --global user.email "xxx@126.com"
        git config --global alias.st status
        git config --global alias.co checkout
        git config --global alias.ci commit
        git config --global alias.br branch
        git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
