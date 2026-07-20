Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC72246778
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 01:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784511669; cv=none; b=McK8odL6f/yjjtS2VFzGDnPpIi8sF9haARi3NfoDR3PDiOMrrOVQvbv+h1CvWICzksYu77KotZlKw8qcHOTg9MtcnneI2Sx/A4iKR5T8GKhv0PRgx4jPX5hxQ5Y4Zolp/xsvoxcl6XWY+CHbOFanSk0SajACLZIZZ/Cm2daNk/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784511669; c=relaxed/simple;
	bh=JrOv9dhs52ssTF+KHBKQXjVSa0+A2mWnyvWkZnjbJqo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eyi7PDD28I7BFsGiiuTwZVEvBfcKNAu2ZqVFi9OHlJSut230tDoY10vMig7qGR9pYxZOTxf49DhsWh67tJ/oztHBSsC0amlqap/2AX52hepauALUjDMA3/aqiOqya6SN0icyB20yGg/EVueD/errNKObFWcjLZTNXRbNEOReQWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTAVbh6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJBMXo5g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTAVbh6j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJBMXo5g"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtN2F850964
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 01:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9Z6g5fHkujzAVt4hRZEPIhoLNG7GscEXCwnXq3i1EQ=; b=YTAVbh6j3Kwalp06
	YeG+CaD5Kv4aPcv55JPp447+HP0s70t9N3tP3HCB0NMON9JJAQCsR7mMOxXTKYji
	JhS4xhr+E+V/bn/Jqw0CPcG1Xz/idqUx/pSbA8Q5ZbFHJ8n0hvq5aos7CKRGcKVO
	eA7ZZkOuyXVxTX+sYvA96rKyBx+oBcSnE7BhFnd1LwFWGzE1EytclZsHyu6CkmIg
	v+3Qibq+xvwQsz3PQKQNXMjf8uZKrB7VNnPrX/VSyrZL6/niLQeyUCCae3Z4ACus
	hBon2DaNmiFtCY1UZigMw6CwcKknjClkAdJFAoQz6uSZvmRalUMj2vFqrnqM+D5b
	oj/4Uw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc3wqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Mon, 20 Jul 2026 01:41:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848452dd146so14024477b3a.2
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Jul 2026 18:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784511666; x=1785116466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9Z6g5fHkujzAVt4hRZEPIhoLNG7GscEXCwnXq3i1EQ=;
        b=MJBMXo5gY0eNFOfO+J3dkiW4pcbYvAywwdjhaf/8/X81fv12tGECkxpwsKUa61KYnu
         fjqrcyCaBeZfVbmOOEiORc4VQuK/S/bURFHzN8X5V/Jftt2s+Tsc0qmPFRGpGpzv6uJc
         HAVtLuKf37cTLsBIIvmtDZzyGC8oI0MBl0hXJXC9imUAXEnBOBWRWxCBNxftkNOvy8/p
         IQeFjU5QfLoolsSb8d1oyDFiqOCUVLxqiFby2NiMl1PKS1Vl+8N75fFbOW+KDF+0fK2W
         BY3VkNJ1ARvRrn4tKMWoe2L26J8sMcbDddOrINMpLY6svRHRZ6PbUVFE8Xc1JU+U5Bru
         b5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784511666; x=1785116466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9Z6g5fHkujzAVt4hRZEPIhoLNG7GscEXCwnXq3i1EQ=;
        b=b23uqPl4JcfBVMDj2D+Xs411Bb5BYnoVbUbTnYGSGwlC9G3hNGOzOS1mTHD88kJftB
         eBIU8w5iQNOAmbShgMbNK84pPsZ0x8MODtiXuAUmhqO4caMRxk/1LkcLjcaY8ssfG+s6
         8+hjMraeYZowFlTvBHo5CYpNFFG1IxF7DtC2sm+LAULPgDX2y7ObzMCmOwtEU8foAvNA
         i1iA70k+WrNPK0tJ+beKJjcaPxO/U8ALrSIvi/RF2wgbUB62wQFZqB47u0QUh0G89mJj
         osnMl6SeAD8gdLs/nvzoOCLlW6esXPyKBISJnXwDpMvsjvue47mF5LwLHsHr1woYclAh
         5ocQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8K8gOIb8GqhicuqeUbqYE2TpGlMNpkE434AyyVpUOlk2Jvb3w55UAqilY+BZMuzPvnVT+xhwbbkVZUEOnsyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrRLcEOAoVBXxOZXfZt+9E41k105TewmpMuspq652+uuGUyZ5Q
	9lcWb25FLe1MvIE6JZO+7IOFR1s4y5aYajLGuxOWlsFXNGhahoxvG/LAhzPhO7o+xl0O8FmxruL
	P80ayXuzdMwbizvWIVMB7II7uyX91HVpuVS+w+7eRg9QY+vGHhh8YqTb8Z1Cp74A7Nc/WMag=
