Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632792F6178
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Oct 2025 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761214268; cv=none; b=Dhbfkgj0Q7S4j1g8YHlg77+IDKIxonvlnG6o9kVdJYiMf9wca1hjMzUfOh4ZScLFslCWNVIA5E3tx6UiXeHcNuhMWcFmBpOPZ1o0kRxzIeSQKRR+59lDGQgdB3nW8h8Llttg5+oWs8eww17sPdIJ5a4DCpHRyo3/jy0VuHvkTnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761214268; c=relaxed/simple;
	bh=qLVWI4esBCBNF7xpWlKAqG0GmKGFbIZLAfCdcS/Z+MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3vig5TbihKRibJ8y/ajVIQ1a6w3KV27O38qmkVlpSs8fTXCPhEDHeOvnRQpMuShjOCTYUArwkIms4WuKzhO5KiAsrkmR/SpXZrGB0O1USrrt3Bp1RAGFcEYPdw6EcW+972YoLiznL3xDUenVRVfmhRa7J7uCZ5uCCFI6wlcb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdmkTEjh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdmkTEjh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6f755032198
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Oct 2025 10:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=; b=PdmkTEjhYy74Piku
	o/rzY2pZzaSnTfurWYJ+nMcD+Z2vSvrjfeWbD4+vNPJSsQoWkHb1imjoSeyPfnl5
	f06t8xeTjJthYrgXjJW5Y2oMwqKVvH1dlT+3z0/llH9F+5ObN55oCURUAni5hd4w
	fDl7g98uzQAGvqMzhFcFSIm2LFrqhFGI5kdKNFKOr1n4nufjciODTzfkQ37ioaUc
	dWMAc6/JSX53oeo+AzNXxb5VmZiAFFDOg2snxx3hVVUpxykogKesbpHcfCM4YSDF
	F5dmXoqOArVJMPvrvgTR6Saf1pmRHf05Vpzkis+de7/jvmuz59NZaj0F6iL6/kkZ
	phdTnA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge7y74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Oct 2025 10:11:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62f9247dd1so574867a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Oct 2025 03:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761214262; x=1761819062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UML1yqzrbQrPry4HepC8vV3t4zwpEH9yK9wTNqr1R0g=;
        b=dv/4+jTUuWPsLl0JO2dSwvXW4gP3x5HFYmFSb83fHuQuNiSAeTl34JwU5oRVi6Wshf
         VE4Cl0YfaS24NHDAxe5VVaXWvlJlcgCAgwoHO6d6TOez1WpD0tcM5nR3cCB0bmIU6bpC
         JARISStwwJe7UEiclkZt8hBaIEGeMPOTZwAmnFuyatmh5/A85jDnA5Umh6+G3nCSHKsT
         GAQ9FneNm/1WFkEEs6d/fng2OzBrxcMuJrJzmE8+ba7dyNyYMABjyk6HzJDYBzzbKDpn
         L+f+sEx9jnl6x7AtgPWmCe+ZjjuH9YJF0c3Zizzc0iUY05S1h4tjRQi3AnXQ1M5JjQrG
         8c7A==
X-Forwarded-Encrypted: i=1; AJvYcCV+XdpyYuHz5YSLyDb2SFMVBLj+X9zBwpnstnKUS8IXa8Vj/62l2icctvbivpvfOlh9Rt2loWUU1gC1TkctoyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrQqbjfhhgLP55UnoZV6GT7GH5CYQo8w8+3iuxGcASWzsm0fq
	DB9bfeB277/wDp43ZTedD/duoB08l2fYKzTWwHlyagdcKE1dqnBBc0Nz69x/rY+6CqgqLLKx8HY
	NAuNWLxuMnVhFcJj5y2pjqcAHf9MCVm2iVPa+Ica5SYGxB7dSUmoCZ33C4jVZQDckIDeJbMo=
