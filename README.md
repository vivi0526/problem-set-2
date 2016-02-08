[![Build Status](https://travis-ci.org/MOLB7621/problem-set-2.svg?branch=master)](https://travis-ci.org/MOLB7621/problem-set-2)

# Problem Set 2

| **Due**: 5pm on Feb 16

## Workflow

1. To start, [**fork** the repository][forking].
1. [**Clone**][ref-clone] the repository to your computer.
1. Modify the files and [**commit**][ref-commit] changes to complete your
solution.
1. [**Push**][ref-push]/sync the changes up to GitHub.
1. Make corrections until the Travis CI build status icon changes to green
/ passing
1. [Create a **pull request**][pull-request] on the original repository to
turn in the assignment.

[forking]: https://guides.github.com/activities/forking/
[ref-clone]: http://gitref.org/creating/#clone
[ref-commit]: http://gitref.org/basic/#commit
[ref-push]: http://gitref.org/remotes/#push
[pull-request]: https://help.github.com/articles/creating-a-pull-request

For each problem, you should use simple Unix commands to arrive at the
correct answer.  Put all your work in a `run.sh` file that generates
a `answers.yml` file.

```
# ansewer.yml should look like this:
answer-1: 123
answer-2: 456
```

For this problem set you will use BEDtools to do some calculations. Each
problem is worth 10 points.

<!-- still need a region file with e.g. genes in BED format -->

These files are in the `data/` directory.

- Fasta file with human genome sequence: `chr1.hg19.fa.gz`
- Bedgraph with CTCF ChIP-seq data in bedGraph format: `ctcf.hela.chr22.bg.gz`
- A "genome file" with chromosome size info: `hg19.genome.gz`
- A file containing transcription start sites (TSS) for `chr22`: `tss.hg19.chr22.bed.gz`

## Question 1

Use BEDtools intersect to identify the size of the largest overlap between
`ctcf.peaks.bed.gz` and `h3XXX.peaks.bed.gz`

## Question 2

Use BEDtools to calculate the GC content of the first 500 bp of chromosome
22 in the `hg19` genome build. Report as a fraction (e.g., 0.50).

## Question 3

Use BEDtools to identify the length of the interval in `XXX.bed.gz` that
has the largest mean signal in `XXX.bg.gz`

## Question 4

Use BEDtools to identify the promoter (1000 bp upstream of a TSS)
containing the single nucleotide with the highest signal in
`ctcf.hela.chr22.bg.gz`.  Report the interval like `chr1:100-500`.

## Question 5

Use BEDtools to identify the longest interval on `chr22` that is not
covered by `genes.bed.gz`. Report the interval like `chr1:100-500`.

