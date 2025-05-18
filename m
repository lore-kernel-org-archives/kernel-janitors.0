Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD9D1C5F30
	for <kernel-janitors@vger.kernel.org>; Sun, 18 May 2025 22:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608126; cv=none; b=NpiAO0B4gCvJaUAwBI9yBiMgUnXBWXmCy5AQrSUjTr2C7yA41cA/k/HqE08zjCr2RuvNmMOaiwZ71vOaoD5ov3uhS0Gky0agL7PS7pq7UjizSQqFGBquAEw/1eZ7OcVQQk+Zm8L/YD//IGrXuM0q918wW4SF713G7L1mJj3KvZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608126; c=relaxed/simple;
	bh=2WQfpB8+kAsksZzSScMuaHp9RFtdywGK7Cm9Y87Kojo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uF//naWesxETbznrWlC/AH6CqOBZnHA2T7KjKwXBpx2DYjTVzU9R6FJs46ZiUXoXoUCwF+w7kOR1ciEHlAEmrC9KVsHZcms1qfeha6webpNtXj32BhZgCGonM98YaedcQYMgcfRRYaj+cZUoyJdG5Fcy6pJCINDvP5dGZTs08Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojyabReD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojyabReD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILPJ3W021681
	for <kernel-janitors@vger.kernel.org>; Sun, 18 May 2025 22:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eaaSG9X5R3zIXOMoXuwdOluz
	DMWxOT1zmAnsMUlIPK4=; b=ojyabReDz3msRcARrQsFfnmzGguOU5i+5g43ZX8X
	7PIkyxCmmo4YUgTtsO6tLHRB636hvU2k+gBuuHEwxfH/+o86Wd9IFEk7krOtjhWK
	GklC2yfmz60LYOfstDEkVt/0dowcSP2rgtwbGSRHsPWkXxcxa4/Kqyis6ZYMgYwM
	vN3TNYgoNOuPmTnIzgxS6IlWBi57RMTwsI0bJfNbD1hY744cthmtI78q3HR9EzQh
	1THujfsWDyapZgK+f9mQNZndNOnbOtuh8onZz9MA50ZoOjpiX2UetHybj01/+5mJ
	YhGRMxHPYyhE2LG8GQFNmjQ2FTSZoijD+Jdh5ZFzejJJWA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9tfv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Sun, 18 May 2025 22:42:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8bdefcb39so36656646d6.0
        for <kernel-janitors@vger.kernel.org>; Sun, 18 May 2025 15:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608123; x=1748212923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaaSG9X5R3zIXOMoXuwdOluzDMWxOT1zmAnsMUlIPK4=;
        b=QpOK3sLSRzPnv9y7/zzX2KyCxpsYfLHdqsdalHvplV9GoEHmGbMzEiVOpBN3Ymw+x3
         AJ4bpyJcdu/zNfRfResqPjxc/7dqj+rRhJd1UQlf7T2ev1oL1aW5kCFu40uCpbMXln7r
         1dv/VLqgrqV1mJgx5qRTwz5m56Jm4+cqI76pgGdz8PAYq9smRSBi1FEg+lqJcmu2KOeI
         16ZbFQT9pXLPRBuUwMsj1kPPDg2YNorh3ar8f8k/rSMCySfLtztcsekx+a5uIHVo6cOE
         OO1+Bhme892FfcB2aCXTwrShgbcK7bdS0IyZmcKz3ztcwCK4jcUMUYf3ZUnygz9YAhdN
         U43w==
X-Forwarded-Encrypted: i=1; AJvYcCVHnW7qMDwgGj9mqrkpDLEuwn6hJIkTU2biunRwv5IY06AVQvZNMtPfNeL63CB4/1neVoTVQwlLG4JKL6PGdVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDFA6ScUG7etv4lWuKMcjw02myHSdw5IQ3cgq+iKpF4oHsFrMp
	uUzOX2Y95uYCKyZWvK0YdZik6S4SBgb9S6mDYHtKELwJGv6k4/FQZOhiXPTTwzntjnoDMdMhuOq
	Buwn4ObOApVdMR8el4tc+eGoqBMf/stj3Q/aBNhPCjyNMv50YFkc13sHg4iukbo4Z+6H2wJk=
