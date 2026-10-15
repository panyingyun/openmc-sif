# openmc-sif
apptainer for openmc

### 1、安装依赖

安装一系列依赖包（git,cmake，make等）

```bash
sudo apt install g++ cmake libhdf5-dev libpng-dev
```

### 2、编译openmc

下载和安装 openmc命令

```bash
git clone --recurse-submodules https://github.com/openmc-dev/openmc.git
cd openmc
mkdir build && cd build
cmake ..
make
sudo make install
```

运行 openmc， 查看安装是否成功，安装位置 

```bash
$ whereis openmc
/usr/local/bin/openmc

$ openmc --version
OpenMC version 0.15.3
Commit hash: 27e38e894697bb32a1dac7848d2618818b6b8daf
Copyright (c) 2011-2025 MIT, UChicago Argonne LLC, and contributors
MIT/X license at <https://docs.openmc.org/en/latest/license.html>
Build type:            RelWithDebInfo
Compiler ID:           GNU 11.4.0
MPI enabled:           no
Parallel HDF5 enabled: no
PNG support:           yes
DAGMC support:         no
libMesh support:       no
MCPL support:          no
Coverage testing:      no
Profiling flags:       no
UWUW support:          no
```


### 3、安装python warp包

在主目录下安装openmc python包, 依赖文件pyproject.toml

```bash
cd openmc 
sudo python -m pip install --upgrade pip -i  https://pypi.tuna.tsinghua.edu.cn/simple
python -m pip install .

$ pip install .
Defaulting to user installation because normal site-packages is not writeable
Processing /home/yypan/openmc/openmc
  Installing build dependencies ... done
  Getting requirements to build wheel ... done
  Preparing metadata (pyproject.toml) ... done
Requirement already satisfied: numpy>=1.9 in /usr/lib/python3/dist-packages (from openmc==0.13.1) (1.21.5)
Requirement already satisfied: h5py in /usr/lib/python3/dist-packages (from openmc==0.13.1) (3.6.0)
Requirement already satisfied: scipy in /usr/lib/python3/dist-packages (from openmc==0.13.1) (1.8.0)
Requirement already satisfied: ipython in /home/yypan/.local/lib/python3.10/site-packages (from openmc==0.13.1) (8.37.0)
Requirement already satisfied: matplotlib in /usr/lib/python3/dist-packages (from openmc==0.13.1) (3.5.1)
Requirement already satisfied: pandas in /usr/lib/python3/dist-packages (from openmc==0.13.1) (1.3.5)
Requirement already satisfied: lxml in /usr/lib/python3/dist-packages (from openmc==0.13.1) (4.8.0)
Requirement already satisfied: uncertainties in /home/yypan/.local/lib/python3.10/site-packages (from openmc==0.13.1) (3.2.3)
Requirement already satisfied: decorator in /usr/lib/python3/dist-packages (from ipython->openmc==0.13.1) (4.4.2)
Requirement already satisfied: exceptiongroup in /home/yypan/.local/lib/python3.10/site-packages (from ipython->openmc==0.13.1) (1.3.1)
Requirement already satisfied: jedi>=0.16 in /home/yypan/.local/lib/python3.10/site-packages (from ipython->openmc==0.13.1) (0.19.2)
Requirement already satisfied: matplotlib-inline in /home/yypan/.local/lib/python3.10/site-packages (from ipython->openmc==0.13.1) (0.2.1)
Requirement already satisfied: pexpect>4.3 in /usr/lib/python3/dist-packages (from ipython->openmc==0.13.1) (4.8.0)
Requirement already satisfied: prompt_toolkit<3.1.0,>=3.0.41 in /home/yypan/.local/lib/python3.10/site-packages (from ipython->openmc==0.13.1) (3.0.52)
Requirement already satisfied: pygments>=2.4.0 in /usr/lib/python3/dist-packages (from ipython->openmc==0.13.1) (2.11.2)
Requirement already satisfied: stack_data in /home/yypan/.local/lib/python3.10/site-packages (from ipython->openmc==0.13.1) (0.6.3)
Requirement already satisfied: traitlets>=5.13.0 in /home/yypan/.local/lib/python3.10/site-packages (from ipython->openmc==0.13.1) (5.14.3)
Requirement already satisfied: typing_extensions>=4.6 in /home/yypan/.local/lib/python3.10/site-packages (from ipython->openmc==0.13.1) (4.15.0)
Requirement already satisfied: wcwidth in /home/yypan/.local/lib/python3.10/site-packages (from prompt_toolkit<3.1.0,>=3.0.41->ipython->openmc==0.13.1) (0.2.14)
Requirement already satisfied: parso<0.9.0,>=0.8.4 in /home/yypan/.local/lib/python3.10/site-packages (from jedi>=0.16->ipython->openmc==0.13.1) (0.8.5)
Requirement already satisfied: executing>=1.2.0 in /home/yypan/.local/lib/python3.10/site-packages (from stack_data->ipython->openmc==0.13.1) (2.2.1)
Requirement already satisfied: asttokens>=2.1.0 in /home/yypan/.local/lib/python3.10/site-packages (from stack_data->ipython->openmc==0.13.1) (3.0.1)
Requirement already satisfied: pure-eval in /home/yypan/.local/lib/python3.10/site-packages (from stack_data->ipython->openmc==0.13.1) (0.2.3)
Building wheels for collected packages: openmc
  Building wheel for openmc (pyproject.toml) ... done
  Created wheel for openmc: filename=openmc-0.13.1-cp310-cp310-linux_x86_64.whl size=25834118 sha256=7318934b421a7ee144a1571b6dfab90bb82f34cfe464872c3d1ab99ef794c5a5
  Stored in directory: /tmp/pip-ephem-wheel-cache-n5_qzj06/wheels/f7/2f/e9/9522e883c5e702a5c272416f186aada84c203fb1fd6d0f9b11
Successfully built openmc
Installing collected packages: openmc
  Attempting uninstall: openmc
    Found existing installation: openmc 0.13.1
    Uninstalling openmc-0.13.1:
      Successfully uninstalled openmc-0.13.1
Successfully installed openmc-0.13.1

```




