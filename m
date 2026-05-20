Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32137107E
	for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2026 08:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264427; cv=none; b=e68Lgx1rMoSkB/ztY1OlyYTsoPwj4uZxwKsFZA8Gsbo0XYpCvbZPIMDftOSTjs0dsOWzBrU+JCHVuVHiK/tD8Kf4EZ7e1/Ne2opKbSfCnkYQQpsNNQEPcz0GZZj0bFPI9Q16e9fyENvpZARe/rBE6Ro4S4bsmFlE1RwXgmGqqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264427; c=relaxed/simple;
	bh=doSLGbIUz9VSQbzQuG9/ImNnE2z+3bupLiKkylWPmm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSYD/Qkc/4ixMHsHjAJ30Lh82q7ijEq8lZefRXuw1SvH8ah/4Hj/fxg0bix6cXp8oapG1tHdUz48vbHQcNQPC3ceavnq15y4fgqrkXv364Yh4EEXpvF9bjfhFFG4sjVcUJNC+kw7n1777KhRfYNdJ9B8XUd6t4aI2GwssgDAYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYjAP1v5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hr4ZpGA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYjAP1v5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hr4ZpGA4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6i5qV1237838
	for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2026 08:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T650/7MaBBkMruY+YcsiqlMz
	u9+Z1ZdRxXJEofivwyo=; b=pYjAP1v57ijF3+to3SE4aa/9Jv9WItGzu6afPG77
	mrZ2GMD3Y2v1VL5Qxa6poWFL7mYTfZ22aVL2UniJKCC0ZmfHWnwgxqYURr1eH5JZ
	adG6WVvNGkHwnZfiO6Wq7JuVi5eAmI0wDktbgGAQzlbGUh95nkP+AXslYoaHJV0m
	0iQ74a7rn63cgsHbo7waErro80s7mzCiy92WYqDZ7tmQ/HF7J4ag4kQunVXf1Sfx
	F6QMn4+6fJyom04awa32JK5nU26kMthA60nInQQqHIaLtfp4fQ4GbZbFr174ZneP
	p6Latchcev/seHQJppO9MwOUhmmLVH+TVUgBn70i4R3OdA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sut9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2026 08:07:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso8005351a91.1
        for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2026 01:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264425; x=1779869225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T650/7MaBBkMruY+YcsiqlMzu9+Z1ZdRxXJEofivwyo=;
        b=hr4ZpGA4NyBouedfFqSWpKPWzFaHgOHscevvTXhu0QDDIUs6fKntpoA6ZafWxjJB1V
         7uuo3fQOJbuEC9APTKxuY3mAq0Qado8JSEUZS/gPnTxVdN/50wjRfiVoGfMYv7eOJ5XT
         99bHplqPR69pnODKGEU2WNr4M7EgB92PxjRiqgD8ZLhEbdnV54mIyfaerEzcrIbrlSyE
         Il3d+cb3PvsJL+UHyXenokrxL8OlnKIQZe239qpBI6Kq84oHSNyZZo6N4MApdW3BLaNM
         BRvH7n0v6W2N6Bnc5LA5jEKKbfMq6lMRqBKV60b+V6uGW9TWhikqp+RM07tjHFxtNVnh
         KREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264425; x=1779869225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T650/7MaBBkMruY+YcsiqlMzu9+Z1ZdRxXJEofivwyo=;
        b=ZSFg5TpsyfePg+JNcH3BlQih2kHucClg3ahM+VCVMR6b7riio7mqpU3bnbSqMpWpLU
         oozjNgJHaYpuq6/Y6rY52NylbanvpoqphqH+i73t4upy2vF3aZFHZj8AW2huyu9opyV2
         2n9GwHunMFTuhrIU2+yPP8ZnsRUFQVCwc7IzJmEVQuMoxDjzUPe9EXsvfJvyxW0Lgv2f
         BKBV3zljkArIda/+1BDgNTHbAhPmsB0/Zf3eE/8Tazh0w7gyDtN6HNKpX1r7+Tq+Qdy5
         gI0fgHutVeem3u7RKNqWnhLEkMvsrsDRZtr8CuaI/Pueza/JqCFeUsDhSEG6RxtcXlXr
         9qNw==
X-Forwarded-Encrypted: i=1; AFNElJ9vC3G6sVeg4xcnfQ9eOQHxuqbwh3rsN/AYgnqWH0tr6TBRSrkujqw6QKTVtKh3VWGiyFWqEh0q5u8Di74uY0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTZASAd4V1IOQpJIYsGsE2Dkz0mdeE7L36tNHZdvLbqucFCn5
	I82TSrA5oitcWgjQAugmg7ks89xKkJFcO0q35ra0VysnwpuMQcoetgyqUAUiWenJyaIK1vqxOZA
	+xWduZ6czspeXDvqEKQD03rI4Hzte12Y5OW6P+S16lo11AdQcIxWov2QmzruV4iGJFH0B9TQ=
