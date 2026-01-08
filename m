Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F52C32ED24
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Jan 2026 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767904025; cv=none; b=KmtYqkSIN9mF/N34wv6KrGzIIv9OnvFITl7c6dgi1BdWZ6Swm6hSXWDy5tvNIQXVIoeZIk4P8JBbqhaJKJ7+Iv3UBNJDlkOvS5Qu+wwzAfY5IOPq10d+z1eoTSpLJCUCD0r4nTye1Q/Y6a1lliNS6zNPkx9uEYvJtbvSAqW8eEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767904025; c=relaxed/simple;
	bh=28I6pMwa0y2iwSMPZ7ds42u0EHyroiLLjy5sqlMkZNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fc9IA2ng4J5DuCXkh83jaUTOrah7Izw99cscD9d8/8tJyxSgFvVYWzSDpRfx6We4aiXTWBK1p0OnTm3P5bAWe4SNmS3gVrCQEU0V0Hx5GVMZ0vYD12p10IvTI6hi/EeZQjSz/lJs5btT93WddTP/Iow3cAsXKJtutIc1QjQnecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nh4WF1uJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPtL4buM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nh4WF1uJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPtL4buM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Hk0Ir408328
	for <kernel-janitors@vger.kernel.org>; Thu, 8 Jan 2026 20:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JlZNx8uv9gR3y5zJqqbeRWF7
	zesbHySQ90ufr4l+JAg=; b=nh4WF1uJgplh2QVC5Fme2/O59F2XyZvb5Jl/DItk
	ryFu8mxvJ9boOg4nDhgOhRKSLvjZ/vN7PNRo15g2desaHU9sCOYWOeMLPP8azP5N
	ONS31DqUZcPy7P02VoB2nc6rHoWKr2q4IYDFWUU7ACSt0vxJG+OwSxYmdkSFFWM8
	Rd9b4rNI3+2Bg+VY2ZUmIIZeO+qPxevNTxJyve6w2W6ZEQjYLHQNnwwcgnSM//G4
	hjcu/HYqtKMlg9eLMcGqGUayItcI8+MTXYZ/HmdsnLRZB1K5QTFIJaZCdL1x8ouE
	bf42SWCeiFT3T3XVs4FZ6QNaaDrZOvX807+AfO9ls+zoMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjb39ssyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 20:27:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b17194d321so545671685a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767904021; x=1768508821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
        b=FPtL4buMBB4aSrdFBWikNcJs/KuZuKfKh6grL12AEjqfW+g95NBLwVvBXUJeAa6hsm
         nD6GLwPWUEVEDTnsTUQrISfh0nF/28BFrcampwkT1K4rg3DvDFKr6Ql8o9ESDY+fNAV0
         2uNS3I2vDmPdia6/GFeUfC5Fmc0NVLnM/FpxPz20A26du0MHedAMur6by8lna+sarQh2
         +xzohPAe38EpdJ23nOvba/nOLPcDXDkKzs85eY9/HEaHOM01qeTRN3g+zK0msuBtMSdO
         2KdhmCYwZfcTdENtjO5+xT9GoDq4mIXptXCm57VoHSOqhCEte2UWc1plh6x56J07YRDT
         IQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767904021; x=1768508821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlZNx8uv9gR3y5zJqqbeRWF7zesbHySQ90ufr4l+JAg=;
        b=nDc4VU4MDQ0ZezmcKgb/VfgMa178kGCFbwcCnkF1yMUKFIlT7f2nlx/xNmcWIrFDea
         No4KvPJevZ1HATcJG7AHaXVODeQ7cusNkPGoQqudMF4pkuHfeiLYYDaElaUpnqLz1Af6
         SATeh3wly9rLoR2PEI8zgSIo369IHJCU9DEazxgA72dy6tsLTsaiio4FV3C3tUv75WNJ
         bMQMvc6+4Srw2vmXIypuf4Qaho8eg4pdYRQ61fCK43jReafbGe8aMxpbIBk7D7dBitkO
         9scDBOzVMkQCIz/jqxVryEiqyXM/lOuefwBQFFCBTTNl5TDTRyUJg5/3H5Ff1Um1JJBw
         Va9A==