X-Gm-Gg: AfdE7cnWdCvyB8theQyNnl4SKna4XoVUts141TaMX4ciVBLaOgc6vr3fMizfRVRtgF1
	ZcIQuq54eGceFGWgXSNZ/MblmQETwDMKlNSli1gC73r7s+ed8Ol+h8jJBkf6EhNZ5xvLQfm4PZ7
	d02nqkM+unnrKKGAvBS54ujo8kJKRyoxyNKVaEkdt34+PnYHFG1NvOrWAvlzOPTCAJvSunsRNRs
	6tKvAPB1Aehom2bF367RDyVjjwl9KqB/qBRVhy34XJ64X/zMrTpZNhhwY5ttuOp240wwaLDVTdp
	NPHJEwY7pEwk33RoaUBw8XmHY4cibYH6VYO/e0eUggHJ+0ZWTl5HyFDPF4pJDGRKusCeKF8aCvQ
	5kmwO1qun+iO6g4qt
X-Received: by 2002:a05:6a00:9aa:b0:848:2f77:e2db with SMTP id d2e1a72fcca58-84c2952c402mr11255231b3a.68.1784511666010;
        Sun, 19 Jul 2026 18:41:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:9aa:b0:848:2f77:e2db with SMTP id d2e1a72fcca58-84c2952c402mr11255201b3a.68.1784511665486;
        Sun, 19 Jul 2026 18:41:05 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9f00bsm4748486b3a.56.2026.07.19.18.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:41:04 -0700 (PDT)
Date: Mon, 20 Jul 2026 02:41:00 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
        David Lechner
 <dlechner@baylibre.com>,
        Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy
 Shevchenko <andy@kernel.org>,
        Erikas Bitovtas <xerikasxx@gmail.com>, linux-iio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iio: light: vcnl4000: make read-only const array
 regulator_names static
Message-ID: <20260720024100.42a0f6b9@jic23-huawei>
In-Reply-To: <alZsXBdAJEjkpKZR@ashevche-desk.local>
References: <20260714165740.186119-1-colin.i.king@gmail.com>
	<alZsXBdAJEjkpKZR@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAxNCBTYWx0ZWRfXwZpiwTHylR3N
 GbWabeb/aRRGA3GL77jjfGnauudnce/LHDRFhqsd0bdNSxy9aPriOi+H9p89mJkqQAvsa43InRq
 NUgdsM+T35dnlTWUi1gSOAj8kNPeOb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAxNCBTYWx0ZWRfX/X9BvedNfNcu
 ASITlW3u5ENL1DvG9hRaiz4H+xmV5GXAfqp7JuYQWNzAe6X7GlwyV7pWmvTgpTy7nQVscW2CzCp
 KmBxSVLU1ddPuE4wZ4SZL3pQXULCuF9zRTA13SkdADdCKOP5Vivro/4c8qaZGgNgfqvE1Orv8tt
 XuuOiPK8WRGiHEFc041vHWCDftTgiOIZqYorNWtmMqiYkKQYK+nGlueq0WtXE2YkA8PSmkpMry+
 I9DOXTjH653SOSENrVhc4R9eUp5SCX/Wvlj4dPPIQINH7VE15cK9/iyfN59CuebTykcyckqIrVx
 ZTZecKX8buy9J9Hm5uvuIpi4bxVS3MzkKZmBgN9n0vhin1aWZOeO2NTEO7K7Qt6Ydj7z+kpc3In
 apft2drWXDruZj6ePyj1rGDfh1JaTHPNupZ+cqE6jiZT/M45qapvZXHUE9wNcuvD+cbWdBmR1yu
 mlC7F14BO6nbOD19b8g==
X-Proofpoint-ORIG-GUID: gZWBVbuL0cYq0b74S62QfL0Pe3eRpCqo
X-Proofpoint-GUID: gZWBVbuL0cYq0b74S62QfL0Pe3eRpCqo
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5d7cb3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QyXUC8HyAAAA:8 a=lXELxFmDmW-935DcFO0A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200014

On Tue, 14 Jul 2026 20:05:32 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Jul 14, 2026 at 05:57:39PM +0100, Colin Ian King wrote:
> > Don't populate the read-only const array regulator_names on the stack
> > at run time, instead make it static const char * const  
> 
> Makes sense
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 


Applied.

Thanks

J
