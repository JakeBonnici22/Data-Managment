#Concatenating all years to one data frame.

d_enr <- bind_rows(cyber.security.1_enrolments, cyber.security.2_enrolments, cyber.security.3_enrolments, cyber.security.4_enrolments, cyber.security.5_enrolments, cyber.security.6_enrolments, cyber.security.7_enrolments)
d_enr <- d_enr[,-c(1,6,7,8,9,10)]
# view(d_enr)
d_vid <- bind_rows(cyber.security.3_video.stats, cyber.security.4_video.stats, cyber.security.5_video.stats, cyber.security.6_video.stats, cyber.security.7_video.stats)
d_vid

# dim(d_enr)
dim(d_vid)
# view(d_enr)
# view(d_vid)


#Checking for null values.
table(is.na(d_vid))

#Summarizing the data frame and checking it`s number of rows.
summary(d_vid)
nrow(d_vid)


# Converting percentage values to counts, and creating a new coloumn with these values.
for(c in 16:28){
  col = colnames(d_vid)[c]
  for(r in d_vid[c]){
   print(col)
    # print(r)
    # print("")
    # print("")
    num_val <- (r/100)*d_vid$total_views
    d_vid[[paste0("num_",colnames(d_vid)[c],sep="")]] = num_val
  }
  
}


# view(d_vid)

df_devices <- d_vid[,c('num_console_device_percentage','num_desktop_device_percentage',
                            'num_mobile_device_percentage', 'num_tv_device_percentage',
                            'num_tablet_device_percentage','num_unknown_device_percentage')]
# view(df_devices)

#Getting the total amount of users watching a lecture on a specified device over the years.
num_console_device_percentage <- c(sum(df_devices['num_console_device_percentage']))
num_console_device_percentage

num_desktop_device_percentage <- c(sum(df_devices['num_desktop_device_percentage']))
num_desktop_device_percentage

num_mobile_device_percentage <- c(sum(df_devices['num_mobile_device_percentage']))
num_mobile_device_percentage

num_tv_device_percentage <- c(sum(df_devices['num_tv_device_percentage']))
num_tv_device_percentage

num_tablet_device_percentage <- c(sum(df_devices['num_tablet_device_percentage']))
num_tablet_device_percentage

num_unknown_device_percentage <- c(sum(df_devices['num_unknown_device_percentage']))
num_unknown_device_percentage

# df_devices_sum <- data.frame(num_console_device_percentage, num_desktop_device_percentage, num_mobile_device_percentage
#                              , num_tv_device_percentage, num_tablet_device_percentage, num_unknown_device_percentage)

#Forming the columns for two seperate data frames.
device <- c("Console", "Desktop", "Mobile", "Tv", "Tablet", "Unknown")
device_occurences <- c(c(sum(df_devices['num_console_device_percentage'])), c(sum(df_devices['num_desktop_device_percentage'])),
                c(sum(df_devices['num_mobile_device_percentage'])), c(sum(df_devices['num_tv_device_percentage'])), 
                c(sum(df_devices['num_tablet_device_percentage'])), c(sum(df_devices['num_unknown_device_percentage'])))


continents <- c("Europe", "Oceania", "Asia", "North America", "South America", "Africa", "Antarctica")
continents_occurences <- c(c(sum(d_vid['num_europe_views_percentage'])), c(sum(d_vid['num_oceania_views_percentage'])),
                c(sum(d_vid['num_asia_views_percentage'])), c(sum(d_vid['num_north_america_views_percentage'])), 
                c(sum(d_vid['num_south_america_views_percentage'])), c(sum(d_vid['num_africa_views_percentage'])), c(sum(d_vid['num_antarctica_views_percentage'])))


#Creating two data frames for the devices and countries.
df_devices_sum<- data.frame(device, device_occurences)
df_continents_sum<- data.frame(continents, continents_occurences) 
as.data.frame(d_vid)

df_devices_sum <- subset(df_devices_sum, df_devices_sum$device_occurences > 1000)
df_continents_sum <- subset(df_continents_sum, df_continents_sum$continents_occurences > 500)
#Viewing and verifying the data frames.


# Splitting the data frame by the step positions.
by_step = group_split(d_vid, step_position, .keep = TRUE)

#Obtaining the total views for each lecture over the years.
one_1 = by_step[[1]][[4]]
one_14 = by_step[[2]][[4]]
one_17 = by_step[[3]][[4]]
one_19 = by_step[[4]][[4]]
one_5 = by_step[[5]][[4]]
two_1 = by_step[[6]][[4]]
two_11 = by_step[[7]][[4]]
two_17 = by_step[[8]][[4]]
two_4 = by_step[[9]][[4]]
three_1 = by_step[[10]][[4]]
three_14 = by_step[[11]][[4]]
three_15 = by_step[[12]][[4]]
three_2 = by_step[[13]][[4]]

#Working out the mean of the total views for each lecture over the years.
mean_one_1 = mean(one_1)
mean_one_14 = mean(one_14)
mean_one_17 = mean(one_17)
mean_one_19 = mean(one_19)
mean_one_5 = mean(one_5)
mean_two_1 = mean(two_1)
mean_two_11 = mean(two_11)
mean_two_17 = mean(two_17)
mean_two_4 = mean(two_4)
mean_three_1 = mean(three_1)
mean_three_14 = mean(three_14)
mean_three_15 = mean(three_15)
mean_three_2 = mean(three_2)


