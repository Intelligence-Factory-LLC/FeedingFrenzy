USE [feedingfrenzy]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 8/12/2024 11:57:34 AM ******/

INSERT [dbo].[Features] ([FeatureName], [Version], [IsEnabled], [SettingsAssembly], [SettingsClass], [Settings], [DateCreated], [LastUpdated], [Data]) VALUES (N'Email Feature', N'1.0', 1, N'FeedingFrenzy.Features', N'EmailFeature', N'{"SendWithCredentials": true,
"MailServer": "email-smtp.us-west-2.amazonaws.com",
"MailPort": 587,
"SenderName": "Buffaly",
"SenderEmail": "matt@intelligencefactory.ai",
"UserName": "AKIA4DW3Y6HTG5W7PBHD",
"Password": "BNn/azRsOF+H7b4jpwL/gJwX0ZkG+lbHeu+fqaN0pKPD",
"EnableSsl": true}', CAST(N'2024-08-12T00:00:00.000' AS DateTime), CAST(N'2024-08-12T00:00:00.000' AS DateTime), N'{}')
GO
