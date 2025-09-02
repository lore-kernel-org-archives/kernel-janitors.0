Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE02EE26F
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Sep 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807857; cv=none; b=QbZtUkHFtQLITX12YY9urPoKK97B+mE/L1a0fxDqbtw8lpZu28mjVinVbPcgMwzhHlhUW22g4ChYYqPR6ie+ZVL9aWi+hjUiAMofW8DOj4iWGk6/9hJVTDvdxQWBZt9Rea8kw1OmzGQ5di4seCaid2vpFF59UBLBaBmgEv6me6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807857; c=relaxed/simple;
	bh=uQRbZpMZzS7UYewybYgEDAYd6OeeZC4wMAAbwE42GwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rO+iulO1KfHaVk9Vpo+Wgz9ebzkZYtWI9FO+sqDpsfry2fmYVJOZqsrs+Ocw6JcFfxmTEjyV5cr+mtRNbwfuaKsgh3GywzEoVD1J0Cp9mBbq/kb/7X9YoBIOXp13BP6kS8aODAWQa2A7BXbFNd2pevr8yRgckjgnLseqX41nALc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XhwSZYx1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XhwSZYx1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RuUw017486
	for <kernel-janitors@vger.kernel.org>; Tue, 2 Sep 2025 10:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	THYxMAXcq3NlTG1/1Gxwv/IFrQP4eSDyIsfIRZHUUKg=; b=XhwSZYx1QCW5reF6
	LbAAnpn1ls2qOpFm35u+EM53VOPIEx/4PSSm9TFFi3G4YRioKHDpDmA/DRpuXfjA
	K7y33/f9OvhcYb7/7pVednZgXTe0bZtDqTtSXFYpDLtyHXBwfdaRXzT4bicKRtPD
	3ln/yIOaawRA3iQHSjUF5ckXl0ALN+4i2GZNcxQl8Q1PToazSxA4Ve7TTtfzMlSM
	xJDJ+eazKfkM/nbSJ7HVkGpW3iyaeCgKEqfPYbaKswOYh/ZColeG9dw16Ln/MjQV
	QsopGXLxJWTvedAO6Ow+rOdmqTIHoMluNHGolD0K92515oDRQXfPZDWWBePv7HD/
	wjfvXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8y7s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 10:10:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b307e1bef2so14050791cf.0
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Sep 2025 03:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807854; x=1757412654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THYxMAXcq3NlTG1/1Gxwv/IFrQP4eSDyIsfIRZHUUKg=;
        b=Rz9c7I1fvUu/QXN9LU2gEfdK9E2e5/36XxWMO3IhXfJajGiu48SQRGt7IGAaZdsIDg
         NR0vxu2W+HfP3SDkrvrLYzzuHMay4g4ZpyxnftwGbBVToYL/fHlhx3nzu457ZzxnyIq0
         54ZzQE5S5YRbsAQAmPnhQPCBEu6lWK8u83J3YpRnEAZKF5uLZ57ov6FR7JG5mWBBsiI4
         AaX1JBYYopQrEqJMCnHsYjbLYLqoTP1zphlc9fYktXZcq5PeNJ/CBc+HUWPDoC9DzAWN
         /L6gdFl4/mjQV9k30ONOEb7xSTOSJhJJPl83Nu28jhsf3iQgL/yPA/fpC+wOEkRMGf97
         DsmA==
X-Forwarded-Encrypted: i=1; AJvYcCWEzsCg5DPM9WTokk/Jn8IS48i/1P4JuJ8Xj4e8e3zlSHxJfjeaFjlfuImpNOoRAmtas/H27MbO3yh2fDQymN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8G4M4ZokqMWgg+HuaVpjkV8GK3Gxj9tS6V29QIxm+v1N9ViB
	k+xp5tEiBgjOp5km/tFZXKSza05+UrhVmB8BrHhBOuOSGf2ut0cOvDZFL6sWqL6WU6Z8ZZ6P/l2
	jjoSLTbzY5dFCbuHyOk41dHy0msX/7MUT0ZeTaaqWTatxmf14kbhpQpZvtHkTIoI+aGS+syc=
X-Gm-Gg: ASbGncuL4hkGJc1qMrySywVDhOJA2H3EsiicpUQPkcve3DD02i5WZNHQqhwbrIgGFcr
	zil5bBIzTRt7FZeANzZ1uZByOY8Vf5kKVNckESVTDJQwwx9TdNqNkcvsTpRcG1zTqDmU/q8jlcK
	+xJ9wh4jjWtoOXMkmgMLznFWtZn7x0KlyERuzlIJRgtDVbFB/GhtK3au6bF9mJb6MMbdVSZv4Yj
	fXiILvJy+oSZmyDbAOkAarsqQr/irIFwTSN5lswEGxDk77ByeXo6UmKNQGa4eNrlshMyS5Mbgiw
	pDV/y2knMinTSyoiGFmRAecmbDeVplRV4nDHFLdhCJjj7qiEh0TQt7GoXroBQ4PrKM4xVSSwk8b
	jjS1rUAh3kG6sIur0KT636A==
X-Received: by 2002:a05:6214:252f:b0:70d:fda9:8118 with SMTP id 6a1803df08f44-70fa1e37ac5mr90373066d6.3.1756807854205;
        Tue, 02 Sep 2025 03:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXA1MX+R32DY7z70Jxh6Fma+swPbMAM/TxTka9ZiM1Mii2YSXZKJfvdjD4E/i8Haz2dDeEoA==
X-Received: by 2002:a05:6214:252f:b0:70d:fda9:8118 with SMTP id 6a1803df08f44-70fa1e37ac5mr90372936d6.3.1756807853750;
        Tue, 02 Sep 2025 03:10:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a8fsm9210260a12.3.2025.09.02.03.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:10:53 -0700 (PDT)
Message-ID: <f65d7789-198b-43d9-8d2f-eed87c32a984@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:10:51 +0200
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aLaPwL2gFS85WsfD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: He9behpXlLL5jxdgberL6VZ0EzHne9qd
X-Proofpoint-ORIG-GUID: He9behpXlLL5jxdgberL6VZ0EzHne9qd
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b6c2af cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8T--ygq334zCgzS6G-IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX/kW3GljEnRD6
 6ulkpQkJufn4EcHE3MvSYjAI/iEcFn1nYn0Qty060t0HnmTErahZeWmglqP6MWuyWl14yTNBrZK
 djqxlaFfxQqbIoi4yNrBGRyLxLXPI582hGSgfe8OQfUXPX3fcm8GJiBx2+6HdIIb4Fu+BbziDcs
 JIuJr8PjzwtOfWmq3OmbtugwnWTQGLYvZGE2oO7qiYE/pwGzcgNMSmXNjDmi29bXVhrrdbHvqMR
 NhnE89qPzIx0U7Au4qoGv4F1d7860g5+UH/g92XxfUPyAxjLF3kpY/ZKQ6QL4GY55b0M1T4MJne
 wHhXEZwj0xXQsCHSIQru0c0ts9E3gUOvCt44tBg8AsyX6v4grB/xJ1k3pL9ihonqtWM5k3+4Xw6
 bYRxU5Nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On 9/2/25 8:33 AM, Dan Carpenter wrote:
> The devm_clk_hw_get_clk() function doesn't return NULL, it returns error
> pointers.  Update the checking to match.
> 
> Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
