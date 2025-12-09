Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A22D7DC6;
	Tue,  9 Dec 2025 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765270421; cv=fail; b=mooVMFp/8FgFdktEpkKKBaRiPGCb+OEjASaCR0/L01ppjTJZDu8RGIr2Qrf67u9nBn5DOAVxAx069EFdVENJgdgGOOlvsYlrZHbrV16eQc5/49uCr340DgpNGfRn/5M3p3Sa7VIN0tI2aBkSWP2OedY/7uy58pHqdc2lt3v0gxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765270421; c=relaxed/simple;
	bh=rIBDhrNWBnwd5aQ08kLd2Dag1F6X0mW24odcAeFsqFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jSOwHLJxbpuhSf/GeVP8fE/aDjzhSHTrqriDJudhkTtKUUQhV3wq4SyxchlyRzarVua9n5BSmz9mzjKtCrZSvPt//5BsuHpGkvQrdxtj0/QS85cz8plxBtcM6Q96spaZlO3StIoNqT6mx7XHs/RVXnla19bL7NLj4cObS1isyso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IElGHFzK; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IElGHFzK"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B98kj3p3429234;
	Tue, 9 Dec 2025 09:53:03 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4avcq31rwj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 09:53:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMXXNL9q4Ja7fDw2PdNlwyWGQvI+NfU2GjxwVuebmslcShTnOmlAcS8emMTJf8fZyW43mQ7MJ8z/ky5Lb5+qiUji+M2pttUssAJDnpQa0LAJ3V7U2WOfqTF0S2xvF9WloTOsZf6mocgg/12KHHlKnxQ0XcIeIh0BHEGWBhqlzWJifoYNIr0jxNTxOTS4y1XGOBg8gX43jL1aqyVPraNNo3GOw6RAjUW5eVRKDUCbdT7+ZuzdvQmTHsn7LM/fXrvlVJ/OKY5TPJl0owi+PPVBeERydz1l9zGkpIIrD7TCARsLqbCFppUsQHOR88rOcjSAItJELJL07UvUlm6AsX8Gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRweUJCc/tyk5f6nAL8sfLdj/YQWUpKr12enXXa9wIA=;
 b=rwe4ZnGKqQT5aIW2Ov2fihdw78Av9r/Qpv0U0+jIqNYNn9CTZksHC0mJuHCytbfbWSc4Y8k7GqS9Br1/HF/fcqfU9C1QXBntRgPMWnFwvghziy6gCaRWTYVp/nHBAscik+Nb4Ia3golCrFYZvNKGU9HKBfABVnYCFJce3wlybc10cRAjwLiDGi/ET+9yPQ18TmPuhho65taGmtqcr89e2VM/Xx/ILNHLwnHCIO+u2rkuF7ooTn14SdR3gwAhtj9NLlBGOuj3emGJqnclOAMkjeDrArGjBZBqYDg9pup9hq899gkjMc/E35ic8Kykx34oTkahQLllbV4I48UkmGIATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRweUJCc/tyk5f6nAL8sfLdj/YQWUpKr12enXXa9wIA=;
 b=IElGHFzKnuqIp/wu6EuHoe6clAwcmipNdj9fHtWDu70dIUAZMcpsRFT2TZFM5WYD0EwFRXbvod6xS6SNblks/RYFwjWdEtzgAd55oM8aqtb5gmqlPZaEqJIKym8eIAoCg0pTerW3AieTwU1iDuONb1zEuQfQRsKJyuvH01SWGQx0MAU/fnLzxbDt1wQPI56uMricREuSdTCRGXjjWK1rB1uyhWvX3IDWQAom3gTTgJDgfb1yaSxTAJUaVo2QQpwkr5iTy+vHCKs6L40J1dau92scAdHyqy+EgzjZxhm3UfAqVXOd5gW86K2zdGny+WQg753UkKEe70ftQGkOjRBk2Q==
