Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859802EF66A
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Oct 2025 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566118; cv=none; b=KANJSXzMUKCsaubz9RhYIB2xiJG+2n065+HBzrmOmBRTk82AzFZn4Tlf64joehNHxJlKedVLutrRLs1Aggwir641Yl/d0TILPcYo5DowRYgat4Utxeu3NxyhJSTz4AoBPtlK9VjnIxSsJpJJX+msYUOzECZoMOKnAqWm3k638Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566118; c=relaxed/simple;
	bh=s0aokbeBV/ht3ahPvmPE5Hx1GouHUyuPwC52VaMCS54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZrxEt5Mo1nyuJIj7bwp3CvBtR/QdsiGF147FXgH4BcXTe2Sh2zcuCdUC9JvidPWnJHUDen2JoFxvrSkySm65dyH9cdP1vQb3wz62du5Zsb3onADdxl3WgDACahpjJPB2bZ9EO/EgXIud1KQ+x2TLkZ5dvNqGHp/oW4NMPtizyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNRPH67Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNRPH67Z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R7JvWR2059268
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Oct 2025 11:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWAM/1l3ob/3LqSmNYM1Kzzm3JAMnpjQt4pTVWbHtSU=; b=cNRPH67Z1NyjlP86
	M3mT59D+2BjMtjmwTDK4eOBY5D48EYOjfmoKt45lQ91fdljCtvuHEmWbjcvu0jKN
	qvGFPVMEJobVnMbfmWfgwW/0VxH+7AuzzTvZb4skfqOMI9qISCFUwlnEbz43bGA0
	//bJ4mw9Z0bu2PkyBcRWpQQmMa/U+MjAxRu/a5C0mhUp5qezSrfGK7//NzvQHkTj
	Zwdaqj9sY23LIXHqbOk/gx7gjt+PSV8cGkioWYe/BsryN8ruQdJY3dkBCzvrLyQM
	CTfdvPZ/yDfz8eOrfR8Eni4x/ELomNWnlFqbmEV2fZH+9ng5aIdxy4ZsYiGJzqaD
	8Pp1Uw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a248p8r72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Mon, 27 Oct 2025 11:55:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a2803fae59so6240631b3a.2
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Oct 2025 04:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566115; x=1762170915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWAM/1l3ob/3LqSmNYM1Kzzm3JAMnpjQt4pTVWbHtSU=;
        b=Iy15u4E3SM30stgdpAM2fCwZ+ueCeoM1aEpKIt/7SsnbMrl9QGOzPy3upzxQVwki3a
         EIrjSwruZopL5DboRdaRfuACrObjNHsPP5BTp1lPwR+sOYqPZeNP/8riGH4vYiPXMftm
         Ml+KHw5mTUx2ugIJW/qHwey59m/Qln2nt11wZ8BIZCYA0OgTHb7s/NWovjWdv4F/+31m
         mcb9k06Q1AHmmVOcjLJTIIO5tQWKAzVSfiYQRo9gNaWVbo/Y0fscADE6Q2HN9nFq9Nb8
         W+PdWw8PXg7suLjBlRodgkiMIl4hTA0oQmEpcKhfzJp3Coy2kofv4r9bFwX+hYjG8Cfd
         L00Q==
X-Forwarded-Encrypted: i=1; AJvYcCWog/jFIp8xp6GtBSXKFhVrTO8a9AhGNbpQdSN0GmwNVM8ootiSBsTU4Z7CRlWkKtcm7oxdtqoe3UmRkau0lK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkUzirkBHOPeVQPTlQ+bUYwCcwt3XZ5OF97RFYx67oIG15Yv1
	1xIHbtYJ3rDr/z0HY/JfKsgPeSD0l2/oBzKRzDU4T4JAi0xUiRio9GC8iJhwmacnaL2jJgWoOLe
	5IQgCra7W1PAunijt9CQb1DqvImfBeLoeXpne27d6VZvsAsBzLbbR1sY76W/wPHvgRZi5cUM=
