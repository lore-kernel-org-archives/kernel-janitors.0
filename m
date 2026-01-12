Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB1321422;
	Mon, 12 Jan 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216451; cv=fail; b=hL86n0OGuPhEK06e23qoxvvqmFbvNtQZze2/zP8etn5L6qPmwxzxDgnE5C3lx0Mieavy0owVBafIEoYBATDmL/35b7lXhSQPQCPEocoE9xjeLlfxIn6oG5LkD+03uBNQlm7FzWnUrCNbMwSG63svR1Lcux3alEYx08v5YgrtdLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216451; c=relaxed/simple;
	bh=/OeS6Afa+9kFYXLlYDxjlqQ3qEFHzzMHvyfhSAWWKk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siCO9NwuiiV956CpUSn+9kAmpBOWbfkYvwTiTyn/ZxsLbZPi8O2bAtr8sFdBPQJMnun6odwhESYWDeWkG+op/vhv/gq8UtoTa/UtWPB+89nSNh0PbMKhldGoc+MqBOsazO7Rc2rLvLoxL+LBTrdv7Tj9sQQlq8eGN+VDfX9lHJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QE7c98rg; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=M0tBjyZg; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QE7c98rg";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="M0tBjyZg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7CHMb2269630;
	Mon, 12 Jan 2026 05:13:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tMNEQRQAOEZ4bJRAIffwFlmD7hDspGVAwFv3+WKixRY=; b=
	QE7c98rgTWCXipOiQ/zM7wXwBIboeddCpZktWHUrEHKk5F+3/PPUlipCUHPEmfsz
	VCqDcVMCiWmO6zQjstFQbHpBgYmKxjpew8IwowBY2evdgjQn82jlq2cGwYUz1VKR
	v8rhOc7lb8G2JOPL+7GLuUKC6HwZz0kR7LrDnMNslsl7I9S50sGxbvCikzAus60J
	VpCCnSta0DMWheXvs2VjDJ/yVNSX5qly2JA4uo2VM1pfHt4QWJTPtsk+Pw+ubU0w
	DKsZCXJCwpPYlnf8m6C7sWXEi63OdMQyAKYozOqIR165BCgpF5MM3oEC+7rKoTcU
	8NBXXCIsHBL/veu/BbXOBQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022130.outbound.protection.outlook.com [40.107.209.130])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn201j18-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 05:13:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkNz6YOUBXWIsuxB7iR4DnFYHpIcff3rgMYnvwUip48X9H4XRiqD1uluyk0nqyRE+yINhb5ClhRD0kE8zLdsUL9B2nSRIYXOxNZvnP/WQ08XazdTqsgei0Z+tggtgUZTTqFTBaZA4aSQDVzp2jGa2A/8fusnbJRBxSixyJobkiS9DyUiQx/biA3NnI7yLL6qXD7O+LAbA9lPL9JHtvOd060rA0ShF7K6CBs2OzgWS5ZocUVHjBi+q6MlhBhqVpCBqhKA2f54COyV+4RS2TK08isoJESP2wSIYCbvYheMSbkVel9pIqNeGbds+NzjtTKVRW8YhtUUkLtgm4b6YpC4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMNEQRQAOEZ4bJRAIffwFlmD7hDspGVAwFv3+WKixRY=;
 b=gLs0T/Q/blINBTpSIdnP6tgUi+1dFacAhvet7uWq3+yDJMnCcxhDpX3qQgwbn0DuilD3En8sH03R3H1acnxCqfy1m6ox3WLm9wBe88WUNEhSh26/qPGdnJ5ljsvIhZlZgcHpdv6QVn/irWSD1ybm6/YzdKXrin8aafjNszZxZZY6o5F6COKw6An6tD2gwrxlApDodxbKGE7Ut8wYdPdpgAKJ6XBzg0F124OT/SFdM7K4bjZryXtvlITJCiuZtgyF1J91VmtFY8Ae/3GqiOPem+3Q+HaYLbpyZRXdmUVn5nj3rrmPFehmAaMzQAF9VjWfCIBS9OnBSBY3txMn/oNvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMNEQRQAOEZ4bJRAIffwFlmD7hDspGVAwFv3+WKixRY=;
 b=M0tBjyZg1xaTMXI5qrxpgJ6dZgT2VXW32Wq4RZBVifw7o5tPj45qc7FAb77wUPMQcpIhZtKdh25/gTyc2nQk2YzGnwU4u47bM5Iz8jYMgPVF4fCF5AMq8QG1DxoDGVBUro9mzJykioQpiinxRfMwNvrDBqLkEmNK0MocHNWVHcQ=
