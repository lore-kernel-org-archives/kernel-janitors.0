Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B1A59;
	Wed, 11 Mar 2026 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210694; cv=fail; b=f4TyIVOCdXDnmDgFSusVckJ3uenzClMvwplvWJl7JyaZwgbhe8EiKONDn2XZlbd2ejMewl/gXzhFGKu3Kv237Yx3YcKlMyt9eUCSHesAEtlKhCjBATGdKyuTl5i7yDjjqB+ePmN2WJB+aK1cWMDWMS+uhDiyrQn7kYXwJjOBtqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210694; c=relaxed/simple;
	bh=aFcCPLMkfflFlddxwI4a2uPVhnZKZOXNilNktVvUHBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h/qAdUGrL0ltbeMJBDQhlZcXAyKxjbIa7oMZrWo8PSnTTMJi2J/QTkxts6WnLHdLIN6uq+Nq54TKAozQWbk8E7PH7hWbW+dodpKBc5++7COEwwWbzAR8rLjJFDclnYaJTe+hRnpyp0F2rbqg0SkY0SGQ2B9f/iFaM6bnsgq9zzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K4mGNJn+; arc=fail smtp.client-ip=40.107.209.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K4mGNJn+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx8dm1V3cKRCSYfAp7luTVCQR33tgPOLhjpLZXJCN4FH/bNsCzbCY4hVCsyhNzy790Qwi7RetdOv2ZYvh4IxnUoVS0oIRPKYOZ/Fr1FyvcLp5fxPsndFr1X5JOZkNlGO4INo3sP6mG9zB8W+2t8CCuvd+LzftoyimjsPFFsAWrDAg+d9oWNlGuF+aNXW+pdfSixtn9t2hno2b+a+ddLqj0dRLW5u0JMx/Dz9TAA3xKRUdA0iu8Z3FXapnnbgv3u+ryC+K/BSFtr8ehgVXs1cpStE2+Zud+wBOdsSrDnFDOUbluvE02vEdhqSigA959UB25yeXIdT1lK3H76CEIz+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brYKgHY8/FN78qyks81Vg2k9tQAsqvjGp3TeVS8cXFA=;
 b=a94J0LK+1L5EVXz2lK8H+NDj9VRXvrbt/aqjS2io1zeUsVcHEzzlaKb+mKpr6HEqWni6mkZ5HEsBBHSFGVy3nkzbX6K5RikXmYxH2YQdS8D1gXVFkEPv+XQxrxZ8fOkaJi3in7GYPuqyIvLYOQVNhT5EsVBMo1Ij/fnqOXJ4/z1LM8x8NOBcW03kqfXvMl0fkxRfQ9NrxjjjJzEWF+wfjjHBU7S0anotEEsuVldfEt+gh/2OzwtMJlzqmL++dCIHXVw2O+esEILCwxgPqVF6FfCCpJSs64ZOwWSg24MO7mZ2WQ5yrrO6+EuVSyg8MzJ4tSLkVAmpfxW5InmXrgVHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brYKgHY8/FN78qyks81Vg2k9tQAsqvjGp3TeVS8cXFA=;
 b=K4mGNJn+KvMJG6YGb+zNt7QO+CUXYmxHRs2fmd0nMlFCIRa035vJaZU9KFiMQUNbbSipdyT4scmN0AyLRNcJZSTs02m1dRSKT7HgjKKxt6/K7r3idZzvMYvDLrgq/OWbtcbnqfZdnBxOLWKL29ewDz5IwcYz8YG/ti1ElXusr/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CH1PPF2C6B99E0C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::609) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 06:31:29 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%2]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 06:31:29 +0000
