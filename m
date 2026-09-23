Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB747535E;
	Wed, 23 Sep 2026 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158977; cv=fail; b=Tk8t4ofIcTjP0jpgewd1PZAVrtKHtCGrLZ5jIEaFS0t5DxJdk10nosChWkR/5H/J7MIUjULA4YTHRh+uy3aZCyNClrycDaTnBaNRfcNoAJyI6PptnQB0L7tB00zYovJOT+yIJGo/VgVhQIyK9DuhZlBHj639NEMB/ge1Gv0Xyy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158977; c=relaxed/simple;
	bh=Q5XPfIxAQ2OqE6/QVPf+dElFddylfIl4CaG+RSz4OJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b48o6XJvV8cMGL7n4Z3Ow9bb4vP4uJXCHYfFr4AnHE4ML/VriAKZIw9oWgnB+tvr9JGRt3tUiMniwFWIGNisQuVKSc/3jdkRkg0lzSBPUXjHfIcyUbkxFGueVmouEneBO6jAGgeYIPl9n0bb83FrXfIrl+4DG7L98TnWvxPBYZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=A/hfiCwN; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ayNYTajA; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="A/hfiCwN";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ayNYTajA"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N9XQ0E446146;
	Wed, 23 Sep 2026 05:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OGdEA2EOYZLBy0Uh+Rb5YX+LbjDdyOd2TgT6B/INU
	Wk=; b=A/hfiCwNx8B46R/JpLcVCGDAnyL+uVF6yLFoCxgXSq3a//1lyv5R/XxpL
	SwBwtWDBGPGBBA4wdXKjXEUOTCsrkYFZ0txWTzXQB2wRDU5j3EJrq+4dB2HnutSZ
	okl5SaRayvpfk+WCygLwZb3GFrX/ZB6uf0435yP/PM0XutyvdLU4uYONos/MY8QZ
	QPMe8lzg6N+SMAqQ1E2M+j/S/GaIS6OqlMsp2mLfEKEJY9Xez9zF9LZD3o5A5Fee
	AtyIgP/+EvZXP9FpHpFvPYEYQO5qb2pcRx1fy4GAA9tzK3pGZEqCd/Ty7ekQBnz8
	2uXIn0Y9AUNpAUAfIgQ10ZQ3PUJ9Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tjkqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 05:22:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWhdCVVHUcykv2Ut9QZHv/vXJnW+kSrofYhRC/p8z1b5umbhZJ7MmY0RHdEeOzYGv2z+Vs2YykIozNJ4i42BwWoGPOY6Q05j74CqHbzjof7/WT29mugKBbfTXDnIOlmvo6xNkF8z9en1SvJXGmq3wRj9nktjDhLaa1cNTnB4hgwAdra/cUuPOraitMHvhH3Vt7l3FBf/LCc1jwv5V6/c0O31BR8xKBsBFPyECDdH5HcIFFy0TuKEQDG9CNJI7mdxivbjLEZ9T0jMr9NCfT4bujyDbI+TEg2cmwwGXQfL00MBz5+jJ/tLOjuuU0hWJYWtb5yTrgmeJbORRCLQ+pCwCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGdEA2EOYZLBy0Uh+Rb5YX+LbjDdyOd2TgT6B/INUWk=;
 b=OC/IcoAtev2oNtQSECNfwSeE6xOskgD2Ro21zH8IFKNKUofB8kvDLnmF0oxknPCFrCrNwcFLdYWBxtoTXlCDczkYcn/WM3mGVZcP3Mdet/Q8T2oI1pt7df5eBRFsbK6sAT+lAuZOWBJb4f29D5WLf6rhXYd3XCO6A/DWbHURpVgQoabSizwLFBOXUhqgBcWuNU6TjE3yKn5cKFXIvoF0cdW90c8Mp+yWRcuiB++gEJK8vf/B7sYmyZnnNdhwPWB1cTP48rXrTTCPwZW8RHeyufksee1GmPs/Erttljaamk0an31R+n4YqulDMQ5EnRssky7uxBWBdel3N1ZEuoJvVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGdEA2EOYZLBy0Uh+Rb5YX+LbjDdyOd2TgT6B/INUWk=;
 b=ayNYTajAzCyRJ2dHIQeETjv1UIx5wUm1jClvXmcILBZkkO4oY4/gQKx+vOrx761DKG4o2ZUuhLSvLRJW6k9RQ81++wXO0R85FpcR3QgW2bomHd/N+KyEyQwQ1nEg+O2+XCdopa+LD+wzUpBRE/T6d+coAWKnueCI//JpwG6bY34=
