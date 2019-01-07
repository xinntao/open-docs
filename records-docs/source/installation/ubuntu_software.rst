==========================================
Ubuntu安装软件
==========================================

Ubuntu Silently Install Matlab
==========================================
若/usr/local空间不够, 可以安装在本地目录 ``/home/xtwang/MATLAB/R2017b``.

1. 挂载镜像文件

    * ``mkdir /home/xtwang/temp``
    * ``sudo mount -t auto -o loop R2017b_glnxa64.iso /home/xtwang/temp``

2. Silent Install
修改installer_input.txt, 修改以下项目, 然后 ``sudo install -inputFile /home/xtwang/my_installer_input.txt``

    ::

        destinationFolder=/home/xtwang/MATLAB/R2017b
        fileInstallationKey= (your key)
        agreeToLicense=yes
        outputFile=/home/xtwang/mathworks_xtwang.log
        mode=silent

.. note::
    ``sudo cp license_standalone.lic /home/xtwang/MATLAB/R2017b/licenses/``
    ``sudo cp libmwservices.so /home/xtwang/MATLAB/R2017b/bin/glnxa64/``

3. 取消挂载
``sudo umount -l /home/xtwang/temp``
``sudo rm -rf temp``

4. 安装MATLAB的支持包
``sudo apt-get install matlab-support``

5. 任意位置启动
``sudo ln -s /home/xtwang/MATLAB/R2017b/bin/glnxa64/MATLAB /usr/local/bin/matlab``

:Created: 2019/01/07
