# Bilingual Embeddings trained with parallel + monolingual data for low resource languages (monobivec)

## Description
This project is aimed at learning bilingual word representations under low resource settings (from limited parallel corpora) by leveraging easily available monolingual corpora in each language.

Training of Bilingual SkipGram Model: 

![alt text][logo]

[logo]: https://github.com/ksharmar/monobivec/blob/master/biskip_model.png "Training BiSkip"


Adaptation: Including monolingual data in the training process similar to regular skip gram and balancing the loss from binlingual and monolingual signals for unequal number of training sentences in parallel and monolingual corpora. Code found in the repository. Code extended from bivec-https://github.com/lmthang/bivec.

## Experiments

Documentation of experimental evaluation and comparisons found under Bilingual Embeddings Experiments.pdf.

- Work done with Scott Miller and Prem Natarajan.





