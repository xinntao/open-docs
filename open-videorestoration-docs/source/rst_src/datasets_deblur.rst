==========================================
Datasets for Deblurring
==========================================
**Created** : 2019/05/03; **Updated** : 2019/05/03;

Overview
==========================================
In video deblurring, there are two commonly-used datasets. DVD and REDS are large-scale datasets that provide both training and testing datasets. In the following, we will introduce the datasets and provide the link to the datasets.

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

GOPRO
==========================================

DVD
==========================================
DVD is a dataset whose images are captured using hand-held cameras. The blurry frames are obtained by averaging several frames captured with high frame rate (240fps). DVD consists of 6708 frames from 71 clips, separated into 61 training clips and ten testing clips.

======================= =======================
GT spatial size         1280 x 720 x 3
# frames of each clip   varying
# training samples      5708
# testing samples       1000
project page            http://www.cs.ubc.ca/labs/imager/tr/2017/DeepVideoDeblurring/
download link           http://www.cs.ubc.ca/labs/imager/tr/2017/DeepVideoDeblurring/#dataset
======================= =======================

.. note::
    1. The ten testing clips are listed `here <https://github.com/shuochsu/DeepVideoDeblurring/issues/2>`_.


Real blurry videos
==========================================






.. rubric:: References

.. [#f1] Wang et al., EDVR: Video Restoration with Enhanced Deformable Convolutional Networks, CVPRW, 2019