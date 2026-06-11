Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56F3CE080
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 10:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173800; cv=none; b=B2e9gVnRVGVmmstgE8EzQAlNL8TRDVkDg+HB5lmifuiP4w9be//zx/5wxnzNGPJdPxHC9yBTROdscSG3q5diC+82tmo2jUYsnTQaYuVleZP/nEuwrcLr65SPuIr+JHn0xNcXjDZRDSQbj+CxuvuPGeJI0/b3LV3UuNE+kvEouwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173800; c=relaxed/simple;
	bh=6BtBfy3blHmdDbzQ0mHVTFkA9pNVSOFmH6q84PkUHjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+kJhXJilYNBAHzw/Ei/Xj1VTG6YIYlTHhKh3wcJliIHZdk8FqUQO7IFwoIwJYff/SP2gmaxJZbi7jdfGNfxVFYjem0Qwt0cyXEpLA2Mca42eR2TUx0xUnhfEEIXetO1xQfywFa5V4W0VpqxWZCyq6GUq89f3OenlA0NOCuvhVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ibH1AWNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKIAYAbs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ibH1AWNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKIAYAbs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA1Rhw168063
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 10:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsbX8LJfzS1TZMIkwbo3ResQeTNTfuQ6Cs6WQoVUlHE=; b=ibH1AWNMnqYf4733
	LM3sye481UJUyBjAz4Y94Pl8IXMLtxnri52mTXTxtJZihbXU4FmaO1gxGWNKAD3r
	9xdVnyRYvtg3rCPxCd0NRuxZK0dTMOGFxtFITJ8Bdn/yeb+NSneRS91QI8Tx+m14
	FOHZg09oek6hql1MrQplonw93stutFwXWdoENOxRTRhgK+J7L1vEtPJe3HAgUXVS
	RTMMPQxF64ONp0qUmauT3WM2aFZQnqLNNXCRcnnJZwK2BRLSSwDEK7L6LuDA8cU2
	ZTMjGFDCNbthikmmh4gD3ZkcJnidVdH4DKYG9hnLCjqQ74PWKwWwBIu+jCfhPVWC
	ia3MoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uaxq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 10:29:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176891d0a9so19897361cf.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2026 03:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781173797; x=1781778597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsbX8LJfzS1TZMIkwbo3ResQeTNTfuQ6Cs6WQoVUlHE=;
        b=CKIAYAbs1CoiFkGiy4nZC0w4VhpvbMYgBFhzgLbMqnvoG00kCiZ1E/mMCMCDkURxb4
         3tz2O313sHFXejEl//uQl05trklGYNqvmAoGkCP5AVN7Ka8HwojKmZtOHfbDlV9FDnf6
         PZGa1aj+XpklWdRnTrRqkM8Vytg4w1Uxgl5GIazQrRmKLZj7l/LWx6uNaWjR49Mn8Rt7
         i5kmBSgn92OFbK9+LMwGIHdBHFY4jqPL5/AzCRgfkBnh4X+l1qv/qmyWaLIzod6q+A/K
         k2WLvQi1yF3eeLOw3jFODZctNJC9kCmpQrOVuKluvVFMwuEtwAugKMcEWt5VFGKcXRBp
         GdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173797; x=1781778597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsbX8LJfzS1TZMIkwbo3ResQeTNTfuQ6Cs6WQoVUlHE=;
        b=cMgCcyK1qroE269kER9sUm0dSHaBEUCoAEY/Rycv7hE0NCKmoflREk23yPZcuSZ5TE
         9B/DhkQuthrSQooDCwMIwVhaY7uzpEVYz7swbUbzcPCbUGNliV0ehuYaW6cgPhEVj93j
         pkW0TiIrJA61MjEmpkh8kyLHQxeZwwxHHDxM1wicYfLXXiQfCTJVlWq9Q3KFFD3u6T2t
         CzF7MY4jQI0qGbzsIfhLUmrYxOkOi7uM0CdbGoH//zdT0R6b5qs+I2CVrB2aSoxSTdVl
         /LkljEdL1i3tEsZYyG9JNVidLcl/QdZCIcTUONMck2vrk/AuOoGUD8jwTCXhjotqJi0O
         RN3A==