X-Gm-Gg: ASbGncsET6zVOyLs15Zcms4y0J/vVhAV15IjkONoL9qyYJjvQdNadTEY00d/SBWCe3G
	cyY31D3E50ljL4HaPM432JCeOBUf5UbNGgJ3YDGqfYP9y6Lj8yBKiggQmbyDTqWN0Oidku17fHm
	B2xZMy9arglrcYUhroEIsmzjChCYA0p2AypvntZFzdbKRdzEy+wW2kYZk1Dc+D4JaAEsp+x1/vS
	lHnszCMGoKkza6zx/rWSFtKYXy4XlNQWC0FkxE55bCMSjEwUfv2Cz7luMev8+tyGo5bvkhkVhd3
	oYH7K2jylPDB2xtALrAzic3WDUB6JvYa76f5eoG21Sl6JQmks3Z3vL2uywhRDrNxz6Aoe6q7s1w
	=
X-Received: by 2002:a05:6214:262e:b0:6f8:da7b:9d2f with SMTP id 6a1803df08f44-6f8da7b9fe4mr15487796d6.20.1747608122840;
        Sun, 18 May 2025 15:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUjV8M+Fj2g9HbnyHkTiE/hYtX208dk0WrYDuNrnpAxFDjqyRvu9ixEuA8DIi/pbCTpIxB7w==
X-Received: by 2002:a05:6214:262e:b0:6f8:da7b:9d2f with SMTP id 6a1803df08f44-6f8da7b9fe4mr15487566d6.20.1747608122476;
        Sun, 18 May 2025 15:42:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280ca53e2esm15185761fa.89.2025.05.18.15.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:42:00 -0700 (PDT)
Date: Mon, 19 May 2025 01:41:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom_spmi: Constify struct spmi_voltage_range
Message-ID: <pxm4kekb573zz2cdjgjn5rxlr2ipneaoxlqzwkcwhctqnqm45h@pdgediy3o7tg>
References: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef2a4b6df61e19470ddf6cbd1f3ca1ce88a3c1a0.1747570556.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-GUID: 1JvV5k-O24TTNQKpukxfByJaK_0vmHAB
X-Proofpoint-ORIG-GUID: 1JvV5k-O24TTNQKpukxfByJaK_0vmHAB
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682a623c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=gpGGzw82cXZ8HdMEZUsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIyNSBTYWx0ZWRfX3esoXcAbO3mB
 R6pqVwHbi9EWdvH9diL4DezmVEKlCndmrzvVVgV1Lo61iVjkPy5g0qy1V1wpEKXG/sSX23Efqld
 pMBz2Qojeonn8jTwr2wFRbKptyVqVGhJOQc14GbzwgK9zCGbS2lkU3hvVrPT2QzzSL4PZ/0W2rM
 CoJmBCUBUH6872LeRgyLxUETK9NBYb5LNm8YW+93N0NfyObj/gqlx2r3b6Op3o9Xo+sU3xIUcC4
 hKbjk37gyDczAH3f5l7d8rrjrnfpr7HPoxHVYgVrjCp31o5D+Qzp95f+bIAO14QeEz1pVII7ZIs
 ZI3/3Bl9VHuu1fTcYHIoc/hxL8ltnF0TX8qdN5TBnhezzW5Hu9+AWxn+A0l4gK7LdokHBF82ONy
 9uofoUiuXktGo8pX3Kr0mPAplkwTNg3EQgg/2I3+neRju33qTKsAR1x4oeGyF0LI84l0NKG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180225

On Sun, May 18, 2025 at 02:16:21PM +0200, Christophe JAILLET wrote:
> 'struct spmi_voltage_range' are only modified at runtime to compile a
> field, n_voltages, that could be computed at compile time.
> 
> So, simplify spmi_calculate_num_voltages() and compute n_voltages at
> compile time within the SPMI_VOLTAGE_RANGE macro.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   85437	  26776	    512	 112725	  1b855	drivers/regulator/qcom_spmi-regulator.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   86857	  24760	    512	 112129	  1b601	drivers/regulator/qcom_spmi-regulator.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> I've also checked in the .s file that n_voltages was set initialized with
> the correct value.
> ---
>  drivers/regulator/qcom_spmi-regulator.c | 69 ++++++++++++-------------
>  1 file changed, 32 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
