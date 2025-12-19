Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B202D0C82
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 05:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122945; cv=none; b=r1r7mwhRZst5topZlf1XNOiK8rOhAMSpQnqTGTYVrdrCS2/oogR+5rgWRF6CfdlyRDtIIPP8Hk3rJQ+PfZ72joZ8kF4jJ6rd+qUR5M9pPzbRj0uI/6+v1ayCULnFyOpoO6o59GfX5y8O2pzmCq1kgP23jHlGw+YsL7A4iOt4JYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122945; c=relaxed/simple;
	bh=gzvBQaQE04aWx7Tv8hc+MsWpJrIp26psxmc1jwDn7E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAd1ZXWOpyr5EEiMWkalgYYTb4EL1TB7V6R7Ez6dRNE24EhwjFPC/lg4C1PByfUnLzDb6PzFsqCsEvLbIZztlTxtRj3J5Qz6OmejD96//5yiFHN8pv/J3aWje3ui8HljKBULqIstOVMr4HZDZFmlEulgtxrYO3Vo2flrAbSGnOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOb6IjT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bP8mTEDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOb6IjT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bP8mTEDX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cU404154970
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 05:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5m5tAGlkGiYi81yuxiUUxECa/gsyO0V5obb+kA+4XI=; b=IOb6IjT2KCeaFFPC
	qbitY9mejvNfAxdKwcHxSJbGLgBr8OIIyVT11AEGgsmrICPi9htrwSU+Bf85Dc8f
	03Sbs23Bx0da+FJIYI0mA/Me5t7IHYnNwMC5Rf0SOnKnNmHAUCwEdfYrAAXguM76
	zuZHnrzzBaSrhrHbpmFbmr/fdiM/g5OI4sobhw5mZ/RPVtxyQpgr6uk4EtUyALuD
	cqa1hChjSuVRnGpciftph0et4RaS0Bw76toj58e/2OIFpb/YUD+UHkMZGSL3VLlU
	M3EZq0WIHG8xcpBWzXTz4zp84djn7TKy5FiJU/vSsRw/0BJcSHqMB5uw3S+bsXk6
	hBVKvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cscm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 05:42:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1478268a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Dec 2025 21:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766122941; x=1766727741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5m5tAGlkGiYi81yuxiUUxECa/gsyO0V5obb+kA+4XI=;
        b=bP8mTEDXgyNIGwM4I/cmnI0speWD7RwG2Pp/ktvFFEtLjcNKmvhDVPYjWgSc1oZi2b
         6TDtHND182r2D5PbKO6ti+svPlakAl0BKZZVFT8fLYEVrHRNVirJRbegaJtbgtUCd7dx
         iEeK08HWLimxzJS8BGgHHHKoUC0XyyWxwsjnKU4DRjHDcYzrKStJtMzbXHeF3MxfNXYo
         rb73/XrS7aC2w8mAPBJNd1/nQgRdHfOXgG/Zt75xvTYrWJN3PmGJu1BHy+NmlqGRRibJ
         UmmUmPZaqLwysQRbv1MNAvLFybrg0765ZkImnC4DtpEwaIDlww38iNq42qFbr18e4N1f
         ZZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122941; x=1766727741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5m5tAGlkGiYi81yuxiUUxECa/gsyO0V5obb+kA+4XI=;
        b=cvJ9JrkqMqKDTX21Mt4Attqsgv3oPoWEhwdVftHsn+DMTxuGOXoP4bjXOnV1usXRAP
         NhSy2exSSNO34NXyuyfDxodGjlpssnr/6UWpMPRyutR+jFxEFk2oDYFQVmHlsy1XVTyA
         Ip1menLiULR5ctehY4weDHhvFP0yF1trMrEGYfGaIkUkNbFQKc1Z+Oe5hGtuXro6hLmK
         7y3vwJd+mZQFyg5YyGPfzz0k/PSXK/Sgn3xnD9uy2umWM6aMwqiFA+LZ98DbveJ+M/we
         ZADQB9xtT+4ZkkEuaZbz8KqypkznOiOGgdh1K5jg7JqQPNABuNt9u5jZo9X4HZXNr+CA
         OMhg==
