==========================================
Ubuntu安装软件
==========================================
**Created** : 2019/01/07; **Updated** : 2019/01/29

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

OpenVPN配置
==========================================
OpenVPN安装, 配置很简单, 个人觉得也不需要图形化的界面.

1. **安装openvpn**:
``sudo apt-get install openvpn``; 验证: ``openvpn --version``

2. **配置文件**:
.ovpn的文件, 一般还有.crt和.key文件. 向VPN提供商索要.

3. **启动**:
``sudo openvpn --config xxx.ovpn``. 如果看到 Initialization Sequence Completed, 说明连接成功.

如果出现max_route错误, 则``sudo openvpn --max-routes 500 --config xxx.ovpn``

参考 `blog <http://www.linuxdown.net/install/faq/20160307_how_linux_4955.html>`_