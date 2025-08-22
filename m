Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2051.outbound.protection.outlook.com [40.107.95.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138012EDD66
	for <kernel-janitors@vger.kernel.org>; Fri, 22 Aug 2025 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755868235; cv=fail; b=UU6b2naMQvRgAsN9/2CG/BxU90ZHq56cQc169Eegv9rmNZB/vWGUGE8FScaDoHkklSNhQo2r2wS44RH6I5f2KMS+GXHeC8HUKKMiSy67nXkcwVejHg/XRR1hxAULpm1EFM5T+KDlegmlgiyWOM2WucHV6Ev7MtA6htzvZ5TOuCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755868235; c=relaxed/simple;
	bh=1oFzvJVXhhvqVbsGXBIFuBvvdfePjBtBWx3I2tbJE7w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OO0UCknQUDMWm1pYl9dd93tvscPfXPvQmfRbJNmCq8e+POikJZf6ZyonqHKle8cqcB/IK2CzdI6iasAx8toFQcHA87tmnYl8lgjVGryfPPqqoH16t11sSKBX7rFX4/6o0i3lWmP2ghQK7iYgMStLS5o46fnDJXyKvHt2K2wSKPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mN10nKFY; arc=fail smtp.client-ip=40.107.95.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mN10nKFY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bns2pZ5fhLxal6pzvIWi1C3Of8tgxRVv0elC+SitSenrfridSF1HWvIJVrfoC3PBZMZ+aG3bSR+ruM7/5qc5del4KBhX9vRvyQNsxxTXSiCH2Mlh1BY7fiuzUR2YcvEzEbBi2NOoWid3cg4MLtsxbw7YiytfMsDWs4zGbu5wQh+wu5lYJuANhnj9j+Q3rSuEQwI8knM2sIKsxPG/jNxOM0uMGy9DMBrHNlaec4vZKxxsEkpjNj+fpL+hTyRUvCbf+PDIAv6axOg8jYcEveq3Okh/C32OhQ1XWClOc7DVxtDu3t2Ixw0y3cCaIDoUXv9rAsE9adAdD2TKDf7QL0kXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjZqxh0H1Kt2w6Kte4ZxSe3MWoI5ngxLURHNPCLB+XE=;
 b=qxI9XmH/RmvxPzdlAuWRkH8TtQ2uFkPVXcYyHq/QEamnXg2RD0QWmGL3egFfAPv/uxvP32AG6SHcGnFVlIdPiN6WhvcO4OAit1uY8XYzeLscAU+J+KYIzlVwyiyIKNCeYjoyRlSOMzGctJVqePR0RQ0ETQyNF3zHBAnJ8+eF+W35O0za3v4HTBuq2FH028vdrotTjP2LzyMVK7DsydWHXo523OS7WbNguE1pF8FGasih9iiemsQerhkOrGOoEMOUTl2wk2xIdyw1bwFtVQNB9gyX8R0b7owXRoqMfDEIDl+OsQhd/ADDnjFzy+02huVLVhUYg4UTk547+5Fgu1DHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjZqxh0H1Kt2w6Kte4ZxSe3MWoI5ngxLURHNPCLB+XE=;
 b=mN10nKFY0lqISRyj65jwiV/eIgSmY2osjLPKCmDXTlDMEjoEp/MUTPuP1PEkPDGSO2NjDkP1MoZTCdKsX8DKJ/EZIQzBY0z9VavkQvpLm+Q1dangV7KoWcX9Go22WIcyxTOdlqsmzkZGr9FKuRHhIswuNJaHjvcoQj4b5ABt46U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 13:10:30 +0000
Received: from BL1PR12MB5946.namprd12.prod.outlook.com
 ([fe80::3e0f:111:5294:e5bf]) by BL1PR12MB5946.namprd12.prod.outlook.com
 ([fe80::3e0f:111:5294:e5bf%4]) with mapi id 15.20.9031.014; Fri, 22 Aug 2025
 13:10:30 +0000
Message-ID: <b384d966-69f5-4d82-b222-882826d8af15@amd.com>
Date: Fri, 22 Aug 2025 18:40:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] net: macb: Add TAPRIO traffic scheduling support
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>
Cc: kernel-janitors@vger.kernel.org, harinik@amd.com
References: <aKcR-LiAmoAv7Bzj@stanley.mountain>
Content-Language: en-US
From: "Karumanchi, Vineeth" <vineeth@amd.com>
In-Reply-To: <aKcR-LiAmoAv7Bzj@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::11) To BL1PR12MB5946.namprd12.prod.outlook.com
 (2603:10b6:208:399::8)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5946:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e36f1f-ec59-4ea9-7410-08dde17d44fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2dnNTI1azM3Rm9EZTNtcDR6a2c2bWxZbEYvakt1UDl2em5PZUd2WUZRUU5o?=
 =?utf-8?B?LzRJK1JoMlBIVTJtQVI2Vm15cHVsV3ZmYmZya2xCajYvZHoyb2IyY3BTUk13?=
 =?utf-8?B?eXRGak1HNWRrNjlZQzRlZzBseDdveVlZNEtsZ2Q4N3pYeGVtcForai95S0Nr?=
 =?utf-8?B?Q1NmcDB1OHcxT2R5M21Bd25aOERZTjJTVWhyT2NTMnkzaXFNRlNRWEM4NEI3?=
 =?utf-8?B?elBsblRvNW95bXBhdS9SRVFhMUI5WldiTEFxMEtydTNPL3ZSVTZlR3FvYURO?=
 =?utf-8?B?dTlxRm1rVlNVVWpoSGVBaUVGdE1NU0oyVCtZNmV3YldhUTVTYkNWOWdFWmsx?=
 =?utf-8?B?RGdwSkRMNWhQbDdtTk9VNlF6MnIyVEVhd1JISUM4bWNySXlpTDlyaG5lajdX?=
 =?utf-8?B?RWFTYVlPU2ozL2RpZHlTaEpZOFlLTGxNMTRQeEhGTk8xSGNBaTJwalE2ODQw?=
 =?utf-8?B?bG9oeTBoSjh1bVlPS2Rhd3d6VkZKMkw2K29uMDE4ODFTZEZQcVF2ZitSNWVo?=
 =?utf-8?B?VU1FTHB5dE8ydVFnSzNmSE9OOHl3c3JwMkxjTXA0dmEwbFRiQ0NDMlhnZnRW?=
 =?utf-8?B?d0lLbFFMbC9vSUt5MlphUk1kbFEvclFyK0tNTWp4U1UwRDN0TkFlbTl3NFR1?=
 =?utf-8?B?ckRPQXRjRkk5TklFVFl4REtyMnB5NDBQWlRXUHhxcXdiU3FpSTZ6UGdLYnVw?=
 =?utf-8?B?NjdaZ0QwWHJtN1BQVDl3aHkrenM1TFI3TnFJVVlxbm00UnY2aHBWOEExajBl?=
 =?utf-8?B?dDV3VFVtMWpGSHl4UUpZbmViWERHaUl4Sk03WWVUSXM3aDNoby9QellMMnpy?=
 =?utf-8?B?cnhhZmYzc0NKQU9Jd0FTQzRlRDBjbmNwWUdDSlV3Tnppa1hjQ0VpeHFTVTlS?=
 =?utf-8?B?SDZ0SHhyU0tSRVkwa3ZNblpValRpVkVvL09qSEV5cGJKeUlQQ2N4eFNDb3lC?=
 =?utf-8?B?azFGcDJnT3QxQTZUbUpKUTVFMjFYajNPRlc2a3l3ZzVLdEZZWkl5STZ2bHBS?=
 =?utf-8?B?YnFoNUZncDBTblFuYXZDdlgyejJBaXBkRENwL0d1SkUxeXduZW5nRjZ5aVho?=
 =?utf-8?B?dk5SU0NwRldDbS8vQUM4TVQvRkExNHpjMmJTZXp2TW5oVVFhVVZwRjlJWVU1?=
 =?utf-8?B?V2Z1Z25PRXgwR0VZRnlOczJ2SE5nZGtubGx6OHZERGNMUEw1Mjd1cFUvTG9v?=
 =?utf-8?B?b21iNlVOTytHWjB3di9oQXBSNDFxdmZvT1VUenBZQ0E4K2dQbnJJY1VRU0Na?=
 =?utf-8?B?UitSbG5tYWE0Q0N2UGd6Q0RSR2UzOEdwd1ZTZ2hlbXFMLzVZTk9wQldhVFUy?=
 =?utf-8?B?Mld2LzVrOEJzYWZubkZ3NDVzbWVGSkdYMjd4OUlKclZMRGFHcVRyQ3Y0N3kx?=
 =?utf-8?B?ZVArZjVUQUxOV0FmRUp5MndyaDlOZWFKSHhtL2Z1eHVMUW9LYXdRSWlpY1Z1?=
 =?utf-8?B?bVpVMVVvYWF4aWZodzA1bUFvNDhCd2ZwTUJnT1lNWUIvU3FyTlhibnNPS09y?=
 =?utf-8?B?c3JOTExQTEFlUm1OK0JWcHhDMzBRSTZLVGd5ZVhUY3RBUjdMR2F2TEVnSXBZ?=
 =?utf-8?B?bDcrajhXZVJiaklyNTFrbXRPdEpqRU5USkg2N2piT3Q3K09qNERkK0gxRm1U?=
 =?utf-8?B?RHQvZ2NxVDFzdDY4TVJNTTFMNDY5MFVVS0x2c2ZMRjI5Q2tJTDVPdGZmejVI?=
 =?utf-8?B?N05vME4wZmhBTlk1QjFtZ0Z4NWxkVWtlOTNNMGdpd083a0dYZjN5WEZwNHZQ?=
 =?utf-8?B?RFp6ZTdjNmxqR3VyMXBkQS9KOGhmWER3bUhPWldLY05lYlQ3ZXRZeHdxMWNa?=
 =?utf-8?B?YjFiTm9vQW42NVZDeGZ5MjlwcWxlSmdXRk04OUYxWE5kcHZySFcvdEZaazY5?=
 =?utf-8?B?RWo0aS9SaS9TMkkwcjFsNE1JUXkzNFNkdHpNMXdQNkdmMVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5946.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFF0Z3ZsWWdvQWh4bUhyUGlXOVpXNnF6eUlOcEdzRVV5VHZjVGxVVnZ2bVRm?=
 =?utf-8?B?YVQ0MzB1SGp1WDBBVHdlM1VLNHoxbDRLWnIzT0VQa0JreElqVFluUy9IeVM5?=
 =?utf-8?B?ZG1YNHhQdndtNERSZmFoY3hvczEyS09jREF2SWNhYlUzTXYwaDlIWkZJbU9T?=
 =?utf-8?B?aU13RERNZnpNa3V5dHRCSG5tUVMwNTVOdHlTRFJuMm9BYjBRb2lCcU1qRWVV?=
 =?utf-8?B?Q1htV0szZG92aHdVRUFVblVqUHNGVWc0SDhZSXRpaFNHMFV6ZVZJQzNzdXR5?=
 =?utf-8?B?LzJsQnNtbm94anVnZ2FpZHdseWVXVEZsRGJmZldGdkdvSDlmZXE1Nk1zUW5K?=
 =?utf-8?B?ekx6c1VGbG9lV1NTeHRSQ2ordExjUHMwTnBpZXBNQ0g3TXlSR044STV4TFZ1?=
 =?utf-8?B?R3B2c1BXdStCa1dETzJub1daNEFjV0RSdEtBTFVBZFFtajdnNXk4eTBxZXgw?=
 =?utf-8?B?cSsrNVdqdGxaYlVUSnlhTDJvb1RMYjNRclp1MWR6T0FtdlRFZHVqVVVrY2tz?=
 =?utf-8?B?cU5Yd0lXOHNFUjcyNlJUOXp5UUZjOG54RUFIMnU2UXpHWWo0MFV5c0xoblRi?=
 =?utf-8?B?Uk44dDQzTkhQZWdtaDhFVitEYUgyUW5Uc0pzbGpBR3daSUlWc2lXSXZ6cXFq?=
 =?utf-8?B?VElaQ3VWUnFxcU1zNTRLQWJuZDBsWTNVdk5iVSt0UVFCT0RnMmlrTUpHN05v?=
 =?utf-8?B?ZlBTd3paNmNHVU56ekNJaGRBSVF0TGpRZnVGcmpWQVEwUm9pM2l2MUEzRWdW?=
 =?utf-8?B?L1BuZkhjT09EdkljaEdQS0dTVDF1WHZWYjVMMU85cmZFSzFpd1c4ZXVMallY?=
 =?utf-8?B?MWRJRWlPOWJ3ZDAxc3lrNCtVSlN1aGpwQTVhWjFnNHppeWRGaDhKSXVoaUZV?=
 =?utf-8?B?MWNSY2FwSndjUDVGZi9PME1PUDJjSDNxaktoMVVMQlpvVDdhNXZxSW1YRmZF?=
 =?utf-8?B?b2FXZlhheWpob1AzdFgweTN2MU54dWNlRUJsRi9CRkxuMjVpWWFJOWZVZk5T?=
 =?utf-8?B?L3dueEFIellUQ2w1OUpRNnBYeEJKYVE5aVJKay9zSEhDdXRPblBteWE3VGNp?=
 =?utf-8?B?a3pMUUc3OEdUeHRqczNNblZUVTUwYzBJNUFvZTVnQXR2TXZXSTNsWkVWVVA2?=
 =?utf-8?B?ME5WR2RCc1BmVkZpcW13dU1lcmRKSDkxdXB1ZmRPeGJPbjJYQ05oNkd2dDBu?=
 =?utf-8?B?MjFUa3plbFFtMXZROFd0VTVBdFVFZGtoL2hMZlhsU3g1SzhLV3NHRkJCTnYy?=
 =?utf-8?B?eDkxV1U2NFFFYmtJV3NFS0R4Zy9VKzNaNDU2d3RvRnRRU1Fhc0ZPaURnUnI5?=
 =?utf-8?B?SGR6cGZwL0V1NlFvSTZXMnoxaFpqTDRFYm9Ia0crdkpQb0dTMk9zOXd4VVdR?=
 =?utf-8?B?UEZKUTc1SmRxQS9YNGJwVnY2RGhXVm5CRkkzMUtUdjhOcGpwNXFOUUNJK2d1?=
 =?utf-8?B?ZTMrUThNbmJOTU85bTE1YXo4bXRGRmNQNzZnSWgvcXR5NHB6K1BlVGZHQnM0?=
 =?utf-8?B?L0dSR1RaSGJvS1FLdWtSY3FxOFcrS2lGQXUzS2tsbVp6MS9mQXlLN0tYY0J2?=
 =?utf-8?B?eVduU3p2QzJRT01XVkVPbFEweEs4RHlIMlBJMHlVeENtREFncWZqOW5oZXhD?=
 =?utf-8?B?MStyR3FVV0h2TnNtRXZVWStGVEFiQTRUSmZmMmNhNzJQL3BZZDZTRHM3R1hj?=
 =?utf-8?B?a3B4WGhHcG0weXU2K3k2T3BKbWkwNFBuVDd6UWhRNER0cHFCT3g3U05GeW8y?=
 =?utf-8?B?czhqRFE2ZVVwS09BbnJlR2VjdVRZMnNvcXY0dmVmL20wQ093OWpUcEt2QkVi?=
 =?utf-8?B?RmxYVjRWMEVneFdTeFFjL0xKeG00M3B0ak5uejNwSGFQMUF2WmU2bEpGZTNI?=
 =?utf-8?B?Znd3Ny9MdkU1eDlsRGo4ZzVMTE5IRG9naStNS1NyL1NmVzlJUWZoNG1tL0s0?=
 =?utf-8?B?V2NrWDZEWXZnS3J6Ti91NUVEck50VG9EY3VWbWtGM1lJOEFBZDZFTnNzS3JU?=
 =?utf-8?B?NWlrYVdHUC8xN3YrcGJqNys5RVNyY2QxWnF5amE4RlQwcEJnUWRnTXprT28w?=
 =?utf-8?B?cko0OWwrTno1WEtrM0kxeHJ3TThKZmRvUWFBd3FDcnFyTGh1czBvNFVyUXl5?=
 =?utf-8?Q?E63Ix6iV2zoREZPAa0O6/Rqem?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e36f1f-ec59-4ea9-7410-08dde17d44fc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5946.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 13:10:30.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAhCYo/gVELKzIflKOSU9RTlX40dny/tGZJs+1sXPHvdKD4KZrORUXDHe8laCCbK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272

