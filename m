Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8727D147C9B
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Oct 2025 04:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760846909; cv=none; b=YkgmHKStV9aVcRRtyVP9rerYDj+oBcmZSsrqQ5GHG+Qs/1DjorZIUrxG62TJjiAMgPe7XhUiswoFEcRGaXcFv5dGmD9Q0+yZJaxKZ69oz4LzWxC9lDX/39rqXxCBS+bqmWwp8/QveJutb5x1Vwl6cm3J6TyivR5mNR09NJR6DIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760846909; c=relaxed/simple;
	bh=PYQScSZOYoE1QyTJBk6buoc5qNLZZCr+32xrpVAzVuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jF6cjRGc9EPXRCWsFS8/h7c3jPFqsiPkoNSxnTHZQSq0mcZgrNfxhjPPJQ4Nsq0ftiGD3E9hSGU6LQkhX29x4g5i8NWxjT0pxd/xuvsrbFacrZPfII6rA6YhuXCiVRCwWv/tXxo4aW+oWYvjDfatapYj/7DfjqpJ8fq0cCc9dgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XVWZ7fwi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XVWZ7fwi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J36UBe004333
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Oct 2025 04:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eXtIl7gx2a3Jyse1CDj/YUds
	dckxFLnn5liYk/3DXnQ=; b=XVWZ7fwiNdHgJNJA672XFIDVSSDeXZsLaXAdgl4M
	zCHJrfEgm8LrYeUW330MrzQwl9M+tTIK3iP62ylNyAiih2Q8lqrICU4NGQ0aNEZg
	fBg6VzLx8Mjr4xJqnvKna3Xz6mzOsoOCHKk0X4fQPC6G72sl+X4EBIpQoVVNAfAb
	d/OBzlHz9JiGXXKeual49iQZnFnMbx67EolgQ9kq4XtHma93DecF8XByHabxEe93
	a0qldw06+YOTeTvz3yy4vNO1FcMnAyhBKSUHdwIZWLLBQK8PCVkheivK4BEwrgIK
	J1CBZsKbH8olCx74m0LWXdCJrubXyL2gKFb/Sz20PRpw2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1us9wkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Oct 2025 04:08:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-891504015e5so190880385a.3
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Oct 2025 21:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760846905; x=1761451705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXtIl7gx2a3Jyse1CDj/YUdsdckxFLnn5liYk/3DXnQ=;
        b=nJH6uflg78vWDJC7Bm5kXpGVseOPGiZVdbrshpSCcmY+a75ZOPyO8FJl61gP/nSM9V
         5jujXvcwvmVqZlHIufXfs1N7pSp9JQ2L+t4nZ6dd9zaXPr6AACquiZ2XbICAaS1p9B3V
         FofoiJvmisNcj4im9XhxffEuHu2FS140lSPiO3jx8J16k6JshKRk/pHwjr736rNqOLHE
         lhHmxtQN0IjlWcDwfHaS5BZGAeCTt0bKrLzfMTv673ojYsi14P4wXqoRXPRjaiuYCqrQ
         NIRMKW63uxq7Q9BSe92m5c91ZRa2f+6bOV7LZgoNaUapZTrfmaOaHczwZnu2PdrmkIkp
         GCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGPdSuj4DrxtyuUL03jH5S6Qfpph181GsxG41i5iKVtWVem3wLwpAxC4i2r4rohtbX6NuMHqhk0j65OYWjz3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjHYT2Zt9+X3BuB6tmwbfVD5RXagwKb83jTzuSe/tUbnQb3OPD
	LWpGw9oDfAGyiJW+3aNOwwKS5kKwcF5YPsWiTmBBRSGdQEiglgnSp7e6HBRoaDueW/sYsHJRLN5
	IotaH9CmPLDiP7IT79BH3N74HE91BXL8XSVeeWoW4VYa8ULiW3PriLXrY+asfZUl3FMMafoQ=
