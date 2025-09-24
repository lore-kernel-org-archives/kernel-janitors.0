Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5B2DEA7E
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710205; cv=none; b=nmFU9D9vBihcjsZ3zNk1WOquDcehilqZAnaTapa7RMtr7itKYKrego0V/6ZgpMQ4l8+vOt6SgEJPVee5/1wdxkxYbHfJryJFWA0RgLD5OuvWD0qvykHBHdHGBRidgt7n2P1nWSjfiOSBJ/Sj3tA6akup7D+By2lp3WwRGfFxNrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710205; c=relaxed/simple;
	bh=TcJuuFO6n0Y9yMEhd3p5BYTjpQ9PLg7J6rBPzBmb53Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HX41NWwSBua0rFDAj2t5ML2613cu40OhYaX8TPx6bEiLE2BtfQiGUBpYFg2aSBEssDbw26eGpyZFhaSaKv2qQTXtI/BHzPKGZlBwM2Lo3pGkmOK4srAUSE8cuq1iiV2/+Zp/Q0V1aA0Il8VVeDCeIHjNdn2zW9c9UiME56/bBd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crCZxAex; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crCZxAex"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iJ07018200
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/Yl5Cf4yj9MAlJOJXqnptSyyyT3YpEhhEgjwU6fmXk=; b=crCZxAex6fQshZlM
	ju719S9Mgg9yEm1Wmh3Oc4+Czb6/XeUhVpAv7SR66PoQERKkhl4+uGW7Z+oCYfp3
	BW0CnfhXL74teLEy1b9yLozGO1XeNLre0HNo96fhnLro//2Spx2e152WdPkO6D0t
	/mPOdRkbqVwPJoMUsoGuiHc2VLOE8GwlXyzL8GuipP1pWlQU4GGynNS9XMAuuvVL
	s9plhEzvJz/Bktz9N/xhtldwdjENV17YDioseUchtUKrX0bk2ZBWEfcj95ADViE4
	Qe3EdSlN3AU5kAyDQqjrTss2gJeJCcLQASPAM13tBfyOUzm9nmvXQUmsqO7P2Vzu
	KZ8koA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk7x27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 10:36:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d905ce4749so5683321cf.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 03:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710198; x=1759314998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/Yl5Cf4yj9MAlJOJXqnptSyyyT3YpEhhEgjwU6fmXk=;
        b=Tez400HA+RC+XmaWkGPD4jKozGFVyrwWcZm4H/WW8Oe1aXq8VjYFFJhSpRaP/5OkUU
         oqEqbk+7CXbm6Ehyx17CqHdMW3a3rQ/jkpYvqJzkiAiwytMKCjMYZlq97COThEFgl0J2
         OCu6UVXfdGuey3qEHzZa7hZxtreVqmkuy9P72CXLUk62PMKpPhydS/JHRYnuJk99yZq0
         mqyNOj8ROfT7Uo+qWN1sjNt5M/TdjQDXRXtnRLeF0JFdMjkJBCs/XtJj9hMVZ/LohViM
         +ZIpOolZsarsQ8W3JtvpvkYB0lpGAY3pkERERVUnuzA7AggGucBOR5vIzXoPAVwCUqsz
         Xpvw==
X-Forwarded-Encrypted: i=1; AJvYcCVyr/YFovkCS4Y85DYzN2qkiV5kk13M7nyZvhopTCHY3HFSN+Kc/I9Jnw6Uebjzpru9BM1kWvjPjhvuKfA2Iqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzX8q2Hp5yLWOY9prjEIjkEnlt+JZ3pyOW261J8Uw4/8Ogha9Y
	da5817Dmsuilb6c5xRXKyz/k6stj48GNN2mqm/Iq+E56keSB+OG5/66V8AaUtW5H3NcnUpR/aov
	qQpC5egp3XkncmlUnFAHIGjKs1+RHJKCf401kFecAbFQP3bAwUx6NgR2kZe1glHNfP1Hx40k=
