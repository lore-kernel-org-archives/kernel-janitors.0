Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF5A1DEFC5
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573804; cv=none; b=Zj+temO4Qi56t59zWRPkN2uqvUZzZUHNVelOjpUNMMkcFcoazDOhAlwwgPhE1JaNwLJ5T2HdR51sCSw+A5o47qu+FY7E9mv6+cXRF8PcEw8ykHfbefcxqxehAA3XfjEpnZXQauyHHGcSLrvCR922nAB5f6oVdgMVLPoaI2iMRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573804; c=relaxed/simple;
	bh=sX4muvpyzWlipm3+edEVZE9OiBEpH0DByrdbnIKMYr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3lIReqmOI+FU1v5H9XzxqBk8TfoZRx3GFCSOlaUN0+Ep0ZP2Q7MvsEtSo/xvQVyKas1WbwGhZ9Kny5rUrMo5mYo9HCdOZxGenHQcqxd0GaIc/Wwuhz04VIIWDMmhghKZSSpwcIPD0bYN/MqID365I47yhN5u5iIHYZC+5aTKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtSoBD0t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtSoBD0t"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBen016516
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 16:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KC691n78UfcfnBIMAEEZOgix
	8UerazMGS6DJH8rBSes=; b=jtSoBD0ttl3RR0OcVWAiU/nuCCHpxHsJRs8T718P
	mPp0eDBxxTQce9+Dar557Zlf9gKMXJGcgJSLUZZjaCzrI59/MGrbjO+ecn6sR5P4
	/CkzAuySTJIRr7YNmt92bvIlxVqquRB717Kxu5nbZ+5rvED+3XClwt5jMx6jH5rw
	vDT25pWCuY07CXEUk2jmFMo98CLkWqP99IDOjgamiXKg1GUO8176ikjn/rnPwrOh
	6wSDPq5uxAB3qEhypBM9JT0wsNGqq2upSh2fSZVEsrCyUiqpels8zshaow4M/B9D
	d7/iONRXmp4uXex3oCuC3NI9Vvr6lmCqgGrU9Gu59p1Ghg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1ddvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 16:16:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c544d2c34fso342075285a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 09:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573800; x=1743178600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC691n78UfcfnBIMAEEZOgix8UerazMGS6DJH8rBSes=;
        b=KHGSqnD6Op2rmead72TTDdOGPIxI05MXdl+khpc27OPC8JpMhRjueR7+7YD+i10jiE
         c+qQYZkEfihXsmQ7ZMLt38iuPvbOI3BGd1JzhcyYS5YIeQ8xUbGBYC14/p9EWDPHB1xw
         rW+qReCJhd3hKG4Gu/B+2auADEttRLC6Bi/qyZ7gnQp2urHz3Uyl9u3Dkf9UzcuO2NXF
         CXef1RTgbwYxZ47b+EkmuWMenyh+2BFxmSMvv6XaAVWvnjA1TRoN4pIleecJm3aApy5O
         Z70ZwIzBzVqvpeya2GS5e/N/XxKoFtepja4jqce/kcAvhjqvLmplntCYLX6d8wP/TquO
         gc0w==
X-Forwarded-Encrypted: i=1; AJvYcCUgPGeu158RHLAxPVWrbySgT+0b926ina0VL1YCEYKoEemwKJXMC9VdPtKMXXX/xYUOoGu5HCLcOCWg+tV0ZXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+fw8Qj3aQWhSnzoqakikgvFjPADaQlxSDoHMloDkUxbIGobrY
	ejYWDNDHRJ/66gDGvc4XlwkHfb5Hi6TIYoKKf03tLtmOE/6j0/aVvtiQh6d0bKWXRZ+qXE8q7pc
	70uBwkm4UrC/6ADbVXld6EC2aQdNQrz2MbArBP8EmZZgrZ1mdEgB3pUA2HDgmOc0xCh0=
X-Gm-Gg: ASbGnctzGEaMgn3ob+0Z8LeVNmoP73QgS4XCJ/an6p0baobtzgDWH6+YjJJGS5dmtHi
	QpFlB7r7eIHbLnMr34C1v0/X87nsKk4JLXC6YJvJkNci42Z63Pl5JtvBiekQz5PLRf4ZkTfAMP0
	WOoepukCfhK+DCS+y5hSRGIoVdMY326zAjuY3d4spoUGvz1v83lJXINaSqCz3bad2C/Z1F6F1D+
	JH8UodIJwl3JLYQOnFvBx0WlWBUNgqQ4xHhwEU8YT2ZKzz9VlFFnxIa/pVGYugzZdXQBCicngXl
	Pn+Y8EcYjblWTuxUWstkHB2lo8o5IrK21GF32vQBPmNApoAcZF4aH3/NiB7f1vp43PTDUaw3PmQ
	oWck=
X-Received: by 2002:a05:620a:394a:b0:7c5:4a6c:eb8d with SMTP id af79cd13be357-7c5ba200eb2mr484939085a.58.1742573799923;
        Fri, 21 Mar 2025 09:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCnw0RuPGGAcRXmxyrZFcq6Uvyn0JUfRhjB0xBqWfhqbZS/bLEaIZ6/ICcRwJQBMDqvBgROA==
X-Received: by 2002:a05:620a:394a:b0:7c5:4a6c:eb8d with SMTP id af79cd13be357-7c5ba200eb2mr484933985a.58.1742573799445;
        Fri, 21 Mar 2025 09:16:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c79dsm212119e87.70.2025.03.21.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 09:16:38 -0700 (PDT)
Date: Fri, 21 Mar 2025 18:16:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: sysmon: Update qcom_add_sysmon_subdev()
 comment
Message-ID: <ytbcjcbzwftajmovkun3x44tvmfyljthzcsrml3vbwyvkd7glg@enfp7qfhtzkq>
References: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a6b65b-5f3f-4a21-a837-7a4a7e09b099@stanley.mountain>
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dd90e8 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Oz3NjKvTjiMZACM5Y-cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: C6_Wv4Yl5LD6KL3d0C_pWY80J8fStstm
X-Proofpoint-ORIG-GUID: C6_Wv4Yl5LD6KL3d0C_pWY80J8fStstm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=691
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210119

On Fri, Mar 21, 2025 at 05:35:44PM +0300, Dan Carpenter wrote:
> The comment says the qcom_add_sysmon_subdev() returns NULL on error but
> it actually returns error pointers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