X-Gm-Gg: ASbGncvPXKiqTIeKFXg9LbaxUjipqaTpaIO/1WmQRNLPTPCtSPxtTicmPy/K885nrPy
	WKImh7QYlwivmxJj7l01VK7xD10asHUuQ67B4fggFWvtMr1FZEiCTDh1JQaxpQYP3dCMX0+crkj
	RT4fFJqMTa5tPcNsGtdNehFYqXMG71tVIimi6FnOaVQGvHmYSFACs2spRlaoav7eNcc1xdlOCcy
	+i3b1qeXgtomn/o6bcBS63h7yVqYjeiMFbVRUvhmf7VzWQ1t0VJv1yrf47HGmA07myx3k7wkbJD
	nMUy0pdGBEsBv9Mn4+gzsnnJOZH/5n80j+9eNO+SIiDhYEoDagdbqWdyqBjoboqzxa/POSbA35r
	7447hjKnyorYecU79+QQXCnh/vjrzSnTZ4T2FMJkhiMa/WcbnyepWhTRjIIQUdZtR/ISb9erUFi
	vxKTsJi+PXOMc=
X-Received: by 2002:a05:622a:1793:b0:4e8:b4c8:3fe2 with SMTP id d75a77b69052e-4e8b4c8412fmr34739571cf.11.1760846905202;
        Sat, 18 Oct 2025 21:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwjpMQMP09kJ0jfxgHAqYveaQLqrlnJM2EpETyDsZGjRJiaYgkp4Ad4myb57SXe9M/dpx8/Q==
X-Received: by 2002:a05:622a:1793:b0:4e8:b4c8:3fe2 with SMTP id d75a77b69052e-4e8b4c8412fmr34739361cf.11.1760846904593;
        Sat, 18 Oct 2025 21:08:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16b31sm1225608e87.60.2025.10.18.21.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 21:08:23 -0700 (PDT)
Date: Sun, 19 Oct 2025 07:08:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] ASoC: codecs: va-macro: Clean up on error path in
 probe()
Message-ID: <oghgx6bzhcd3uoju2exzijoe7titw5kuhyk5g6hx7rdcgjsvmv@fvsefyhkeaui>
References: <aPMyw_ryay9LA5SW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPMyw_ryay9LA5SW@stanley.mountain>
X-Proofpoint-ORIG-GUID: Hb90hBt0KzADRgMU5S1dtTYqYcYUXaiG
X-Proofpoint-GUID: Hb90hBt0KzADRgMU5S1dtTYqYcYUXaiG
X-Authority-Analysis: v=2.4 cv=XuT3+FF9 c=1 sm=1 tr=0 ts=68f4643a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ebUXpRROGgZ4PK-tThsA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNCBTYWx0ZWRfX7CERaEPr19z3
 LTkpxM0DgubkwcGAfyvy9b9V9QXI0Adoh8dj2wTeueTOLpsZhiV3mQDoUqdvosMZ0Qlcig8GgM+
 2+BvM/G3XbjvmDBdppv7us2EyAOdX49ffl7xlQTPM6qvasYAmIAK8M/Apb0RzEL5u/87r391fEK
 o2IHiSPCyaRxqjkRxct2qTXYDJ7Bq2bqRGw7CaRY1qXBdgOUG9llFLHe7ZYAJA7Y9vGhyGdFcoz
 RbpWhUz8rcNbEUmCB3mdWr7iEv6KGNF978fUtpp2e57qh6bIhJmesbKmR0Xn14wifbDibaPisG5
 xehcX3Kx2pNs2SlYXPdFKr5RBTRw3peezTztL67WMe/UEfDNRh/eCFn06F1cdSmJObvEqeZhpo9
 wAj9MNegwFwr/+IkCJrUUIJHcqj5/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180014

On Sat, Oct 18, 2025 at 09:25:07AM +0300, Dan Carpenter wrote:
> Do some clean up before returning the error code.
> 
> Fixes: 281c97376cfc ("ASoC: codecs: va-macro: Rework version checking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  sound/soc/codecs/lpass-va-macro.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