X-Gm-Gg: ASbGncu/KFRDwh2Xn2keMmXaxHEA1ws/5d9pXzEvfkj5X7NX/k94vqgJc4gsN8xaew3
	u3XOmZkZCAlHWZjBi7OiqXiQkbd6bi9rstGYWTgsh6damB/zWCAe13i/JH+YguUP5GuWuxB9G0i
	xExhaJk/7VqjxyEOXH+13YgFi3a9idj2eUvq7HFD1Y8P5Kcun0yHZvpA+7HicM6V8QKLxOfrlWC
	ti3PP/j6lT2movqYIVZ37418R2azjYF/PwUA6Bs7GqbErESlgRBHePms7GCga71gDZdwD42wrdy
	/pX1lAG+m79EQMKy1Wp08WitCJxVaRbUOZpUziY1H29/P66fUtt4BmVfoluyux5XPgCJMOzOV2J
	zYhrI/d6Gc9Id0GUgOCwPkoMyZSAl2aQXhGHyjTR2f7jTjJIC5M+hP8sYexvia6arwg==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446146637.20.1761214262557;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFy40H0MW5NZRQSkKA5Qh1AhBvaXks0B6kqhFazrM8IjeVicGOuL4gdISqwRAuDa2V1gGJ8w==
X-Received: by 2002:a05:6a20:9186:b0:334:7aae:c43b with SMTP id adf61e73a8af0-33c600ad4c9mr2446115637.20.1761214262075;
        Thu, 23 Oct 2025 03:11:02 -0700 (PDT)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb9c8asm1654060a12.9.2025.10.23.03.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 03:11:01 -0700 (PDT)
Message-ID: <f8c315b9-acf8-4085-ab10-0d6e60ef7c39@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 18:10:56 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mtk_scp: remove unnecessary checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <aPi6eBlFLH43A4C0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX8ZU1RV3efHBN
 ZKb9HZGhTYbG5KKaf/qmb+uusARLeD/5bBM6TcRpnvzVxg/58lYWxb9Xqyez+749migUXeSeViz
 n53I5y3VUvY3Ng8x926RzIpzC3Cl3S+gLXi97LM4TJFxYyrRgKeJU8eivjlTYuTKCwwzaDognHT
 WOk2Vkdb9Y9gM6tl6PgyquOyfLEpo1bFMkQZEMP10ZdwPhr12GMgQ7JHd4ZP5N6dXaLDnHOEeHr
 kCQuMxljRCSuQsABYaYLunKl4FVUZQ4/kenPftvMDwcH+jqcecn9B8JowR0DYsryhr7lRFgMnWt
 j65g1SRAazn2Vse5ypKOxmoocd52q8XbBLgKFWTapOGkan+pXe9L55jFSSzOfofP6gleEjmLaPy
 ilcCJULcTkOwmnZ4m1/Ss9CovCMyAw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f9ff38 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=IDcGV2vxZRipFm0qDp8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: RTXenhdXaN98BmwU6eNZOgKuSY8JeZeP
X-Proofpoint-ORIG-GUID: RTXenhdXaN98BmwU6eNZOgKuSY8JeZeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/22/2025 7:05 PM, Dan Carpenter wrote:
> The kernel implementation of snprintf() cannot return negative error
> codes.  Also these particular calls to snprintf() can't return zero
> and the code to handle a zero return is sort of questionable.  Just
> delete this impossible code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/remoteproc/mtk_scp.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..9b624948a572 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,9 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);

Hello Dan Carpenter,

The patch looks fine to me functionally. However, one concern beyond the
current scope: if core_id >= 10 in future extensions, the
snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id) may
cause truncation.

scp_add_multi_core
       |
       v
scp_rproc_init
       |
       v
scp_get_default_fw_path
     char scp_fw_file[7];


To guard against this, maybe should we consider adding:

if (ret >= ARRAY_SIZE(scp_fw_file))
     return ERR_PTR(-ENAMETOOLONG);

or just expand the scp_fw_file[7] array?

Thank you~


>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];


-- 
Thx and BRs,
Zhongqiu Han