X-Gm-Gg: Acq92OHqnvFs3QsUudO4QBuiOPkzV7LfcqhHieReR7X399Ob181v46DWwK8zgVK1lyE
	N2LWriWyD1a8V/25NPugzzc8OCscjG1gAD8wK/b6L6K2E7AS8xSJAI0kM9ib7RgMP332h+gBpgk
	uIOosy8GEi2xdE9c5XRF2uaRlKUjYbw8wEsaMLAvC/MFSzqr9dBlS0VoFMPmU3YDXvU8eldfI4o
	GQawZy3RyJDzcTy42XCIDKxnMwALF8U6yDlPCXaB5U8vtRrCJ4nAhA0YnheVqzj/pwW5aZC0Nt4
	m0m4pd3H/VB6VhHua04rrPodeOU65GxqTxrsOiiN3ZjIJdj9fUfnrHFiiMtPv1pAWsWkrkvUsn8
	6OjkqHpAyoVdIc5wFincDkIMO4KHax3CebYSwtyNMikM0cAeFNAwprvt62xc=
X-Received: by 2002:a17:902:7244:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2bd7e8fdd06mr167260385ad.24.1779264425183;
        Wed, 20 May 2026 01:07:05 -0700 (PDT)
X-Received: by 2002:a17:902:7244:b0:2b9:87e0:1f80 with SMTP id d9443c01a7336-2bd7e8fdd06mr167260115ad.24.1779264424662;
        Wed, 20 May 2026 01:07:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm209236415ad.60.2026.05.20.01.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:07:04 -0700 (PDT)
Date: Wed, 20 May 2026 13:36:58 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] soc: qcom: llcc-qcom: Fix NULL vs IS_ERR() bug in
 qcom_llcc_get_fw_config()
Message-ID: <20260520080658.grps5dsesc7cxdqf@hu-mojha-hyd.qualcomm.com>
References: <ag1N_rAHEQ1YJsa7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag1N_rAHEQ1YJsa7@stanley.mountain>
X-Proofpoint-GUID: amdWcXf932e_q-_XY9vaiId5yc_SyoFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NyBTYWx0ZWRfXwHqgZS2SC/t2
 UEblcv3tVTFBaz+dgkV8v1xKrv8gc0y1LQozE7vEkdVMwYfLWWgW/NK29s7tIe6JmT0XUbCROqO
 p/g8Pw7YOhRgHUqefId+KNUx486B1DVzl5Y0iwH+XA5WvfwHB1KkNLpzLC+kF4lG47guIPy2g2Z
 9SwdR3hKnofBcHuO+lKjRi7U2349/z/m3jJwcVkQ3jr1I7Q7deHth0OTtIEV4b4c+3b+4Pjcp0X
 Tbji7W2I9rPuDSAeIxAYSHvp7z18lRMWlQZAT5XABtgk2J8OQ9hU6dNqD6V3XkeJi29ODQUunHq
 +RDRpqr7IH2gsd5G61dSpj/QEm8ge5Lt5lvnOFZDirD6fF4p7+BoRqVdm/sYt8p8QX29fhTfND9
 J7bK4F5cQJBHJTEULmjm1RF06DsIGWaIVx+Bq5vk6DDwr21git22gG41t9HJBF1AmNnoPYn6tqv
 gEYVrrlKiUjArDBpQAw==
X-Proofpoint-ORIG-GUID: amdWcXf932e_q-_XY9vaiId5yc_SyoFL
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d6baa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=E9smiYq_Guv_G-xNp4cA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200077

On Wed, May 20, 2026 at 09:00:30AM +0300, Dan Carpenter wrote:
> The devm_memremap() function doesn't return NULL, it returns error
> pointers.  Fix the error checking to match.
> 
> Fixes: ac23106a9b9a ("soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Duplicate patch

https://lore.kernel.org/lkml/20260519023841.1995542-1-nichen@iscas.ac.cn/

> ---
>  drivers/soc/qcom/llcc-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index dcc08f63e020..2006bfe198ea 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -5231,9 +5231,9 @@ static int qcom_llcc_get_fw_config(struct platform_device *pdev)
>  	}
>  
>  	slc_mem = devm_memremap(dev, res.start, resource_size(&res), MEMREMAP_WB);
> -	if (!slc_mem) {
> +	if (IS_ERR(slc_mem)) {
>  		dev_err(dev, "Failed to memremap SLC shared memory\n");
> -		return -ENOMEM;
> +		return PTR_ERR(slc_mem);
>  	}
>  
>  	ret = qcom_llcc_verify_fw_config(dev, slc_mem);
> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha
