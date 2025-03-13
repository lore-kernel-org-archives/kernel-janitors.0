Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B71ADC86
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Mar 2025 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887819; cv=none; b=loBvvptnTnXicSSgbEZ8VBKiuBT8FIcz0nDVckEm+6OpfGwLr8X4G/lb4XnjstXJVBVicGEzwnnJU7Ipv1zMJHVy447I+DJ/fREcxhllmSZfJ47C6e97rzxNiXnXk9eNDrLDP6Co7Gw7vWapq1rzzWtMcbZyhA6tTQSAOMa1c14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887819; c=relaxed/simple;
	bh=l4FUKGZsRIdPf4GJY3/NkLbvnoXG8vfF3EfbTjmupHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snuPh5lMlBDrMl8WNTy09htRUrBIotmZMZYFhcIOJ1/JP7/XF0mdhbVvMWoWpPMKxhfnXZ5cU66Na6G5wZ1i7Lv8CGk8d7VGBA2edn4xki4xSfZewdr9gjV+FOarCSuEOrJBpl1hVRSL30M7X4lA7dREUr9sbZoT17DDeUEaytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0nMJUCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0nMJUCC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DBmtkd007310
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Mar 2025 17:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSWn7tl18hlF0bV3T6ruuTbfiE1zk9u8Mb11OU8HZR4=; b=C0nMJUCCYpiy9DSk
	OZRw1sMn12XFi35M/j95NTaBwB/KI7WGmWuMdR2vS0qtwT0HCDyO3LfY34sRUrdi
	mwsJGwtYDpZ88Kdt6cbMTylT+lvD8NKtxFwRStvzQK+4oMQu4AXth4tC2YN25SA1
	I2cmioT92cSF6OQw4by2mwEzUs44XMDZqwEdQVt08QNTZxfssC1+oIUncNh08RgR
	3Qz6yMH4G43yTt2VXgCiYRNZAJ3Suxs1UEwn+BDckE61D1VuiYDsArkN4TrPvzZX
	yzZ0tIFryeWpPj6BjhA2F6A+KzhLThp0r8JkQOuVsPgwa3woIsJFUZZEJ5MI7MHl
	VfX8vw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8ae2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Mar 2025 17:43:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240fea0482so30603255ad.3
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Mar 2025 10:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741887816; x=1742492616;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSWn7tl18hlF0bV3T6ruuTbfiE1zk9u8Mb11OU8HZR4=;
        b=StfjpfKyw5w/rOpfMkF2Soo1O+cwfrFY1kFeXy6D+jUT6yFBiroSu5HlWSUrvuffLg
         CQhyenSQR9R9jkEihOYWHncGoSC6nFBJ8FOEQGhY3P4ykGXbTlN6r/trcUo2t6hSXLRr
         y0xp7gEs7bYJT5DtSOncSvXQK5iAL8s599yKDh2e5Qo9pCYHlQ+MXBjVSiiHgN/uRHm1
         0XoEtOy5tXKTggJTorWrOu794KNX/qdBkPaiRW+evcCZTsn6LD6O1r1bw43pUeaJPq/O
         hyQZc47d31c7Vr1npJOTPrMcGLP4M+9UewNI9dKUiV7TdtDNWyswLwe7ZPTD8Ohb5yHB
         Uo0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNf199rFsnO8xMBgswWmZPyC2bBPCeuevp0UAu05QQBNmsxta6QO7ZLgVNsUeCxoIy1/1T68HsT68tK695ySo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNmfp4EE5d208XYURCvpJ5KRHZUBCsNdFhTlsqZQXxCTI0Ehj
	FUDti1SvAAsDAZjMkH+DfNXPxKzwlDgSLiGqii9PPjEG8cvTOpwf2GtSGyVafveGbDmF2q2wpVM
	otjAauzi23OUMTP69hoBj4pBdIQjiQ+TrJZAcDxtjU95vuE9NEVOoxbU/+pJ1WkbHF+4=
