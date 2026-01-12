Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679823D281;
	Mon, 12 Jan 2026 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211798; cv=fail; b=EdAEW00XvDN9XrGdWMDWk+Q4iz+YhyxgPwoTqJPT/s6WuCaaXPCF6wHJcmSMI1K+9+x1f19Xkjaw49kArrF4iDnorLV8N6BDWta58gJoc0+FO+eudSM3Fbs+jravTi0/ehrT8iGifOguGE3APJwrdH7BR95zgfzrHXR6VxzCv3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211798; c=relaxed/simple;
	bh=SfnNh4M7tUoAdW3HQOb/JIBnXNAw2KK0SGba2qrYUbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNdQ+e3UbTNWqC0ft0UGlSEQkX1m9oWI8qJGVVU5V1X2MiIGBxhzgy4r5XG3Ck3ksCVy+/cuuO3+RzdbKcUIyg+gZn1sfW/wRyeBmT4pbtPYiYZQuoKBkZfgUrI1KOGchPbZVr9zH3BmZsZhy73a+3t0HTfiqCiBV1w2w5nm1I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HQ4FKAip; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RYrSrBet; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HQ4FKAip";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RYrSrBet"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C6R5Dd2406337;
	Mon, 12 Jan 2026 03:56:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=OKBFaO7lMo18q6UNkj
	NAAOj7vg424qWdswAXhfuVhkQ=; b=HQ4FKAipn/0nKZEFAmIGHEIAXeqfRu9S4r
	CFD/9uzKQis3IT1jLDG9ghzIlyObYltb/YQ/joU0Ob2eF1Tcf/Wj9MVvn4KqRD+t
	4NT/hhLL9vd87aaEAGRAkuvXCl7T92cqt+Wl5RaCjV2LAAMU/wyQ6l5gQa4q08WB
	NDXEjlAuDMFAAfOAxQ5vc9gAh+tj3ARm7G4N4OvJKXtdgtWTmlZTGNHKqjEX7pD1
	ENY0t1izkamzJX9SxMlm6hg1VWTgLWY7a4dqGlqVgxuQ3RbhBYsSBeg0YTQxxc2K
	2k7ESdvXdMhYnvzTwRWJq6Tj5PR1e6aZweVPYygx3U3RdE50AiZQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023116.outbound.protection.outlook.com [40.93.201.116])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n1h6a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 03:56:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9CFyVDE8jKKNQ9I1CVj3LJ8a3YZNh9rfYiwUuazjygYAGJqXUb0x8SGiH3pTq73f0NzSKqrGGgeya5YQTzM/E+1qW09Dmub90hOtu78wtVB4um6gwsFnsHQU1z88Fe1PKgicSusq4Pcw8awN4BRsbtT1zsKmIy8HOdWrVGlgQ9Ew+TwZR7rgjeMQJlogWQ0MYgyyTByOyLnsRMEBpBFFssVkjCGSnEzMj9BL5wkszuAaISVwJsRZLY3Im5FIoPucnTtJMJ2PxhJdzGvu2k+F0kRObzowrRAeWXmkh/+wQ5sr1E1jqxC7y7GiLNHyjUHtfrwJvz5/ST/h4IozXclbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKBFaO7lMo18q6UNkjNAAOj7vg424qWdswAXhfuVhkQ=;
 b=q66Mdk7+iSBaTzYRaDIvMVYY/7bdws7+PLEr/6uuAqYRPsZpA3J0JdZXayt31CDqjURBQhsiTp6nKpQ00Njy2wwpn82fETt/UHErGubPR/3LxVHaX21jYZESzz6WGZKvXTzZJhtrBpy4lfilb7u5kSRGNadYze74eCZP+ALW2GGeF1c9P0KoNN88FPMSxMwGCqUe59i0dW/pcpoX9GG3rpaHMw/m4llaxSUOmOBorC+9uUki/osd95Bl3MCVI1nIJkBEY+kh24vK14/zHgMaevb5afLeN+nn5Hj4W0Ap2aFC1Na0AngPBPzZJqv5LyfomifxvMzccdsuZEP0x/9c8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKBFaO7lMo18q6UNkjNAAOj7vg424qWdswAXhfuVhkQ=;
 b=RYrSrBeta7mFkb6vYzUoeIz+/FfwNF4LoYofEJRG3Kt+OyolFhNh3QWr5Vhc9h61qhW5hZJszX04du0DGih3udr7xncSAqdGkXmutHnNbljYHcUbpMfo8Lt3TzvkS/ZZHABHZI/UKGCJaef2vI+IhRK1dEWzaoYpLKR+G+vKxzg=