Message-ID: <883cc734-b998-4133-9c97-b10c8e5960ac@amd.com>
Date: Wed, 11 Mar 2026 12:01:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in GPU BUDDY ALLOCATOR
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20260311043314.265627-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20260311043314.265627-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::16) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CH1PPF2C6B99E0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c15bb3-2980-4aa5-9edf-08de7f37d3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qm4FueQFcP5MUtz6xana8w+LrYHxIpkkvYA4/076ksQYOLgAVcOrP2aa8XbMUtHJWb43XZ9nF6h4VzO6PgCheZ4EQ5EqddBE7u45vb6K2sv8V9o12DmE6HBBW7DwEfNMWA8gTS073AnNKBDvZHJEpCbmfewfc/vu6iI8HtUbeR0JhPcQBeUth63Q8LB5f76DzQzvIVte5rUERcXDXIc9lQpwYOQkQWvSKS8IlVlSbznvSelOpPvBlQoaS5PTuhCfHRPAwNzLMLdLqwPB4/tzd8x7KVmefdZACMATQwQDNWe0BBzAWsrA76E0W2zA1meXGDuInzqrjDovgd2DRvc+3KGM7g4gr+Y6WR0BnixnC3N1Wo3rdVNdt3+LNguZ90WfajTSyirqx9Cd8DwZc5I93NF2OxaMuQc91apj4SFUFs89TCHVaTy3HNuS+Yrsyz11bys2vgP6jb3iRLkVVj1WLGLesDf+vpEToTYrVUxm7IqasxAv4T3z2SCaMRxydh3bjey/M8OrABa4ngR0WeZI/JippCdajGn7aRWEbRpbl5S408LpDaEAAOfgroY4J7IKYdSxOoDLE960hhBdUipeNjk1Mv6SmOswL/249a1rQQ12MCUsgTadqMQpEYk0FzWdTtjIuXJgMvF+Zhjahm3SQFX3XNLjqHbD+ALama0cjJbDUx1xGXHjinERA1iZ3lvsua2TDm8wwfVHhuMMtswtMMR1tTHcR4L0YhkpDyk4oOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7301.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFRDd25VNHVCOVE4Vm5jMDBIKyt4aEFEYjU1RGcyVEg4QzdKc1V0ZTh4eWl5?=
 =?utf-8?B?c3JRcFBUTVhNODhKdC95RXRvNFBPWmRTNkVKNEtGcnk5bFllTlI1WFBKYldn?=
 =?utf-8?B?UXJycFRnK0JhRUM1cmZBTWVPNjYreEZUTE1va1R3bzZzMmNURE9PTDFuSFMy?=
 =?utf-8?B?VkdxSWEwL3lsMTNKUVVzODNPZHl3Ziswb1V3ejN1WE9aU1MwcHZlQWVXM1p1?=
 =?utf-8?B?bHhaSnR4VHdXNW1lSkNGTG1yM0cyR0VFZVd4eURSMEtyM1NTb2ZabTIwenA5?=
 =?utf-8?B?eWl0Z2szZU1yVkVJQ25FS3RPK2NxUUN6em50SG1JaS81WUxuUkNVc3RJSVdj?=
 =?utf-8?B?WGEzWDZmVFF2b0RlRlVzOW40cFZxUnA5eFM0bWZ1c1FKVDFVTlNHNnVtWkYw?=
 =?utf-8?B?T2FKUnpBa3ZNaGwwOUNMVTcxaCtYb1djRWs2Sks5K244MWV1d2J2TXFKQU9P?=
 =?utf-8?B?eEtseCtPRkhCOVNLOWkyQUtxclI1NzFwRTZ0UGlOOUpXRmxiQ3BqT002QlRa?=
 =?utf-8?B?M0Fkay9WSEwzR2VMbFJRRDE1L3Y4MjRYcWxmZ0p3NEhJSTlWdEgrU2NxdEM5?=
 =?utf-8?B?akNGSm1mY0dHWjdjVGlsSHB5MnNkaDlYQVVJUjlXOUZOVTJVRCt2Z2JDVkJt?=
 =?utf-8?B?NjJpNDY2ZTBIV3VxbkxjZk5QSXhPckFTY0Ztb0VtWDZreExPd1RvUzJiNjNI?=
 =?utf-8?B?QXgyQTRWNkJhMmhhVENDaHlaYUxnVkEzUDV2SmdlS1NXdWozK1poeXk5Mnp6?=
 =?utf-8?B?cGpselhQbko2WUdkdWxwY2hyL2IxcURmaUUrMi9nSExHaFZ1MWQ5MFdDdHZJ?=
 =?utf-8?B?clFDbXhnTjBnaUcrOWdmL0tGcWJEeHBJMys1MzFCTXFTUTl3ZzUzVnVLRUls?=
 =?utf-8?B?dHFnT3FjYjdaOVlFYVN5dWRNalVTelkvSllHZFJ3SXo5ckZFM3l6dnlOWG0x?=
 =?utf-8?B?L3g0MnFzbDYzOUJvQWdKM3hGTEpXS1lqRi9EUDE5YTZ5V0FuUjFFVWIvZEF1?=
 =?utf-8?B?M0c5eHZscnpobURzN3VSNzZ0N2Q0dEtKZzdZMjFNdTdMb1g5Wk1MMkd2azJl?=
 =?utf-8?B?eUJCcXd3QlZ6TEFOeVFqT05MZ2RkUnBDWVNXVWR0citBUno4S3N4TVdSKzIz?=
 =?utf-8?B?Sm14aFZEMk1rUXVCRmxDSkN3VnlRMm1Ha2NiZ2VueHNtOCtDckNpUzdJYWhI?=
 =?utf-8?B?NVB6VG1CMmNZd1hVK2o4WEZKVGRlcmJadXdBek96MGRTcit4MkVQSVJ2QU52?=
 =?utf-8?B?SFNlYVBaWklSRzh5Wm1RVkMxNW5WZDJoVUdEVzJmK0ZDWDAyWlM5YkFFL2FL?=
 =?utf-8?B?ZWFaZitLdDg3UnNMTTRZQ21ScWxnS01kVHRwQ3BLTThZdzM0UElHVGwveHgy?=
 =?utf-8?B?SThIYWE2bWRoejd0am42QkRGVUJUN1lQSzZrS3ZVU1FzZUNRQmNPK0xKd0Rx?=
 =?utf-8?B?RWFqNm1rdkVvUnBzNnA1MmhVeDFMdVJwVXVxY3dnUk9BcDdWS1pNb2h4aUVC?=
 =?utf-8?B?YUFNVVVwOGxjbmtMT01JUmRyR3plMmdjTkFCUUcyc1ZaY2ljTndOeW84Q0lL?=
 =?utf-8?B?YThFcENIbUp6RVNKQVAwV2M4aHpRUy90YllWb2hsZlJkcVZJSTkxZ25pQjdI?=
 =?utf-8?B?UmwxcmVBNGdiNUZCWGlXZk1MVzczYWJoWWl5diszL3RUSDZweThIU3djRTRr?=
 =?utf-8?B?VlVzemphOUNZaGVudkZ1SDRpS3pKUE1Iays4VmRhbVVaNTJ6R2JJVzdRK3Ro?=
 =?utf-8?B?NlJleEFmMFBIdkdQKzdwbVdxNkJ2Wjc2bkV6UW93aSt3L1VNU2NQNkh3ajdN?=
 =?utf-8?B?RHEwcW9HOEw5cDJVSXBWaVV4OGdYczg0NEJIYzFVOGJsdW1YVkxqTmNaQ25w?=
 =?utf-8?B?bU1ydlZtV01nVWQydHJPdENkM1RDckN0Z3Z1R0M3dm1NUkVIY3NxNjFEL2Q5?=
 =?utf-8?B?ZDI4NmdpZ2NHaVh4Q0toRStSWE5wajZ6Tng2RjYrT3VjR1UvQThVR3Z0Zmkw?=
 =?utf-8?B?ZWhYR0FSNUJ0M3VrT05oTmFVMXA1U3NKVlVkYmhpYXU2QUhzWUxaV2hTcjNN?=
 =?utf-8?B?SytONG9Sb0poQ1AxT2g5czQzOTJJdldvL3dxSHAvejBYTzVOL2FNOWFIM1U5?=
 =?utf-8?B?YzdsQkVqQXBXSWhheFE0WC9rYzFBdktyTXQ5a3E2R3FueUJpZWI3c081VEFv?=
 =?utf-8?B?bDV6aG1rQWcvamtVNm9zc3E4NEpRMkNtMExjd1FOTHdlNmhsSGYzQWRkek1I?=
 =?utf-8?B?M0JTU01USFRTNkFkeGx3YVNxam9IMC9OMXFvaDFwcGtmNE41VkQ5eTluWkE0?=
 =?utf-8?B?RFFUV3ByQXU1aWpGMkdrRC95QitPTFRTM0lOdC9wS0FSbmk2UEFQUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c15bb3-2980-4aa5-9edf-08de7f37d3ca
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 06:31:28.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fIKBTwjjHqFitkkQq1XHeIk2H4B0CVJOmGJ4s0VJRhJr/HWd9+1Jn7xJG+4wRwwKQ/jfM7QGogu2FfvhzZ9hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2C6B99E0C

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