# Labeling each lecture by its step position.
step_positions <- c("1.10", "1.14", "1.17", "1.19", "1.50", "2.10", "2.11", "2.17", "2.40", "3.10",
                    "3.14", "3.15", "3.20")
mean_views <- c(mean_one_1, mean_one_14, mean_one_17, mean_one_19, mean_one_5, mean_two_1, mean_two_11,
                mean_two_17, mean_two_4, mean_three_1, mean_three_14, mean_three_15, mean_three_2)

#Creating and viewing the data frame.
df_step_grp_mean <- data.frame(step_positions, mean_views)
df_step_grp_mean

countries <- c(unique(d_enr["detected_country"]))
countries

d_enr$unenrolled_at[d_enr$unenrolled_at == ""] <- NA 
tot_no_enrolled <- sum(!is.na(d_enr$enrolled_at))
tot_no_unenrolled <- sum(!is.na(d_enr$unenrolled_at))

enr_names <- c("Enrolled", "Unenrolled")
enr_uner_vals <- c(tot_no_enrolled, tot_no_unenrolled)
df_tot_enr<- data.frame(enr_names, enr_uner_vals)
df_tot_enr





d_enr_1 <- c(cyber.security.1_enrolments)
d_enr_1$unenrolled_at[d_enr_1$unenrolled_at == ""] <- NA 
tot_no_enrolled_1 <- sum(!is.na(d_enr_1$enrolled_at))
tot_no_unenrolled_1 <- sum(!is.na(d_enr_1$unenrolled_at))
rd_1 = format(round(tot_no_unenrolled_1/tot_no_enrolled_1, 2)*100, nsmall = 2)


d_enr_2 <- c(cyber.security.2_enrolments)
d_enr_2$unenrolled_at[d_enr_2$unenrolled_at == ""] <- NA 
tot_no_enrolled_2 <- sum(!is.na(d_enr_2$enrolled_at))
tot_no_unenrolled_2 <- sum(!is.na(d_enr_2$unenrolled_at))
rd_2 = format(round(tot_no_unenrolled_2/tot_no_enrolled_2, 2)*100, nsmall = 2)


d_enr_3 <- c(cyber.security.3_enrolments)
d_enr_3$unenrolled_at[d_enr_3$unenrolled_at == ""] <- NA 
tot_no_enrolled_3 <- sum(!is.na(d_enr_3$enrolled_at))
tot_no_unenrolled_3 <- sum(!is.na(d_enr_3$unenrolled_at))
rd_3 = format(round(tot_no_unenrolled_3/tot_no_enrolled_3, 2)*100, nsmall = 2)


d_enr_4 <- c(cyber.security.4_enrolments)
d_enr_4$unenrolled_at[d_enr_4$unenrolled_at == ""] <- NA 
tot_no_enrolled_4 <- sum(!is.na(d_enr_4$enrolled_at))
tot_no_unenrolled_4 <- sum(!is.na(d_enr_4$unenrolled_at))
rd_4 = format(round(tot_no_unenrolled_4/tot_no_enrolled_4, 2)*100, nsmall = 2)


d_enr_5 <- c(cyber.security.5_enrolments)
d_enr_5$unenrolled_at[d_enr_5$unenrolled_at == ""] <- NA 
tot_no_enrolled_5 <- sum(!is.na(d_enr_5$enrolled_at))
tot_no_unenrolled_5 <- sum(!is.na(d_enr_5$unenrolled_at))
rd_5 = format(round(tot_no_unenrolled_5/tot_no_enrolled_5, 2)*100, nsmall = 2)


d_enr_6 <- c(cyber.security.6_enrolments)
d_enr_6$unenrolled_at[d_enr_6$unenrolled_at == ""] <- NA 
tot_no_enrolled_6 <- sum(!is.na(d_enr_6$enrolled_at))
tot_no_unenrolled_6 <- sum(!is.na(d_enr_6$unenrolled_at))
rd_6 = format(round(tot_no_unenrolled_6/tot_no_enrolled_6, 2)*100, nsmall = 2)


d_enr_7 <- c(cyber.security.7_enrolments)
d_enr_7$unenrolled_at[d_enr_7$unenrolled_at == ""] <- NA 
tot_no_enrolled_7 <- sum(!is.na(d_enr_7$enrolled_at))
tot_no_unenrolled_7 <- sum(!is.na(d_enr_7$unenrolled_at))
rd_7 = format(round(tot_no_unenrolled_7/tot_no_enrolled_7, 2)*100, nsmall = 2)


yr_lvls <- c("SEP 2016", "MAR 2017", "SEP 2017", "NOV 2017", "FEB 2018", "JUNE 2018", "SEP 2018")

years <- factor(c("SEP 2016", "MAR 2017", "SEP 2017", "NOV 2017", "FEB 2018", "JUNE 2018", "SEP 2018"), levels=yr_lvls)
percentage_unenrollment <- as.integer(c(rd_1, rd_2, rd_3, rd_4, rd_5, rd_6, rd_7))
class(percentage_unenrollment)
yrs_course = data.frame(years, percentage_unenrollment)
yrs_course
years