Hi Dan,

On 8/21/2025 6:02 PM, Dan Carpenter wrote:
> Hello Vineeth Karumanchi,
> 
> Commit 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling
> support") from Aug 14, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/net/ethernet/cadence/macb_main.c:4107 macb_taprio_setup_replace()
> 	warn: unsigned 'start_time' is never less than zero.
> 
> drivers/net/ethernet/cadence/macb_main.c
>      4088 static int macb_taprio_setup_replace(struct net_device *ndev,
>      4089                                      struct tc_taprio_qopt_offload *conf)
>      4090 {
>      4091         u64 total_on_time = 0, start_time_sec = 0, start_time = conf->base_time;
>                   ^^^                                        ^^^^^^^^^^
> start_time is unsigned
> 
>      4092         u32 configured_queues = 0, speed = 0, start_time_nsec;
>      4093         struct macb_queue_enst_config *enst_queue;
>      4094         struct tc_taprio_sched_entry *entry;
>      4095         struct macb *bp = netdev_priv(ndev);
>      4096         struct ethtool_link_ksettings kset;
>      4097         struct macb_queue *queue;
>      4098         size_t i;
>      4099         int err;
>      4100
>      4101         if (conf->num_entries > bp->num_queues) {
>      4102                 netdev_err(ndev, "Too many TAPRIO entries: %zu > %d queues\n",
>      4103                            conf->num_entries, bp->num_queues);
>      4104                 return -EINVAL;
>      4105         }
>      4106
> --> 4107         if (start_time < 0) {
>                       ^^^^^^^^^^^^^^
> Delete this impossible check?

I'll examine it and submit the patch.


> 
>      4108                 netdev_err(ndev, "Invalid base_time: must be 0 or positive, got %lld\n",
>      4109                            conf->base_time);
>      4110                 return -ERANGE;
>      4111         }
>      4112
>      4113         /* Get the current link speed */
> 
> regards,
> dan carpenter

Thanks,
-- 
🙏 Vineeth

