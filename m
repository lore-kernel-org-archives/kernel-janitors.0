Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549F283144
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831571; cv=none; b=RmaPMTEXJ0CuddKmzdmcWdWxODoCijQWWPWatiZ7s+JTAJnls5Nsjpusy/6CVkVXTDkFaXGEAYou2hz/dBqH5lZlLPmf7z5mIcbTSb5ptwTrEci3GdDINv8EqYNJh4uV9Kv/hR7RVTiR0Vnhjin2zGI02/W6iN/9FdIizgdtD14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831571; c=relaxed/simple;
	bh=+pd5ibWIKyHRFFR0VYcPPSihlyE9oJC51HBCwcLMQas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HD7uIcKMtGsbU56oiFpHXdf30f0iB/ieDKWtDgxOqzKImDmtUu+cDfPnALwu7wwDzdWRy8x77Gi/5rQv4mFq4VcdW5qzWpVszvF7XM6h6ayfsd8tf4o205/mzsCrxKYpRqRrWv7oZhOxUdgnjg3OTPvddh23wPTPK5ZdCmApudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4PKlm42; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4PKlm42"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqDiK025377
	for <kernel-janitors@vger.kernel.org>; Tue, 2 Sep 2025 16:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X6rGdPxT1UiWkrcEgByQOjggZJJnyxAl0XI2p+tHJw=; b=J4PKlm422wVwPu4D
	Mc2+lAOVFo9MKrDO5ujM4PiUEFzyZwkV+gGesR+qnpbJX23HOo+F2C5BU3RYQl5X
	Kr31+FJJdxeViNchZ8mMelrxvx6dK6nD5rSi5C2pHD3qkdb0Acr0LaCjmthyXqwc
	8nCX8akkRp8pTcbbAhe7UtoRxiXVf1mXKuUM+IUDliaUfnHI0J8RpEFlj/lYd1Ub
	ODmRslmztdkaHpxAq9f0nKQEAl/QcwQnLmmopveajSt4B9zCllVcv3yKcuf9qIiU
	XApT1/PdWplyo9BzjWqW+j1EkDeMew7uWYIEn2IDyWYOlLQ90imsPqs5pRJU0GcJ
	TTmGmA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv0nb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 16:46:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77265551c77so2451584b3a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 09:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831568; x=1757436368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X6rGdPxT1UiWkrcEgByQOjggZJJnyxAl0XI2p+tHJw=;
        b=Dev/BKlLpX00yut4ORpe5eiR/bBffdrV2/HdGSy/EsiQoJkNkt+WrtWyK2sZisJi2o
         AGFrPYEinsEzcrZo56JvOmOhpwb4FETrEyMnFDlYwethxHc4oGIENK6GQ3b2Brx7SRZR
         c49O/zyzEhaN+XFr9lT+uesOc7OjYFe0FekpOWhtW1Jt5M/Ym/UjuxzEUK/+p1UhKmRM
         eydaaQZeTrTnibdJSHs+n977Ek/Mslj+iDW6Kva8eE8W+8amBIDblcOubOMolO2J6+Op
         O/Lf70I9cadP9x83kUS5EfNU2C5TUMJvAA1NLF3XRNiNbVeeGs9SDyvN0/j6xn0D/P98
         X6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuL46ITl/p00Inlkg/mbIl6ZYUwHSq17Oth8ckNJJa4BEdqN+ca2Ax1omi+b3E/lYZtV179xJWZN7c9DDCjPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLcY8/7r0ot2x27pweqWVapminPCPpnFotn0fugGDVKWfy0Y27
	cuQyPURG7S73oIbzPOXD2OO/GjHZ6ed/5Zi+jaNi9Wj8P1IvYeumpm7giaYSsKNlYGS93WErfpR
	qbU55C542PcM/wRAQJU9yPT+H6b6yp3USGFNiP7eZsDDyr62ZydJZrc1zME9WTBrq4qM4OHI=
X-Gm-Gg: ASbGnctqgoMmLPniXsc8x8Gkn03WnwsQj9KPXRmSUsU/aWJTi83+ge9114OQNMMlFvJ
	+ZRGmS7TQAhy8yKKpJFnSzk9BlxB7iF/M/Aq9oV9/ixCoAw8GxEt+STlffb7UlYbZm8qfRmRK2W
	/JC2WvzpK8EVo7dAV3v9Gt7lB0Ec2HVJvmWhz5qOMCJ+/wAppz+aTYGBZERhiXosXALufSUC98H
	18LB1W9LWhycZAW7lwWtGRADQqIRc2IAIXy6pQaL5sxAXINmnCZPdKOSuO5bP7obRytwgzQxB49
	EvcJVKQosYaXGbfYWAp9BtBDfd+xjg6uccd0j7WAMe8u67tXmHf0xYfLSq4l+7xsRSy+2r4=
X-Received: by 2002:a05:6a20:549d:b0:243:c5c7:1126 with SMTP id adf61e73a8af0-243d6f0324fmr17153220637.30.1756831567558;
        Tue, 02 Sep 2025 09:46:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpXLMq++UENp17zgkzAVidoy/rMcBj+5w9Vi09jk3fctElIIy1kaIPr2lyaGmIxwQhJIRuaQ==
X-Received: by 2002:a05:6a20:549d:b0:243:c5c7:1126 with SMTP id adf61e73a8af0-243d6f0324fmr17153173637.30.1756831567069;
        Tue, 02 Sep 2025 09:46:07 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.120])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd366f95asm12393842a12.51.2025.09.02.09.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:46:06 -0700 (PDT)
Message-ID: <0855853a-4b77-4bc8-9e78-bd4e8a211b65@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 22:16:02 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: common: Fix NULL vs IS_ERR() check in
 qcom_cc_icc_register()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX6xtCnA4xW51i
 aZhmU2Hy68Mxck8SNitF/akEfKXb4GFCemvooGWWy/59G6YxMqIqXPDLP2o7D60F+vi0poErQt2
 n65ZUxNqZmO6LJMFKrAA3ZXlcXK0zP3DrXJxAB0NlUZt/zrvP9cLlsQb8wpy/7IY4HtKv50sP2q
 ixptAHPIonyBEFwNLPCoMbKpkOjEkft6usvPpl9YV77hqu19rLchhZTUGEAcp/LiNikdOgxGELh
 IsaoJdZkJ5YcjYHlR2WJyKKSMyMX5uw9uHY9/l0+OaIwkyAkbXuJUOLPn/y+ADs4oRhv+gyb7iE
 gVGC162dyDTLbAtX+foOGoQI8UjCs+mbkfDsNiOld7IXLfVHeaIzx9FiCMlIyxUa8jkv6aCHg9c
 pUxVfoJS
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b71f51 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=+KjSowhBs1waSO1ngDLaHg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8T--ygq334zCgzS6G-IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9BU1VrMGFmSo-eXPEr_OhQ5ejS1DUt8j
X-Proofpoint-GUID: 9BU1VrMGFmSo-eXPEr_OhQ5ejS1DUt8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031



On 9/2/2025 12:03 PM, Dan Carpenter wrote:
> The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
> pointers.  Update the checking to match.
> 
> Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/clk/qcom/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
