Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640AF283FC9
	for <kernel-janitors@vger.kernel.org>; Thu,  9 Oct 2025 21:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047010; cv=none; b=JwSKTscQ8/ucGXseWyP5yVe8o1brw87fnSuwOx+CKggtl55x5zsW5P3sbLzOMYrK3SLwymVdjB995oX2xVUqsLjAXI9tsle9svfmI7/fnfn0JzKr6lg5LtDSCrYdZHUFx1cX4CCp5YQNNEYeOUmIapW05c/zIgXbZzm5NoZFNVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047010; c=relaxed/simple;
	bh=0OgiVxHxuHOwZl1JtEffwi7VWDcOnNxQta3JJsmBPCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6GlgJEJOLA+2cNnssibPBdLPdbRHkh8GZIvFYnhZO6b2ksQ1De6bNxw3jkXIYI3bYvKKIvuYT+SLWmo30W3K2fTYXiddPdJMwYANC5sv6LZvcLmrUQbPAFblevjnyiMEklhpDCGT/MadCnGUagAeZTAfVt9n+9NcjqOIfZFIMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyUTD9rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyUTD9rm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EZsBp004144
	for <kernel-janitors@vger.kernel.org>; Thu, 9 Oct 2025 21:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aXc6K5FtfcVXCLUBSxVt1McR
	pcSj+yDNhIZwNeN9Dac=; b=QyUTD9rmA8NOJa8IAHnoJvNHyfr1M5380oyJsX3b
	R4DqEb+ay1JHcls/T/Hh2H4+ZXJdFtqmUuZbM3/oG0sX8n8y1/VE7RONq8l0pkxM
	njzgs115RQ7eMC8o+DC2TcEU2zR9R3uDau0fRg2krkRwJeZLiVn/O/1WFFvhl8fI
	kCUPEmG2MuZLbuhYawhUHGsTa4mMmcVViUxmShgs6d0LcjAmRFeDcUEEhHAH1Y+Z
	7vLtyLuUScfZFMon3sCuyCuI1AlG8YCvgNEkigwWYn3euk+fIGWGGrzbCoULSYu+
	Lio6gXm17TL58qigBe2HL4DxdeEvdDXgXaXeg08oaBR1cQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4j4deq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 09 Oct 2025 21:56:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-859b89cd3f2so480705485a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Oct 2025 14:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760047007; x=1760651807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXc6K5FtfcVXCLUBSxVt1McRpcSj+yDNhIZwNeN9Dac=;
        b=ZHvY1IZKkbCI0BsD6t7QJ/NoBQcLdFgrlZIJ7tHNhwlXwCxDQXM8mQen7ThxxP/CTt
         4f+u/FxtZDP/B/szOtJwM5pi19TAIuE6P1Qm+x76iRiJJUWTt0AjwHwkPqoA4ckTEK0f
         CjmaS5y8tlx8zSQd5SXmjEKdmR9NKrp79o43SKWG/djKFMYXNYgA6KNlUKf7n46OcPoM
         whPIbylrcrX5AoqqW2bLUyLaz9DJD98O/+y3/qdzOcf4f8ZEYrwhC4m15vipZtujL/E8
         Zr28Mw7deiSgSrBDDaHDuGEjzSoSv/7LZidZMovKXTVX6Zi8fI8+x86nRUZu2ooQhdF0
         USUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaeo50MIasbq6+TtmDJXOXokjJBcFtY1EASaE3r9gsRmaYalashh5XjR2WenMPCUaHDmj6QWKfh3u/pHy6Fus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6wyQt6eENPIZUbC0N6MVTxwmkx6hhTx8Rz6SnWwDpldAGylgb
	fgHWjPliC4IEPuE7mee0Q6H0ANdgI9wglGKUUGbSHg8sXadWxgNTH00jQJWzotSQOHprsxIP8TC
	P1x0WPlIA4tu5CXxZcOayOVT9vArI+xtDo0Iyb8c+fcGmaCXkBqQnYyX7QIJCg1OEU4yKxmMZk5
	g2cxA=
X-Gm-Gg: ASbGncs/zvA3ffJzlHNX65aBX8epmAwkeZDW773dfAVXgh+CG/rZQg6LWRgYUcmP9v1
	/u/Eo0G1yJAqKppyHnhmf11eT9Ttf/cUP88qeqGdt+OOJOyk7KStFc52X2Tq9NgiaJwoKrrIbhj
	RwpyfPYq9nYsmdk7e1H4ac5oRLt6/B/GFNoF2UIMPc+pTxvCdQk92mg7a57pckb1LQEuDG6IF9O
	tNvYkxQCbkk5zos7hFOApqpYpUKHCRawUawfrIsPo2JLMd/oSeC+nbYooUJJKBxGA2M7+m4MdIU
	qo7ANRjczgTGyrwO9iVNJHUGmck9T31E/cSLMERvtlXVuWNv8lfFRDCritT0FsJ5YV1ItnEuyzA
	oX24wiOrAK0orGQuwqACUhv2RK48pA78dDxvf8jUz+srHBBv8C0uH3MitHw==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id af79cd13be357-883502b5269mr1331694585a.10.1760047006490;
        Thu, 09 Oct 2025 14:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSe8X1c6l0Woc6nK1FL8k1XI8rlfvjiZmvEQKYodTgIRwNv66o2mRudxwpcphaC7lwUMm+yw==
X-Received: by 2002:a05:620a:1a05:b0:84d:a352:1853 with SMTP id af79cd13be357-883502b5269mr1331691785a.10.1760047005925;
        Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm225146e87.7.2025.10.09.14.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:56:45 -0700 (PDT)
Date: Fri, 10 Oct 2025 00:56:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <vipgohc4rdankw2lcitdeypzpnqicbpccqcs72e37itpxj6wt5@5govlfjwyqxl>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-GUID: Iftiuvj9OcHDueqR2SqHCPvlI_6zCB0u
X-Proofpoint-ORIG-GUID: Iftiuvj9OcHDueqR2SqHCPvlI_6zCB0u
X-Authority-Analysis: v=2.4 cv=f91FxeyM c=1 sm=1 tr=0 ts=68e82fa0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_rVczFtdL_8dPuQia7UA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7T0tZY/NOtx/
 KjGyQ6IgFbuYScBuXuJDHolVdT6OpjvVm4lPuoK3Cosn1HPJWN73sFqY5DP3Lrdae8lvEZ+EU2N
 rQnSsl2Xfylk5ruTKiu0Pj49Fx/CapFRlYqAUF9Lpvca04oGkFlaGG2YmvDyT5ZVrIfWI4IXwpz
 c+EPDshRKgEUUO127zTdfWUV7nG94OmirUTZPE8njBCVC9A/NTRCgaB1mYIs36m9CG+u2PumqoQ
 kJo514/HZsv+CBJ8we3ohb/CQPYYJfy5IdUxpijopAtdD9UCbBYxMV0hT/zmir2+lZs3WCMwPU8
 XQkqMVOdadT/0EBPJCKWOncd4pbX0hespZKIFbz9DBFjXXRI8VHK5Gylxvraw4tJYeDSTHa5EUD
 V2Wl7JJfnaEr2Nuxpc1JmaO52dEs2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Thu, Oct 09, 2025 at 10:09:32PM +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