X-Forwarded-Encrypted: i=1; AJvYcCVQNKceW9TmQwA4kgfrkF5zKu8BYjDCksIxU9eVU42YjdoJuiZKgxfYJOFnKjHL9ijZ2djcrcYdeiJPhwRRbIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYbHBOJuNLfojpohtM1ReN3bpWOMqTuH1L3ZR+V4vyTGjOIj5
	ImB2pBhBWuTl2zDsR8Q/Lg67SE4Fe84lN8AdtFae6KcJGKQw/Cfspryi8ONp612JbVRuy1llfCG
	rNnjQC/i3RMu+sfycvUVmc6W+H2VjoED4Sw0aFIOWAZol32YNnkEVL22929bnGeZlpeOH1UA=
X-Gm-Gg: AY/fxX4fONuAd3elypQeqnFD6mFn1qp/cdv2mAyPLEQgWMHhu2xXwmAPZxNZCfmGazE
	qfSG4E1bwI/O6l0VqLGUJfpbAAHzhjL9XfIMZCxo2WvPcwRBJlTdu3W7UBkprvKrV1miDhsIO9+
	6EJ18eZ9xMjblNJFnEDRq4awo0cHpC5scFKvcyS9N78Fz04+ntZ02piyb65MvYG5IU9y75UkfMl
	zVOh2LRDi+q7loa8QpHhftZKUjnFolpXLPqlO7cj/K1+sUbwKE5VXoeCIjeUgp1j4JugeqgE7Jx
	G8qFzApvECnY25o4dFUKxjEE/v7c6mJU/iQcZaY0PbrCHgJDGA6hUKRvUcHtY/wyewCBMw90PUE
	boL6/rhnEGb8vaqhE6hNuQZCpmzHU+YD8ly0TB44oDRjHuaa/lhL+gQt2q6jg7gfiuEGb
X-Received: by 2002:a05:7022:f693:b0:11b:803c:2cf5 with SMTP id a92af1059eb24-121722eb259mr2094564c88.33.1766122941352;
        Thu, 18 Dec 2025 21:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhk+4V4h85Zxgq/94CKGljiu1MRE42gFAPuVqCapM99qVbrJgOcmpXpxMamCypOIwWFCgFNw==
X-Received: by 2002:a05:7022:f693:b0:11b:803c:2cf5 with SMTP id a92af1059eb24-121722eb259mr2094530c88.33.1766122940751;
        Thu, 18 Dec 2025 21:42:20 -0800 (PST)
Received: from [10.110.90.237] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de25dsm3836422c88.7.2025.12.18.21.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 21:42:20 -0800 (PST)
Message-ID: <f113b35e-b84f-40b6-89a7-284018e93853@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:42:15 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri
 <quic_rdeuri@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pynNcfQzecGnI9daa7IQu2wBya7ejyG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0NSBTYWx0ZWRfXwACL2yr57qgF
 Ba5I3Ccv7wsxO9vPyxYO2ppjSJnJS8a8AJxm583nVzBTDfuOiONTzGUrVyyGYw9CnhF4py8H1O+
 Fg8ulWSgYUDqi5hNwGSf+bmUE4vdok336aS+sWsbz7dFAftaIdCy2YXZKocpAo0RY+gN5h/ivMx
 5yOwFOJcOPOttZ+eh1IgjEKEXPZ5GCRP1R6qhfHQR2iJoUINcPPuntK/LWLR+zzWG2v/m29pZJu
 sJO3nz8adSf9YIaPZqKR+k4C6y/LnNT+BroiwvifBrYAzrSZ1+P+9PHMk4D59GXpjZmBLqHDVcv
 ePZi9DCvZoNRixkEF6LkfWzK+/lcv4rQvYUNNNsiwwpBSo7UElVKF6zfTlfR6bvTMthdbtA5D2x
 8GGFdCfhSoKQLFLz9P4tThFkBRISpb7C2gp2ASBiRKE3eqprf6odb5/MZ0UVFo4/RWNcqTdm+Lo
 6pxMyPw+ftpuD9qX5VQ==
X-Proofpoint-ORIG-GUID: pynNcfQzecGnI9daa7IQu2wBya7ejyG0
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=6944e5be cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=S47APn7KmZlrf8u2960A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190045



On 12/18/2025 3:44 PM, Dan Carpenter wrote:
> Destroy the rhash_tbl before returning the error code.

Would be better if the actual problem can be described first.

> 
> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/wireless/ath/ath12k/dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index 9f05eea6695a..ab54c8a84d3e 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1513,7 +1513,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
>  					HAL_WBM_IDLE_LINK, srng, n_link_desc);
>  	if (ret) {
>  		ath12k_warn(ab, "failed to setup link desc: %d\n", ret);
> -		return ret;
> +		goto rhash_destroy;
>  	}
>  
>  	ret = ath12k_dp_cc_init(ab);
However since this is trivial ...

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