On 3/11/2026 10:03 AM, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> The commit 4a9671a03f2b ("gpu: Move DRM buddy allocator one level up (part
> one)") and commit ba110db8e1bc ("gpu: Move DRM buddy allocator one level up
> (part two)") split the majority of the file drivers/gpu/drm/drm_buddy.c
> into drivers/gpu/buddy.c, with some pieces remaining in the original
> location drivers/gpu/drm/drm_buddy.c.
>
> The commits also adjust the file entries in the GPU BUDDY ALLOCATOR
> section, but as part of that, change the file entry to the non-existing
> file drivers/gpu/drm_buddy.c instead of keeping the reference to the
> existing file drivers/gpu/drm/drm_buddy.c.
>
> Make the file entry in GPU BUDDY ALLOCATOR refer to the intended existing
> file. While at it, order the file entries in this section alphabetically.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe2a6e548169..c847d05e6c27 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8946,11 +8946,11 @@ R:	Christian Koenig <christian.koenig@amd.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> -F:	drivers/gpu/drm_buddy.c
>   F:	drivers/gpu/buddy.c
> +F:	drivers/gpu/drm/drm_buddy.c
>   F:	drivers/gpu/tests/gpu_buddy_test.c
> -F:	include/linux/gpu_buddy.h
>   F:	include/drm/drm_buddy.h
> +F:	include/linux/gpu_buddy.h
>   
>   DRM AUTOMATED TESTING
>   M:	Helen Koike <helen.fornazier@gmail.com>

