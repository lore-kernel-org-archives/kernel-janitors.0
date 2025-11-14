Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265BC232395
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763092280; cv=none; b=kjY2FuASs58lMGJbTa/0qXscb28ubYg2XHvsRqQVpNn6+qKKO2mcg944MgGOPRc/oWhkHFpiX2F0oDJZh1aiw8Zo+Kve0831ZgfE3OH1D+lHkXbuQlRD1QRptGUSZBsE1z+WxVrILczkmiqFVEtKanXFJpO6HiNS+Ltc58tFpJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763092280; c=relaxed/simple;
	bh=JxiSen5cCIxQYPY3v1OTx2nSNNdt3Kjhi6LAWhcE8+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSBZX9qayFYNKlwqv3AGD5Ic5v/iOq4b12+pH2YPu0ht6ArW11ty2f53b5GRNy/bu77jBeADHMPK+v3sLYp5Uoj4MCeXhbWnPCpeXeBDBV5t67Vejvf2jOXc3JleWCeTz7+T8L6y3J2PvVCMuY56DdBR4TNC7UwYp9kUEt7YZYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgEEV9dv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcB+Dytx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgEEV9dv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcB+Dytx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaruI1609784
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 03:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WA8Pr3rs98Cbnt7QTDamV871
	sv4DYRXzkpojMhmqMxk=; b=VgEEV9dvKW+QCdwH8pegM62gA6GJZWJc1GLg8aeA
	CrqQlVMH5qtq5SK1slbIkPHJX92pOqrJc2iVUC9oqIo07mu1k7YaeFTdAD6+QPjw
	Hju66sMzCVEojW8XdZXjAzgJWX5ye1fZFj1eSt/1XmteeM7XwNBf7FpcbVNdgeBf
	Prhop8vht8mY+2m5eHvrZSV551UG3CigtBbq3DU1Wxj7lkPsBDdtXFNfwTj6uKKl
	2RLkoBwnt33uFSUxHdZghIpjVy9+BHEamkkbYmTVyn32TnchRemeqP3jf4EQNttt
	SzHoSvBhqbYKARVvZj2JWAY3NeLh9FCzgG6erFNSoQTYAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h0q62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 03:51:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb34dd9c9so43170961cf.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Nov 2025 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763092276; x=1763697076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WA8Pr3rs98Cbnt7QTDamV871sv4DYRXzkpojMhmqMxk=;
        b=gcB+DytxK/7A8g0fgqYz619NA86FRhjuEQW7Z35mlWP5lmoHEu9o8W8S59xjRttzo4
         vWzyYiP7BnwpOafOZT2FdBW5O+QEC/rEMCnbFigbzVX4LMKzBwyUJtDYOh9Xuj0JPf6B
         khd4LEggCyIsm4j5gyhtXzNsoI3U7PHxIzKsbOfG8BwoYDFkbi90bxz9d91mXQlwCWb2
         OzY0ibtwbkhFm8yW+a+70Voh0XCYKVZmUjoh8qXWjMqAoo76XJEfgriu2I/fWnzar7A3
         AcZ5GQXP87Ar07HErAQzEcCGzKrKkP3zMBxJtofqmhsKlDWVHc5hyEKKfPuKFGozcwTz
         PwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092276; x=1763697076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA8Pr3rs98Cbnt7QTDamV871sv4DYRXzkpojMhmqMxk=;
        b=N8K7CVqc2BCERpMwpscVfaSj4HC5Ngi80SzFym1sIb5S3IOqy6nh+MFndwxhpzc70m
         UdnzaxcPpwrbpnmw7gtlHQ5DFd2JUTW5jESBhiVmy10mua3TkjUUvNdc5okWZm/qp/2A
         J9lkvpMbkmvqEDD+wgEYCKjf/VGru8gFUmN5q7X0zM7UzsR/XM3VIZiQkQuvGrhnLR9H
         MS2/87Y3FOg65wdv9RQglnktZhIcMsfSRBNm4g7HaRoUyZxBhyHIJgZ4rH4aI+bLlbPJ
         73ww4BBIHv8CQ8f95GGztZTKG0RZor0GFNxAyFISJoGKfWupywRwrPLg7KZwYJqGs4t4
         +spA==
