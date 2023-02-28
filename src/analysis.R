## FIRST CYCLE ##
###################################################################################
          ## Which devices are most popular to follow online lectures? ##
###################################################################################

device_popularity<-ggplot(data=df_devices_sum, aes(x=device, y=device_occurences)) +
  geom_bar(stat="identity", fill = "#FF6666") + labs(title = "Frequency of different devices ",
        x = "Device", y = "Frequency")

device_popularity

# Correlation between Video Duration and Total Views
cor(d_vid$total_views, d_vid$video_duration)


###################################################################################
  ## What is the trend of the mean views as the year progresses with lectures? ##
###################################################################################

lecture_mean_views <- ggplot(data=df_step_grp_mean, aes(x=step_positions, y=mean_views)) +
  geom_bar(stat="identity", fill = "#FF6666") +
  geom_smooth(data=df_step_grp_mean,aes(x = step_positions, y = mean_views, group=1),
                                       method = "lm", se= TRUE, color = "purple", size = 1.5) 
lecture_mean_views

cor(df_step_grp_mean$mean_views, as.numeric(df_step_grp_mean$step_positions))

###################################################################################
          ## Which continents are most popular with online learning? ##
###################################################################################

continents <- ggplot(data=df_continents_sum, aes(x=continents, y=continents_occurences)) +
  geom_bar(stat="identity", fill = "#FF6666") + 
  geom_text(data=df_continents_sum,aes(x=continents,y=continents_occurences,
                                      label=continents_occurences),vjust=-1)
continents



## SECOND CYCLE ##
###################################################################################
         ## Which countries are the most popular with online learning? ##
###################################################################################


d_enr %>% 
  group_by(detected_country) %>%
  count %>%
  filter(n > 1000) %>%
  ggplot(aes(x = detected_country, y = n)) + 
  geom_bar(stat = "identity", fill = "#FF6666") + labs(title = "Frequency of the Countries of which students attend the MOOC ",
                                                     x = "Countries", y = "Frequency")




###################################################################################
                         ## Unenrollment rate per year? ##
###################################################################################
total_enrollments <- ggplot(data=df_tot_enr, aes(x=enr_names, y=enr_uner_vals)) +
  geom_bar(stat="identity", fill = "#FF6666") + 
  geom_text(data=df_tot_enr,aes(x=enr_names,y=enr_uner_vals,
                                        label=enr_uner_vals),vjust=-1)
total_enrollments



###################################################################################
                ## Total rate of unenrollment over the years? ##
###################################################################################

round((tot_no_unenrolled/tot_no_enrolled)*100)



lineg <-ggplot(yrs_course, aes(x=years, y=percentage_unenrollment, group=1)) +
  geom_line() + geom_point(colour = "#FF6666", size=5) + geom_text(data=yrs_course,aes(x=years,y=percentage_unenrollment,
                                label=percentage_unenrollment),vjust=-1)
lineg