Received: from CH0PR03CA0240.namprd03.prod.outlook.com (2603:10b6:610:e7::35)
 by MW4PR10MB6396.namprd10.prod.outlook.com (2603:10b6:303:1e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Wed, 23 Sep
 2026 10:22:43 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::a3) by CH0PR03CA0240.outlook.office365.com
 (2603:10b6:610:e7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 10:22:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 10:22:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 05:22:42 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 05:22:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 05:22:42 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NAMePX1829591;
	Wed, 23 Sep 2026 05:22:41 -0500
Message-ID: <ffba8b51-fea2-418b-af26-dd287878ca97@ti.com>
Date: Wed, 23 Sep 2026 15:52:39 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ti: cal: remove unnecessary error check
To: Dan Carpenter <error27@gmail.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <arJZri2tFcBqBLgN@stanley.mountain>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <arJZri2tFcBqBLgN@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|MW4PR10MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 1712c92c-cb8a-4535-a9b0-08df195c9ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|30052699003|82310400026|36860700016|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rhf0tWs8B2ksUczG1AeKYq92KFSIVJrHIq4YmxDETCwrUg7va2XZZtN+tVJgW+N7wZeTjsf90FHe8Y9kau82SesgsTvR+YP1BCKGcQXO1sslQVlMxyeqCTd/sJagVfXGSHDpN6uqX3AsdX6jWo6VqL0Gb/mUFxUUQSUrWRUN3Q9rHndZkdc8omQsdFgeTIsx6ItqPYRdWaaWcd6Ad0m8vaAuiKVlMHA+8gTxHj11MXuwnrrClMgN+w2KgiuHRi0RVFpMMe4rrSVCnrdFk+zORzWknlRhF1V6eEh+RAGj4B2rUIORKW62IZkedb+8kX5g5sSlm6mNcIJMdyQ3jeQnQGRmgYztooRHUPyL2o+LeDCKgYajZPTLyTnFIladUWf1RCgc2/ofqz1OSYMvrehuyP7xlOPQ2rcvjTlXzp1ACPOmXbPeYM7Ew4nyvwzAKJvqutvqJAr2NyywpMtjl9DCCRLIwAOmR41lfUGt6CBRWAeJsej+qqNMsMvVBNqNz4tHmzbD9HoHmtodU3AehLhUZvakN+FY+kV4CU8vm/aF2FI877LNP1x2ScPoB6miUB54yXvpLXFipgqARMTnInjuLB1is776suZnO2Zg2dot3R4/Y1PAXE+m5/LQMQfkc1DZJQMQf0x/qfxcc8HEmQDbBSAj2ybetSvbANeIODWTONn5pKKbdZd3MH/foZDA2KxS1+YPjAF2lBU7epFXe0pcow==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(30052699003)(82310400026)(36860700016)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	37TgXWbQMvd8sNnoVzv4aR2O1zgfXMq6IjwNsLz2YEmNbYUXQPQDnOfRxWDAxL0nx31mTaaAgNbtF1KW4mQg9i8HiL1KPf3UDqMt0LRsEuOyBWdZQUXn7KNWf3qPWqKOozkNT+0pevw+QqO5nN35HcIt3sg7ybsw15/V3rRtxkyxBKJ9TC8o4FRM+wMgMDIMSMBSQKeI+wS68XrxfQG9Jf/2q1UVIwN3Xt+vQ67XtwfL0WYtjZ2FKM20+3tdA+aUQbFN/oojGnKwVAyBb+l+w9uXCAoQoYSyGe+ODX+oaNdOtLmVt9AQoy1Nf+fNwrjDlLHgOLJ0Iq5+N/+bCmagRn452zhonLMlo7KYus9432O2a3lKNJHlkM7bDb+MEctzy/NfGcctu/On1CVAWl+liXmYaPYgK4uXDzRvJ51sa1iF4pOdKC6LCf6j7fS38gsV
X-Exchange-RoutingPolicyChecked:
	chVCt9mel9P6yHsLOOE2i28u+NBKh7WwCyunIu/MhBEVdnTTqm+z7lMummJKu+AeuNY1sPPX1ocQVxTwsMyeEIkAHNmqntDUHTb43AdMIIVMFj+JFy/ekZ8VkvHwwM0OWfRMYjcKO9uHpubHWKo3gN+YbBE4iZH3dI/JMvYOUI8/zQvSlaG0lU7PZ4vO+u6Bu1sg55JiCtm8ymfo5c/SaJRIdaUeUzuipAWVFJgq88iqB7FSwEONXAOCr/TB2eEYL2iRvv8hIydfrbXUWPttZ99/SFXfuwsHkfI/6x9lgIeJczdftI/3C92zZDt5NZCPqDXSmyjb2W8ZAq8W9v/bOA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:22:43.2238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1712c92c-cb8a-4535-a9b0-08df195c9ab4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6396
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX4EMgVzi/Q6bQ
 5asqOqqODTi1tNBURhaq5mig5TPn/7jTsWzH0kePFF77T2nlkxCq/i+2lipiYkDefC61Tz1gZl4
 0Q30TkTv8ETDyHh7Zl/oAiMIjn9N8es=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX+WcvMWRoozWO
 7m6U9k0zjY9Nm/zVdD+thLnHggje9drW8MGRbbF9AKisg47LT0FiVaZdPFatqgXFRzZ1lMpd+ZH
 wMvtcNaUKc4RAArpK6E02UncZKmJzn+V7umSyKoXz4UJJDuRZbmrX2uxFdl6ZxRoG7OU3Ueygw3
 ib6OyJzwwYjGVO1KWqWQTGCZikOxaNFWjrLlor0oYNEGnZ3f8p6nDm+Lhs4NEVWxBFUfEBHkicZ
 9aa8sgmgI97TUuTEVRbkpbqicwBklZX54KBBQHm7G6yYNHlE/OiMN783uz/O+DTfR2wpWDUPvms
 TUN/HQ7hYp0aG89l5+NrugqAS7FvsdEwSrRGcHU7owNVeMl4mn11FnrCNvSQ01Y03gJvx7zB2w8
 3CmMLekzfmTAJaQ0vyIPJUkc0MwmN08TzEJYLo53ERxLMjdPQptoqU1iwdX4DLT3y9gat6te6C0
 bNm0C2Ms1fChWfIhKTw==
X-Proofpoint-ORIG-GUID: uABT46Kdj6_cCGoGeLUp_I923CjEKEH1
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab3a877 cx=c_pps
 a=9AcDkMntNQwiSFi2uhiI7g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=pGLkceISAAAA:8
 a=sozttTNsAAAA:8 a=7fezpzRnfpkoq3Km_k8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uABT46Kdj6_cCGoGeLUp_I923CjEKEH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Hi Dan,
Thank you for the patch.

On 22/09/26 16:04, Dan Carpenter wrote:
> The v4l2_subdev_lock_and_get_active_state() function never returns
> error pointers.  As the comments explain, it "returns the locked active
> state for the subdevice, or NULL if the subdev does not support active
> state."  None of the other callers check for an error pointer return.
> 
> Delete this unnecessary check.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> I feel like if we don't delete the IS_ERR() check someone will eventually
> try to convert it into a NULL check which would be a bug.
> 

It makes sense for me. Hence

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Thanks and regards,
Yemike Abhilash Chandra

>   drivers/media/platform/ti/cal/cal-video.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
> index 59f0cc4f0d1a..1990cab77344 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -130,8 +130,6 @@ static int cal_call_active_state_set_fmt(struct v4l2_subdev *source,
>   	int ret;
>   
>   	source_state = v4l2_subdev_lock_and_get_active_state(source);
> -	if (IS_ERR(source_state))
> -		return PTR_ERR(source_state);
>   
>   	ret = v4l2_subdev_call(source, pad, set_fmt, NULL, source_state, fmt);
>   	if (source_state)

