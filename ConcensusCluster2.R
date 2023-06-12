#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
suppressPackageStartupMessages(library('ConsensusClusterPlus', character.only = TRUE))
suppressPackageStartupMessages(library(argparse))
parser = ArgumentParser()
parser$add_argument("inputmatrix", nargs=1, help = "matrix of peak names vs log2 normalized RPKM")
opt <- parser$parse_args()

inputmatrix = read.table(opt$inputmatrix,row.names=1,header = TRUE,sep="\t")
inputmatrix = as.matrix(inputmatrix)



res <- ConsensusClusterPlus(inputmatrix, maxK = 10, reps = 500, pItem = 0.8, pFeature = 1, corUse = "complete.obs", seed=123456,clusterAlg="hc",distance="pearson", plot="png", writeTable=T)


