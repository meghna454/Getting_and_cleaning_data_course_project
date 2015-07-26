---
title: "CodeBook"
output: html_document
---
**The packages plyr, dplyr and reshape2 were used for the script.**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

**These signals were used to estimate variables of the feature vector for each pattern: **

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ,

tGravityAcc-XYZ,

tBodyAccJerk-XYZ,

tBodyGyro-XYZ,

tBodyGyroJerk-XYZ,

tBodyAccMag,

tGravityAccMag,

tBodyAccJerkMag,

tBodyGyroMag,

tBodyGyroJerkMag,

fBodyAcc-XYZ,

fBodyAccJerk-XYZ,

fBodyGyro-XYZ,

fBodyAccMag,

fBodyAccJerkMag,

fBodyGyroMag,

fBodyGyroJerkMag


**The set of variables that were estimated from these signals are: **

mean(): Mean value,

std(): Standard deviation,

mad(): Median absolute deviation ,

max(): Largest value in array,

min(): Smallest value in array,

sma(): Signal magnitude area,

energy(): Energy measure. Sum of the squares divided by the number of values,

iqr(): Interquartile range,

entropy(): Signal entropy,

arCoeff(): Autorregresion coefficients with Burg order equal to 4,

correlation(): correlation coefficient between two signals,

maxInds(): index of the frequency component with largest magnitude,

meanFreq(): Weighted average of the frequency components to obtain a mean frequency,

skewness(): skewness of the frequency domain signal,

kurtosis(): kurtosis of the frequency domain signal,

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window,

angle(): Angle between to vectors.

**Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:**

gravityMean,

tBodyAccMean,

tBodyAccJerkMean,

tBodyGyroMean,

tBodyGyroJerkMean

**Out of the entire dataset, only the mean and the standard deviation values for each subject and activity were extracted. **
**From this dataset, a second, independent tidy data set with the average of each variable for each activity and each subject was created. **

**Columns**

1.  SUBJECT - The person performing each activity(1:30)

2.  ACTIVITY - The six activities the volunteers performed
              1 - WALKING
              2 - WALKING_UPSTAIRS
              3 - WALKING_DOWNSTAIRS
              4 - SITTING
              5 - STANDING
              6 - LAYING

3.  Group_mean_tBodyAcc_mean.X - Average of mean values of Body Accelaration along X axis of each activity and subject in time domain. 

4.  Group_mean_tBodyAcc_mean.Y - Average of mean values of Body Accelaration along Y axis of each activity and subject in time domain 

5.  Group_mean_tBodyAcc_mean.Z - Average of mean values of Body Accelaration along Z axis of each activity and subject in time domain 

6.  Group_mean_tGravityAcc_mean.X- Average of mean values of Gravitational Accelaration along X axis of each activity and subject in time domain 

7.  Group_mean_tGravityAcc_mean.Y- Average of mean values of Gravitational Accelaration along Y axis of each activity and subject in time domain 

8.  Group_mean_tGravityAcc_mean.Z- Average of mean values of Gravitational Accelaration along Z axis of each activity and subject in time domain 

9.  Group_mean_tBodyAccJerk_mean.X- Average of mean values of Body Accelaration and Jerk along X axis of each activity and subject in time domain. 

10. Group_mean_tBodyAccJerk_mean.Y- Average of mean values of Body Accelaration and Jerk along Y axis of each activity and subject in time domain. 

11. Group_mean_tBodyAccJerk_mean.Z- Average of mean values of Body Accelaration and Jerk along Z axis  of each activity and subject in time domain. 

12. Group_mean_tBodyGyro_mean.X-Average of mean values of Body Gyro along X axis of each activity and subject in time domain .

13. Group_mean_tBodyGyro_mean.Y-Average of mean values of Body Gyro along Y axis of each activity and subject in time domain 

14. Group_mean_tBodyGyro_mean.Z-Average of mean values of Body Gyro along Z axis of each activity and subject in time domain 

15. Group_mean_tBodyGyroJerk_mean.X- Average of mean values of Jerk signals along X axis of each activity and subject in time domain 

16. Group_mean_tBodyGyroJerk_mean.Y- Average of mean values of Jerk signals along Y axis of each activity and subject in time domain 

17. Group_mean_tBodyGyroJerk_mean.Z- Average of mean values of Jerk signals along Z axis of each activity and subject in time domain 

