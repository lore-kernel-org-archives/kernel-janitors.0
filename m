Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DEE1FB1
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jun 2026 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224088; cv=none; b=ED59U00uoplqvcfdqAFxcceAYeNh+8SaQl5hEiCMqLDK5UrCtl+cYkzP0SdzImhGX2itkpR7t0XUgqTysSDTmNTRBLrmM9BNLPEZG0wJIUL6yTXmbHLkmrsMYX2kf4NWMtsSsC/DJ2npKDTzvgYC6RHfpwAVpVvScRHBrM0Cc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224088; c=relaxed/simple;
	bh=E1ZBaDImfT5p14y+ousIOrBndGpsxu+XYR0GSvcmriU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZjMAS8oE2fN8pRenwdZWTDOJ6d/vIH20EPzehGRIxejfHBarEVJcwZYUPkEGbjjhSy5oZyCdZTskcJ8y+s0HqU9oQKVI3JvMBtKpnB2YhnofvhAWCS82aM8+mtsEZuyDQQMSmLp1nCAZaAaPOau/x0rHese0xHniqemgQO2mkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of6Pc/GZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJTkdwyC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of6Pc/GZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJTkdwyC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMV5lx1964363
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jun 2026 00:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6l0mQNRXPjow+FlkvrpYn9i3
	O03bnURn14zmv8KuYjo=; b=Of6Pc/GZtoV88SHtzU30JsOQA+uaAbNxpeSqfY4n
	O4NXIMAHOVM1DsUhU8o10S3id6/azs6vJ6ua7IPkw5iKClhkixSpxAgVkW+bIhJF
	/AH6t57RtvNJIsn9JEWVNezRwKdHQrI02EbUhEQmLJER72IYURB72Pe347P1Szkp
	b87sb1WbJo5iiB93IQdygYmQJgzKp0eaIHl7XuKYKfwRQE5itUwCCtyU9hZv+mdQ
	Bx6rm8VYNt0mm3AF7uHdjbhsGPEwZE81d24Pp6gSBvf/Lb9v5NhtBIfUTsBjWt8O
	W0t5GxW686fGuw06JV/SudeKfhEypXmwq1Ql14VYDe5YJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29us6cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jun 2026 00:28:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175a1e32e3so9796771cf.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224083; x=1781828883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6l0mQNRXPjow+FlkvrpYn9i3O03bnURn14zmv8KuYjo=;
        b=MJTkdwyCCNVFZxYsjwCZDM+cNcov2GIXzGssOPhM17NXQumPFVG7dgvb2mUGRe15Bz
         jd9Vfe+j6xTzitnvqDTYh1n+5HWlWIeRokhNiwMnJ2hhupbN6m643V1Byb+89XAHc+2p
         fa5dti7gyxyZGA+W5O2oXpZYz+wpW67oWhZrNUr1gD3dpP5jAubAWZ1RkYBUtjTZgLFk
         JqjLX2dkTITqQK9B/TLqhS+TnqmbatN8HH9ZE1SvOOOs6VXzYrrlNDcbn9+8g3Pu7CTT
         xv2sBJS6LUeB3CqOTXbkJLuP1Ilu9urUEDfIf8BcAL8isIvNvWj9qsgqQCImspodtJYF
         8HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224083; x=1781828883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l0mQNRXPjow+FlkvrpYn9i3O03bnURn14zmv8KuYjo=;
        b=KkobnRaOqhaX4nW/AhcjjZyYST5Ww5WbnsDZWwGeEt/xdNLuakPWESxDE9W9mDet6Q
         f42CnUM1KJrqlyGPGDhxCGPAk0COBp07rkV8LpRfHq5tQOmZR9edGsxPh/5IiCCgrvCT
         E14nFZT0TOUXn8Uz1LaT+6qPWof9lrYEmbh1oyQD3vy1GskBrAH+vc63Md/vfPvcQTnq
         F3a1kNrFlJ6WfF6uDHgEqGe+foUMPd4UFikPIGLUwCGApYzNHFI1oR/5D86REApi6FP7
         pCEDIi8r9eexLMWpL+7xl3MO09RfWdJBOI9W/dsf/MiLGg+1lC13uwXkeHBTRwiWt8VE
         uvjw==
