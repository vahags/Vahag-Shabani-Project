USE [s16guest73]
GO

INSERT [system]([systemID], [systemName])
VALUES
	(1, 'Windows'),
	(2,   'Linux'),
	(3,  'AppleOS')
GO

INSERT [genre]([genreID], [genreName])
VALUES
	(1, 'Healthcare')
GO

INSERT [product]([productID], [productName], [productDescr], [systemID], [genreID])
VALUES
	(1, 'EHR System', 'Health system records for the patients', 1, 1),
	(2, 'EHR System', 'Health system records for the patients', 2, 1)
GO

INSERT [productVersion]([productVersionID], [productVersionName])
VALUES
	(1, 'v1.1'),
	(2, 'v1.2'),
	(3, 'v2.1'),
	(4, 'v2.2')
GO

INSERT [feature]([featureID], [featureDescr], [featureDate], [productID], [productVersionID])
VALUES
	( 1,              'Login module', '2000-01-30', 1, 1),
	( 2,      'Patient registration', '2000-02-08', 1, 1),
	( 3,           'Patient profile', '2000-02-10', 1, 1),
	( 4,      'Patient release form', '2000-03-03', 1, 1),
	( 5,         'Physician profile', '2000-03-09', 1, 1),
	( 6,     'Address veirification', '2000-03-15', 1, 1),
	( 7,              'Login module', '2000-03-25', 2, 2),
	( 8,      'Patient registration', '2000-03-29', 2, 2),
	( 9,           'Patient profile', '2000-04-13', 2, 2),
	(10,      'Patient release form', '2000-04-17', 2, 2),
	(11,         'Physician profile', '2000-04-23', 2, 2),
	(12,     'Address veirification', '2000-04-26', 2, 2),
	(13,    'Patient authentication', '2000-05-08', 1, 3),
	(14,   'Patient medication form', '2000-05-09', 1, 3),
	(15,            'Patient e-bill', '2000-05-11', 1, 3),
	(16,         'Patient reporting', '2000-05-13', 1, 3),
	(17,    'Patient authentication', '2000-05-14', 2, 4),
	(18,   'Patient medication form', '2000-05-15', 2, 4),
	(19,            'Patient e-bill', '2000-05-18', 2, 4),
	(20,         'Patient reporting', '2000-05-24', 2, 4),
	(21, 'Patient reporting bug fix', '2000-06-13', 2, 4)
GO

INSERT [releaseVersion]([releaseVersionID], [releaseVersionName])
VALUES
	(1, 'v1.1'),
	(2, 'v2.1'),
	(3, 'v2.2')
GO

INSERT [releaseType]([releaseTypeID], [releaseTypeName])
VALUES
	(1, 'New product release.'),
	(2, 'Bug-fix release.')
GO

INSERT [releases]([releaseID], [releaseDate], [releaseVersionID], [releaseTypeID], [featureID])
VALUES
	(1, '2000-01-30', 1, 1,  6),
	(2, '2000-02-07', 1, 1, 12),
	(3, '2000-04-23', 2, 1, 16),
	(4, '2000-05-18', 2, 1, 20),
	(5, '2000-06-13', 3, 2, 21)
GO

INSERT [street]([streetID], [streetName])
VALUES
	(1, '123 Privet Street'),
	(2,     '348 Jinx Road'),
	(3,                  '')
GO

INSERT [city]([cityID], [cityName])
VALUES
	(1, 'Los Angeles'),
	(2,      'London'),
	(3,            '')
GO

INSERT [states]([stateID], [stateName])
VALUES
	(1, 'California'),
	(2,    'England'),
	(3,           '')
GO

INSERT [country]([countryID], [countryName])
VALUES
	(1,  'United Kingdom'),
	(2, 'United States'),
	(3,               '')
GO

INSERT [company]([companyID], [companyName], [streetID], [cityID], [stateID], [zipCode], [countryID])
VALUES
	(1, 'ABC Records', 1, 1, 1, 91601, 1),
	(2,    'ZYX Corp', 2, 2, 2,     0, 2),
	(3,    '99 Store', 3, 3, 3,     0, 3)
GO

INSERT [phoneType]([phoneTypeID], [phoneTypeName])
VALUES
	(1,   'Work'),
	(2, 'Mobile')
GO

INSERT [users]([userName], [firstName], [lastName], [email], [password], [phoneNumber], [phoneTypeID], [companyID])
VALUES
	(   'PeterSmithABC', 'Peter',     'Smith',               'p.smith@abc.com',  'letter23',   '123-485-8973', 1, 1),
	(  'MariaBounteZYX', 'Maria',    'Bounte',                 'maria@zyx.com',   'books45', '1-28-397863896', 1, 2),
	('DavidSommerset99', 'David', 'Sommerset', 'david.sommerset@99cents.store',   'cable38',  '179-397-87968', 2, 3),
	(   'MariaBounte99', 'Maria',    'Bounte',    'maria.bounte@99cents.store', 'cabinet11',  '178-763-98764', 2, 3)
GO

INSERT [download]([downloadID], [downloadDate], [userName], [releaseID])
VALUES
	(1, '2000-06-01',    'PeterSmithABC', 3),
	(2, '2000-03-01',   'MariaBounteZYX', 3),
	(3, '2000-07-01', 'DavidSommerset99', 5),
	(4, '2000-09-01',    'MariaBounte99', 5)
GO