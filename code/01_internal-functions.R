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