X-Forwarded-Encrypted: i=1; AFNElJ9A+vKRxO/hJvsP6lajPPt/Wfrzby24FcuINFxN4fdFqgRzsaj46USTaO0HUsoY6k21QgGnfeLzNdBM7eV3/Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD2slxixfArCKvg6uiwDtexXxe9ZnriFBtdt4MbZtLZoY3BPfx
	mfbLouxPo1Bm5+jDyUaXtwUSm1IuL21PcZiti5T8zX4tohtYiS+UPqKfybS2/Vb6+hztlMcFDWp
	H4A5YLu019hdJ/Cs/DuAj/iBEmoG/nJzZuEpgA1kvy6beJ3Dsr2Po8WRT1H/fg71vOyunazI=
X-Gm-Gg: Acq92OFCt+dcmH3xB6+lbFsyIPyHznG+GYllXrfeDykuLmpuBzQHGLc+9nHVOf8MSuF
	xrZgE7IdStScb7c5dH5TZOJvDwCGGJ3jpxAgjlDyKGpWqVIrXWvvqbO1QOTs+KHLLq5IF5JLDOo
	o/1gPYw2qe484K9JJ3cTmVizJ5fe/TVQeF82lKSe5B41NgI62jTMDk/AXxaqQ0uIgjW+KQ0sgJB
	sX2PQ0c3K2aKC2If1DKM6T54lTHmULkkPpHZInXravQ5g8Zdqhqf05kPFBwthNftds53MvMGaJf
	kE8cwAyVoU4uTkrBCMSvauDPd7Wc3qhC+z/49ILNESvZcLoqJuqdkiu/5iiUmDOFut1lly7tM3u
	+ULTKilHEsXBjtNcPa9Ol6MVuKbrWVV1ll/hmQn+V20VTWwoGavd827yT
X-Received: by 2002:a05:622a:1dc4:b0:517:5af6:77f9 with SMTP id d75a77b69052e-517ee1d207fmr22539751cf.3.1781173797071;
        Thu, 11 Jun 2026 03:29:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc4:b0:517:5af6:77f9 with SMTP id d75a77b69052e-517ee1d207fmr22539341cf.3.1781173796593;
        Thu, 11 Jun 2026 03:29:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm10778203a12.15.2026.06.11.03.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:29:55 -0700 (PDT)
Message-ID: <90de58eb-b440-44ee-882c-cb52d0f816cf@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:29:53 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/msm/adreno: fix use after free on error path in
 a6xx_gpu_init()
To: Dan Carpenter <error27@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
References: <aiqNktNfXiaPhje3@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aiqNktNfXiaPhje3@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNSBTYWx0ZWRfX5mDvT6CvSZ4K
 yD2IciXAJ+LSArkIZLSrZpxjtyGEzSGS3OKH1LE+S/jiSQkdT1RdZObb+2K2uNspMC2j9IXAV45
 pRozbNq7a7mACOVjVMZk5sJxiqbZZL4=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a8e25 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CLLU5E3UPER3H5ubdxMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNSBTYWx0ZWRfXw60RAOupXyuD
 bhCOUGBrStFrRUKNIHR6FIi7QK9kzShmvFemH+OypTnVhf/TgxUq4Mu/zuzkt3daXsTY5w/RIYr
 mFl3U3DOOA7lpzaE0oXJDZd+nYXPitZ1z2q/J6DrOa+tv96gdXTG12ay21kDX8xg3RMJ4HaU8qa
 oL3kazKXMajsieXAXe1l9syQgVz4y8RL0rarPXJD07k8azPOxtOC+bWJceC7r3Vp1swOYwmRnTC
 DRpMApOpddn65AmTx+lg0AsIq1Y3JOwvX/BzxtA3iynepaa1/xjDRra1He/wbd13YPJzF0q+NQz
 pBY3vjQDIKVIe54y4PORsOyGWzd8D+8kB32JHIxqz+hGfCyP/CykYS4Wz2vK9RfgB6aFaT/pKNr
 lWhH6vRD831HE1RtTwD4EdBCO05ZLHezYWOvAqqheZbuyZ9+G0zl76ppaqqqopybz6Kg9NMQufH
 qaPZmTtI1Q40ujBMLKg==
X-Proofpoint-GUID: Ek0rqXt6219WT8Pt2kVTOnvqHTCJO-iZ
X-Proofpoint-ORIG-GUID: Ek0rqXt6219WT8Pt2kVTOnvqHTCJO-iZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110105

On 6/11/26 12:27 PM, Dan Carpenter wrote:
> The a6xx_destroy() function frees "a6xx_gpu" and so "adreno_gpu" points
> to freed memory.  Preserve the error code before freeing the memory to
> avoid a use after free.
> 
> Fixes: d158886cba08 ("drm/msm/adreno: Trust the SSoT UBWC config")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
