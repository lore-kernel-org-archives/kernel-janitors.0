Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C93634F279;
	Mon, 12 Jan 2026 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215347; cv=fail; b=hfPe4NDdw/kWHXc0Hst1j8obs31BB3gUQSoipNgSSGbYgNAWJXbh0P3NkSwvww5ErV4r6UlHLJRcEwe3Cy+9Yli5KBECdjKV7zTHmeHtXE6sGH0quu6cmkO/rZFix4Rfa5C7uCHt0Kqu6xohLnFC/CoQn8mrd4s/YThjBtZRPB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215347; c=relaxed/simple;
	bh=CxHgoAwwY7K+ChRkBqySHwlMEIVn0N7xvvyflaVc8Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3MKkdTlcZMKKKpMDwb5g2UBjgcIPm4FCMng7YLJxBnWzXrsST5ohhD5FQuWfT7vyhf7dq9hEIOB0smNfFlLareAGkkW3dcwhMj9OPdr3W+eR552ibjJD2ePjvJIDMSDz1CPk9pMh5cpyPB/M4kqngH9nNr1qADv+QgwwrzGLJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qBoNC71g; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=d+fk/wkT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qBoNC71g";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="d+fk/wkT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C6j7qg2227961;
	Mon, 12 Jan 2026 04:55:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=7ZBg+ZOdt6I05LKeBX
	xK5Qsg/VuAcfmtbuqJsiICOTc=; b=qBoNC71guCwQhaK3Q5/wnvsYFdIRkkxhj8
	n9yOEFW4kseAlzlHOmcyYSq6hYYQ5s+ro8tBHVshBS6ytrkOxIbIWbERu+aukvUO
	w1ob8LtE375ZuptZkyJXVM/bm5J5fD1ygjRrNX9HOLiFBCt3hBeQBmSRtC6orcab
	JfgeWE96IK61EHiCbUHnUsjXLvBbypaefDuvXEKl7nYmthw4/NjZHDxwxDE6qCfe
	OyZhZt1SGtjD4C52sfkAsSaPxRzVZUp4a/CdsZQzDezB+NBgJOKJIotG7MYjK7hx
	CTtgjyfWunpl5/0zz5/COjIh2DsXH+LD1o4pkR8c3N9wu4FUHygg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023077.outbound.protection.outlook.com [40.93.196.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn201hbu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 04:55:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyF8Y4CKrQuuRtKC2lTBg/lKKCqn4jCN/QlC6u4y4Yvj0KsTYY8tzRapdtNrizyOanCyYep3pfEvsWtr5CzKSgu8uKWBbHRsxoPmN0jOtXf1Cby0kO6TYcu9XJTpAxzVX2Up6hZyU3hPk9dCX1Gm8JI00v7sG10y1rphQ1RHQehOXVZ4XKPKqwpgezyFnburP3W49k+nHkWbnTI9VehdLat/w9NLb6dcUb8kMVDZ07iTJ44Chp2jK9J/jPl8MLZWzZRWHSq22M9bqtW/zKkSibG2LZ/WQmd2aMdSCXsYAVmtHGGGU2kTU5TS8R2QxHvr1UhX5kWFYCiP2ZhG3hOuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZBg+ZOdt6I05LKeBXxK5Qsg/VuAcfmtbuqJsiICOTc=;
 b=Ua6iBO1vkf1WIcgU+q+MrHuiF3j6N/X09FA4lpRFHG2T8RUOPTEHQ6BRmB9jM3TsRczcL3XeDtfcHjGG8EMBqphE4qPlsbl3/GlzOdtPat0lJ5y5edlXsX5mvQyAQ4pFjgb79I1wDMJHDD/UvUOroEYRv0zl3ohBpyNT8TpRi5PwDOIiMnWiXcYfpqUWoDCSvQ+vkM4QaIMzsSk3omIymvnY54+L6HY0rfJQbR2MPpcDfMhYPudtWEJ0xb89iJXYJRYT/QdbV+3XJB5mO1xWdhGOJ8iEdS6EuF7TjSSS93CmAgw1wDAwy4alHlVbrBXYlGYDMfJ4h7/PNhR/BFxYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bootlin.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZBg+ZOdt6I05LKeBXxK5Qsg/VuAcfmtbuqJsiICOTc=;
 b=d+fk/wkT26IZBsXjRrp6goMUwHxBmAksciEmdSpTbFf9WxFkCCwb6fczm17KVDqya5l150JVdqtMTWTPTofkaOMw8UWBZIG+fOrZOLBQhzAN4GhPYRnnwzhUKbl4bmnZzhoWfTQ6m3ulSL+UK2LORwaV5Jj3Wv3FObhjgigswiU=
Received: from CH0PR08CA0019.namprd08.prod.outlook.com (2603:10b6:610:33::24)
 by CO1PR19MB5112.namprd19.prod.outlook.com (2603:10b6:303:d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Mon, 12 Jan
 2026 10:55:01 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::f9) by CH0PR08CA0019.outlook.office365.com
 (2603:10b6:610:33::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 10:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 10:54:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6F2F840654A;
	Mon, 12 Jan 2026 10:54:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 49414820247;
	Mon, 12 Jan 2026 10:54:58 +0000 (UTC)
Date: Mon, 12 Jan 2026 10:54:57 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Pascal Huerst <pascal.huerst@gmail.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com
Subject: Re: [PATCH] ASoC: cs4271: Fix resource leak in cs4271_soc_resume()
Message-ID: <aWTTAXwR5o61s64t@opensource.cirrus.com>
References: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|CO1PR19MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 987f5938-dd4f-4f0a-889b-08de51c90811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ch45YsY7r0Ui6QXzAe5jmDE6rrgeuYDe4UkUTTiHdRq8vjCZk8krQVTbs0Dc?=
 =?us-ascii?Q?u6Z5uIWR5CkxCKchFLa6kt7NWYw0V0fKLJNTWi8g7jbyTLP9jR0S+HEVUmz9?=
 =?us-ascii?Q?Qbz/m5dIbuK4Mb1X7vEtXU4Ruuf3wLIl7c8ZHA5PTxPRdTbazHMhr12CbRVc?=
 =?us-ascii?Q?elIeC7v12oxR/txcWw+oFystMxbywYhu62SCA8e88+TC8lATtgUM5pF7/f8V?=
 =?us-ascii?Q?i8UYBTQuLB6xHvVePluJeEThjDFXhQBCikn6HkUfCjGAyjAs/OxDWwRazjal?=
 =?us-ascii?Q?BV38lQ4thDJAOzJiqG5v3UBISlUmQta8VCZ1l01FtNjjAA/wWRa9zentcjoq?=
 =?us-ascii?Q?K9a3NxAhjfLzEIDSVFosOc8QIrDC5yDdY2KqtcFdZRccpjhhaZa86RMUVNuW?=
 =?us-ascii?Q?3NCnoCEU/a+LpoLsvRjBU0U5Fh8mdwHabdAwOznpJ95p9Qsjku4Y8VbXMkB4?=
 =?us-ascii?Q?GjfQ4vkESuLfoVtIYk0ZfP5NrrjmoHIEGQWPmrIrMc0V3XTwLQHXi35tFpq5?=
 =?us-ascii?Q?pIDHseF2eUzRoQzSkc3TKXVBhK4fUhF04d2ndFEiICsHsQ6iicROJTM981O0?=
 =?us-ascii?Q?00UGwRcsE2JgZCk+NV4CwMma+aR7qE5rSLHqLwUA0ADPbnTDBw0M+igrYRga?=
 =?us-ascii?Q?JD3Quv2LkR8ZHn2BszUG5XmSnm/OMzx3mwp+NM8q4gW0l2jbPlq4ZSR1lXiz?=
 =?us-ascii?Q?heFeu/p6jvBVTDZOZnagYN6umWxnM4mKxrD5uee8Uo56BWdRhGpyOV9qY3/B?=
 =?us-ascii?Q?32j85MwPwfz+mWN3GZ7BPvC80G47ZKmKALoR19DuhkVbPl1wQKs+Yje9Zs8l?=
 =?us-ascii?Q?DxYdMkNJHO0vRawKOdy2Imxa70XucCZnVmj+bOwEp1hX6vYA/p66/oN5j/9A?=
 =?us-ascii?Q?AmjRH52Y2tbAYZUMHpWAQrjgCXG/vax4gG9YhBKCU8x7DGoq3oWvpJ3ilnhR?=
 =?us-ascii?Q?nORHO4efQpQulZI8NxxaG/RHYEjDCKHeDFX2lpIcHFoP7gqvbX5yFL9O1nHR?=
 =?us-ascii?Q?4gUlNbY/pJuZKS7+SOzFwmrRVP8+WVzDJ8U21d7y0QlOM5mALATWpxOjOaSz?=
 =?us-ascii?Q?OKC8D1QbGEeMMxhlZclMcRx6JHo3WLJqPv/lnZfgTQ0M0Iz/fA+FKeoWHoDl?=
 =?us-ascii?Q?kTmNcbDzs/RGYCacm2RoJ0xOeLHqGPeQjo1ZSfYxt4ChWvp6DIQYdLOmGAMJ?=
 =?us-ascii?Q?sZkOarSqcRKg5kSZQcM1o6NSV2uuLxe26Hxmhj4ZZton5wbYg6P/6IGGxsyT?=
 =?us-ascii?Q?6FPLQW3gPgORWY9KEEugmvWXzT+75F58fb19zExUWTbiwDma+6UkCtQB+MLR?=
 =?us-ascii?Q?uDz4Cws6ALASjdS7jL2tFqYK0IZYczpN/zN+SCNI91PCY5ApPIhsFTDBvaLf?=
 =?us-ascii?Q?vOUcYdqYfY9KMXiUfj1agAQzuV39iY/OU2cLRaXZttauOWuWzXNFcXqw5nNx?=
 =?us-ascii?Q?Ldfh8G8wDcvbbGddXGnoOP5xYhjGjmDFgPMzSfpwAVuhTeC5g7x0UAdxIQyI?=
 =?us-ascii?Q?+a0QIUnXvcUYr91OXKicLYkjuiiBKoxQgwecm846ECwOz+r6NdipO3crky47?=
 =?us-ascii?Q?cL7YX7BJlCJ3OzDfweQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:54:59.6049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 987f5938-dd4f-4f0a-889b-08de51c90811
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5112
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfX48K0YEQR0BsG
 +ZCc38hpcbLCKiAFQMQFoivJ5ruWYl6NoeBQHZNGONUN2dxwdT7YRIdcM9dWwY61NZD88y1GslZ
 ntTM+en6ZUsMOSZeu+Z+THDfaCV9sbyBekRQBE/61AETeycykuV9dzOE4jXOgt4R8nvrdObMK6V
 fZ0rw2GAPQeh0RPAypzEr4cbGUS3fbbP1A62+lkvQCIHDFjeihjcAfngTQzjhVfGECoWLIs/Po1
 pW8KXNNBuD38OpQUcO3EeyUXpq8Q/3dfKLjnxX38xHHABVhAKiVAYozxZoBQv7HPVyAgnf3sqdE
 cWbY+3OerntUw8maispdJ0lkxczyadBoUIZIQoCEhcSQsoDqaG0wbzTrgdPpaZxkaFHMI2F79fA
 NVLDPGHoqHRSZLvU6a7kqYqX7avwPMBoZ6Pg9p58fY7jGwAmHmhijDb9ZO+RbVlgx/dUCNfAgJg
 Z189f9LJaNGIf8QDwmg==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=6964d309 cx=c_pps
 a=I1rsLqJrwb5vkj+WUQplAA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=w1d2syhTAAAA:8
 a=Uiwcif4sxDz132vj1QsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: XTL60A9GAxl8_RdLC5xDsQf6E_ieZN9q
X-Proofpoint-ORIG-GUID: XTL60A9GAxl8_RdLC5xDsQf6E_ieZN9q
X-Proofpoint-Spam-Reason: safe

On Sat, Jan 10, 2026 at 11:53:36AM -0800, Harshit Mogalapalli wrote:
> Smatch detects this resource leak:
> 
> sound/soc/codecs/cs4271.c:548 cs4271_soc_resume() warn:
>  'cs4271->clk' from clk_prepare_enable() not released on lines: 540,546.
> 
> Instead of direct returns, unprepare the clock and disable regulators on
> the error paths.
> 
> Fixes: cf6bf51b5325 ("ASoC: cs4271: Add support for the external mclk")
> Fixes: 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
