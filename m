Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE48149C41
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753287409; cv=none; b=Ln1ii+2pBMLb/8yfFQhxAsKWX+mPHcfHijjTM2CuNOo0NZNicFFt/GAy6K1KwWCoN8YBeEnSmZtK96tZZG+CtWYSwTpSFIJTveXCUskKhMu/1NZLGrfdHNIyS5+3NjvimfiHdEbLTeFhi6BSEs5EXN+9dRN3v0RvmQRVT7ukrs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753287409; c=relaxed/simple;
	bh=TeAfo5XC+SYG/qzz2DoAru3zKW8ugDTeZdQCUfzlipY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnnVzigqR5g/jGzwBhWBlzBS9KhtP5JzVGNrDnVTssy9mYYETRACmR34D4+iCZ95QfG6V6HawlM3hLmduGDgpJPOHgHEi4XWAMveb35V8jFw2OhtvHn3/y4yOQ1QCWUiEiUezAbTcdvRr0iQt7Quuln+rL4+pFcyQckWc26err0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sth27BLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sth27BLK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9G1Yv023226
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 16:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ahHdpK2wt442MUxN/a81ci6TCouisGheQufqHd76VQ=; b=Sth27BLKQyLoRJBW
	octAOqjeROU581klddfMxELv0V+1wzEVdpo/zAljqSjNZ5Aa2NwDJYbOJfw6+CV7
	yZFHHSa4hsx2Hp+XgXqjkKyZncOSpNF0Mto9BGmPHr21x+KtDIimVPttQASlxzc/
	g3RBazqqeVZtAbcExNlhYKs03x2sbMFHlgu32IJA4cvvsAVnSLmVZt/VTyik6Hvy
	bQ41Kli5UHdcIWp3iIlp2/8g81tAOMw6f5BQsdCzlxZYEdZ9nYOixdZB9B1Qza4S
	EwYNLap08aEw/7t5EqBrZJfOEEMFCRgpoCxh8Ls2j5U0c8d1OQcDoexJCiqg7yB1
	cf/bfA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3ern2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 16:16:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23689228a7fso99961835ad.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 09:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753287403; x=1753892203;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ahHdpK2wt442MUxN/a81ci6TCouisGheQufqHd76VQ=;
        b=k+1olQTnMi+3lcG0FUL4mqjMVBeilB0mz5xLB9qBO4nhhRtl9nbR00WYL4+EA1pPH+
         qZeafmvkLFtkcR0Vs8PSwfNo6Pa53fMCubBVoSJWzfPVm5Ca1oK1jLNDhoCmNE1SAQj+
         4SASAUYW+8vJ3HVIsH+8bE/UwTQZp3Z+jSH8mrbUgzNVmA6AFyJy8jNmcq8DjnR3tTAC
         df3s+3YDX23bz5JphxBeTyVGdoccysZZtd8aYwSK0coG9IzEKUiaC6ZMmzlPt/O9t+in
         e3NLTsZJ2YlW7hA1+fGVdpEO972DiCexhZ7qsiJvFokcPQpdLCZcKVCfpoYUJ4IumhCx
         jLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBZ2cVwAU3EHQ0Ok18afBHOpTdAoTQkz1jC3pMfSvXOwdpDWfnGbgGsq5Tx0VK/qYeZ4xdm+ykbpfyB9eY0wU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8io3eYZXzaUBWJCSrKURU2hlUItr5RJe99+FZ9MFMV6KB4f7w
	yXEJ4XPmvijeC2Lyf194tfYbFztRqQpffl8+4+QnlUwhOdpp/dAMpiKdal1OtRj8pqp31bCVeeU
	9NM1VEG8NNQTmvWDDzBmnI5l1IpB8S8mZpHagNiU9+URQOdzo8Hp5hZ9R0k4adKRK5SFciqCUrB
	0YiYU=
X-Gm-Gg: ASbGncuOueeUVKrnkwusAModKc3mv1W4VUsIOEQTLth6g2RW9e9S0yl+vOFXBI1NWIv
	Hl4uuJSKG/BXIuqR/oOS2+BcRIDecX9x3MeYx7KG2yRUl76Mb+SK+YirwAtshO4uZXAoFtcdX3T
	4obre3+bzlHwx7lfXPRci7wFFSKI2UB4svkVU9L2iSoYsx+JEgaE0KAnEOoj2B5y72liiCixD8m
	BeFhJrzpA0ZULNIZSDKQYtKlCMvD+eSsCnxl0SWd3d2zT8r1rr5j/vJLS9iDg5cmM8hoW+6i3GJ
	MF+bhi/vawvUpC+LmOp+m1+lsNrnCm/4YhtzLPnIp5Bcu3NCYIudZ/HmGl89vS4I
