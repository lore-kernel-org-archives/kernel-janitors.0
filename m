Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244F28BA95
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 11:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715362; cv=none; b=lY5198UHiAo9O0bgsdZWon3W7iwnMOUZRW2cet8+ouIdllgwrzUjXMAAAetQyWJgoJ+7zrPA8dpZvNP5hJtmwSOkxRCC48iJ4pmB5DKwoAn3K7Xjxrr6f8DIbzxcXzEf1fUjk6hyykdOee33dBf+o1jDL+lbshionCy11OugwLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715362; c=relaxed/simple;
	bh=ynGxVyDinc7WyoZdUXr705wWkKE7PQbhLwK/puARYOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiOMehvFXsc8vc53fDNtbfWBrUtWnNtKEVFrR6nXHfre8IjG89JWBqA2umlHldCR+zu6m2m20IeM3OVCTDsCi3JQewxZp+paYpQQ9iSUOmEh8j43rVcejJv2w0Fh1WLt6xvvAWwLrcdPwrq5aeU0be1poxj7ofilxb0TXaIQNgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKlP9218; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKlP9218"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tExj019568
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 11:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h6gv0ECKL9tJUyXSo2/PgT35
	c3CAj0ZmFRJki0PvzWE=; b=kKlP9218v4OW4p++AOwvndUevkiDRsURU6lH6ZGm
	N479caZcmnniCnQR69+F9Im9KfLeSWTIkc1IIu+/7nGE0EmkF0IKSmWzm6rLMyTj
	qn0DjuYTR0tPXNP0fuhBqHnMS4VCUxJEzRhi7uQmDGDMUTBrK65zJXTBSB0lo4cD
	7MplGk8qGN3b+hgMDgsyrbe0xsGAG79OonvdZM83FCoYzhYGD1gqNinJ1Et0RxO4
	i+6isL2wHPWb2CmTmQ/ytcio8kb2ws/GTri57rDa2cdqOAPr0LnMoI/GSVit8Zf7
	aAnAAbKV9n6ea1S5ZMGrcU3wJk27CVuDf/H+OQHVWXhCTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcypqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 11:09:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so1086381085a.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Apr 2025 04:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715359; x=1745320159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6gv0ECKL9tJUyXSo2/PgT35c3CAj0ZmFRJki0PvzWE=;
        b=tIXtH7g304XPhfehApLeveYDInhYU+JnupOfTOaMXnwKBrSz+0Kwzt0eFIkoWj87l6
         HOKd864JajokqDL4ug3vqa74h22D7eDBHAcwxKdGZlxgHJbTyk7LDxsHOZR8Z1eiDblO
         s+ifqG1NxkdzyIb1aAzm8V1wHTrzDqPAoPLgCPnXQKPPy38gyiXQFB0qJTiD/fo9zEyO
         +UzA/bgtmV1C0/7sYM5BsMKkNPjptcFYzKMXE5/Ff+33xVty+4BDoj17c8BRY5J0afNt
         WNDKmrzAb0m+mtCtF26SztGHepkhYhuB6H8eiuRXUMIhveads0nOI7mycy+QukFE6jpX
         1KnA==
X-Forwarded-Encrypted: i=1; AJvYcCWDzQ7cXu4xrfaLNtwHq+1IIqAXLfD9e1YYdsq4jUhk+MVn4HSKKpwZDJfo7r3T++4CSCl/tNSuNqsG18hQaV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlwUGfMkg7BVCASul8DDnZEJoon5yznj3VOg8vhRGb4W1Xzwl7
	mUC2/rEaMSJJsXVd9E0btxcNCLsURndglcA1ndCKWxbp7qyM1bK1kJ0JrDhHkTRSJ8x9caEkxom
	kZuHr2boNDL2I34SkM4cHFP3ooTTzRpYpO+361OKHLKHwZNh3qqsBdAxIwgLysbgcFro=
X-Gm-Gg: ASbGncuP2lqOISXbGCO6lADu0/8W9GHMYVQfLenP2sy0wMHxK/ftU/uIIf1j2IALRWG
	nXW4GhN5/hyoozVy4CBtPvLWf/PzA4GutuUWKfGsHLDHEgdz8qAU/6fj/G7g96ZqWcizrl4vd22
	It86hxk6hL637W+3tay/UYSAVRH5OJr+OFXrb9/0lMsl/LNkWnWJHPMIxtGvIRXUBIZfQGxFEnG
	GdMgV9lqovOnMVTg931rA6Gc/Ux1FtGu83LNjqmuBzpBOYcwhDLWbr2JDrmtL0Dwbsf07iyPnLW
	hTt15mgBIMjbv6hF3g1EoD0D7YXSj4QrwgtokByKPKASfS9NxsyMGdJP6ZD5ehwDwfHtzNn/tGY
	=
X-Received: by 2002:a05:620a:4307:b0:7c5:3ca5:58fb with SMTP id af79cd13be357-7c7af0f7ecbmr2389151185a.4.1744715358882;
        Tue, 15 Apr 2025 04:09:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOKV0EZaARbnrysYds/riY2sNERqlVNe1z6l3k4KbexchCh2m1o3RxPJVBQiZUraGYxmH1Hw==
X-Received: by 2002:a05:620a:4307:b0:7c5:3ca5:58fb with SMTP id af79cd13be357-7c7af0f7ecbmr2389148085a.4.1744715358604;
        Tue, 15 Apr 2025 04:09:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b0asm20275941fa.98.2025.04.15.04.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:09:17 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:09:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ASoC: qcom: qdsp6: Set error code in
 q6usb_hw_params()
Message-ID: <pcwyzf3yzsi2stdryw4qazp22cs6d5pd4yx5l2r4seycpanam5@jian7eu72vf7>
References: <Z_442PWaMVoZcbbU@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_442PWaMVoZcbbU@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe3e60 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rCPy67Auyf8QrFhMEPMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SE_cYmdW9z8J8kPa44ZtVjaOeYlLLFjN
X-Proofpoint-ORIG-GUID: SE_cYmdW9z8J8kPa44ZtVjaOeYlLLFjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=637 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150078

On Tue, Apr 15, 2025 at 01:45:44PM +0300, Dan Carpenter wrote:
> Propagate the error code if q6afe_port_get_from_id() fails.  Don't
> return success.
> 
> Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
