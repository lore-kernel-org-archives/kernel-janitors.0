Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641B2BDC04
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121854; cv=none; b=i3ITU8A81BjDtRxZlwB7LX2Y4dRQV/KT4Vmhts3WKwXPB23GIsTRBthajIcpLBnxBqjCtPlHrvIHCMFfDIPT6tFSma9vgmHd3gGmVF5B8QFmi5rxsweL64IUeu4KG3xxfdRBiT7MC1+X1P3MaQxk1gJMFuGTOLNWo251RWDOFnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121854; c=relaxed/simple;
	bh=tHTLu6pYA17IPA3+9SgO0Vy2yrt8LY9SceGnhjjzWDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRNKEVUB83dppfSzctqoyZ3zn1PfT1vRyY8PgKU5K0z9SKPUUyHZTsoEA0hY252bTLF9wSSBBK2+1dxNxiGUYt7KYCvwgms6/QjZE6LouUVrscFfeH1QRsdgqdcVKfRLzr0zETLlW839LoCjwP14Te2mR5pgExqKk8855n6kBB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EVK5U2xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caTd6C4L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EVK5U2xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caTd6C4L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cL3F3991982
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 05:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2jVuL0Bz+ej9c5464E/vN6YXCzWpbQDOG1kB6pWIUc=; b=EVK5U2xd7w11dyD9
	m/EcxE1g2aA+CkfA6DrSB+28WD6CxIV/vKTeizav5ySWxuTtDwhJIBkTx5rmJRtd
	myu1sBu3cW+l/V5MPLIeQ3KkVT8z0nOadR71w5hfYrqpc6I2yqIACKf3lTazvklF
	rR7hxH1pv7R0Y8UwdwIz6zJkY7GC8pN3S3yplK8AVL8pwspO642JguJf8I00h2Gj
	dBd+10MMzAmw3i3bHYXKdGGD6uNxI90wVN7M1FMfUi3EG9O8wgb+1t5q2ToXDb6E
	58gINAfdum8IRmXumuQ+oESng8kNmINbx6Qqnsz1SyzfsqdsigmRgUyOt9MmbC5H
	uIhsww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2d99wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 05:24:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba92341f38so1701361b3a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Dec 2025 21:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766121850; x=1766726650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f2jVuL0Bz+ej9c5464E/vN6YXCzWpbQDOG1kB6pWIUc=;
        b=caTd6C4L6vLnxzSU3Q884kaw2IBgTPM7Ef/rzUAXFR5c+5FWUcapyeIkxfU1yJm1Tt
         S20G86IRXh+DSGCmvPPMLqudb7ZMzjrjKh6LSfTDgl4tJgwF5Ef/7i1E2a01p+IO2Wf0
         33it7ypaGQRTDwZNuVtg1L604nSJbBkbRoqoS5ygu5UV24RMQ9wJhhzwshPpveT6KKQb
         GjbJozxNTEIqe/dGs0z75TywTNitkFmyVOoDgdGrn7FXRVED7OKzPhQm2+uVvYkocsR6
         Z9/2xkbd3ETQTCEMOl1nO6XqC0ksuT3Uhl+wV1G9ebeibThKirnql8ObFDAAKlbmZIUV
         PzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766121850; x=1766726650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2jVuL0Bz+ej9c5464E/vN6YXCzWpbQDOG1kB6pWIUc=;
        b=Ly7kELkV2AoOJHCkz+OWchsuH5k6FtskPa7FYWzR1O3+w5A6z8pfh8Ou2A6KH8mut6
         SDVoW9NFzHJk6VtUJAaAm1dlGpBiX7AmS4L6T3XvVLP6eyg9PPzSpD9iVGdOcadLWFmW
         lmrArmpi20zU1nF6+9kSKQsPfhqOv8juHzGc372bj1OKcyQzWw2bsMohLxnHGqg2eJJE
         UHr/L3ppwE+WrX113mnPa0GV7UCRQyhITNypuDBlZZHHg5GlofiB+dwm8b+zqz0SgChT
         WsPqsrqEZyZG3hZ+Z2FbCzsesv9DPcQvSyp6FkXGgV6SW6vgcefLCdHnNwmjwVSaLMle
         7rDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfDt77bEALgQzMRgmFgYbwMhgeI4nhDWaFHCt8k1gOokrX6Bnr1fheYsvAPJpgkSrPfz2T1PeZq71d6iTiGB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVPFHpNN9q2x2NdibUKzm3CW1wFUWRa5U57m4KD6G0YqhKwsfy
	1MgTR/lbcKQhMzBw5T5uHmvTxDjRXKG2Ec6p63Box8b8V2NVigry0gTqc/Z8Um4qH9l+gV4g9db
	TV3Ib6/qldH1O/U0Im98VNBWIQJ0UkRgchYh6DdkF3EUGDgYRo4uFPYsCfKcZEDmNbez4taI=
