==========================================
Datasets for Video Super-Resolution
==========================================
**Created** : 2019/06/03; **Updated** : 2019/06/08;

Overview
==========================================
In video super-resolution, there are three commonly-used datasets. Vimeo90K and REDS are large-scale datasets that provide both training and testing datasets. Vid4 is a dataset consisting of four clips that are used for evaluations only. In the following, we will introduce the datasets and provide the link to the datasets.

REDS
==========================================
REDS is a high-quality (720p) video super-resolution and deblurring dataset proposed in the NTIRE19 Competition. It consists 270,000 high quality images from 240 training clips, 30 validation clips, and 30 testing clips. There are four different degradations applying on the high resolution images, giving four sub-datasets. The four degradations are:

#. Bicubic downsampling

#. Bicubic downsampling with motion blur

#. Motion blur

#. Motion blur with compression artifacts

======================= =======================
GT spatial size         1280 x 720 x 3
# frames of each clip   100
# training samples      240,000
# validation samples    30,000
# testing samples       30,000
project page            http://www.vision.ee.ethz.ch/ntire19/
download link           1. https://competitions.codalab.org/competitions/21482#participate-get-data
                        2. https://competitions.codalab.org/competitions/21483#participate-get-data
                        3. https://competitions.codalab.org/competitions/21475#participate-get-data
                        4. https://competitions.codalab.org/competitions/21476#participate-get-data
======================= =======================

.. note::
    1. Registration is required before downloading the datasets
    2. In [1], the dataset *REDS4* consists of clips *000, 011, 015, 020*


Vimeo90K
==========================================
Vimeo90K is a large-scale, high-quality video dataset. It consists of 89,800 video clips downloaded from vimeo.com, which covers large variaty of scenes and actions. It is designed for the following four video processing tasks: temporal frame interpolation, video denoising, video deblocking, and video super-resolution.

======================= =======================
GT spatial size         448 x 256 x 3
# frames of each clip   7
# training samples      64,612
# testing samples       7,824
project page            http://toflow.csail.mit.edu/
download link           https://github.com/anchen1011/toflow
======================= =======================



Vid4
==========================================
Vid4 is a widely-used testing datasets in video super-resolution consisting of four clips. The low-resolution images are downsampled using a bicubic kernel.

======================= =======================
GT spatial size         (720 x 576 x 3), (704 x 576 x 3), (720 x 480 x 3), (720 x 480 x 3)
# frames of each clip   41, 34, 49, 47
# training samples      \\-
# testing samples       171
project page            \\-
download link           https://drive.google.com/drive/folders/10-gUO6zBeOpWEamrWKCtSkkUFukB9W5m
======================= =======================


.. rubric:: References

.. [#f1] Wang et al., EDVR: Video Restoration with Enhanced Deformable Convolutional Networks, CVPRW, 2019