X-Forwarded-Encrypted: i=1; AJvYcCWhBjXRrPd++nwf9K3VRimQaYjNv29BXm9OYe5TlNdRFr/SA05Pfxz9BynfOdtpo+/Br9kY7JvGzfS8A5sIAZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNrQJc0k2ANvtrc3JFn4vBdngwnbC3EMWZHXWq+lDvGF8Y+ZT
	HWRwq+7el2AvOaMlJr5oUarqLLgNHKZpVRfG9e1vgTVm8KRFhxga0eDMMrIiP4DNfkRX/wyjdnR
	lU4GEhXzNW50zmTEiJ8cC1j9Cb3aZftzBrhZr6aFWy7EfvI1C5FqHDGEGfjPZjLDljGEe5Gs=
X-Gm-Gg: AY/fxX4PHqTe5y4VIUrod7Oyb94K/1UJWdnzmsNvJYO/DSjUVJoF7AaC++NgVP5LKDn
	O7UJKBb5PYQ1mJGdiwnbCX2iVAWIpn9rZk3mQ1gakFzlw4S6T5FiCx4VLfY79QFEVEPtYd5+FKd
	gX2uby2TA4E094eBwkK4qt791n9qz1hxHfy52JLgg0/ODaVRVmX98EBBS4t11EimyloAMb3Almm
	4HtSpnZSpGFGzrFM79aHUunDfCtOqvOblWFc/mVT4MV8PRq8tMD17LQgc2qZY7ylJCFquY3gm1m
	I/vY8iFzZ+bBLwluYMJfMkRYTcHj/fH9mHD5dCPXNTY5JW4cvxvR+ckWkv7cBUUSqzsu+2Bdd3A
	00LegIra+YxugcT9bL/dWlh1IbFFhrIYh+rFRz3ScfCLWlup6H8X3t2dY8M8O8HtiLkn+d9venf
	gcdx7wBhm9COl7RMwMHfXHcYw=
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id af79cd13be357-8c38936ee02mr1046211385a.32.1767904020626;
        Thu, 08 Jan 2026 12:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+tGcr9iEka9GeEGlKoDUMtAGlIhxtlSoeNxoSYJowpomJjo9Qx3ZXWW6eqP1k6Up9bwnB6g==
X-Received: by 2002:a05:620a:2a0d:b0:8b2:e51d:610d with SMTP id af79cd13be357-8c38936ee02mr1046207485a.32.1767904020120;
        Thu, 08 Jan 2026 12:27:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b71b7eb22sm1324479e87.41.2026.01.08.12.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:26:59 -0800 (PST)
Date: Thu, 8 Jan 2026 22:26:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Message-ID: <tl4a27hxop6avr25bimieet4zcoy35lvmt6rmqe74wdg6si4lk@vlm4osda5y53>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
X-Proofpoint-GUID: 9hn4vBjWra_uFvcwfGf0gnp9OhPiznCZ
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=69601315 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5j6SfgzwYxDfwc0PMj0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE1MyBTYWx0ZWRfX4q01sguWNxii
 dgYi7Y+rm3s72Elt43Kg6/jh1UUb7c3NvyFn15+pU7j+P4hg38pXE9Zv8l5SHOs04jhRnqgvTow
 YRbzLJYobZZ5sPNmXrL+/+nz8CFHLQ4R9+ImmIaelyfbo10qEQoD8Vqe+DIEDhYpb1IlUPj3cJp
 AJTbM8zyOKKrQ5rVw9hU6KkYmmhnIMp/lSbHLZCY391wXZpnvzFmCKajLZF96jEuNeT4MNM2G8x
 YvkmlZ/I2Sf/8UAQVqGd23ZcJcV/z/xd5XDcY2PIt0tHRTGo6GJxyEIhPnFBDEjM7xVfk259erR
 t6gL0jCNumOdDnT6o7Lf/eFAwJiGe8j4uBWgIQ04gl58w8kjMMo3x7F/k3lujPk3ptw7XkZR8YY
 0zAghlldCq06ZOL86VkghLuxwpm6CffBWoiLijFhSXzs/7NjDNEfyJonMmjwGiODhIJfxgLqzHk
 TZPulS7ydQdbng/qbOA==
X-Proofpoint-ORIG-GUID: 9hn4vBjWra_uFvcwfGf0gnp9OhPiznCZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080153

On Thu, Jan 08, 2026 at 10:57:22PM +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
>  1 file changed, 1 insertions(+), 7 deletions(-)

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