X-Forwarded-Encrypted: i=1; AJvYcCVNVQnphDnIZOQnG1tMYj8po5RQyPjV4XoV2/DkdM/3K5LZKc0rCKD0UF7xkKsGKcZLVz2wiCrdJX4hhMXdJ+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy552mfwNY2gnw5Jw+JLnSXFrDAeoHBUynVqYuEwCccg0OplUQi
	JIP0acQUuAtdSC4JCqq6sd0n2W2TjCtp2x8SikJhu4mG6T1LN2igf3GKR0P/wadfUHQ1Mo6GBTt
	Mon3jYQBh2Y+fkRHr68D1HPqSm78Gl5IX7q0/bX616owK4H6fLYrUFyd0WlRSEIFJXuNBkbw=
X-Gm-Gg: ASbGncstenCBnIK2uC33srzkclEoXAVfR7+bYvXmcW5DilvoINJRdYfn8UgaAc9ADwa
	vVq9ENi7weUU43aY2Fwt9eRNc/z15SDa79AqB1dSLXh0Xs+L43u2FEw5KX5bLmnbWNrTmV06bM1
	8fwA3en0Isd+TUhOkkqY17HzjYkWRx2fZ4rljR/IBHjbTX9EyTG4JvSDNGQsHosndr7gdiId+2F
	4AG7TFzrgHtE59jzsyWDQEjxJwgrDC5AEytD+M7s7RRlMzWs1f2kg0apqF3wLr/J5cYX2Wmjzla
	HLI3C5461I1GrEs8LpJjw35c/nmR/yviPcQZxvt6a5RH2YBmyO0P9IqVC3UUL10/wFR7wMmMWKH
	rJ7bjVvRDCpqO3RcuMSGtsEAnVpEnOIgoYjya987ZYiK0DMbRJor8SZArrcteCGRvVQ3iPBbwLj
	B7j1/M1X30taCj
X-Received: by 2002:a05:622a:10d:b0:4e8:8b15:3180 with SMTP id d75a77b69052e-4edf21647ecmr32176881cf.70.1763092276380;
        Thu, 13 Nov 2025 19:51:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGglGhnKyfb4md0LOfiFtq5AkSBtaC8cwHdC1+0NXzOVrGMGqvfys6xNubxOq9fdeveH3rafQ==
X-Received: by 2002:a05:622a:10d:b0:4e8:8b15:3180 with SMTP id d75a77b69052e-4edf21647ecmr32176781cf.70.1763092275932;
        Thu, 13 Nov 2025 19:51:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056c9sm797010e87.90.2025.11.13.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:51:15 -0800 (PST)
Date: Fri, 14 Nov 2025 05:51:13 +0200
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
Message-ID: <3uwuzwxj5elwpciensgvcpp5vk3x6f45jy4qvnysw4p72uanx2@x3v3lesvuewm>
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
X-Proofpoint-ORIG-GUID: IxynumqWtGDVsiC8coKML6ZWm7-dZncW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX/cKKJ85gHsBa
 BGfZp4KZac/R/BORPYxte5MyTyIaUme52B94MyAboq7ERy/7PQmywelDtoZYQPVDgXT8EhJfo84
 1KTrzzjJqJW5/XxqDiBElVq76D6UvpxEOSh4sZxQQzw+I/P+8nGDLqUXwfdHpfdCtVxnPBh2vfu
 ErINwjUdqWMSa7Z4Wg5v2lVWBFGzFp2hRZFuxeubWEg6CYxcoXXTPcW3myHlv/A1VqxF0f1Kxk5
 rqC3pxOqXuRXzAHO4GozfUuRtIanftjyZIA81NdVsFR9ZmRHOsdq72x7/N57ytrrAcbsf8uC8Ae
 9yKDfwBP1K5zghzrZvZBPw8RqvrnDQy8Bp6E53aNObPCzc5rwDgUxinEfU3vmJagOBcwN1hCqYt
 tAoZtIgonu95C5CccyI3/SenM1VmxQ==
X-Proofpoint-GUID: IxynumqWtGDVsiC8coKML6ZWm7-dZncW
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=6916a735 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=_rVczFtdL_8dPuQia7UA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

On Thu, Oct 09, 2025 at 10:09:32PM +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>  1 file changed, 3 deletions(-)

Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")



-- 
With best wishes
Dmitry