X-Received: by 2002:a17:903:2281:b0:236:748f:541f with SMTP id d9443c01a7336-23f98195113mr42556515ad.33.1753287403357;
        Wed, 23 Jul 2025 09:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH32GBYmFHtSz/Uwh2EzZr1vWg4+DmelFbNwMgWwGmiVYzlCyNqOtYbX5pVtof8b7I5J1rvKg==
X-Received: by 2002:a17:903:2281:b0:236:748f:541f with SMTP id d9443c01a7336-23f98195113mr42556075ad.33.1753287402781;
        Wed, 23 Jul 2025 09:16:42 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ecbdsm100314065ad.82.2025.07.23.09.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 09:16:42 -0700 (PDT)
Message-ID: <77e344a4-ab45-4999-8864-2ba443dc0391@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 21:46:38 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
 <aec9cd03-6fc2-4dc8-b937-8b7cf7bf4128@linaro.org>
 <c052931d-9bbf-42d0-9ccf-4fdc62d408bb@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c052931d-9bbf-42d0-9ccf-4fdc62d408bb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wLfHZ5jIkrTWJ56S63m5oX7k9wsMz96Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE0MCBTYWx0ZWRfX8lnzh7943TXg
 fAl2yIqZXLVngY3doXbaziDchgSHu9WwdORqgWvdFsnC0Kpk17NB/CwMfqYsSK+5hMD1CJ7GNai
 XBeduQ8Kv0nrY0bDj1fZI4BCf3pdcGKIT3xpOKN7Qinl/OzQPXwcVBAaXQlg5Cweil0nU8b+Ap6
 78dTpgfyHpMz66oyn45pQIu9TsAflFT7Xf6NdwUq1hyqvGcteiawDwaXhl3p+9Nmp3J89xM4O4a
 jWxzxMko3BoJcbj4tq3EII4IR0ZHi/JIvrlG0Fd4fsh2osZARIbtBEG+E+nI0oJrtJ6sTJ92zQB
 pPpDAYXclrrAXPmAcOBJtHClACis774oajmifeDyK5flei1YK6mc9kiVpVwJsaiH/nF2nC8ge8M
 HwdoxZgMBlxRBmSB/kQd9TbWFJAziPQhyFNWqPoupUGyDN5Kk+ra82ptZkdRTWqD4vQ+LlDk
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68810aec cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=7eR1o1z8CW6_ZOpSCJ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wLfHZ5jIkrTWJ56S63m5oX7k9wsMz96Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230140

On 7/23/2025 9:16 PM, Neil Armstrong wrote:
> On 23/07/2025 16:46, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 25/06/2025 17:22, Dan Carpenter wrote:
>>> This function is supposed to return true for valid headers and false for
>>> invalid.  In a couple places it returns -EINVAL instead which means the
>>> invalid headers are counted as true.  Change it to return false.
>>>
>>> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read
>>> past the ELF header")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>   drivers/soc/qcom/mdt_loader.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/
>>> mdt_loader.c
>>> index 1b4ebae458f3..0ca268bdf1f8 100644
>>> --- a/drivers/soc/qcom/mdt_loader.c
>>> +++ b/drivers/soc/qcom/mdt_loader.c
>>> @@ -33,14 +33,14 @@ static bool mdt_header_valid(const struct
>>> firmware *fw)
>>>           return false;
>>>       if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
>>> -        return -EINVAL;
>>> +        return false;
>>>       phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr-
>>> >e_phnum), ehdr->e_phoff);
>>>       if (phend > fw->size)
>>>           return false;
>>>       if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
>>> -        return -EINVAL;
>>> +        return false;
>>>       shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr-
>>> >e_shnum), ehdr->e_shoff);
>>>       if (shend > fw->size)
>>
>> This patch on linux-next breaks loading DSP firmwares on at least
>> SM8550, SM8650, X1E8:
>>
>> [    7.572665] remoteproc remoteproc1: Booting fw image qcom/sm8550/
>> adsp.mbn, size 28342616
>> [    7.615176] remoteproc remoteproc1: Failed to load program
>> segments: -22
> 
> It also breaks GMU loading on the same platforms:

we don't use mdt_loader for GMU fw. This must be due to the zap fw
loading has some issues with this change.