18. Group_mean_tBodyAccMag_mean- Average of mean values of Body acceleration Magnitude of each activity and subject in time domain 

19. Group_mean_tGravityAccMag_mean- Average of mean values of Gravitational acceleration Magnitude of each activity and subject in time domain 

20. Group_mean_tBodyAccJerkMag_mean- Average of mean values of Body acceleration and jerk Magnitude of each activity and subject in time domain 

21. Group_mean_tBodyGyroMag_mean- Average of mean values of Body Gyro Magnitude of each activity and subject in time domain 

22. Group_mean_tBodyGyroJerkMag_mean- Average of mean values of Body jerk signals Magnitude of each activity and subject in time domain 

23. Group_mean_fBodyAcc_mean.X- Average of mean values of Body Acceleration along X axis of each activity and subject in frequency domain 

24. Group_mean_fBodyAcc_mean.Y- Average of mean values of Body Acceleration along Y axis of each activity and subject in frequency domain

25. Group_mean_fBodyAcc_mean.Z- Average of mean values of Body Acceleration along Z axis of each activity and subject in frequency domain 

26. Group_mean_fBodyAcc_meanFreq.X- Average of Body Acceleration along X axis of each activity and subject with mean frequency in frequency domain 

27. Group_mean_fBodyAcc_meanFreq.Y- Average of Body Acceleration along Y axis of each activity and subject with mean frequency in frequency domain 

28. Group_mean_fBodyAcc_meanFreq.Z- Average of Body Acceleration along Z axis of each activity and subject with mean frequency in frequency domain 

29. Group_mean_fBodyAccJerk_mean.X- Average of mean values of Body Acceleration and Jerk along X axis of each activity and subject in frequency domain 

30. Group_mean_fBodyAccJerk_mean.Y- Average of mean values of Body Acceleration and Jerk along Y axis of each activity and subject in frequency domain 

31. Group_mean_fBodyAccJerk_mean.Z- Average of mean values of Body Acceleration and Jerk along Z axis of each activity and subject in frequency domain 

32. Group_mean_fBodyAccJerk_meanFreq_X- Average of Body Acceleration and jerk along X axis of each activity and subject with mean frequency in frequency domain 

33. Group_mean_fBodyAccJerk_meanFreq_Y- Average of Body Acceleration and jerk along Y axis of each activity and subject with mean frequency in frequency domain 

34. Group_mean_fBodyAccJerk_meanFreq_Z- Average of Body Acceleration and jerk along Z axis of each activity and subject with mean frequency in frequency domain 

35. Group_mean_fBodyGyro_mean.X- Average of mean values of Body Gyro along X axis of each activity and subject in frequency domain 

36. Group_mean_fBodyGyro_mean.Y- Average of mean values of Body Gyro along Y axis of each activity and subject in frequency domain 

37. Group_mean_fBodyGyro_mean.Z-Average of mean values of Body Gyro along Z axis of each activity and subject in frequency domain

38. Group_mean_fBodyGyro_meanFreq.X- Average of mean values of Body Gyro along Z axis of each activity and subject with mean frequency in frequency domain 

39. Group_mean_fBodyGyro_meanFreq.Y- Average of mean values of Body Gyro along Z axis of each activity and subject with mean frequency in frequency domain 

40. Group_mean_fBodyGyro_meanFreq.Z- Average of mean values of Body Gyro along Z axis of each activity and subject with mean frequency in frequency domain 

41. Group_mean_fBodyAccMag_mean- Average of mean values of Body Acceleration Magnitude of each activity and subject in frequency domain 

42. Group_mean_fBodyAccMag_meanFreq- Average of mean values of Body Acceleration Magnitude of each activity and subject with mean frequency in frequency domain 

43. Group_mean_fBodyBodyAccJerkMag_mean - Average of mean values of Body Acceleration Jerk Magnitude of each activity and subject in frequency domain 

44. Group_mean_fBodyBodyAccJerkMag_meanFreq- Average of mean values of Body Accl Jerk Magnitude of each activity and subject with mean frequency in frequency domain

45. Group_mean_fBodyBodyGyroMag_mean- Average of mean values of Body Gyro Magnitude of each activity and subject in frequency domain

46. Group_mean_fBodyBodyGyroMag_meanFreq- Average of mean values of Body Gyro Magnitude of each activity and subject with mean frequency in frequency domain 