Received: from MW4PR03CA0328.namprd03.prod.outlook.com (2603:10b6:303:dd::33)
 by SA3PR19MB9473.namprd19.prod.outlook.com (2603:10b6:806:49b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:13:52 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::3) by MW4PR03CA0328.outlook.office365.com
 (2603:10b6:303:dd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Mon,
 12 Jan 2026 11:13:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 11:13:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9335C40654E;
	Mon, 12 Jan 2026 11:13:48 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8300C820247;
	Mon, 12 Jan 2026 11:13:48 +0000 (UTC)
Message-ID: <62e256c4-a616-4c80-ba29-43f767f4d342@opensource.cirrus.com>
Date: Mon, 12 Jan 2026 11:13:47 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: soundwire: bus: fix off-by-one when allocating slave IDs
To: Markus Elfring <Markus.Elfring@web.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        linux-sound@vger.kernel.org
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vinod Koul <vkoul@kernel.org>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, lkp@intel.com,
        Dan Carpenter <error27@gmail.com>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
 <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
 <aWSwS0PQHumb2TJG@stanley.mountain> <aWS1j7IdRLCJTj1h@stanley.mountain>
 <35084885-09dc-4255-8ec9-ba23c3a2a925@web.de>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <35084885-09dc-4255-8ec9-ba23c3a2a925@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|SA3PR19MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: 846f63ac-4adb-48c5-2267-08de51cbaa00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUFHVTZpUEhISDNGUHp2NWZHK2QrcFRMMWhOeXRLd0NjaDVuVllhMFFDYmEv?=
 =?utf-8?B?ZGJyZEVsWHVNMUV3anlpNS94UzRZeGM3aEdCKytHQ1NYUTZrUWpIc2kzYUdi?=
 =?utf-8?B?QXdENzZjT0JwUk95MXRyejZaa3pQNkdaTHpUdTlTejZxeTVPS01OSUIrNXp5?=
 =?utf-8?B?NVJ1alQzUm1Ud1huMGlVdmxQckZxMUdpTkhOb0hyaldabEkvS25MSWkvRmJu?=
 =?utf-8?B?UmpkRzZZOUZwQzUvaDdrSHFVUmlyNUdYanlJMTJHQ21lYWZpVXNBUFh2OGlx?=
 =?utf-8?B?Nndad0F1ZHFQS2RWY3Bid2htZnNkVmt5Q29yNk5hZzJ4aUl6RW5ERnZwYldT?=
 =?utf-8?B?eDFVendWM0JBcGZ5aTN3Ry9KSmI0NytMUXBsM3ZYSW9Qei9UZktBeDZObjV1?=
 =?utf-8?B?dzl4R1FxZmpISDhLVCtBWmZBTU9yTUFIa2c4dkxlQW85RGpJYndSS3JqTU9p?=
 =?utf-8?B?UkdGT09XbWRWOHp2SlFtMXZ5T1Q0c0t6QWxza2hxWEx5dkFwdG0xRWdISWs2?=
 =?utf-8?B?Y1Foejk5VWc3N3Z6R3k5d05XcHo3QnRGV21UY0ZnaUdPdEhMS0VpeE5DblNw?=
 =?utf-8?B?eEVwZTVRNFdDdGJqbGxWNHRnOXpIQURkcXI2d0lObjRIQ05Ea1VrRWxwMEF5?=
 =?utf-8?B?Z1loUnRmWTdIM0VWMGQrUkJHT0lmUmlwTWNkeE4vc2hUNDJNZVNianNOeUFC?=
 =?utf-8?B?K0t6blhGTnhoMzMwSEhsWmpOMjV2eG5lU0l0Yi9NcHA2ZVNGOURWRWptMVlk?=
 =?utf-8?B?K29QL0ZwQUxDYjVlbXVZbkFZaDFWQzN5eDhPQ3ZNRWtOd1ppWHhOazJuTEsv?=
 =?utf-8?B?dTArSDRBNWVjZEpqQThIc1pKWDN4VlV1dDdmYVZ5c0xOZ3pIbGhDTGs5eHdC?=
 =?utf-8?B?M1cvUXh2dEdpaVE1WnJFZ1VqQnlVSHV4b2Rlc1N1R3UwSWJlWjRYQlFmQy9Z?=
 =?utf-8?B?QXljUXFibDBUM2tsUWpGK3Jnc1dRWEhNWGhJN203dFdieWl3UnlrVWppN0wr?=
 =?utf-8?B?THVLc2ZlYk1ad1MrVS9rRE14V1ZYVGNaK1hNbkNwRzJBY3NwVkR5K2d5WDNK?=
 =?utf-8?B?SE5Gc3c5dTY4NnRMalg4RzYwd0pvNm82RnFEY0dWSmV2dThKa3JkVUZ1bzVR?=
 =?utf-8?B?b3F3SHJCUWh5Q1YyTkhKWVFVTjdzK2pIVHFTWlRCQWlVQkVpTk1ZOXhZZnJW?=
 =?utf-8?B?TTRnTFhLTXdseGIzVDFtNFdPRFFwY2tUMCs3TkhzR0sydTZsYmJjVGUvUndG?=
 =?utf-8?B?QzZOQVdwZDVrQkdQdTZWVmg0MTdTQSsrbndnUGwzcW1zVXhaRUk2OGxBRTlQ?=
 =?utf-8?B?MjFyNXN6VlJ4Q1cwaXMrU2gxVHByM04yakZxbW81RFd0L0xKcUs3MkplMEsr?=
 =?utf-8?B?QWxRSjQ2NWtFYTRqS0J6ek5vYnJBQ0NNTWtLeHdqQTBsZzZSTi9YVVBMQkJv?=
 =?utf-8?B?NjF2aHpoMHdzY3JkS0NmdlI1ZWo4SHNPM1pIOUpvOWVmZnlhZEJGUjd3bDRM?=
 =?utf-8?B?MHZwL1NwZlMwY1ZxL0dIbkVVVnVMN0g3L296RzNhcmlUZ1dkbVJEazRCdi9P?=
 =?utf-8?B?QkVvTkhKZ3Z2cWcxamN6YlFtNTRzYlpsM3l2MVdmbTM4MGdNRlBnU3oxMHFj?=
 =?utf-8?B?VW1ETkFIak4rVDJDM3hobGdzbEFNZHhPRUZsUjZ6aVREN1cwbHo3c1JmQnB6?=
 =?utf-8?B?RDQ2eU8wT3FxYnRVRFdXZ0dEVU94aGhIeWx4cDJBeFYzVkltYWxMdlFBZzc0?=
 =?utf-8?B?dkJVVlYzVmpRQ2draXlJRm5pbnlNTHh1RlRiai82RXR2YjhLMmdzUnZzc3pp?=
 =?utf-8?B?QmFCd2VKb0gzbEtyNDQrTnVzQWtNR0NLT29ZK3RMMXJZeW4xNkEvTmRia3lM?=
 =?utf-8?B?NHBuYytSMHZwSUpqQWZVZ3c5QmdHcGRyQjJsT01zOG8zcGVqTHp6SjBWa2xS?=
 =?utf-8?B?eEtXTG53TVExOVlGVWJsMzduY2ZhOS85SGpzMWVkZGRRd1lsWmxIQk1OS3hY?=
 =?utf-8?B?eUpCcWZLOXZ2dnZBQnYwTGI1eTJjdS9BZGJyWXZUSWh1dGF3YkFsU1FZeWIy?=
 =?utf-8?B?NFg0NHVTc2ZTZ3dqQTBRRngvRHlaY2tuSnlPZXhaZ1dtb0RUQWpNSDEwNlNt?=
 =?utf-8?Q?x1g8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:13:50.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846f63ac-4adb-48c5-2267-08de51cbaa00
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9473
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OSBTYWx0ZWRfX7EEYMJI2N3vU
 x7KeLi77BdtXh4X3vaVjnYd/1kZGDmJASFKhnbEhu4ss6/F/HgAPpAYp4vXyeO9yzQMUXQiOORP
 SbvNaabU7QKIjSeKrPk6MQQ7zoP0cf96PaYI6VzkflyGCFkXHkatQ+lrN8cONTdoGR2Fb0a6b/Y
 OxuQbbFn6AjqbS+ubbDV/A7NiFDf3gmOwkAynSImjKwN/qlPUAuk1oW3rkT6VNod1P6E9IcF9Kq
 M470zu25S2MY7LFDQ3AZR6dN4++Hke3lAt2rWlnIIztyFWQ9/TPcpOSEnE88hwm+QUeHKpf/RlO
 CESrOnnGWV+iZktn1Bq3LYzofR9UMpDCyB2HnJu+LCGK4j0nrRuRoGIYTotDA3zgQe3BriTINeT
 6HU9AtPVtLt0jg3prO05cBU15ppzx/jQf7HaaV/ieVWJZ5oVYQv5UiG/yr4Vcaw6fVmy4ExYhOH
 ikxLL31Nz4na6Q7hm1A==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=6964d772 cx=c_pps
 a=mtbE6hZZzJ9LV2y+bPDlKg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=x4p_sq3rNDGoslgc0P0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CM1HptoHASfuE7cn1ydqY0wEGuclLi9k
X-Proofpoint-ORIG-GUID: CM1HptoHASfuE7cn1ydqY0wEGuclLi9k
X-Proofpoint-Spam-Reason: safe

On 12/01/2026 10:55 am, Markus Elfring wrote:
>> Sorry, if that was unclear.  The link is a real link to the documentation
>> which says:
>>
>>    - The body of the explanation, line wrapped at 75 columns, which will
>>      be copied to the permanent changelog to describe this patch.
>>
>> The rules that we write down are simplified guidelines which are designed
>> to be easy explain.  75 is the upper bound where checkpatch will complain.
> …
> 
> Can we benefit a bit more from this system configuration setting
Why is this wrapped at column 64?

> instead of performing word wrapping at around the column 67 here?
> 
> Regards,
> Markus
> 

