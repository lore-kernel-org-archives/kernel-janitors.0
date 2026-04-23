Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0562E8B8A;
	Thu, 23 Apr 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939859; cv=fail; b=Ea/wjFdJF39JBlL0VQORz8fd9SLdFZnAND/bvbtzv24aY9TjcCx93NB5Lb/6X9MK5JE2jguhDTSh1ojisPDzpyXv5oC9qkIsL+/JCVwR7k9arw7diWWvAmE1AfRVX5C5ieCggYYnvE+pRvVXPLU7LSdTlBxRfYopDhKcsJ+00XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939859; c=relaxed/simple;
	bh=UmjBAZF9GnvDojNuKukz4ePbjaWFj5v8v0XVCAEPQRI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d0kheyzHt9rzV1vrSKv6n9l4DXkZQNBw4HzbD/vNZqhpC8AEaooiq8ovtFIaf7yl/upbMv5fhKSAxttek5QLPsqGAX5UY4cY5Cxy/TwYqEXef07xg0XgS6qbka7h5ZM4GS0s57HdvLyvGV+XqP5Yl3q0cP49yRkhxbgq/YzmRBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=juXjGxcZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HBTmml0W; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="juXjGxcZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HBTmml0W"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3uxMr2984847;
	Thu, 23 Apr 2026 05:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=OY1USyHDR6cFO0/fWWhssqAZW/aVQFKQgupw8OIDv28=; b=
	juXjGxcZJqsXvuZswg3w2fRU1hsr3f/yIS1pNQKfv5je6Gq8EvS4eYz1bGU03GJC
	42PHAxVEgPtJwQWoOOqMVyDW4UIOrS8yQ7vY6PF1crCc5rPDba23F3eu+RRjh4qM
	66EZyaPvhoxoekX1fH5jhP4qjGgjgn1x6jXqOS4nUsHzyzlB+r44/PrIfXswCVDh
	4vTdTLYefKdpHnpHiWNV9MAdcRUlwY/rgLRrJER1CNCeftAjyg2L27BPg9Re9yqA
	E1aPLhv/mXPCdRjedOMbjN/OuHbI8XmjKUobwVdsbMU5GWtCVcK2r5+/XOr5twNb
	YcRiimlwMM+UqbPQgbEgMg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021117.outbound.protection.outlook.com [52.101.62.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dpenu299m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:24:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waCas90ZhOxAG8sK4peF5jUgzHa9TqPV4MiT7gy8j/eP75uTm/PVHqoWnwQbzWpbnM5atJE2qHX4MlOIL2ln4D9+W9JyrBwOy+GB564JxMEM/qZzezBtYePtB+TlGMUDfCwEeGBh8RCpnzNdLlmeYywrp4PyIrHEEbY4XFvZ9Bsp9GcU2gK4xZW8mW54ucUJHkI5xexiGgK/nsHZ4GW81tNtd9XBmh36DMlbcP0fzf4vzcaEkwQ/8wKhCLRY7rR6oFYU+YLdR2obO8Bz2jOAXEAfDkOXLnUjQH2/ymgx7NahtSfZn6sW8O7aAF2JjreJxwRkbhy9rJyaRGPCDZGSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OY1USyHDR6cFO0/fWWhssqAZW/aVQFKQgupw8OIDv28=;
 b=eGEa+Bn4eKdwApHqSkF3AzDhqYvC0BtsCE8gKDpMcAql7TXPyYRppXM/RO0nyitkl4CzuTUJQZo1FKvzsnDxEeX3afVScLof/2qQ/6LukMf0KPu+CvKWZ4HrZTa1GQXHGd62+LuSdQw4SX1lEog79xvbX07oCu7CPiN3q0qZzyhKkokLjM0yS2KDOLLN4B+qU/IxQPyQiMAlsHVgWcQxdgeXNVspuRULgJvu7p7WTK3i4cVjuoncryU0k8RYB3HkYwgtwz9boDpTN005LgfmG2eKg6+yjFkcug8NRJL05ABtuL0UWZECsZWmOzVowb31B8bNCpXW/KMnBWRukluD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OY1USyHDR6cFO0/fWWhssqAZW/aVQFKQgupw8OIDv28=;
 b=HBTmml0Wee2v6kuca0ZfDhGcdo4qiM6lnRLRBbh3nOgF4Av6iMIqbBVBwr9G1/ZhWGcWuRnVewmem3wwEYEXveUAhbB7eDeoaoW1aHwPpUnZtQp7hV7Ljvs2b1OTXWWvW6n/Fl3zYcwHQOpYtYrkwNiuc4pEoa2+CQihwiJdUJ8=
Received: from BN0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:408:e7::28)
 by PH7PR19MB6110.namprd19.prod.outlook.com (2603:10b6:510:1dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 10:24:02 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::21) by BN0PR03CA0053.outlook.office365.com
 (2603:10b6:408:e7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Thu,
 23 Apr 2026 10:24:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 23 Apr 2026 10:24:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 028F7406540;
	Thu, 23 Apr 2026 10:24:01 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA695820247;
	Thu, 23 Apr 2026 10:24:00 +0000 (UTC)
Message-ID: <2fea43e1-8687-4391-b378-f2b845e6a89f@opensource.cirrus.com>
Date: Thu, 23 Apr 2026 11:24:00 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Fix some NULL vs IS_ERR() bugs
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Dan Carpenter <error27@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        kernel-janitors@vger.kernel.org
References: <aenFqUC8X2CucQwb@stanley.mountain>
 <63c18e33-b2bc-492a-8879-3e298ca81465@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <63c18e33-b2bc-492a-8879-3e298ca81465@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|PH7PR19MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 8346d733-b78b-42c3-9c60-08dea12270bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|18002099003|56012099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	afJYYaA9g64q3YwYNqWtalZ949iRVEiD3ScxrWsQ3sO/TvHknSu77wpf7Q/0LXwHTogm09to1Y4eyZnMOFEuZyV4VTWOHArNLXPGI00vWxD1bcSNSsGsSz+e5xbRlHyK4mMtUf5UIL0nrRQ/MZR04rOX5HwDFAv6JYwlQ4yS2OYLN/i8km9uc4t+9JaM2/mxLOWgG1Gizzn8vPilnK/6eG8B2V9LaTl17FYk10o4aUu35D5FAVZZm9tcSh5qO59+YiNQ1CoWY/hp5ZG6AJvHq62f0yPEEIGreaCj8U3Hw4BCO72rjQduouW2qN/F9ZuL0BXp5RAS6b8zC3nYM7gJ8QofP7GxFKdc2oFc8IpdyfVt0L7vq2Hy5iakP7YoNCR4OLdsfxXcpCYU3yvMVtyF/cGoO5LykXNfFMIHaSfGBmmU2QUX+7fHfSNmmbUAVs2+WvgfmQcbvgVWA3IM43YWAqRuxADIwiAbw1mtGeQ2U0j4fP9STVyATaasS1cEKDMAmtJn2Qqittk00zyoPxQEtUXGjpii+TASKxI2WR8ckSm9OgweDNEe+kqKMIQev5XCOckX1VJJBUbsAUjsJuVs8nqTNshzZSE7Njb3K2p5oBuG+tBbN9icEyDqHhIdMNj4XxMrMmjKEIDYB6zYzCnOH9jnWv7BCvTxSICRjm0170prUTwGJzVBUbHKYjI63Up9XICgCUm0cRDp1pBy2117BlIJ7fQfe7BryHs3GBVPTJb7X+5xaPK3Iveqxe4L61AfzyRSFDMScdUGuQLDeDyLMQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(18002099003)(56012099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sfI/l7mD7IRdjnhVqGGKjPWf/iN0pinP7KBbuwDMlQ6fWHfgZqYTBEfKYMqunxPWT7ueZt/IrdPwIlUbj9dwssQwKZb9BWEZD/IukZasNV+UyDMTFsXT5D7bzbTZQHWoN1rBvTV+pqOIHJW8QNOC0jIkVNuSrVsuK5747C5s4RpW/vlJb74dPsqu8diBzm4lb7fod2Rm+uM6Ly2+q1kMEvN0j5Bhd6aCgfWkBokEk96ivscZjKj6WU+KNS+iFOT4/rxfWN1fFW+A89nAD38eBPOq9wZhYW/NDmZGcUjM35lJT/WMoqQQhufLNq+/MjyupyVvmPIChZ4nH+3a7Gw7szL4SxWet8cqbiHjPROuBhaMwm+lwtSnHmTQvwc5S5uHq2j044N9CPRYCwsGuJxxu9q0ApZ3vZyph2moQ0x+psYq+UVegL0O5ARplTxkNYId
X-Exchange-RoutingPolicyChecked:
	dRzqSC1ZFj20Tvix9BKe5AKqLLXKS6w4raU8oJP9sPcHMG91Af2wLlhJjIagaAxmIHgWXDOKOP6GYkJILI/uMerruPn9f20rOK2vtUUtkV3kM+gUKuJmPAKdQYQZ74GMPfYgkX2q7tF2wSOR8DXyFr46bE/UZdihDg5FXQ2q9Q5qc55rlsWVt1UDOayxxz7sNS2WJjmWWOeyRWY3NRm+833RUO3aNKm9CHntHWjHBYFmSXwLSzgmwbD6av5ltPbYikw/0UBF+MWF8rFIti2vuFm6WwSom7y3jfRQlUsRbPfBXnjxOWbUvIafdkobJMb6kGIl8m7W352Qxp2DSMzpKA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:24:02.3504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8346d733-b78b-42c3-9c60-08dea12270bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6110
X-Authority-Analysis: v=2.4 cv=DbknbPtW c=1 sm=1 tr=0 ts=69e9f347 cx=c_pps
 a=0ugTtL2IYW/sDoruYPcCDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=8CtNID85CrS8holIQeoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pcrViwuNoOvSl4vQ5NseUQonAF_iWYcv
X-Proofpoint-ORIG-GUID: pcrViwuNoOvSl4vQ5NseUQonAF_iWYcv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwMiBTYWx0ZWRfX2y+KL2BEgAi+
 ImPuIbEFR5UQZUpeitCfJhhMuej662jMjbMajKFbzWJG97hYarzLaMTFx6zd4Kt9Ka7E2fRmQXE
 vdmSaC6fhy1G1EgYDu/J0Ltg5uaoMXsbLz76pGeshGI2pLqleK420DYDVKYzRH/2HJ8exgkgwEW
 QnPJN7+R4p2op67DqmVt4tBXJOEuFcY9/6j9ALcl19+DpdnqBX29YWawnqEY3JtOJgIFLUrcORW
 qFWAMlYqiVUfxQgixzKBnf1mxy7QcJYrN4930Coc+Hzo+GuGcSTLkk3PToTk9Xi6yVihxO6QNxp
 HCrYHAyHSZzmHh5blUF5OvyRQueQUZ+S6JMnjtGZTX06UzPRCTiQBiacWO8BM9GWy9q+Dt5/MUO
 zB/EOOuK98qM+g7QkeLcJNZn4w7c53uGanFhxmXqUAy4QA7ixu0Q4jcX8IQn0EogOawUEvyiNSC
 dh1qsWFtqaBgKPUkuJw==
X-Proofpoint-Spam-Reason: safe

On 23/04/2026 11:09 am, Richard Fitzgerald wrote:
> On 23/04/2026 8:09 am, Dan Carpenter wrote:
>> The cs_amp_devm_get_vendor_specific_variant_id() function doesn't return
>> NULL, it returns error pointers.  Update the checking to match.
>>
>> Fixes: d70fa6b569a9 ("ASoC: cs-amp-lib-test: Tests for reading SSIDExV2")
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>> ---
>>   sound/soc/codecs/cs-amp-lib-test.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs- 
>> amp-lib-test.c
>> index 636d0f3198b8..bb0cfd9d5db2 100644
>> --- a/sound/soc/codecs/cs-amp-lib-test.c
>> +++ b/sound/soc/codecs/cs-amp-lib-test.c
>> @@ -2360,7 +2360,7 @@ static void 
>> cs_amp_lib_test_ssidexv2_fetch_invalid(struct kunit *test)
>>                      cs_amp_lib_test_get_efi_vendor_sysid);
>>       got = cs_amp_devm_get_vendor_specific_variant_id(dev, 
>> PCI_VENDOR_ID_DELL, 0xabcd);
>> -    KUNIT_EXPECT_NOT_NULL(test, got);
>> +    KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
>>       KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
>>   }
> 
> No, this is incorrect because we are expecting to get -ENOENT but now it
> will fail the KUNIT_EXPECT_NOT_ERR_OR_NULL() and not proceed to the next
> line where we assert that we got the expected error.
> 

Slight correction. It will proceed to the next line because it's an
EXPECT not an ASSERT. But it had a false fail from the
KUNIT_EXPECT_NOT_ERR_OR_NULL().

> The asserts are:
> 1. It should never return NULL (because it returns ERR_PTRs)
> 2. It should return ERR_PTR(-ENOENT)
> 
> The same for the cases below.
