install.packages("tidyverse")
library(tidyverse)
install.packages("Stat2Data")
library(Stat2Data)
data("Hawks")
hawksSmall<-drop_na(select(Hawks,Age,Day,Month,Year,CaptureTime,Species,Wing,Weight,Tail))


# 1.1 Types of variables

# Check how many rows and columns hawksSmall using the dim() function.
dim(hawksSmall)
# Display the top 5 rows of the hawksSmall data frame
head(hawksSmall)

"
continuous, discrete or categorical?
1. Month
Discrete
2. Species
Categorical
3. Age
Continuous
4. Wing
Continuous
5. Weight
Continuous
"

# 1.2 What’s wrong with this plot?

# Too many variates in same plot causes confusion and should be avoided.

# 1.3 Generate a histogram

hawk_weight <- ggplot(data=hawksSmall, aes(x=Weight))+xlab("Weight (gm)")
hawk_weight+geom_histogram(binwidth=100)+ylab("Count")

# 1.4 Generate a density plot
hawk_tail <- ggplot(data=hawksSmall, aes(x=Tail))+xlab("Tail (mm)")
hawk_tail+ geom_density(adjust=0.5)+ylab("Density")
# adjust at 0.5 shows a Trimodal density plot while at 1 gives a Bimodal density plot

hawk_tail2 <- ggplot(data=hawksSmall, aes(x=Tail,color=Species))+
  geom_density(adjust=1)+theme_bw()+xlab("Tail (mm)")+ylab("Density")
hawk_tail2

hawk_tail3 <- ggplot(data=hawksSmall, aes(x=Tail,y=Species,fill=Species))+
  geom_violin()+theme_bw()+xlab("Tail (mm)")+ylab("Species")
hawk_tail3

# 1.5 Scatter plots
# two aes: color and shape
hawk_tail4 <- ggplot(data=hawksSmall, aes(x=Tail,y=Weight))+
  geom_point(aes(color=Species,shape=Species))
hawk_tail4

# 1.6 Trend lines and facet wraps
hawk_tail5 <- ggplot(data=hawksSmall, aes(x=Tail,y=Weight))+
  geom_point(aes(color=Species)) +
  facet_wrap(~Species,scales="free")+
  geom_smooth(method="lm")+
  theme_bw()+
  xlab("Tail (mm)")+
  ylab("Weight (gm)")
hawk_tail5


# 2 Data wrangling

# 2.1 Select and filter functions

head(Hawks)
hSF <- Hawks %>% 
  filter(Species=="RT",Weight>c(1000)) %>%
  select("Wing","Weight","Tail")
hSF

species_code <- unique(Hawks$Species)
species_name_full <- c("Red-tailed","Cooper's","Sharp-shinned")
full_name_df <- data.frame(species_code,species_name_full)
full_name_df

HawksFullName <- Hawks %>% 
  rename(species_code = Species) %>%
  left_join(full_name_df) %>%
  rename(Species = species_name_full) %>%
  select(-species_code)

Hawks
FullName 