Received: from BL0PR02CA0111.namprd02.prod.outlook.com (2603:10b6:208:35::16)
 by DM4PR19MB6223.namprd19.prod.outlook.com (2603:10b6:8:ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:56:05 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::9a) by BL0PR02CA0111.outlook.office365.com
 (2603:10b6:208:35::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 09:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 09:56:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9BD0640654A;
	Mon, 12 Jan 2026 09:56:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7CE47820247;
	Mon, 12 Jan 2026 09:56:03 +0000 (UTC)
Date: Mon, 12 Jan 2026 09:56:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] soundwire: bus: fix off-by-one when allocating slave IDs
Message-ID: <aWTFMrNExMP0WNS6@opensource.cirrus.com>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DM4PR19MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d976ba-3521-454d-150f-08de51c0ccef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GiE/AKUj4ghh67/SGwIDZGCFuQxwf4+f9bHK0rI8IBVtgYM3Qau+7OrYhTMc?=
 =?us-ascii?Q?FdFRJjynb9667MDqwmMiAYAkuqrZeF3HRXRq1aIsG6kgJw14V8+1D0882Vl9?=
 =?us-ascii?Q?88DJPotkD85utBdrHr/Ha4SBCH92gy/Z+n0WDwAbh5KY53vGROagVypF3wEk?=
 =?us-ascii?Q?gwTStFA+pnSgmv3aQZbRtlDIRDMFW0h2ekqTY/n8tz7RIN8jZ8Xhd4nz8maw?=
 =?us-ascii?Q?+Cm6Z9jfkZiLmea5uHJzxcubITuZ4U5mN3IqYAgDDSeDkSmnEk/hxdsUFst9?=
 =?us-ascii?Q?N8Vp0kwmd0RxGrTsS/f3QyiSEwN03pUBthdFGZjOzSSEAtmMtgMeL9lNiJKW?=
 =?us-ascii?Q?WV4DQpQDGkG0OvlSkkM3b66LaTKiJdwib5/I2/A54PXOBPRezKsxHuvbeJFS?=
 =?us-ascii?Q?YUX0E9x6W6JMlhQa2BROrkcisVNhqdSAha9eNnlInjPk/yCrVVMPAqiYCTY5?=
 =?us-ascii?Q?MEf2RnlKK0NyJ5cYbjxf1mP+hx927IOt17PISpISH8/HxtY7aVJtUlk+1UiS?=
 =?us-ascii?Q?G/j+OLSs/lPZodIol+Q12NAqvUszm5daGqKT4sH0rScfsnOEaZ3VEMis/OnB?=
 =?us-ascii?Q?QHMlJfQcR6Fxh8oYSEtgJeGlQzjC84puOGrw610MLbW4njVD1tzdooPW+9XM?=
 =?us-ascii?Q?PfChJA42JNGii/xjB0ic7xJEyrTzHJ0vw9tXl7ZFbaY1I6MqOdHdrdQPXlQT?=
 =?us-ascii?Q?H1i+QXChfE1TAfo8+vXkWtu1mlJ7d/NtMlTbmJ709nn3ua++W6fXaXF+P63M?=
 =?us-ascii?Q?tbQkHl6bm38tPqJ8ZeLjuwBrlpjptmfqmH0SqSt/xx/EdQDBntf0x7UBjhoH?=
 =?us-ascii?Q?D5lw1O/Vhqa12xCBX/BUt1tGPAqP6iQ4PH2dK57n5gRjrthGgFYu+48ZNY7x?=
 =?us-ascii?Q?2E1k1u6xLyVyTXAHZfcKV/aI0w0/iOVaJYbpkFv33fjPS4hvQNXMROB650KV?=
 =?us-ascii?Q?m8sf4Bh68H26I4BA+GeVfE0ahkOpR7b6Y1Y8Z7dVgVy7Fg03MBMBaXSYgY24?=
 =?us-ascii?Q?mRXqokj/nS675Fywp2PXPVgdpO2iCvsRCV6qj022uATUBMkUBSZ4tfJZDkC6?=
 =?us-ascii?Q?2eSO3smI+HmpygRFFUBbYM4eXlGI3ZezdIMLcgtKcuX1DTkNyh+ha96pbvXo?=
 =?us-ascii?Q?ZXaYl9IiuBzD8eSDHWKivnW7AAhdoLHxR+SR/0BG2KLM7cOCjSQr1J8mim+l?=
 =?us-ascii?Q?9RTy1bJybW0PjSs02rbyr5aDScSlD3/NHSaUvz/2mUFH6xpFfHMis0Pw3Mgd?=
 =?us-ascii?Q?E10shpZx6s6TT1CfSgWWN4ibvK+7A90y5Drf+3A8CmtQkIHxnH8jijhhBoZi?=
 =?us-ascii?Q?UXaqAXYlZZRJhRniK5y+VLHgweLKqlF3vv5Ux9NHqeiDQaLztm5Tr+gSwtF/?=
 =?us-ascii?Q?Wf13IORdOZbSgkA7h5/DOY8bHVvaZ6Vvi8x3K7QBJSoFVe5ImRd0mnXXbRTc?=
 =?us-ascii?Q?t/vp48XimqffUZMrt1lQiGYMg1jp8kG0HApmOZtxUHzlRFz9U1zQtTlrrKre?=
 =?us-ascii?Q?wYfi1sgtCSHv0Cxqwva5ATKgJDbgw4oloD35O8YaxZ952rMiRCK6oT08upBX?=
 =?us-ascii?Q?wp/9YJ8BBqX89Zjh4m0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(7416014)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:56:04.4926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d976ba-3521-454d-150f-08de51c0ccef
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6223
X-Proofpoint-GUID: XYjZkDgpkehBsDEgAhaSNlinXRo__4_H
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6964c538 cx=c_pps
 a=0c6nIVSIW9eNWsIgvcvAAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=yPCof4ZbAAAA:8 a=w1d2syhTAAAA:8 a=R9bv9ltgyd6VJMm0rNsA:9 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA3OCBTYWx0ZWRfX+9QR3vQHQwte
 0uI4vylmN6YbuLgiabZh6w5ULriNPef+dDlkXlCW5iSCAvLbIVZARV35VzoW4kOlM7+wqwbo7cT
 1ABs0V2Nf1xL0xlhIpiOe8/4Vomto07hXmf8fbmuZ9uXnsantShxVs/ZvGUO3AbmknOaLHZVt9b
 c/gZp42Ww0NCWIZx+yaC6URTbYtKz98sUvRHfCiYuJ2dd9ck0+DXWaYyDnTrs5zCcS+lawxYLW0
 ae2rgztEVqS8ojTNqVaAwwO5jE20vmGAM4X+zBgqHA/JxtrqZIv5M3qVCQJxNU87u3w0Tv9lHRN
 FqQOICHICsCoksgAKBL5zOXhwIUN0GNMayxXOPzyp+dS//n1oN6mLXrbhGJR/XNYG3RmFPnVsfe
 bjQtMuTjokyGgKGA2BnjivUsarbafWgiA6mij2foiYe5xZ2UqsZPQhgsSqQYb5X+lO41WfeKQff
 AKfV3rXcS5LjcDsOUxg==
X-Proofpoint-ORIG-GUID: XYjZkDgpkehBsDEgAhaSNlinXRo__4_H
X-Proofpoint-Spam-Reason: safe

On Sat, Jan 10, 2026 at 12:19:58PM -0800, Harshit Mogalapalli wrote:
> ida_alloc_max() interprets its max argument as inclusive.
> 
> Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
> allocated, but the IRQ domain created for the bus is sized for IDs
> 0-15.  If 16 is returned, irq_create_mapping() fails and the driver
> ends up with an invalid IRQ mapping.
> 
> Limit the allocation to 0-15 by passing SDW_FW_MAX_DEVICES - 1.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202512240450.hlDH3nCs-lkp@intel.com/
> Fixes: aab12022b076 ("soundwire: bus: Add internal slave ID and use for IRQs")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
