Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF9202C50
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748036594; cv=none; b=P5gRABtdApPMSnfgr9vu54d4yXQhwFPYUafs9WSLYTC9i28fK+lkRKjGw1mSFtX4KgxrcDBaGjsCSXw3MgycpkmH2q6Go7RVMCNplNFwH4fKVe2a6fqFPs97sf7NIGegwRZzlMXDzqDCwTFK1GefB0C81MzmhT6nQQA8Pz9Nwmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748036594; c=relaxed/simple;
	bh=zmqc7w1XQdZKiY9duDOtn6FNuNtSt44PM697KAQVHGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lmegk+w4of7icuv0Vpx98hTXAmyKyFULCV5ZZj/0fwfNfAmqeDED6iRVUMGhz1FT1RF5qs/LXVCJ+680qYtqbbX+Bb1uAJvCkGIs5O0SRDnAX/PnTbR7vD0FsmLc7QGxXO0ucl/EOTd9th5L0vco6WqfWojZj0VdoNVj0iMfH5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnPppKdC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnPppKdC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAZDws013410
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 21:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+0WOrSLVzx1QmMfqvPr+uPofC1Unku8ELEwf6xozuw=; b=nnPppKdCeEdY/aTT
	gObDXhuTLh6YVJWaP+otBQmd9IyrT5JDAuLQw4AATwIcQnAyK4aqbcTZZLDU+ptg
	zHK5unRflPwBDMFaqjtUSsxAPdhbMEgRR63lQjKt0wDwsHhX2ZZTVok5KtPuDm/B
	Gqs2faL/o3bOZpUP7ZbBTHbwDPDx+Imb41at8U1PkC4OHNfmIU6Ga0/OJjQL4l5A
	ktfYgXe4HsQrOYxaicQYG+PW8adXCn3Wea1XwxDjZH+Gx34CUXENwREVOERKdGvF
	Rqt+VTZpJCaGdudCQXuv0X5JdyNN4CXpJyP6zm9UJBjPaTCB8emUVG4Lar19llVd
	IcHmZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5kg0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 21:43:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8cb4b1861so4391106d6.3
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 14:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748036591; x=1748641391;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+0WOrSLVzx1QmMfqvPr+uPofC1Unku8ELEwf6xozuw=;
        b=UkByXsqIXBTuScaC1EJ07pK1T/B9yrbHAQH4rGeDDfv1ABBPaeMPTFmmr7lMMQRF4f
         kIEZKl5kySzm8lyxjfkbXYomoEVE/GDgerb7BOOfMiu7j0/r5FFI9HE2sSzN3SRKD0N2
         kkR3ZB698y2mouK0lF17yQppFjDTHuMcm7sxzmn8K0mnMDCKhCXzPqwDQBrYqnQNeX0C
         jBnsPYMwawr7IsQKU/o/VFTDq2pV20Iu85lHZWv20q8GsIWIacTrLbDmo1fo+kd5vtys
         NklvFo61/o8ITVBsSO787vlAG6DUj4Sc6X0g9Qu12BTwNt7FrrUN0C6XLTj9x95kVmyN
         vEIg==
X-Forwarded-Encrypted: i=1; AJvYcCUjJh9GqwmYBcQ/hmDb1StxZazI6IDHadePlBmnqyyIp5WlmyfF/60RcCklGH7eR5Ew0vXge3mVzynIaBuPw9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSFT7h8e2x2O/Lq1vqOENlfUp0Z03V2TErJ5F2U8/S0K4krWXB
	t6+hST8+PwuGy3ldZ1QyFhBeQ+2bbQi2iI26wXe/TL5whcPlCxRTLO0iWoMKwk8hsBhp07q9SxI
	knGPY+0o1bK/V+Sx6tviqfrdnniE0av71hqiLrT10RFRQv0OSzaFXbA9YIw5B++s9QQMSKzI=
X-Gm-Gg: ASbGnct2k1SpN0EDS2/F+B1A83odAykfEJYRYp++51bns5KxGoVWiLAxePEu2PLNFcq
	qXqs1kVtOksJAG6Z9+sy7d1PWl9xN5jkdPMGxDv2RHVDE6EA3om9QzrN1C5eniHjk8LadkEBGYB
	+duLKLPNAYu5T7D+cA6Op1PYy08gc6El4mNEy1TBYjM3rOWCIOc4qAToDXanoDuqT9yPgukzjde
	N6FGNQ6d0E2a9PzwNVS1flYgCdqIxWYTWcNpC6u5wRzVsLx4ZLVNVTmlpyF06Xpa0m+VB7BFIdw
	NrL/Kgy3xz5DI5vW9pRgUxdVDxaS+5wmtUgQLzuJej55yel20eyUiJAwMWe3fc8uzpC/n5JSVFY
	+W0Yxb3fyTb9rgzSqbP6VpN7O
X-Received: by 2002:a05:6214:20e5:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6fa9d16bd31mr20049136d6.23.1748036591299;
        Fri, 23 May 2025 14:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsIyi1DNeSV0ltsvQnqAPemiYB/XrfAMLNhKLi7K1DXufTbnvw9fGiXj1zZXip7xUmJkWnbA==
X-Received: by 2002:a05:6214:20e5:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6fa9d16bd31mr20048706d6.23.1748036590929;
        Fri, 23 May 2025 14:43:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018349sm4016945e87.142.2025.05.23.14.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 14:43:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <aDCdn9r_ZAUTRpWn@stanley.mountain>
References: <aDCdn9r_ZAUTRpWn@stanley.mountain>
Subject: Re: [PATCH next] drm/panel: nt37801: Fix IS_ERR() vs NULL check in
 probe()
Message-Id: <174803658983.3675779.2609702556913509168.b4-ty@oss.qualcomm.com>
Date: Sat, 24 May 2025 00:43:09 +0300
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5OCBTYWx0ZWRfX8cIvUK45en3i
 CsMQKYYo3I+rzXRmct1x3DJ7YPDOqzqhPsS9S5t4M5lynxzswWkH9ISYLE1qVHzNw0kXPREBDur
 VhGGcy/pXj7hi11oOo2dV3EHe33r1lQ3+TRMSDlmeXWq31BGyk9RNYugbh1l5W4h3pg3afYlca8
 DP63XQ7er5CJwC+/AyIfnZIZ336oyNqAr91lhLzUxxnIZw+HClbGiI5G/81H0sOMXx3Dy2/v92e
 I2K2rN/8AY9oWGp6SMvubxBT/ly9kcQ2XdSzcK+/xlnt4L5PR/CS1WYravOWE4mzxjIkOLYdwPE
 DRvd2wM0mVIMGvL5WTi2Sm3GTa2xXe4aMrDVSshU+LBxUjY25cbEyNlIj9ycqGf2h/RJGl5Bo39
 s44va/gxVywt+R/5b2xveZUHvpuus9vNfAozH0LNluIO3y1rw06LUKL+8UTP7ClFjYkPfkle
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=6830ebf0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=cxelKPMm3W1_tlv-AlEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 9_1vM3fec1jldiv9LoU7JL8MQohUK-Zr
X-Proofpoint-ORIG-GUID: 9_1vM3fec1jldiv9LoU7JL8MQohUK-Zr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230198

On Fri, 23 May 2025 19:09:03 +0300, Dan Carpenter wrote:
> The devm_drm_panel_alloc() function returns error pointers, it doesn't
> return NULL.  Update the check to match.
> 
> 

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/panel: nt37801: Fix IS_ERR() vs NULL check in probe()
      commit: 4673dec88da803fa23f1af9e04761683a30dd6aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