47. Group_mean_fBodyBodyGyroJerkMag_mean- Average of mean values of Body Gyro Jerk Magnitude of each activity and subject in frequency domain 

48. Group_mean_fBodyBodyGyroJerkMag_meanFreq- Average of mean values of Body Gyro Jerk Magnitude of each activity and subject with mean frequency in freq domain 

49. Group_std_tBodyAcc_std.X- Average of std dev of Body Acceleration along X axis in time domain 

50. Group_std_tBodyAcc_std.Y- Average of std dev of Body Acceleration along Y axis in time domain 

51. Group_std_tBodyAcc_std.Z- Average of std dev of Body Acceleration along Z axis in time domain

52. Group_std_tGravityAcc_std.X- Average of std dev of Gravitational Acceleration along X axis in time domain 

53. Group_std_tGravityAcc_std.Y- Average of std dev of Gravitational Acceleration along Y axis in time domain 

54. Group_std_tGravityAcc_std.Z- Average of std dev of Gravitational Acceleration along Z axis in time domain 

55. Group_std_tBodyAccJerk_std.X- Average of std dev of Body Acceleration and Jerk along X axis in time domain 

56. Group_std_tBodyAccJerk_std.Y- Average of std dev of Body Acceleration and Jerk along X axis in time domain 

57. Group_std_tBodyAccJerk_std.Z- Average of std dev of Body Acceleration and Jerk along X axis in time domain 

58. Group_std_tBodyGyro_std.X- Average of std dev of Body Gyro along X axis in time domain 

59. Group_std_tBodyGyro_std.Y- Average of std dev of Body Gyro along Y axis in time domain

60. Group_std_tBodyGyro_std.Z- Average of std dev of Body Gyro along Z axis in time domain 

61. Group_std_tBodyGyroJerk_std.X- Average of std dev of Body Jerk signals along X axis in time domain 

62. Group_std_tBodyGyroJerk_std.Y- Average of std dev of Body Jerk signals along Y axis in time domain

63. Group_std_tBodyGyroJerk_std.Z- Average of std dev of Body Jerk signals along Z axis in time domain 

64. Group_std_tBodyAccMag_std- Average of std dev of Body Acceleration Magnitude in time domain 

65. Group_std_tGravityAccMag_std- Average of std dev of Gravitational Acceleration Magnitude  in time domain

66. Group_std_tBodyAccJerkMag_std- Average of std dev of Body Acceleration and Jerk Magnitude  in time domain 

67. Group_std_tBodyGyroMag_std- Average of std dev of Body Gyro Magnitude  in time domain 

68. Group_std_tBodyGyroJerkMag_std- Average of std dev of Body Jerk signals Magnitude  in time domain 

69. Group_std_fBodyAcc_std.X- Average of std dev of Body Acceleration along X axis in frequency domain 

70. Group_std_fBodyAcc_std.Y- Average of std dev of Body Acceleration along Y axis in frequency domain 

71. Group_std_fBodyAcc_std.Z- Average of std dev of Body Acceleration along Z axis in frequency domain 

72. Group_std_fBodyAccJerk_std.X- Average of std dev of Body Acceleration and Jerk along X axis in frequency domain 

73. Group_std_fBodyAccJerk_std.Y- Average of std dev of Body Acceleration and Jerk along Y axis in frequency domain 

74. Group_std_fBodyAccJerk_std.Z- Average of std dev of Body Acceleration and Jerk along Z axis in frequency domain 

75. Group_std_fBodyGyro_std.X- Average of std dev of Body Gyro along X axis in frequency domain 

76. Group_std_fBodyGyro_std.Y- Average of std dev of Body Gyro along Y axis in frequency domain 

77. Group_std_fBodyGyro_std.Z- Average of std dev of Body Gyro along Z axis in frequency domain 

78. Group_std_fBodyAccMag_std- Average of std dev of Body Acceleration Magnitude in frequency domain 

79. Group_std_fBodyBodyAccJerkMag_std- Average of std dev of Body Acceleration and Jerk signals Magnitude in frequency domain 

80. Group_std_fBodyBodyGyroMag_std- Average of std dev of Body Gyro Magnitude in frequency domain 

81. Group_std_fBodyBodyGyroJerkMag_std- Average of std dev of Body Gyro and Jerk signals Magnitude in frequency domain 