X-Gm-Gg: ASbGnct+VxyY1i1/il1QnVMHbiZY1SQr4265ZpPfKNYIrmFwlczkfxJ+rB2vS/z3Ym1
	C18jazOH07FmDvcu/4Q0EwVaHYUEWmVmJeZap+SOPzZjawNeVSeP0kYnX/CHpWxSFKxTtU3OG3C
	JVFxzKNNrF2GMkxcv7vooEnK0Py38VQJxwccIcjM7dIpEz3phjs+QNhJo4KKBlhdb+qittt2wx+
	pl72SSCqZrXoxaFzVjWjijX/hxHgIGDlj5qsRgUOK4/hZpHLEggVyCWcsPz714XQn7mE3Vzs71S
	nbMKREMKAAJV/YWzSxAQh2Az5IwGnCcmPck4VLILjjXgNuNdLAhUxMAA1wfxq8eXkmw=
X-Received: by 2002:a05:622a:2996:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4d36879b57bmr67953391cf.8.1758710198496;
        Wed, 24 Sep 2025 03:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvc+HULoluES1jwdfkJ75V5AO5mrYzrq/vmxtknjaJtpWE6iUTAMZQ0tm+dXZwSY8DOzWdVQ==
X-Received: by 2002:a05:622a:2996:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4d36879b57bmr67952911cf.8.1758710197936;
        Wed, 24 Sep 2025 03:36:37 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3f0e28c83d6sm22815116f8f.56.2025.09.24.03.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:36:37 -0700 (PDT)
Message-ID: <59aa38cf-2a57-49f2-85bf-157b1e7e977e@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 11:36:36 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] ASoC: codecs: wcd-common: fix signedness bug in
 wcd_dt_parse_micbias_info()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aNKEZ3VqJ8js208v@stanley.mountain>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aNKEZ3VqJ8js208v@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: csoGBc2Fj0WO1dWtTfn7mRFRE04xnSB8
X-Proofpoint-ORIG-GUID: csoGBc2Fj0WO1dWtTfn7mRFRE04xnSB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX5MQK3lCNeeFr
 SBsWJZJRIj+5OBRiho0FhTWMlcD9Enh0YQ5XVWzF7clKH0MfTfelrvU0e6AmSBoRBQOie4YafyG
 uk3NOwhqlhWyBqpS96tpbLaGdTX4kzGLggD4Y35vJpOjGwhxYPJOeekC7jTEfTWsCZtkDWM8vjr
 PyOtU92Ypfn4K4cPlsk8WvXaM7IhjhmC2Okpiv4ROF44cJdQrgavvEf3+4mM8Yq4YYT+jQ5rO9e
 nm3BDGxuv3IjsbEfDUA+F02/cZvDxvRgs/LI3Oo9KHrCitd0Y3boz2JwvxCXmFrBmddZb2YzJ4l
 0TL8poTadSnEAbMKnd5WKKapB/Idd/M52g21tFK8I2dE64FOk6oyJPwFZIiX5E0VsqH9/eqi7ID
 xsKdacOW
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d3c9b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=-C2JdNfRTmumDSgDQiEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/23/25 12:28 PM, Dan Carpenter wrote:
> The error handling does not work because common->micb_vout[] is an array
> of u32.  We need a signed variable to store negative error codes.
> 
> Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Thanks Dan for fixing this,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/codecs/wcd-common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
> index 9bbfda828377..9016e974582f 100644
> --- a/sound/soc/codecs/wcd-common.c
> +++ b/sound/soc/codecs/wcd-common.c
> @@ -62,12 +62,13 @@ static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
>  
>  int wcd_dt_parse_micbias_info(struct wcd_common *common)
>  {
> -	int i;
> +	int ret, i;
>  
>  	for (i = 0; i < common->max_bias; i++) {
> -		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> -		if (common->micb_vout[i] < 0)
> -			return -EINVAL;
> +		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> +		if (ret < 0)
> +			return ret;
> +		common->micb_vout[i] = ret;
>  	}
>  
>  	return 0;