-Akhil

> [    7.418330] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu
> [msm]] *ERROR* gpu hw init failed: -22
> 
> Neil
> 
>>
>> CI runs:
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/
>> jobs/248846#L1323
>> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/
>> jobs/248850#L2037
>>
>> Bisect log:
>> # bad: [a933d3dc1968fcfb0ab72879ec304b1971ed1b9a] Add linux-next
>> specific files for 20250723
>> # good: [89be9a83ccf1f88522317ce02f854f30d6115c41] Linux 6.16-rc7
>> git bisect start 'a933d3dc1968fcfb0ab72879ec304b1971ed1b9a' 'v6.16-rc7'
>> # bad: [a56f8f8967ad980d45049973561b89dcd9e37e5d] Merge branch 'main'
>> of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
>> git bisect bad a56f8f8967ad980d45049973561b89dcd9e37e5d
>> # bad: [f6a8dede4030970707e9bae5b3ae76f60df4b75a] Merge branch 'fs-
>> next' of linux-next
>> git bisect bad f6a8dede4030970707e9bae5b3ae76f60df4b75a
>> # bad: [b863560c5a26fbcf164f5759c98bb5e72e26848d] Merge branch 'for-
>> next' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>> git bisect bad b863560c5a26fbcf164f5759c98bb5e72e26848d
>> # good: [6fe8797df6f2e3a7e3c736d5bd4862915a06a690] Merge branch 'for-
>> next/core' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
>> git bisect good 6fe8797df6f2e3a7e3c736d5bd4862915a06a690
>> # good: [c522d00e1b4b00c5224c2acb9c2738bcc9c04ff5] Merge tag 'ti-k3-
>> dt-for-v6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/
>> linux into soc/dt
>> git bisect good c522d00e1b4b00c5224c2acb9c2738bcc9c04ff5
>> # good: [6a323f22a8b925f3646c884e2f9c733c79393f1d] Merge branch 'soc/
>> drivers' into for-next
>> git bisect good 6a323f22a8b925f3646c884e2f9c733c79393f1d
>> # good: [5d8b3562faac8030b5c26efc1cd739a41c4db722] Merge branch 'soc/
>> dt' into for-next
>> git bisect good 5d8b3562faac8030b5c26efc1cd739a41c4db722
>> # bad: [b79c0d780e519d760c2529f0bf849111b9270192] Merge tag 'apple-
>> soc-drivers-6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/
>> sven/linux into soc/drivers
>> git bisect bad b79c0d780e519d760c2529f0bf849111b9270192
>> # good: [9841d92754d0f3846977a39844c3395ee2463381] Merge tag 'memory-
>> controller-drv-6.17' of https://git.kernel.org/pub/scm/linux/kernel/
>> git/krzk/linux-mem-ctrl into soc/drivers
>> git bisect good 9841d92754d0f3846977a39844c3395ee2463381
>> # good: [64a026dd896e423a177fe87e11aa69bf5348c27b] soc: qcom: socinfo:
>> Add support to retrieve TME build details
>> git bisect good 64a026dd896e423a177fe87e11aa69bf5348c27b
>> # good: [9cea10a4f5a39fde32bf7b8addfa5f9175174e0e] dt-bindings: sram:
>> qcom,imem: Add a number of missing compatibles
>> git bisect good 9cea10a4f5a39fde32bf7b8addfa5f9175174e0e
>> # good: [0445eee835d6e59d635e242ba1d9273f168035fa] soc: apple: rtkit:
>> Make shmem_destroy optional
>> git bisect good 0445eee835d6e59d635e242ba1d9273f168035fa
>> # bad: [5b8141596b06fba7313cdfbd5f589649d7fde662] Merge tag 'qcom-
>> drivers-for-6.17' of https://git.kernel.org/pub/scm/linux/kernel/git/
>> qcom/linux into soc/drivers
>> git bisect bad 5b8141596b06fba7313cdfbd5f589649d7fde662
>> # bad: [9f35ab0e53ccbea57bb9cbad8065e0406d516195] soc: qcom:
>> mdt_loader: Fix error return values in mdt_header_valid()
>> git bisect bad 9f35ab0e53ccbea57bb9cbad8065e0406d516195
>> # first bad commit: [9f35ab0e53ccbea57bb9cbad8065e0406d516195] soc:
>> qcom: mdt_loader: Fix error return values in mdt_header_valid()
>>
>> Neil
> 
> 

