Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7B12DF6FF
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710287; cv=none; b=jUXq2o9ZiJfTvk/NOGJB6alEGe9Fo2bXXLsIYbBmm5fVyOC87aqrMlfgyzPRIOg2fPRkoW6CVKLVwD6n3J/ZThgEp5fgIEYcbH/kgKI9YUoIK44e0Vhf7CkdeTXUHKZ1/LDckfuwqx0wURcEpMn7VFr0YeJ8UViOGFDRcW20Pdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710287; c=relaxed/simple;
	bh=Toar0gvp2qJ43aKc+/cW7q0AzANqcXizpPzrPHWXH30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObGQpNupuzk8tyPEI4R5xUCUC1VjxV5G0CFsnxoHl4PT6c+nY9eJAq2h9dJTjFaXLn7mNtIPNlWKXRTJ9WRYvYNblyiF6wFebMp2w3Pf5usnkx0vJ6ctjq9cpxdkcD/25nASlWcRoVqtvcHNlS+M/wV0NWGOFnHJ105zWMyeN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCpFnMCC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCpFnMCC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iJDN025120
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9MQAHNRQTDWklM4yOpEwiFV6eCi+r3BJBm1CRNI/Qk=; b=KCpFnMCChEFc3DP8
	vbHTSH3gLdgpSwVZ5pTgOA7OY9nU10qZuuJJIn8InaFyesIL5rerjjLWWsQAspum
	ddlvTldnB+CCiUgVcjG2qkF+K0LOgN9qD+ujEhzzB1bdtnH09dAuqXk1gDto/mKV
	XkHYSf3w2WMM224E2gxYiwGLDFLroUoG97Q9K4GgWoQr2TnEIpko25mS8L8KrwBf
	0PHd81Rog3BavLMiplfQQqXBI0i32JwA9eAYzPm9ntIg2BJHfT1pcNCSvVwDR3JN
	7C+zO0sxiqGr/hxNIUHM79q8LUIZQ8nf17eRdiK5f5I1roMM4QzuIJWqpGfdkyCe
	R8qVTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv13yux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:38:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d38dbc0e29so39873261cf.3
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 03:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710280; x=1759315080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9MQAHNRQTDWklM4yOpEwiFV6eCi+r3BJBm1CRNI/Qk=;
        b=d/hpsEWzLBV2CuWlw0Mqyr8DdqFO1+B+R6X/dVrm/ad6TTfOzRBfWVPRY9LRzMIUJt
         HJnbBNQXdFFG/wBAzqmkpsqpc0CCW+n6tBAbma76q5CMIvoAQdtQviYeOk93ISDYcmHf
         6+y+dR/+ETqs25HN9yP4rutGfPkEK99J8zFOvFCRS8NAMc2kcvRytt/9o2aT4MUSqav0
         nlO6lWY2BilNTcZVZtM1QMkxA5Kbrzjo7ZH+jrSDZGs3Fmcz1miYpcLToJSkTD6QPn72
         qHO/WbQA5R4Y/1vI2GAqRJbm961lLdl824dtiyte6SxK6Rsw2plq6aEsk2Hpgq9juUTF
         yrtg==
X-Gm-Message-State: AOJu0YyDO03DCCgSHXHUSUrhD0RUy80Xg4aQkbyasaAC0EB5eXC5Grxc
	5AWF5q7k468syW1SusFwEoZgeuvOVkX9GGUmeOz/t7D2ScWM9AietODnQv6ijrPhhoa0unVlFaV
	z7QyUZArvTAaDqvB9/TcVnnzBlm+DvCryWrd4NugLwuIzxSp9p4CERpNzsQhlMnhaNPcr4T8un2
	/eymQ=
