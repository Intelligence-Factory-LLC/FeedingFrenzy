USE [feedingfrenzy]
GO

INSERT [dbo].[LeadSubStatuses] ([LeadStatusID], [SubStatusName], [Data], [DateCreated], [LastUpdated]) VALUES (6, N'Duplicate', N'{"Description":"This lead is a duplicate and has been replaced."}', CAST(N'2020-08-12T00:34:39.803' AS DateTime), CAST(N'2023-12-05T16:13:08.290' AS DateTime))
GO
