##### Custom functions that can be sourced for analysis #####

#################################################################################
#### inputw #### (This function is an internal function from the seewave package)
#################################################################################

inputw <- function(
  wave,
  f,
  channel = 1,
  bit = 16
)
  
{
  if(is.data.frame(wave))   {f <- f ; wave <- as.matrix(wave[,channel])}
  if(is.vector(wave))       {f <- f ; wave <- as.matrix(wave)}
  ## WaveMC and mts objects are matrix by default, there is then a conflict between is.matrix and is.mts
  if(is.matrix(wave) && !is.mts(wave) && class(wave)[1] != "WaveMC") {f <- f ; wave <- wave[,channel,drop=FALSE]}
  if(is.ts(wave))           {if(missing(f) || is.null(f)) {f <- frequency(wave)} ; wave <- as.matrix(wave)} 
  if(is.mts(wave))          {if(missing(f) || is.null(f)) {f <- frequency(wave)} ; wave <- as.matrix(wave[, channel])} 
  if(class(wave)[1]=="Sample") {if(missing(f) || is.null(f)) {f <- wave$rate} ; wave <- as.matrix(wave$sound[channel, ]) ; bit=wave@bits}
  if(class(wave)[1]=="audioSample"){if(missing(f) || is.null(f)) {f <- wave$rate} ; bit=wave$bits; wave <- as.matrix(wave)}
  if(class(wave)[1]=="sound")  {if(missing(f) || is.null(f)) {f <- wave$fs} ; wave <- as.matrix(wave$sound)}
  if(class(wave)[1]=="Wave")
  {
    if(missing(f) || is.null(f)) {f <- wave@samp.rate}
    bit <- wave@bit
    if(channel==1) {wave <- as.matrix(wave@left)}   
    if(channel==2) {wave <- as.matrix(wave@right)}     
  }
  if(class(wave)[1]=="WaveMC")
  {
    if(missing(f) || is.null(f)) {f <- wave@samp.rate}
    bit <- wave@bit
    wave <- as.matrix(wave@.Data[, channel])
  }
  return(list(w=wave, f=f, bit=bit))
}

###################################################################################
#### sspectro #### (This function is an internal function from the seewave package)
###################################################################################

sspectro <- function(
  wave,
  f,
  wl = 512,
  ovlp = 0,
  wn = "hanning",
  norm = TRUE,
  correction = "none"
)
  
{
  input <- inputw(wave=wave,f=f) ; wave<-input$w ; f<-input$f ; rm(input)
  n <- nrow(wave)
  step <- seq(1,n+1-wl,wl-(ovlp*wl/100)) # +1 added @ 2017-04-20
  W <- ftwindow(wl=wl,wn=wn,correction=correction)
  z <- apply(as.matrix(step), 1, function(x) Mod(fft(wave[x:(wl+x-1),]*W)))
  z <- z[2:(1+wl/2),]
  if(norm) {z <- z/max(z)}
  return(z)
}


#################################################################################
### Scaling a range of values between 0 and 1 (for the space use analysis)
#################################################################################

range01 <- function(x){(x-min(x))/(max(x)-min(x))}

##########################################################################################################
### Stratified - a function that can be used to essentially choose random number of samples after grouping
##########################################################################################################

stratified <- function(df, group, size, select = NULL, 
                       replace = FALSE, bothSets = FALSE) {
  if (is.null(select)) {
    df <- df
  } else {
    if (is.null(names(select))) stop("'select' must be a named list")
    if (!all(names(select) %in% names(df)))
      stop("Please verify your 'select' argument")
    temp <- sapply(names(select),
                   function(x) df[[x]] %in% select[[x]])
    df <- df[rowSums(temp) == length(select), ]
  }
  df.interaction <- interaction(df[group], drop = TRUE)
  df.table <- table(df.interaction)
  df.split <- split(df, df.interaction)
  if (length(size) > 1) {
    if (length(size) != length(df.split))
      stop("Number of groups is ", length(df.split),
           " but number of sizes supplied is ", length(size))
    if (is.null(names(size))) {
      n <- setNames(size, names(df.split))
      message(sQuote("size"), " vector entered as:\n\nsize = structure(c(",
              paste(n, collapse = ", "), "),\n.Names = c(",
              paste(shQuote(names(n)), collapse = ", "), ")) \n\n")
    } else {
      ifelse(all(names(size) %in% names(df.split)),
             n <- size[names(df.split)],
             stop("Named vector supplied with names ",
                  paste(names(size), collapse = ", "),
                  "\n but the names for the group levels are ",
                  paste(names(df.split), collapse = ", ")))
    }
  } else if (size < 1) {
    n <- round(df.table * size, digits = 0)
  } else if (size >= 1) {
    if (all(df.table >= size) || isTRUE(replace)) {
      n <- setNames(rep(size, length.out = length(df.split)),
                    names(df.split))
    } else {
      message(
        "Some groups\n---",
        paste(names(df.table[df.table < size]), collapse = ", "),
        "---\ncontain fewer observations",
        " than desired number of samples.\n",
        "All observations have been returned from those groups.")
      n <- c(sapply(df.table[df.table >= size], function(x) x = size),
             df.table[df.table < size])
    }
  }
  temp <- lapply(
    names(df.split),
    function(x) df.split[[x]][sample(df.table[x],
                                     n[x], replace = replace), ])
  set1 <- do.call("rbind", temp)
  
  if (isTRUE(bothSets)) {
    set2 <- df[!rownames(df) %in% rownames(set1), ]
    list(SET1 = set1, SET2 = set2)
  } else {
    set1
  }
}

###############################################################################################################
### extractRandWindow - function that starts at a random position and extracts n Number of consecutive integers
###############################################################################################################

extractRandWindow <- function(x, p){
  firstIndex = sample(seq(length(x) - p + 1), 1)
  x[firstIndex:(firstIndex + p -1)]
}