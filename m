Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A1322C99;
	Tue, 25 Nov 2025 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079515; cv=fail; b=UjT7ihdy9FmVygNOBCd6/bX1DHtHTVEkY/hng0T5CGsEEMlev3V1yQXI83ni5mMeS/cIhUNnfy4xpWBtqpxjpU8vXxGYWngxKffsrBRHSkEJWSapau9huSubBdiTVpmRhNuP0Ef040JXl7M4jyV7nagy+HLbmmLNIr8LMZKYzb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079515; c=relaxed/simple;
	bh=nI8wkuqY5F5qB2ZVESWBkkZ0aYrdA/kIhKXCMpBkElc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOdWOPqI+t2iAaOnk6Q/nqfwTMa3L06Wx9+T4KWe454+Mf1hI9wT+B5eMTA8vTOe25QjXnpilJgE70NlAa5+ZIJXALr+3F+B7hlBd92v++LIwjVgxNMPOd89dvMdZr3TwlOjmBHuQ1RABwbKliuVnCKLC3vFTtJ3hgjJcKLhilg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=V3OR87FG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lycZ37VZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="V3OR87FG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lycZ37VZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4gsQM3663653;
	Tue, 25 Nov 2025 08:03:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=g1QIu5ZGOC9i6mI7mG
	UmarLiD8uNH6NMyR2s0mpymlU=; b=V3OR87FG15FLAYTcTIPEU8F3rtUHuWcN9F
	E9MlIx1PJvDzsAJm9XClx6/shtE7f48UPNuA8lSVbM3aJLoZxpwDYeRG3CcGZxv6
	/bAYNEg2SxAAN6jMWV7XUimum8aefsOmzJWe34PCxjZjpY4o5N5jM0pdVBtLVn8N
	FQsL/PPRwGN/zPekLZkvpTE+srN2KrOWPhVEnMgxNTzO///g7lls/ZHT05Jp9HRO
	B00eDhXmtRdcqIScUpK6jlYlw6PFFoWsjQVpc//V0uFHPmBpG0qCUL4kX0G0aKuC
	1sY9V0220l/Q3x97l9E5iOXOtfTUBxTi0qBQLV20jilhVRsjVmOg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022130.outbound.protection.outlook.com [52.101.48.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4akafkb2mu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 08:03:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C01MPrF3X8UvLuy590YB7G6rf1jIca/rMIBGsqaBy7+MAxFvlSOR170UxVID0STBJR43jpP1axkL1amyCny0B3QJXWStAEZKAJaUHC475bF7YJpYlaZikQqvR+eIJ2fojsMcdO57GbOwEnQJgcIkhZi/XJaK1nqNdFgCvcIB/GHD8BzdZrWDktnzP4SC2G/6TOPfigaO94q3VHURyLkPEYJdCe55MVM4ONEgDYXlB4vamew/jfyXxkvth7emc+lH5nl56PG5LqOYM1uUOOKbykbndDmsR5U/1kV3NqUaFMiCRmSXCIFzDJAzwtAbd9iYoc2cDIOSSApaxdXZgq/dUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1QIu5ZGOC9i6mI7mGUmarLiD8uNH6NMyR2s0mpymlU=;
 b=sJ72eWcldPnrfTdP/zmrVi7vysmI5VLNlKnYYPW3V1I/Zlm2JC8tzjextpNCXtuLk7YfAGolzlGDc3XRP8/EIBN8ZeorAjchHvXCsmU0W3lYtUSHb9VBozFECPhlThlp6qWVT7swHAoCmMMGEAZtNNWemwVZc6GtAarMYUKDfzYB0YoeOCbqlsKExd4R8+xhw4gBolqrpqP7kfo8+q/0gh3cJE8WVo9EdkKkjmc9CuAAvUnpzfB9OR7Qss4PWXojsgzSuFD50IpsdD8RogE3I+Hx3W3laGf93leHALsBs4jHCWi84o5sPQRkXG1mqk1D/HFK3xiQDJ/K/2uuaolyvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1QIu5ZGOC9i6mI7mGUmarLiD8uNH6NMyR2s0mpymlU=;
 b=lycZ37VZ8EoBzuCvc3S8nOWPNOnWyUMGRKP9gW0a4HOewE7wa/FW84MnFUN4ABYttfJ/Alzt/k8aCvvVjfoSfKNb3NNu4g0O9jHBt7QtZwEedajPIDzrhVA+hQuIAHsm3jDUkTFm6s+CPDhzdKvTflOKZJObRqlae6lrM60lt4Y=
Received: from PH8PR02CA0014.namprd02.prod.outlook.com (2603:10b6:510:2d0::6)
 by LV3PR19MB8277.namprd19.prod.outlook.com (2603:10b6:408:1a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 14:03:34 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::fc) by PH8PR02CA0014.outlook.office365.com
 (2603:10b6:510:2d0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 14:03:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 14:03:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C01CB406541;
	Tue, 25 Nov 2025 14:03:31 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A3E1282024D;
	Tue, 25 Nov 2025 14:03:31 +0000 (UTC)
Date: Tue, 25 Nov 2025 14:03:30 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ASoC: SDCA: Fix NULL vs IS_ERR() bug in
 sdca_dev_register_functions()
Message-ID: <aSW3MsGig4/COjyG@opensource.cirrus.com>
References: <aSW1UOgMCiQIaZG8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSW1UOgMCiQIaZG8@stanley.mountain>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|LV3PR19MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: af6d6425-18a7-445a-cafd-08de2c2b6b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VtiFeGfATuWY4qJI0Gz1bNzMlSTlysCpgliSN2F5sSHzsGjMv53iiPYoz62d?=
 =?us-ascii?Q?PfREdz0F41g3PkZGm3mNtOjZ3O0W5EXx0L3+oHAvVYzMvIHIgvGu09Jd8H2p?=
 =?us-ascii?Q?8VKiEnP5eJHYLY9IBVWR8HlNQNfgnPOw49CDcvuLd0uG1x5a0ivhFcAis9aC?=
 =?us-ascii?Q?jEJyDMwJUTPGXD9RNFXDDMFOHv/bqa2HPIjSGptRhxOk9gvCZZQWNgvYc7Q+?=
 =?us-ascii?Q?+oOF2W1BGNFbIHO3JU3x4nqTReLfIzieCOEDSyLk3M/lmWt61aUR+FPmuuJG?=
 =?us-ascii?Q?4Gt8YTyw7zPDBq9f//gJHHfIGD4+dkA20Yslhr+3f8c9QTcXZ5eEw0sWyAUe?=
 =?us-ascii?Q?PvKbU3clMDbkZ18zHInsLVs8lrDPfA9fjDb21ac/Vd4JbWxzgcqda7cxXFAS?=
 =?us-ascii?Q?ocUMLrDGo9tvCAhaC5HfnHQP/uJ162IMXGMshEC/Gvh8BAizECdDSU/1iWw4?=
 =?us-ascii?Q?3iXGLXVan0dO3sPGDwGhNT4C5wHrHeAeMKSYVINZgILb4eece1EMsBPtnFYy?=
 =?us-ascii?Q?OUMZIz/BaXXwoBx8YqS0Me4BQeE3tVMa25K40VjrShe6RBjFTpxc0lansLCe?=
 =?us-ascii?Q?1FsWiktJvyPKiJC8mjs3by19Ca1vt6UYJEMD5seRWE03WifEt3Ny+qSR6+tQ?=
 =?us-ascii?Q?altGPYtxhIiaKoZai8GSkvvgZrMFwZfG4dUc+s06U2QWe92H72FunmqFZnQP?=
 =?us-ascii?Q?Q3UJXqkqWqrec1cmsw0JvfitVIMV3pHDCWiGlXpCpyiygptekYnKOmMNHlye?=
 =?us-ascii?Q?CjoQMMDLo0etnZIqDWMAgW5ZZ7bAGQ0o7oirtAByPLkZxbXExWzrargRdtlw?=
 =?us-ascii?Q?bT7aSdIRL0em7GN6ewBX6awck11L4fhaOMwlvqyNxoYDdF0qrE7pUq4LZFd4?=
 =?us-ascii?Q?N0roFoUxBS4XpGwCkHTC3h+LZ/BQYjE1j6zdGR+aMrmMY2QKmKw4ZoE4kCJu?=
 =?us-ascii?Q?QOTgVx9CG+Krc8rr6+0hDQYDMOBNMKrqE+NTQEp6KqQlwzOm0KJryFc+LQa/?=
 =?us-ascii?Q?Cno44BIje05fv8fDQduHJGQDlx+5DvGTFesE9W3+oU5vnB6XcLYVu2+4J0me?=
 =?us-ascii?Q?D1JARcljVi9FkB1obvYGPeYG8ZNfINAekMd8/kCD/ztvJctPO8MpIVMwnq2v?=
 =?us-ascii?Q?iltQta1bCvHul6rBEvcPWtp1KlVd2MLc2f8zvhMk6isIxFuIRgxncSUgyhlk?=
 =?us-ascii?Q?xjHS2XYtlVsbnGdtnS9NnWLeEy2PvaTOzVnX5d662fZUgMwo13G57uDc4p5s?=
 =?us-ascii?Q?b914MtymUsko73bmmKuA1N5KsuWaHigOvAuC3n7tb5MfSyRp6lUGhjLtWPvc?=
 =?us-ascii?Q?pjV2mpjqGoZoS8hVoTmy9VahNLCzV+Afd6UbItNt6CfZBeLQHXlOMYM2XV4o?=
 =?us-ascii?Q?KlqzOMpERc6Lpc7AqtQDMyV4fbEk+QcZ0RHBG+O64iY636a+31Spyn9PBYdy?=
 =?us-ascii?Q?XkFN0BTBmrAj/GnBUAlJJXF+R/DJZxtBj4fr7lroPITrK5SFmjPLjD/8PsLC?=
 =?us-ascii?Q?QzuhumI2wkt9M9RN5/TzaKKoCPpHg1sPbnLreSw9BjP4+ILZKRs5/aHwD/4Q?=
 =?us-ascii?Q?e08gKayxbrotFh2lIWU=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:03:33.0787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af6d6425-18a7-445a-cafd-08de2c2b6b9b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8277
X-Proofpoint-ORIG-GUID: C2-lXoc3h13nJ_BA3e43BkBK1i3oT83e
X-Proofpoint-GUID: C2-lXoc3h13nJ_BA3e43BkBK1i3oT83e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDExNiBTYWx0ZWRfX0dE8aIWcpYv8
 CznkEzz2nsvDhn6W+UX/42r2Jqm9+O/RCo/BZt3ppBuO4du0y2kzEvOIWIUYb3E9ijnkJ7fpn5U
 lKekHID2QNPbtUPegI01KNtDZbafCAQyICQJ7D4PhJlfhCeYhREwbFa3f+4tLl5R3f2Q5Y2dbSp
 jkpGZjp6TVFSZtgBBEqwzcv5BuHUIrOKWa9gwwm9wm0yqVQvRT1BPqWDzRwD7saacLm0T+0busn
 k/2WBMclg7ZYB1dsadisj40vDzt632OApieTgu2HKdIz9AOwtu5V4gaW+CIjUbJdLqKkE88ypwR
 aIAPTOKyPUM3m7KkAxp3tm+oHI3jPeJwuz5bBvvg6fOj35IaPIp7KJt6eTcIdZv7myuPu6ay8pv
 /xyb3srdmWbuagHkUBXJxR/ra6TVBg==
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=6925b741 cx=c_pps
 a=5U2/TfBw33PfA2YBhd8Q5Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8
 a=Qapb2KoIIyaq4exq8pEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 25, 2025 at 04:55:28PM +0300, Dan Carpenter wrote:
> The sdca_dev_register() function never returns NULL, it returns error
> pointers on error.  Fix the error checking to match.
> 
> Fixes: 4496d1c65bad ("ASoC: SDCA: add function devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