### 4、运行示例

```bash

OPENMC_CROSS_SECTIONS="/home/yypan/dl/endfb-vii.1-hdf5/cross_sections.xml" python jezebel.py
或者
OPENMC_CROSS_SECTIONS="/home/yypan/dl/endfb-vii.1-hdf5/cross_sections.xml" openmc
输出如下：

                                %%%%%%%%%%%%%%%
                           %%%%%%%%%%%%%%%%%%%%%%%%
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                    %%%%%%%%%%%%%%%%%%%%%%%%
                                     %%%%%%%%%%%%%%%%%%%%%%%%
                 ###############      %%%%%%%%%%%%%%%%%%%%%%%%
                ##################     %%%%%%%%%%%%%%%%%%%%%%%
                ###################     %%%%%%%%%%%%%%%%%%%%%%%
                ####################     %%%%%%%%%%%%%%%%%%%%%%
                #####################     %%%%%%%%%%%%%%%%%%%%%
                ######################     %%%%%%%%%%%%%%%%%%%%
                #######################     %%%%%%%%%%%%%%%%%%
                 #######################     %%%%%%%%%%%%%%%%%
                 ######################     %%%%%%%%%%%%%%%%%
                  ####################     %%%%%%%%%%%%%%%%%
                    #################     %%%%%%%%%%%%%%%%%
                     ###############     %%%%%%%%%%%%%%%%
                       ############     %%%%%%%%%%%%%%%
                          ########     %%%%%%%%%%%%%%
                                      %%%%%%%%%%%

                 | The OpenMC Monte Carlo Code
       Copyright | 2011-2025 MIT, UChicago Argonne LLC, and contributors
         License | https://docs.openmc.org/en/latest/license.html
         Version | 0.15.3
     Commit Hash | 27e38e894697bb32a1dac7848d2618818b6b8daf
       Date/Time | 2025-11-27 17:03:07
  OpenMP Threads | 16

 Reading settings XML file...
 Reading cross sections XML file...
 Reading materials XML file...
 Reading geometry XML file...
 Reading Pu239 from /home/yypan/dl/endfb-vii.1-hdf5/neutron/Pu239.h5
 Reading Pu240 from /home/yypan/dl/endfb-vii.1-hdf5/neutron/Pu240.h5
 Reading Pu241 from /home/yypan/dl/endfb-vii.1-hdf5/neutron/Pu241.h5
 Reading Ga69 from /home/yypan/dl/endfb-vii.1-hdf5/neutron/Ga69.h5
 Reading Ga71 from /home/yypan/dl/endfb-vii.1-hdf5/neutron/Ga71.h5
 Minimum neutron data temperature: 294 K
 Maximum neutron data temperature: 294 K
 Preparing distributed cell instances...
 Reading plot XML file...
 Writing summary.h5 file...
 Maximum neutron transport energy: 20000000 eV for Pu239
 Initializing source particles...

 ====================>     K EIGENVALUE SIMULATION     <====================

  Bat./Gen.      k            Average k
  =========   ========   ====================
        1/1    1.32839
        2/1    1.13509
        3/1    1.07264
        4/1    1.03192
        5/1    1.00800
        6/1    0.99535
        7/1    1.01016
        8/1    1.00199
        9/1    0.99421
       10/1    0.99372
       11/1    1.00341
       12/1    1.00442    1.00391 +/- 0.00050
       13/1    0.99169    0.99984 +/- 0.00408
       14/1    1.00056    1.00002 +/- 0.00289
       15/1    0.98685    0.99738 +/- 0.00346
       16/1    1.00392    0.99847 +/- 0.00303
       17/1    0.99008    0.99727 +/- 0.00283
       18/1    0.98979    0.99634 +/- 0.00262
       19/1    0.99765    0.99648 +/- 0.00231
       20/1    0.99539    0.99637 +/- 0.00207
       21/1    1.00716    0.99735 +/- 0.00212
       22/1    0.99788    0.99740 +/- 0.00193
       23/1    0.99968    0.99757 +/- 0.00179
       24/1    1.00436    0.99806 +/- 0.00172
       25/1    0.99754    0.99802 +/- 0.00160
       26/1    0.99795    0.99802 +/- 0.00150
       27/1    0.98269    0.99712 +/- 0.00167
       28/1    0.99396    0.99694 +/- 0.00159
       29/1    1.00447    0.99734 +/- 0.00155
       30/1    0.98652    0.99680 +/- 0.00157
       31/1    0.99200    0.99657 +/- 0.00151
       32/1    1.00917    0.99714 +/- 0.00155
       33/1    1.01447    0.99790 +/- 0.00166
       34/1    0.98516    0.99737 +/- 0.00168
       35/1    1.00405    0.99763 +/- 0.00163
       36/1    1.00060    0.99775 +/- 0.00157
       37/1    1.00256    0.99793 +/- 0.00152
       38/1    1.00381    0.99814 +/- 0.00148
       39/1    1.00089    0.99823 +/- 0.00143
       40/1    1.00990    0.99862 +/- 0.00144
       41/1    1.00054    0.99868 +/- 0.00139
       42/1    0.98723    0.99832 +/- 0.00139
       43/1    1.00368    0.99849 +/- 0.00136
       44/1    1.00554    0.99869 +/- 0.00134
       45/1    0.99294    0.99853 +/- 0.00131
       46/1    0.99696    0.99849 +/- 0.00127
       47/1    0.99970    0.99852 +/- 0.00124
       48/1    1.00122    0.99859 +/- 0.00121
       49/1    1.00487    0.99875 +/- 0.00119
       50/1    0.99981    0.99878 +/- 0.00116
       51/1    0.99955    0.99880 +/- 0.00113
       52/1    0.99099    0.99861 +/- 0.00112
       53/1    0.99812    0.99860 +/- 0.00109
       54/1    0.99200    0.99845 +/- 0.00108
       55/1    1.00360    0.99856 +/- 0.00106
       56/1    0.99853    0.99856 +/- 0.00103
       57/1    0.99111    0.99840 +/- 0.00102
       58/1    0.99613    0.99836 +/- 0.00100
       59/1    1.00449    0.99848 +/- 0.00099
       60/1    1.00902    0.99869 +/- 0.00099
       61/1    0.99691    0.99866 +/- 0.00098
       62/1    1.01072    0.99889 +/- 0.00098
       63/1    0.99519    0.99882 +/- 0.00097
       64/1    0.99984    0.99884 +/- 0.00095
       65/1    0.99205    0.99872 +/- 0.00094
       66/1    1.00557    0.99884 +/- 0.00093
       67/1    1.00137    0.99888 +/- 0.00092
       68/1    1.00661    0.99902 +/- 0.00091
       69/1    1.00136    0.99906 +/- 0.00090
       70/1    1.00635    0.99918 +/- 0.00089
       71/1    1.00534    0.99928 +/- 0.00088
       72/1    0.98172    0.99899 +/- 0.00091
       73/1    1.00131    0.99903 +/- 0.00090
       74/1    1.00400    0.99911 +/- 0.00089
       75/1    0.99391    0.99903 +/- 0.00088
       76/1    1.00050    0.99905 +/- 0.00086
       77/1    1.00213    0.99910 +/- 0.00085
       78/1    0.99562    0.99905 +/- 0.00084
       79/1    0.99156    0.99894 +/- 0.00084
       80/1    0.98896    0.99880 +/- 0.00084
       81/1    1.00456    0.99888 +/- 0.00083
       82/1    0.98663    0.99871 +/- 0.00083
       83/1    0.99022    0.99859 +/- 0.00083
       84/1    0.99623    0.99856 +/- 0.00082
       85/1    0.99339    0.99849 +/- 0.00081
       86/1    1.00858    0.99862 +/- 0.00081
       87/1    0.99935    0.99863 +/- 0.00080
       88/1    0.99831    0.99863 +/- 0.00079
       89/1    0.99326    0.99856 +/- 0.00078
       90/1    1.00764    0.99867 +/- 0.00078
       91/1    1.00525    0.99875 +/- 0.00078
       92/1    0.99381    0.99869 +/- 0.00077
       93/1    0.98247    0.99850 +/- 0.00078
       94/1    0.99485    0.99845 +/- 0.00078
       95/1    0.99093    0.99837 +/- 0.00077
       96/1    1.00294    0.99842 +/- 0.00077
       97/1    0.99304    0.99836 +/- 0.00076
       98/1    0.99957    0.99837 +/- 0.00075
       99/1    1.00059    0.99840 +/- 0.00074
      100/1    0.99681    0.99838 +/- 0.00073
      101/1    1.00360    0.99844 +/- 0.00073
      102/1    1.00845    0.99855 +/- 0.00073
      103/1    0.98724    0.99842 +/- 0.00073
      104/1    1.01387    0.99859 +/- 0.00074
      105/1    1.00246    0.99863 +/- 0.00073
      106/1    0.98760    0.99851 +/- 0.00074
      107/1    1.00256    0.99856 +/- 0.00073
      108/1    1.00169    0.99859 +/- 0.00072
      109/1    1.00933    0.99870 +/- 0.00072
      110/1    0.99951    0.99870 +/- 0.00072
      111/1    0.99566    0.99867 +/- 0.00071
      112/1    0.99347    0.99862 +/- 0.00070
      113/1    0.99639    0.99860 +/- 0.00070
      114/1    0.99571    0.99857 +/- 0.00069
      115/1    0.98458    0.99844 +/- 0.00070
      116/1    1.01233    0.99857 +/- 0.00070
      117/1    1.00608    0.99864 +/- 0.00070
      118/1    0.99623    0.99862 +/- 0.00069
      119/1    1.00346    0.99866 +/- 0.00069
      120/1    1.00673    0.99874 +/- 0.00069
      121/1    0.99384    0.99869 +/- 0.00068
      122/1    1.00073    0.99871 +/- 0.00068
      123/1    0.99359    0.99867 +/- 0.00067
      124/1    0.99881    0.99867 +/- 0.00067
      125/1    0.99813    0.99866 +/- 0.00066
      126/1    0.99458    0.99863 +/- 0.00066
      127/1    0.99930    0.99863 +/- 0.00065
      128/1    1.01150    0.99874 +/- 0.00065
      129/1    1.00505    0.99879 +/- 0.00065
      130/1    0.99672    0.99878 +/- 0.00065
      131/1    1.00203    0.99880 +/- 0.00064
      132/1    0.99158    0.99875 +/- 0.00064
      133/1    0.99830    0.99874 +/- 0.00063
      134/1    0.99240    0.99869 +/- 0.00063
      135/1    0.99298    0.99864 +/- 0.00063
      136/1    1.00080    0.99866 +/- 0.00062
      137/1    0.99929    0.99867 +/- 0.00062
      138/1    0.99347    0.99863 +/- 0.00061
      139/1    0.98166    0.99849 +/- 0.00062
      140/1    1.01862    0.99865 +/- 0.00064
      141/1    0.99572    0.99863 +/- 0.00063
      142/1    1.00196    0.99865 +/- 0.00063
      143/1    1.01114    0.99875 +/- 0.00063
      144/1    1.01252    0.99885 +/- 0.00063
      145/1    1.01156    0.99894 +/- 0.00064
      146/1    0.99825    0.99894 +/- 0.00063
      147/1    1.00860    0.99901 +/- 0.00063
      148/1    0.99462    0.99898 +/- 0.00063
      149/1    0.99358    0.99894 +/- 0.00062
      150/1    0.99156    0.99889 +/- 0.00062
      151/1    1.00594    0.99894 +/- 0.00062
      152/1    1.00213    0.99896 +/- 0.00062
      153/1    0.99446    0.99893 +/- 0.00061
      154/1    1.00399    0.99896 +/- 0.00061
      155/1    0.99635    0.99894 +/- 0.00060
      156/1    0.99834    0.99894 +/- 0.00060
      157/1    1.00895    0.99901 +/- 0.00060
      158/1    1.00137    0.99902 +/- 0.00060
      159/1    1.00235    0.99905 +/- 0.00059
      160/1    1.00192    0.99906 +/- 0.00059
      161/1    1.00887    0.99913 +/- 0.00059
      162/1    1.00525    0.99917 +/- 0.00059
      163/1    0.98676    0.99909 +/- 0.00059
      164/1    1.00084    0.99910 +/- 0.00058
      165/1    1.00332    0.99913 +/- 0.00058
      166/1    1.00119    0.99914 +/- 0.00058
      167/1    1.00412    0.99917 +/- 0.00057
      168/1    0.99870    0.99917 +/- 0.00057
      169/1    1.00409    0.99920 +/- 0.00057
      170/1    0.99280    0.99916 +/- 0.00057
      171/1    0.99859    0.99916 +/- 0.00056
      172/1    1.00625    0.99920 +/- 0.00056
      173/1    0.99996    0.99921 +/- 0.00056
      174/1    0.97975    0.99909 +/- 0.00057
      175/1    1.00174    0.99910 +/- 0.00056
      176/1    0.98263    0.99900 +/- 0.00057
      177/1    0.99230    0.99896 +/- 0.00057
      178/1    1.00529    0.99900 +/- 0.00056
      179/1    1.00684    0.99905 +/- 0.00056
      180/1    0.99458    0.99902 +/- 0.00056
      181/1    1.00896    0.99908 +/- 0.00056
      182/1    0.98849    0.99902 +/- 0.00056
      183/1    1.00053    0.99903 +/- 0.00056
      184/1    0.98982    0.99897 +/- 0.00056
      185/1    0.98822    0.99891 +/- 0.00056
      186/1    0.99246    0.99888 +/- 0.00055
      187/1    0.99392    0.99885 +/- 0.00055
      188/1    0.99725    0.99884 +/- 0.00055
      189/1    0.99896    0.99884 +/- 0.00055
      190/1    0.99897    0.99884 +/- 0.00054
      191/1    1.00540    0.99888 +/- 0.00054
      192/1    0.99807    0.99887 +/- 0.00054
      193/1    0.99977    0.99888 +/- 0.00054
      194/1    1.00292    0.99890 +/- 0.00053
      195/1    0.99674    0.99889 +/- 0.00053
      196/1    0.99125    0.99885 +/- 0.00053
      197/1    0.99561    0.99883 +/- 0.00053
      198/1    1.00864    0.99888 +/- 0.00053
      199/1    0.99044    0.99884 +/- 0.00053
      200/1    0.99602    0.99882 +/- 0.00052
 Creating state point statepoint.200.h5...

 =======================>     TIMING STATISTICS     <=======================

 Total time for initialization     = 1.4375e-01 seconds
   Reading cross sections          = 1.1316e-01 seconds
 Total time in simulation          = 1.0818e+00 seconds
   Time in transport only          = 9.2284e-01 seconds
   Time in inactive batches        = 6.1929e-02 seconds
   Time in active batches          = 1.0199e+00 seconds
   Time synchronizing fission bank = 1.0656e-01 seconds
     Sampling source sites         = 9.4626e-02 seconds
     SEND/RECV source sites        = 1.1174e-02 seconds
   Time accumulating tallies       = 2.8037e-04 seconds
   Time writing statepoints        = 5.1687e-03 seconds
 Total time for finalization       = 2.8650e-06 seconds
 Total time elapsed                = 1.2342e+00 seconds
 Calculation Rate (inactive)       = 1.61475e+06 particles/second
 Calculation Rate (active)         = 1.86298e+06 particles/second

 ============================>     RESULTS     <============================

 k-effective (Collision)     = 0.99704 +/- 0.00074
 k-effective (Track-length)  = 0.99882 +/- 0.00052
 k-effective (Absorption)    = 0.99799 +/- 0.00100
 Combined k-effective        = 0.99894 +/- 0.00048
 Leakage Fraction            = 0.67358 +/- 0.00033

```

### 5、运行错误解决

``` 
RuntimeError: No cross_sections.xml file was specified in materials.xml or in the OPENMC_CROSS_SECTIONS environment variable

下载数据库 https://openmc.org/data/

下载数据: ENDF/B-VII.1
```

### 6、Build 错误处理
``` 
error: passing ‘const fmt::v11::formatter<openmc::Position>’ as ‘this’ argument discards

注释掉对应的打印语句就行，不影响运行
``` 


### 7、如果python版本低于3.11,需要升级python版本，升级版本[不建议操作，可以使用Ubuntu24.04系统]

```bash

sudo apt install python3.13 python3.13-venv python3.13-dev -y

查看是否安装成功
python3.13 --version

创建虚拟环境
python3.13 -m venv .venv

激活虚拟环境
source .venv/bin/activate

验证虚拟环境中的 Python 版本
python --version

退出虚拟环境时，只需运行
deactivate
```