X-Gm-Gg: ASbGncuLUHczynJHKglRs68DvCLeGI9pjUKl75I9h5wnx+zYKCvdTbipDOabpGN03Nu
	YIWCbUo7+mxe16XBRKjPw156DNETsQQL3GT6ZkkOC+mQh7PHdZN1YTTgqm0IpTqFmgxAGTbaiJN
	G/3NX6CTQwSACuyAl9W+y1eJVdS7FmXJDiVS406fpZBmY2P/0khHSsQu4WVPXnc4fs1i/bmRBNr
	r62OVqsHGLhdmNYa5MOHdVP2R3CX7sc7JCkRJ6vaQJBjfrci2avyRI8XGSydKoCjguNz9/NsG56
	sucjI+odJ9a4KV2uMOf40nw/Xc+RyK2+G40BpwTO5IDwk6hFdusfNYFoEQxiYzR1EJ+jjjpFpUw
	I/u7X7nhg
X-Received: by 2002:a17:902:ce0d:b0:220:c86d:d7eb with SMTP id d9443c01a7336-225dd88fe5cmr6271725ad.36.1741887815978;
        Thu, 13 Mar 2025 10:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx3ng/NXylANuxu5gjtZAWZIsp0ZkJrHPk5CbkePCymLfb7smODzamdaJgGiEDES6vlLICIw==
X-Received: by 2002:a17:902:ce0d:b0:220:c86d:d7eb with SMTP id d9443c01a7336-225dd88fe5cmr6271465ad.36.1741887815576;
        Thu, 13 Mar 2025 10:43:35 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68883b8sm16213225ad.15.2025.03.13.10.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 10:43:35 -0700 (PDT)
Message-ID: <823b1c13-82c3-4164-9809-b42f567e264f@oss.qualcomm.com>
Date: Thu, 13 Mar 2025 10:43:33 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] wifi: iwlwifi: Fix uninitialized variable with
 __free()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
        Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
        Avraham Stern <avraham.stern@intel.com>,
        Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
        Daniel Gabay <daniel.gabay@intel.com>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <f7c17a7f-f173-43bf-bc39-316b8adde349@stanley.mountain>
 <a21610ae-e155-44bc-bcc5-b9b8b1c8cbd1@oss.qualcomm.com>
 <341d748f-55ae-451b-983a-ca9684d265b7@stanley.mountain>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <341d748f-55ae-451b-983a-ca9684d265b7@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d31948 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=xNrqncJw_f-EE2unP_4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZQnrGNMHnm1aeaf93kyqadHf7ZYqEsyl
X-Proofpoint-ORIG-GUID: ZQnrGNMHnm1aeaf93kyqadHf7ZYqEsyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=478 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130135

On 3/12/2025 8:24 AM, Dan Carpenter wrote:
> On Wed, Mar 12, 2025 at 08:15:18AM -0700, Jeff Johnson wrote:
>> On 3/12/2025 1:31 AM, Dan Carpenter wrote:
>>> Pointers declared with the __free(kfree) attribute need to be initialized
>>> because they will be passed to kfree() on every return path.  There are
>>> two return statement before the "cmd" pointer is initialized so this
>>> leads to an uninitialized variable bug.
>>>
>>> Fixes: d1e879ec600f ("wifi: iwlwifi: add iwlmld sub-driver")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>  drivers/net/wireless/intel/iwlwifi/mld/debugfs.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
>>> index c759c5c68dc0..1d4b2ad5d388 100644
>>> --- a/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
>>> +++ b/drivers/net/wireless/intel/iwlwifi/mld/debugfs.c
>>> @@ -556,8 +556,8 @@ iwl_dbgfs_vif_twt_setup_write(struct iwl_mld *mld, char *buf, size_t count,
>>>  	};
>>>  	struct ieee80211_vif *vif = data;
>>>  	struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(vif);
>>> +	struct iwl_dhc_cmd *cmd __free(kfree) = NULL;
>>
>> hmm, I thought the recommended convention was to define __free() pointers at
>> the point of allocation. cleanup.h explicitly says:
>>
>>  * Given that the "__free(...) = NULL" pattern for variables defined at
>>  * the top of the function poses this potential interdependency problem
>>  * the recommendation is to always define and assign variables in one
>>  * statement and not group variable definitions at the top of the
>>  * function when __free() is used.
>>
> 
> People do it either way.  I'm agnostic so long as it doesn't have bugs.

I've been doing it with the allocation since that's what Linus said he wanted:

https://lore.kernel.org/all/CAHk-=whO1+-4ALjFWSE0kzytz1kEbWPvy3xWvcUP1dJ4t-QqkA@mail.gmail.com/

But this patch is already in wireless-next, so it's moot now.
