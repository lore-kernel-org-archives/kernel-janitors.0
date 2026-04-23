Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CD43793BB;
	Thu, 23 Apr 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939012; cv=fail; b=ZknSa9+ERnXg4oyFfLoFcON12PsmFOArPeDyYq1Mb1rbU8QbE+C/m2gaTAfsIbBd2Kr2vz4HMfbGdxGwJd6YJPNXTBM6dREogeyJtW1EMg71Rycf0w9PF8P9MN4LDxC92Px5lEdjf1cSzfryDdJTFLv9op9PAXMRfE2eVY8ekXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939012; c=relaxed/simple;
	bh=R5zBjjfqpByTSo0tYAB7mvzSkFUeCSgC7YMnZ8BKtQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUuStNnMlawY0+8o6cf435nJjbaZJ+Msa948smUrM9UD+rkdKPShEOi28bUaXqWqivhSyuteT7TSFrg5VBIN5+ys7w+9hSJLDI2UqFbPK9LeGHuSD7bEoTPFwgJwKqp81C9nOppGT7n5hn9ukdPfA03b21ZUkoW42CAp2LGChSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aW0pV0/t; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=D8GYM4Oj; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aW0pV0/t";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="D8GYM4Oj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3uxME2984847;
	Thu, 23 Apr 2026 05:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cDQxqboDZV+DtcWZu9RLAwGOUlkwYuJ4SQkUYsRE5pI=; b=
	aW0pV0/t17KcyiX1eD/J5p7MenInhqx2BRVreRzgjUCKFB21tD+VcPVskjWbdIBr
	8NWMM0AK0AwhIC0I09h0eLw7LvuekV8nzYZRZgvT0Lktgnw6Gv2StySmJc5A7zTq
	rfHY7zoAUXnZYFKDGuIpEypjlP3GaC4BuNkMC2rNyMtNVzB1XhMuqUGmIOYfCARZ
	B9HKAS2FH2hncjYB0+9WKq8yhPC6f1KBogMB0/PiLGWUCY+d5dL6ZVJlgkm4WfnQ
	D6RsLw5KPNZw3JUoeMpMxhZ0qlaThV/d+SIXMau+/GT5OS9FpUnBQ3uazgPQBt0r
	Vtbf2ZnDTBJjjiWnoGdZvQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021109.outbound.protection.outlook.com [52.101.62.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dpenu28rv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 05:09:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syNj9Yf3n7498GK8xrNVF9b3Eq+GRwjiskZTK7sdLXyIeBCkmghJYvUGzTF2EABzoKQw0mucSG0mNnRAcVyk/r8CrNlLbrglhMePqbv8p/9WIhG6kfAHe5KszMGsZkb7s4oZRlo7T6Qc3SSYcuP1+3WN6bghZKYCaZ48idtZ+CyEjPUHwv/rU2uQBCwhN/B+aGs+em77Zep34EKF3hrXb+/EhnCIL6nh1JgwaHdYFjVZu/YFF2manObAEgD562QK191iQgIFzeGrjE4Q522fFlX52yAAZetbgveL0ZwlbSIijU7r3dkSdG2+OaY6EkWWY0ccjR+eGuqc504d7dt9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDQxqboDZV+DtcWZu9RLAwGOUlkwYuJ4SQkUYsRE5pI=;
 b=VYXcrxZMmvz66iurnDFuJaqFk0f3kEBlSN25kcroDHVZja/CNIFPzMnaYA/09Cc+JAAo4C2m4zLrZ3AKwyMVm1Ss1O+bKrVHxLzL5qAHaJd2bBWBKcjBshIFeEk7nQBRRN5gOEQUdUQbGtWx+faPo5I257i6+79Sld8AolkQQ18XMAbfaQtmv4MX5FsVfcQzIFP59cREdNvaQ10itkZWMyJwogu5HFvRXKTQtTOqMyEtgN+rmJXm1LqJTdePisEAIfk9dk7JNk5FPm08FdVFCsg5gVp2HAPLKRVO22mVRHu0+Lay1s63XkwmBQ9c+gHmAX3Y+1g0JzkxdGIBxbbjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDQxqboDZV+DtcWZu9RLAwGOUlkwYuJ4SQkUYsRE5pI=;
 b=D8GYM4OjNQ0wdjlaUeCkGhGvKNVFlucmkT8afDLfxDSfzdwvERJLFpu2XvMjkj+YQmySr3jiJy6wXs6qX1noQCdw3Xyrk5VH9u7leN7kA7pNbJe3MRuGaojL2rD/Df/B07bEBS6UE5DcTR06ABx2bNpoqdj7nvXS35X3dCmfiX8=
Received: from IA4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::10)
 by DS0PR19MB7498.namprd19.prod.outlook.com (2603:10b6:8:149::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:09:37 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::be) by IA4P221CA0005.outlook.office365.com
 (2603:10b6:208:559::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 10:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 23 Apr 2026 10:09:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BA829406540;
	Thu, 23 Apr 2026 10:09:35 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A0933820247;
	Thu, 23 Apr 2026 10:09:35 +0000 (UTC)
Message-ID: <63c18e33-b2bc-492a-8879-3e298ca81465@opensource.cirrus.com>
Date: Thu, 23 Apr 2026 11:09:35 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Fix some NULL vs IS_ERR() bugs
To: Dan Carpenter <error27@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        kernel-janitors@vger.kernel.org
References: <aenFqUC8X2CucQwb@stanley.mountain>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <aenFqUC8X2CucQwb@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DS0PR19MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: d68f2927-0337-4c66-8836-08dea1206cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|56012099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	SfPCGWDq9UxhxgQIFMv1yyTfkGdpXeFbDYss4iVF/eD2S9eajeTaW6GUcSLJq0IIRlEGGK3hO3fWkyCOz84km17jJ39iGdfyViNHAd461T1UFMktXyJmAAk9MptNam9ZzUJcyWgGvYeBfr1QduesRm3zQFfse+VZTvLG8hst1fSwAcGAWMkarhUqdQQQ8w3MoqBqN2j8FjeHaVvf3VdH62iadHDT+AMz1XKFbIS6e07qsGUIju9MpnLFvqWEeqyC6wPLB2AliDLlZaTSVTlzuUG35GhVMESUqPl/XQ/zzLf0uizfwbrmM8oTif3KkJzHQvQOJJuauZnUN7rW0VmNTn4CD3YwYGAVDatnU6gS1VeJDWgqXpBPtVpZusdcTToxFvIW1MoKc+4kFwqEnBqAj7SXTd1iF5aX6wd1dGxeLJXwgbxRq8Iyfjo6OH9+WYtC643mjfIm2LroOWBpqO8ZXvXCkj1t1JFaAw4eSR5VrZZbMNmz7cdiJvcUq6k9M3IWuOJw6KsMIsvFF5PoF/r8ci2kIGLsmGC6Y3E2tuxd+WIpKXmtiIJYG9PI+YVqw7RcPSCgTnZeuiCk/kW4Ui7DDmzUoGsEIdzW4TUZzXPVNW7et697fFhja5XPS9qCadmehU5Yosxmr0dvqmrMeEJKTvKJT+IHWZjpzgbCevEXWw4080fPJBu0qsX4O32QxEhqaHreYG6Y6xBOlqJ9tMibhCAb0cUtGe2a859lD3PNsuoiFiNkpkADmpLoEcIocx5JW3v7F65DTCBKdEfx8mrHZg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(56012099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P2UmVAhYWZk05mQIlbsJA+0FWFVhmDjKssjI1eXsZfMkE9JVPh8nUJIodFvGKF3YxC9tx8r3Hu96mrgB3zUWbx3wSG9Vu6fLNURJiv6tPnVXiJAjwEnCGZhwIekt6Cu7mntNzcg0XhBZk/pEPptRNVrtEuespmeggXWsvHNj/3fARZeQ+0GMsD2oK1vWzZlvy4/9t+5yoIn6ljDncxi3UU/+AtkHyEYl5WTTiDaJ9zntmlx6nDsRmpS+4uqR89MEm+NO1lLNpAjXk+mMPssVT0xFEsTJOrgTHZL1vTiozyw1aaJMPvQYfaQopVC0ov9U2S5+5o6QbrqyqQxkj0wqA4qa714lIlIHYiMI0mL3GltUqnseqYIWJSTOEjgjFREeij9SYGfyG1JwA63fG8PchB5dlcz33D4cxXUWXbmGDxWxzUMaRBf45Kp18l66iEsO
X-Exchange-RoutingPolicyChecked:
	LYYHmuGLGqVWAluSv8g/KPzsZnGKzCpV2zsg/4r6h1ioXjjIsnmWxJQ3nbVxaVwi70+pHUFW4l+SZHcV9LG4d/7e20YL5WsEgjk5TbcbiKZKnxMZH5oymcsRpM69myuZM5G9itQo+EZl37RMjKrqZi+DL14fpCh/6EgV0gPDzmDmMHBD+b72PRMrW4rXOuMgPvAT5SR/IJIPfpu1xycYoIgzjOqGuRGHMqOU10rJtJ354y4QS1cIghydTTM9Fua0r19wyGG7+bJcEislkG4PyYLPmm+6jxjCv/WQXGuVupUuVPV+c0KztlQFrWjDEkdA7nvZ1FKr8Z+IT8tVF7r8Tg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:09:37.0000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d68f2927-0337-4c66-8836-08dea1206cf2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7498
X-Authority-Analysis: v=2.4 cv=DbknbPtW c=1 sm=1 tr=0 ts=69e9efe5 cx=c_pps
 a=4XUxxCGR/dZid869Kuw6NA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=qPN4gXW9k4pzgnuM2kEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5OWyXQuA9lC4HFOUofmQ2r8s4Pj4xx0a
X-Proofpoint-ORIG-GUID: 5OWyXQuA9lC4HFOUofmQ2r8s4Pj4xx0a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5OSBTYWx0ZWRfX/cJ8wLgAVlH8
 iuJdmby9py/1NYTqJ5EFLcBhx0dC9pOTQ7/YvIJX+ivIVziXqC8oNgT4RsRfNXHmVx64lEqAC0Z
 KK5RHw+rT6vgmKBJzO/fDpUT4GPWyvIGPXP9llNfYkSWrhKbg2i2l6qLiI0CLDpWfA4xL/KIga3
 M4B1KArFy2pMZ3aUOFsU6XHDIVDAGH1lAdK2R283WQ1IQYmWc/6d4eKp9UhZMixgKNv62srxTQj
 7iEuwytF975xMIx7p0vKv/nzXW3r1IsXxdqIk9U3D8gRaC/jz2LwAcYYOIQdUOHW8flDm23hvTK
 d6wAz7Q++pNt5PXM4cvQAPu36VHL6a3+Qmi1TKFeklXteUC8bptk5D+ci9pxLW0MenHcChWcNOG
 iPz4pgzR97sh2DM36Jygv5gfocKD2FMB+5GneL3JkTy/Ao4ymXVLRdZ50gzG+UpT6mlwrOZXD7g
 xi6MakDlqFFQn4GDF+Q==
X-Proofpoint-Spam-Reason: safe

On 23/04/2026 8:09 am, Dan Carpenter wrote:
> The cs_amp_devm_get_vendor_specific_variant_id() function doesn't return
> NULL, it returns error pointers.  Update the checking to match.
> 
> Fixes: d70fa6b569a9 ("ASoC: cs-amp-lib-test: Tests for reading SSIDExV2")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   sound/soc/codecs/cs-amp-lib-test.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
> index 636d0f3198b8..bb0cfd9d5db2 100644
> --- a/sound/soc/codecs/cs-amp-lib-test.c
> +++ b/sound/soc/codecs/cs-amp-lib-test.c
> @@ -2360,7 +2360,7 @@ static void cs_amp_lib_test_ssidexv2_fetch_invalid(struct kunit *test)
>   				   cs_amp_lib_test_get_efi_vendor_sysid);
>   
>   	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
> -	KUNIT_EXPECT_NOT_NULL(test, got);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
>   	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
>   }