X-Forwarded-Encrypted: i=1; AFNElJ+hZNHZLMMEcpsXVHht/ono/MwZ2ouj9rtlFCCOMUci0RoAbfgqRlu+ltl+17mvRes6J85AwpaUrTCLgj2kNv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+IqYP/4EwecuQqTAthqGY8ZS2au48IXpI4uHjm6JDScFJWvQ
	7f2LTUYuUTiKMhQ6uhSZKv/G53yyhv0Q6S0rxGn/E71ukWkN2R5I5B7IunKCvw/4oWRkwtEin9D
	vzZeEeqyUUn8RnbtW0jPbkxBIFOqJpxYLiQjuepc+7Na15sRvLNmEbJgHqSWAQVEabUSLqTU=
X-Gm-Gg: Acq92OEfu+W9aNGniU4dEYNBm5rURYmrus7VMcFZzpXaR39OrcPR+I+Qk4F9en9nMz2
	2BFJvl5lIAMo3yC6kZwn/Tsfnjz+9jzMUImgi4e7grc/uJ+khbkerrkgNNcEVm5uo0agwq9Am2i
	OIFnXXvfYKVdYhRRb/yxSi0FfphC/ff2eTpL+x5BSFPxeV1mJTt1c3QSXoGYhhHxSe8GAGVN/ab
	fz31qhb1nySNvl29wsdvcN47PQv1MTD3bef8kqHneOzNgdi6HwhGASC0hpeCOT4Qb/SnuZjN13t
	xWmN6XiwGFsUW3kXsg9yUUbbLnAcgzipW270qa0rAWTza3CcUbtEuD/ePyzhsec6bB0JYDqAHJU
	58gg1v9ydLet5cfmYEH74HSARfQOL77peQ34To7FPviWm7tenJMT3xqpswlPEpQ+fFWAefDqXpL
	PAm0uo1wjkl137X+22DTYCKQMaFu/yQ984/k4=
X-Received: by 2002:a05:622a:114f:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-517fe4cac8bmr8368941cf.10.1781224082808;
        Thu, 11 Jun 2026 17:28:02 -0700 (PDT)
X-Received: by 2002:a05:622a:114f:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-517fe4cac8bmr8368501cf.10.1781224082373;
        Thu, 11 Jun 2026 17:28:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7328sm50908e87.45.2026.06.11.17.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:28:01 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:27:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] drm/msm/adreno: fix use after free on error path in
 a6xx_gpu_init()
Message-ID: <naq44ergspdygj47u3evs5vcgovqokpbenblokuskea3mwnqkh@qirq4jd2f5qh>
References: <aiqNktNfXiaPhje3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiqNktNfXiaPhje3@stanley.mountain>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX8yUd6Drd0B0e
 2bELQXhZT6AmOFaJR1Hpu654kWCRU6Lriou3ZAjIQ/YTFiUsZP3YxmWMlgJdENRXpDGCrCP65Eg
 hP77Pfz6z/52s/fJxofALzISpOzTQ9k=
X-Proofpoint-GUID: AKFDIUSopV-i6YeKNxc9bDKSfKEx9Flx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfXxKgp2LLv17Uf
 9sZ+3EbjW9OR+fJKBXfKJzGjU6TTUSIjDvBDHr8Z5N7il2ny68xf9Vogj2eKmJ+5vuCa47qqL6u
 1cFH6nkTOPkLjmHE8iaoTcX3kKV/Hgp249i9qrla5PJ0wq6xYBEvAYeeNlJARpHUd/8WkqfLiM9
 +e0IcKdoZo+yX8O7qMu7FpZJLnI/zaZdrqzu6TflICTuSPKyJ88933SH88P3ThFJUaCqIFw4pzB
 H5tHKzWrEuAcP3x0IC2HLt9NGb3Z+ZjzP183KP+hl+u4e7ABvebjx4M7tMq18BCrA5GSTrajxhX
 +w5x2AkthUAVjQN5fuQG0hhTuvKTsBHTvBO/Ejj8fnaYShfhPF/wGUt45WRgVeoXKXKTRv3fmyN
 4GkJznOgUzsSjlEgzNgGJjdqN+iGWcG3q0KiFJH3xTEKLy09w3Wo703GXz2uKFoe/WDuu5zOHJ5
 kfOqPwIHngMyP+iDl2Q==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2b5293 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Lf4_qmz2JCIWfjkWoTMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: AKFDIUSopV-i6YeKNxc9bDKSfKEx9Flx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120002

On Thu, Jun 11, 2026 at 01:27:30PM +0300, Dan Carpenter wrote:
> The a6xx_destroy() function frees "a6xx_gpu" and so "adreno_gpu" points
> to freed memory.  Preserve the error code before freeing the memory to
> avoid a use after free.
> 
> Fixes: d158886cba08 ("drm/msm/adreno: Trust the SSoT UBWC config")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
