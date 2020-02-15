

FIDLE - Formation Introduction au Deep Learning
===============================================
---
S. Arias, E. Maldonado, JL. Parouty - CNRS/SARI/DEVLOG - 2020  

## 0/ SSH et accès aux machines de calcul Gricad
Fichier config à créer sous $HOME/.ssh
```
ForwardAgent yes

Host *.ciment
User votre_login
ProxyCommand ssh -q votre_login@access-rr-ciment.imag.fr "nc -w 60 `basename %h .cime
nt` %p"
LocalForward 8888 f-dahu:numerodeport_particulier
```
## 1/ Environment
To run this examples, you need an environment with the following packages :
 - Python 3.6
 - numpy
 - Tensorflow 2.0
 - scikit-image
 - scikit-learn
 - Matplotlib
 - seaborn
 - pyplot

You can install such a predefined environment :
```
conda env create -f environment.yml
```

To manage conda environment see [there](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#)  



## 4/ Misc
To update an existing environment :  
```
conda env update --name=deeplearning2 --file=environment.yml
```