No, this is incorrect because we are expecting to get -ENOENT but now it
will fail the KUNIT_EXPECT_NOT_ERR_OR_NULL() and not proceed to the next
line where we assert that we got the expected error.

The asserts are:
1. It should never return NULL (because it returns ERR_PTRs)
2. It should return ERR_PTR(-ENOENT)

The same for the cases below.

>   
> @@ -2376,7 +2376,7 @@ static void cs_amp_lib_test_ssidexv2_not_dell(struct kunit *test)
>   
>   	/* Not returned if SSID vendor is not Dell */
>   	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_CIRRUS, 0xabcd);
> -	KUNIT_EXPECT_NOT_NULL(test, got);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
>   	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
>   }
>   
> @@ -2391,11 +2391,11 @@ static void cs_amp_lib_test_vendor_variant_id_not_found(struct kunit *test)
>   				   cs_amp_lib_test_get_efi_variable_none);
>   
>   	got = cs_amp_devm_get_vendor_specific_variant_id(dev, PCI_VENDOR_ID_DELL, 0xabcd);
> -	KUNIT_EXPECT_NOT_NULL(test, got);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
>   	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
>   
>   	got = cs_amp_devm_get_vendor_specific_variant_id(dev, -1, -1);
> -	KUNIT_EXPECT_NOT_NULL(test, got);
> +	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, got);
>   	KUNIT_EXPECT_EQ(test, PTR_ERR_OR_ZERO(got), -ENOENT);
>   }
>   