X-Gm-Gg: ASbGncsyQxG40LS7OqdwKS6+oCWR5JUwDMgdtFgR0Bqe+N/ksB8lcDpL6WWEvWg22el
	kgnNOOJZaZ+VdQWR62R1cU55EJ9jI5Ibc97JE51KfHPUEay0A8pK7Xl99Adxd2MOsjPofpH6je1
	8wshtgvXrNl3FwMFHyA4xmffSOrtm5RoMd9RgW4hCXw26XP8j5bRkE29WbQaBfN9Rd77GEO3Wr7
	uQfB1twEYXPI+7YouCl3yqy9h5MgoqfECYGJJwzmduQPRukJXplUzBJSwQkcBC8ra7c81xI66oB
	mXJCamyyfeeNZZWQIpyg8e/x4KqWo/beo1Ojbo11rvsG8Kpq62p5JZiYAK+FpGkCN9c=
X-Received: by 2002:ac8:5815:0:b0:4cf:fc38:7ff5 with SMTP id d75a77b69052e-4d370d5e68fmr55024811cf.68.1758710279873;
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDRyLWKTabJ5qvoph/CIwo2q5r7HvHCVkrkTq6bzN60xam0HeMzsPtDkfzIFyr4t9WVi8Jkw==
X-Received: by 2002:ac8:5815:0:b0:4cf:fc38:7ff5 with SMTP id d75a77b69052e-4d370d5e68fmr55024641cf.68.1758710279425;
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf1d35sm29649231f8f.55.2025.09.24.03.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
Message-ID: <4ec6bf87-f6c8-4080-98c2-e81425c44e4a@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 11:37:58 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ASoC: codecs: wcd: Fix a less than zero check on an
 u32 array element
To: Colin Ian King <colin.i.king@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924103334.9832-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250924103334.9832-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: r8FCGCcEMCoJG7f5GhkPTYswt_IKORHN
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d3ca08 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=gChy-ArH425jUgxL:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=OLL_FvSJAAAA:8
 a=pGLkceISAAAA:8 a=bwnp8BXZDZf2W2z4idsA:9 a=QEXdDO2ut3YA:10 a=j9o5Av5NI7AA:10
 a=M_KkFZv0jYEA:10 a=dawVfQjAaf238kedN5IG:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX4U4JO0u3rvqK
 rIYjI+RtNyteA9BzO+q/TaCnv2+xmx9/OT/CYormTMxtWlIK4MeNYK7e1aZK3WrWweUYg8mAzAs
 nIO+N++HDOsj1Tt+NdfSLr7l1eJEu3MzI2YRS+Wz4aSCTqoarvS1qO98i/dBQJGZPq/WIPJrokS
 Nh6/W8QTvtQlx3M7OYIyyuZrFNIMWV45XWa+4nodZh8XTIl0/HfNZu1L07HvkubYLCKovOMxsWY
 guKVc51zQYqNTdS1rRPqaTbu8cfy4CAxDkvd4ecr/q+t2MKEiI20Die1M8J1UnE9cyYaaD3NXhM
 8w/Kpsw0fofeLVZmewdesKI8CGeqMsuIwkzEnd6P6KReMct1tll1AAxpln/ooTyTz0CFLSY+OVe
 i9RIePxj
X-Proofpoint-ORIG-GUID: r8FCGCcEMCoJG7f5GhkPTYswt_IKORHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

On 9/24/25 11:33 AM, Colin Ian King wrote:
> Currently the error check from the call to wcd_get_micbias_val is always
> false because an u32 unsigned int in common->micb_vout[i] is being used to
> to perform the less than zero error check. Fix this by using the int
> variable ret to perform the check.
> 
> Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Dan Carpenter sent exactly same fix yesterday:

https://www.spinics.net/lists/kernel/msg5855359.html

--srini
>  sound/soc/codecs/wcd-common.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
> index 9bbfda828377..9fd3965ed540 100644
> --- a/sound/soc/codecs/wcd-common.c
> +++ b/sound/soc/codecs/wcd-common.c
> @@ -65,9 +65,12 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
>  	int i;
>  
>  	for (i = 0; i < common->max_bias; i++) {
> -		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> -		if (common->micb_vout[i] < 0)
> +		int ret;
> +
> +		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> +		if (ret < 0)
>  			return -EINVAL;
> +		common->micb_vout[i] = ret;
>  	}
>  
>  	return 0;