X-Gm-Gg: ASbGncvPgGmpdXseBWkR9nrMfmVoMHRYRl0w/uTAJiKNUbHJuQX58Gbm2IUtmrDZzGH
	BPe/jO4pJm5F68ifZDvb+TxhTNlsGyztOGtNWXbmPp42rN6uTtPJbGouUPSqE/xNUmhnsZGVnqz
	wF8W5yyIPrgMFYtqKXFEvRU6nHzV8Q7CKT7bIUp5xNWTCJZlW0xeYksFJDgb06unw7EUwpJF/Eb
	44swL/Sz7qSIsiHzWC0PBIwDO/90R1eYJ2dkkjxODeMXGpV7XvPNUDKBhqMyKoWzmyoq3p73qC6
	unidiGg9wO+GWBnV+of5JbAUfUYk7WoCVzFSpdcPsLbzB0hNKJn6WWeDK+DzWt+8zzPP16HIh4L
	kWZqrwnB+uGpKo9yRLg3tdqjJL8ILZ4K//Kc7AwTtYttNEvRH/4qwMPRfaIE=
X-Received: by 2002:a05:6a00:1803:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a28674d25emr12047804b3a.7.1761566115149;
        Mon, 27 Oct 2025 04:55:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGGkAcnkXHKQF/eHcUEuUAMP8k34i7aRfOMaE7hRoA4fzc286ygZftSP3+bEdiIYw6mSvSXQ==
X-Received: by 2002:a05:6a00:1803:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a28674d25emr12047778b3a.7.1761566114705;
        Mon, 27 Oct 2025 04:55:14 -0700 (PDT)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4387cbf00sm1985642b3a.2.2025.10.27.04.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:55:14 -0700 (PDT)
Message-ID: <9d6d7641-d2c0-4629-944c-1bb88eddc486@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 19:55:09 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <aP8agyKj73bLZrTQ@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <aP8agyKj73bLZrTQ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zvzg6t7G c=1 sm=1 tr=0 ts=68ff5da4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9rX-9eNafPfUpquPNkAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMSBTYWx0ZWRfX6RghPgt8/6Ns
 HZwNwbl8HMGmatgoQu35L+ZbyjcCAV7ZxjyN4QKhhxwRkMQ1r/85ThhKpPl/fEsfem1MeDoSQe6
 GjFbp2Axx32VsMyDFZ2ss7PqLqTSqZR/NmX75rSkTA4fxLpCb+hh1lIXQPav4gsfmt1LhPQ4drd
 JlR4mb/Tb26f5S4TgZXFXPaIHkAs4y5t3ahZv0xv4i4PjDsK1YmRTt1BjeZ/4y3wRF2WZnYVGJe
 9DTrBj4Q/M8VwSGv5pK7grEqXsW919C5BXLhu+2FthfSLxnoyRf4sWgYeE8HjoYOjGPwlx8eeo8
 FGzOuDsIopW1fPCGS7aYK2bJx59/i6SIwYYlVB/pPA9DRD4SDyhidTdFyDWrbyirH4iv9FxSxfJ
 IFmu44fGGnuGc6c1vwDVB09E/ikxiA==
X-Proofpoint-ORIG-GUID: aOsmnD6jDhtihDV6gKY0_9MK7ab0HZVU
X-Proofpoint-GUID: aOsmnD6jDhtihDV6gKY0_9MK7ab0HZVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270111

On 10/27/2025 3:08 PM, Dan Carpenter wrote:
> The snprintf() calls here work but they have several minor style issues:
> 
> 1) It uses ARRAY_SIZE() which is the number of elements in an array.
>     Since were talking about char that works, but it's more common to
>     use sizeof() which is the number of bytes.
> 2) The printf format is "%1d".  The "1" ensures we always print at
>     least 1 character but since numbers all have at least 1 digit this
>     can be removed.
> 3) The kernel implementation of snprintf() cannot return negative error
>     codes.  Also these particular calls to snprintf() can't return zero
>     and the code to handle that zero return is sort of questionable.
> 4) In the current kernel the only "core_id" we print is "0" but if it
>     was more than 9 then the output would be truncated so GCC complains.
>     Add an "a >= sizeof(scp_fw_file)" check for output which is too long.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
> v2: The v1 introduced a W=1 warning because of the truncation issue.
>      It's a false positive because GCC assumes that "core_id" can be
>      every possible value of int but actually it can only be zero.  And
>      also generally, in the kernel, truncating is fine and it is fine
>      here too.
> 
>      But let's use that as an opportunity to do more cleanups.
> 
>   drivers/remoteproc/mtk_scp.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..db8fd045468d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>   		return ERR_PTR(-EINVAL);
>   
>   	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
>   	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
> +	if (ret >= sizeof(scp_fw_file))
> +		return ERR_PTR(-ENAMETOOLONG);
>   
>   	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>   	soc = &compatible[strlen("mediatek,")];


-- 
Thx and BRs,
Zhongqiu Han
