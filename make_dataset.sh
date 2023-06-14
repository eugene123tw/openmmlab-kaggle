# clones openmmlab repos commonly used in kaggle competitions
# or for general purpose computer vision applications
# creates tar.gz file for upload to kaggle and optionally removes openmmlab-repos directory

# make folder for repos
mkdir openmmlab-repos
mkdir openmmlab-repos/src

# pytorch for kaggle installation
wget https://download.pytorch.org/whl/cu117/torch-1.13.0%2Bcu117-cp310-cp310-linux_x86_64.whl -P openmmlab-repos/src
wget https://download.pytorch.org/whl/cu117/torchvision-0.14.0%2Bcu117-cp310-cp310-linux_x86_64.whl -P openmmlab-repos/src

# mmcv
mkdir openmmlab-repos/mmcv
git clone --branch v2.0.0rc4 https://github.com/open-mmlab/mmcv.git openmmlab-repos/mmcv
wget https://download.openmmlab.com/mmcv/dist/cu117/torch1.13.0/mmcv-2.0.0rc4-cp310-cp310-manylinux1_x86_64.whl -P openmmlab-repos/src

# mmengine
git clone --branch v0.7.4 https://github.com/open-mmlab/mmengine.git openmmlab-repos/mmengine

# mmclassification
# mkdir openmmlab-repos/mmclassification
# git clone https://github.com/open-mmlab/mmclassification.git openmmlab-repos/mmclassification

# mmdetection
mkdir openmmlab-repos/mmdetection
git clone --branch 3.x https://github.com/open-mmlab/mmdetection.git openmmlab-repos/mmdetection

# mmsegmentation
# mkdir openmmlab-repos/mmsegmentation
# git clone --branch eugene/master https://github.com/eugene123tw/mmsegmentation.git openmmlab-repos/mmsegmentation

# download all requirements
pip download -d openmmlab-repos/src -r openmmlab-repos/mmcv/requirements.txt
pip download -d openmmlab-repos/src -r openmmlab-repos/mmengine/requirements.txt
pip download -d openmmlab-repos/src -r openmmlab-repos/mmdetection/requirements.txt
# pip download -d openmmlab-repos/src -r openmmlab-repos/mmsegmentation/requirements.txt
# pip download -d openmmlab-repos/src -r openmmlab-repos/mmclassification/requirements.txt
# pip download -d openmmlab-repos/src -r openmmlab-repos/mmpose/requirements.txt
# pip download -d openmmlab-repos/src -r openmmlab-repos/mmocr/requirements.txt
# pip download -d openmmlab-repos/src -r openmmlab-repos/mmgeneration/requirements.txt
# pip download -d openmmlab-repos/src -r openmmlab-repos/mmfewshot/requirements.txt
# pip download -d openmmlab-repos/src -r openmmlab-repos/mmtracking/requirements.txt

# remaining requirements
# wget https://files.pythonhosted.org/packages/22/51/52442c59db26637681148c21f8984eed58c9db67053a0a4783a047010c98/importlib_metadata-4.2.0-py3-none-any.whl -P openmmlab-repos/src

# create tar.gz file
tar -czvf openmmlab-repos.tar.gz openmmlab-repos
ls -l openmmlab-repos.tar.gz

# remove folder if desired
if [ "$1" = "-r" ]; then
    rm -rf openmmlab-repos
    rm -rf src
    echo "openmmlab-repos directory removed"
else
    echo "openmmlab-repos directory not removed"
fi