Received: from DB9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:1db::19)
 by DB8PR10MB3499.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 08:53:01 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::e3) by DB9PR06CA0014.outlook.office365.com
 (2603:10a6:10:1db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 08:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 9 Dec 2025 08:53:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 09:53:41 +0100
Received: from [10.48.86.127] (10.48.86.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Dec
 2025 09:52:58 +0100
Message-ID: <274037fa-b881-49bb-9e93-c83fefb80438@foss.st.com>
Date: Tue, 9 Dec 2025 09:52:41 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH] phy: stm32-usphyc: Fix off by one in
 probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Amelie Delaunay
	<amelie.delaunay@st.com>
CC: Kishon Vijay Abraham I <kishon@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        <linux-phy@lists.infradead.org>,
        Fengguang Wu
	<fengguang.wu@intel.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        "Johan
 Hovold" <johan+linaro@kernel.org>
References: <aTfHcMJK1wFVnvEe@stanley.mountain>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <aTfHcMJK1wFVnvEe@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|DB8PR10MB3499:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa57d9c-6cad-430d-3fb1-08de37005b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnJXWnhOdVhxMnpCRk1KY3FrM016RDlKcGwvTFlxenF2aUFrSWwydWxNNVho?=
 =?utf-8?B?QkgrRDIveWZnTVZKNVl3VDFKcGVJRldtVVl3Y1IxTnladloxSmxzS3JDbWc4?=
 =?utf-8?B?VDNjVWxhaGRMNXBsQ0E2NEkzMU5NeFRJMlc4S2lOOXIwV1g0Z05ZN3QzYU1L?=
 =?utf-8?B?cXJ4OTZWa0c3c2R4QmF0SnJnbkNjN3R5bkY4QXJiamJzTWVjNlQvdGRWaUs5?=
 =?utf-8?B?MkZlUFdFdFIzUnRvdkx5clB2T1pFQTJrZ05iQTloYW96NU4ybTlSRzRPY3l3?=
 =?utf-8?B?WWU3UXlwRkRyeVJaelNyVjYwWHExOUtqUUhYYlozUE9VSnlqcEsveSt2cFAx?=
 =?utf-8?B?VVRndVpYVGQwVm1XSWE1NWVOQkxKN000VkhNaVdSNEV1bUlSbnZLOHdLZlBX?=
 =?utf-8?B?VDhabVhjdmRPaHFmR3dMMFAzS3FvU2M3bnZUUHFhZUlQcW1VVTJzUmYzUTlN?=
 =?utf-8?B?dGNHT0hTK2lnZTJJMGd2elE1a0ZnZDRhajRrMUVlaVdudWZoWG90NGhkZjFD?=
 =?utf-8?B?aEhMTjRzMHFicVpMTGoya1FicEszQmdoMk8wMkVtTkxWVktJWTZTbXI3K2pP?=
 =?utf-8?B?SXFUSEM5bGdCMWFzT0w2VHFGYyttWEZOcDBEV1BGbWhEZHJhQWtJMzhkZGlV?=
 =?utf-8?B?NDl0VGdzY3ByYkczdVJMTmlFTkRIbno0TlFSTTVEV1BibXQ0anB0N0Voak0z?=
 =?utf-8?B?YmxjSWwwYlBPTWZlZlBid29iakpkZUFDcjZYa3ZCak40cThZN2kwRmxxOWYv?=
 =?utf-8?B?N2FiVVB6KzAyTjFqeWlwcHcrcGNyT1VraWJSNXV4eGZBUW5qY3JVdUFpVnVh?=
 =?utf-8?B?RitWYTJxUk14ZDhnTEdZUktCeWFKV0JZUGpxMXl0SmY3L0RqaE84QmVlb0lO?=
 =?utf-8?B?R05Yb0hCMEIzR0p0OEpHU3o1eWhCUnUyZUFiZ05UWU1ad2JUbUNicW9DaU8z?=
 =?utf-8?B?VW9PcE5oZ09KZFp1NVh2cGluR2dQVWgycy8xQmFIRUZJMHBjSGlNMVM2dkFv?=
 =?utf-8?B?Z0RYYmsrMjNtdVo2VWc4WVYrM3dYdmpicXYrSnZTcVVhV3dVRWtKeWVvSkZk?=
 =?utf-8?B?MDBzRGNUY0JjeTNTaEhVS295dm1PYmw0aVZpZXNCNjZlSzU5YzFBelZOeEJU?=
 =?utf-8?B?SGJwaDlSN2w2RUN3RXR1RWNJYldzVHN3eFRFQjVEQ3hkemM4L2c3SGFVdUcr?=
 =?utf-8?B?bXFLY3BFelRlSG00K3lER0pxMVV2RWNuNGdzRDk0d2gvR0JjQWxiYzRoVE5B?=
 =?utf-8?B?OGlkK2krR1hlVzNlMDllNmNwT3dDTlBqZkFHdkFVK0dDWmFCZ0VpeS9hYzlM?=
 =?utf-8?B?WFZnajJpVjYyZmI5KzkyZ3o1bjBrd0RrQ0pYOGY4YkpsQmZ6TUpmN3d3bzVD?=
 =?utf-8?B?NWkycHRNWjVONG9LbXplYWxmd1daWEpxVVR1TDEyYnV3UThZS1UzbHVFOW9I?=
 =?utf-8?B?WC9Cc2RyV3FqcWdqdkxidkNlczJVOXZyQnhrY2hTMHZ1OVg0OVFmdE91SXB3?=
 =?utf-8?B?YXQ3YzlrL2tiY1RlTlpFSE91bFRqQzR4c3NoaVdXT1M5ek1GaTJIVXBoaWRQ?=
 =?utf-8?B?azdHWW9vZnRwTXp6cHM0OS9NWDZZME0wQTMzVG41cmdzWWtRUVo3aGJtRlJx?=
 =?utf-8?B?UnRHb1lwN2JxdjcvWjhiWjJYS1dJTmptc1M1ZWljcXlVN292Y3h2cDYrVlJ1?=
 =?utf-8?B?VDBka2Y4RWRuZVVSalZ1T3M5RnZnMDhrUElQNDNUZXl5bnFyRHVVRGhTeSsw?=
 =?utf-8?B?QVNGU1ZoKzNEb2ZUN3pyQTFTc1lIV2t1eVVsSkdoZFBlaitac1pIWEdzbDZW?=
 =?utf-8?B?MmVIVnFQYlUzbnRuL1grb044a2srSDVpMHdxR1hIVjNXblRXa2xuL0F1UG9X?=
 =?utf-8?B?Z1VIMDB0RTFYZkdxb1BEUC9Gc0czTnNPS214MnpkZ2t5TUxWbkRCUjNMbkg2?=
 =?utf-8?B?S3VlaW10Vy9ETmgrcStnRWN4a2F1bmxZZmIyU1hLYlY1bk5LR1RkY2xsNkEx?=
 =?utf-8?B?QkNhNWphUDF1b3BXSW52bmhqcTRzOUVXcnJQUXkvZFNPekFUMnRGeXJhZWJy?=
 =?utf-8?B?RGE1VTNnaG9LMkhHWmxLZWRaVGtrL2xPb0hEdWIwUFJuMzRhdDVON3MwV2pq?=
 =?utf-8?Q?hL4I=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 08:53:00.2436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa57d9c-6cad-430d-3fb1-08de37005b3e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3499
X-Authority-Analysis: v=2.4 cv=fc6gCkQF c=1 sm=1 tr=0 ts=6937e36f cx=c_pps
 a=CDwPQmgHc+Eu1NRyjOF98Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=iPq3YwKX0LwA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=8b9GpE9nAAAA:8
 a=lpf6x-w11vL6lYj2AGYA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: x6U6D92zNA0HQ3Ojla-s9V7z7v-AG0I9
X-Proofpoint-ORIG-GUID: x6U6D92zNA0HQ3Ojla-s9V7z7v-AG0I9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA2MiBTYWx0ZWRfXyythGDvVGGSd
 WnUK+Pd3JFnl60r70ynr24Dg7wTQncA0u2kMlCKtp2vQklVp2Ge14Jvin7/T1g7y+wh8xnD78RD
 ckjrwGUYucsSbR4u3Pe7Fj+3hgtm8TfKAYNtyuC1lye+bgtUgV2vkTnwCJ22Qvr0Z70gjgq4zp0
 pAT5Y25Lz69Oj23y9gZQy4OZ5TBSnVP28pcxeSYhv3fs0FQtuFzUB1XnROzmiacIvrt6eBtXpaI
 spt0j35e0+fKV7WmBmA9Jz3S4n4QJ47eoz1KO8Y5MEz1zptQZxFU9c+NokVARjVo6bXvPfoALJ2
 C3yTtqXMJx+yqZ5cD6l8AIceq0OJdgv5Jg/PngVxE2LXVHrlDbJLWSaK9ZvJhPtGijJt0Cjv0ga
 xzp+E6XpZF4V1AMCA5q+FTG6xUgB6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090062


On 12/9/25 07:53, Dan Carpenter wrote:
> The "index" variable is used as an index into the usbphyc->phys[] array
> which has usbphyc->nphys elements.  So if it is equal to usbphyc->nphys
> then it is one element out of bounds.  The "index" comes from the
> device tree so it's data that we trust and it's unlikely to be wrong,
> however it's obviously still worth fixing the bug.  Change the > to >=.
> 
> Fixes: 94c358da3a05 ("phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Hi Dan, thanks for your patch.

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
> index 27fe92f73f33..b44afbff8616 100644
> --- a/drivers/phy/st/phy-stm32-usbphyc.c
> +++ b/drivers/phy/st/phy-stm32-usbphyc.c
> @@ -712,7 +712,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
>   		}
>   
>   		ret = of_property_read_u32(child, "reg", &index);
> -		if (ret || index > usbphyc->nphys) {
> +		if (ret || index >= usbphyc->nphys) {
>   			dev_err(&phy->dev, "invalid reg property: %d\n", ret);
>   			if (!ret)
>   				ret = -EINVAL;