X-Gm-Gg: AY/fxX7dx6ssDat3z7L05gBafz2rYn/QUz74xll1x6GOJ+DeuKahXuIoP/sV7ZhK2bP
	RWI0gZkUqGgn9EKkzUP+spGzos3K4fSWxlOqJftLSxi2okAZ06cJ8XuggnEuTF/l3xx1pWyLICr
	DxTfNdjmWKJz4gnRv2rlM1AkxMFFvGXN3+S1CXrM3uzCx5Uxx2eI5WnDfFBLExF41zOHVNTUDYw
	etScCzUutYxkQkAGI0avlFCAEugphqOzjKvVA9Ht+FEV25NMhJoKPwdW2GvsYQezzKRCNDM1fvm
	O1+MKmg29wrx6JdDnU58KujCvZm+SExl9GpfoiuzWN3ylZu2uOVtDAYIaJjh20s0Lf9jeVkPfjH
	u7jmCVSStTajuq+F196ADT0TkwTWacdZHAlJnsvztOTOYiTpBFj8Jv7DtP9zV5A==
X-Received: by 2002:a05:6a00:6ca8:b0:7e8:43f5:bd51 with SMTP id d2e1a72fcca58-7ff676624demr1420521b3a.61.1766121849894;
        Thu, 18 Dec 2025 21:24:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhNQ3Te/f2XMrvAgCZ2aPBy38yMuSSI9w3vtSAX45LrLQgNLXDnHqH4Y7M6btY9r8I1mSt6Q==
X-Received: by 2002:a05:6a00:6ca8:b0:7e8:43f5:bd51 with SMTP id d2e1a72fcca58-7ff676624demr1420502b3a.61.1766121849408;
        Thu, 18 Dec 2025 21:24:09 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19d8sm1011419b3a.42.2025.12.18.21.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 21:24:09 -0800 (PST)
Message-ID: <1fa108fc-a06d-a9cf-a56a-c905e4982b41@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 10:54:03 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri
 <quic_rdeuri@quicinc.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6944e17a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=U98CeTqYmU67p05RdacNqw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=OFcc0y_4Mb4PjAsfjdEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0MiBTYWx0ZWRfXxjfvIxpPX1Xm
 3PBW+6N35GPqxybL6ZwSyle3M7Isfl45an37PZNisauG0tmMTT9t5QjAZQCJM7CHsEKzbJMmC0S
 5QMRDmF5zejNChtSkYdBqfHniuJjV/r2cX65CMJJiWKsOhahOMmFBUk/BtgQZrr28P8NW086QZT
 7YfaNfqGFGhdPWaWP3XYBBlpQmpMrzPUhTGLNNCX9dnuep/D0cvoKToaO2O3u+wj9uVzhI7ElL3
 mKYBez+Z31CIjlH7ApZ/95ICoXoBoOZ6DjoYwgxQtGr/zSH5mbi53Lujhs2Bs9p9Qba8v/VkuKw
 9IOXOokTm++wkAndct6rF4xs7D5bkBVj/C/2enYe2XNZ0HIRimP0xg7UfT8bVJ6wpF+XxGlda7I
 /bvD7mHlko52k5Ppt/JMNh9b0uRL26vC2n9W7EBXPHunqlEgefx8Wz+NEd7CiPTmefhlKS2KOph
 5HwbZvwDivZHeBloDSQ==
X-Proofpoint-GUID: eHyxgZ7EveDLQLXMLpKGkro1S2wRY2qC
X-Proofpoint-ORIG-GUID: eHyxgZ7EveDLQLXMLpKGkro1S2wRY2qC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190042



On 12/18/2025 1:14 PM, Dan Carpenter wrote:
> Destroy the rhash_tbl before returning the error code.
> 
> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

nit: The next branch in ath is actually ath-next.

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
