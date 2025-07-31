Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E6528FFE3
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953692; cv=none; b=tHlSIPidKZRMQXdoNhWPcPlVkK080ss3Q099WkExYrQXVS4rnki1cc5X/FhWAs4uh9FvxUs4Tz3nr+pqmVgpxxqpBRUnN/q1Zvf1A4vY4wdLwUe83qIRgwGBG5v2EzOTFlnggJO7gUlxT9Yf6SGj2HVdATrQfnnZYVsl2wkmsG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953692; c=relaxed/simple;
	bh=xpQ/EETidjPmojALdAWFIu2//pYT8zpUgRj3ZDR0V2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6TS9q7LESM/w57e7l45jniaNmElLG/Z2Xvlgvs7JNFQu6zPRmr4zQ0OPY6ABqJxJPQzqYrbChgmwsuvZty6VguxoPkH+Owfwq3Wehfo0pRGTIbLWKdsqaSZKRFmg/Pvyyr/klie3MsUSsvctz91iZR/fN2lMyAV1ZzvvFCiChs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9/WzznN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9/WzznN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fP9E031639
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 09:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=; b=W9/WzznNX7wf3bVn
	78X4fDfQWP+G4fVjX5RCjLLMJDMwYF4oThT6Dw1aFomF3a4dw96Dw0bhCC1qWO7d
	4ZRyIkPpan7q654q4SyCbxCzfrRUUYLH0BVjKGuFoh6JVMZSeFC9YleYNCEEHb3/
	W6xjDHor/kEBI7SeO+m/ch4PzErSvcaq4xhg1EzYvFhz76odXn9nadDYjcW0H66F
	GFKLMett4EVPpMiLM6M3abB5/7VK/LvvizszwxxNJz+yw4R0tmhNvyZlAVw8vMcH
	psHHoLtx+gdjjdp1nZ1+FZBTFMyf4/IV5PDzK1ElfU44LBg4N5gvPdh3e/JtvhSV
	WJWocw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860ep4gex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 09:21:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7deca3ef277so24631885a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 02:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753953687; x=1754558487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YKaZRpzTXWacG09Osv90jCxKbdHhzZHJjXyXniyeau8=;
        b=L1OIXLlmolNQONJHWbGH4Rt2gsChQgPsc3YYU/9yF4iA7WnqeD24cbptCIyQ8NsiT4
         zvicU7fKNn9+35whiVHNUMkT4mLMV5EN9M+7LtjvS9sLtWSQmFmelUMKHznp1FAWpGux
         a+MZrAxO1E7wmBh1lbnUQTeejP0xKrBseN9TpmW215nY7qdg4dnPle4X1CJ6nSd1Kh/L
         uaO/gONWlpIAqRNQ1y2pinEdACl10+MkiqS8AVAtoEd/SrX1HtfXJM5yTYs6Fk+CEsBN
         58nUtIkTTJ622uxc5k+VMofe6D89cjgsSNDmIpjkxF6l1eqkntx4qV5g7ZgfuL92xB6K
         2I9Q==
X-Gm-Message-State: AOJu0Yw47BFA0pk2IF50cBVSQ+JD4/Hk6D/XZEsIfCiDDdIdDDUmuut+
	Et/4xOZoOV3+/SMxb4ogNgGb2niDBHPXnc1dopLXKJ3smHDeXtoMObXQOTK+C/rOuiQgx+S50u8
	1n451TCuTD+aqwcZMszBFpAbqI+26D7vO3MRMpcWMic7Sz0A/sWbKrVETDSbvUuOGYXdmcGA=
X-Gm-Gg: ASbGncv/yP23SIkDxyBaoO3rBbwZ9k2HDv9O4QCcIYenNfoPwCxcjrsN5y5nt0r+rrH
	HkAWvtrCdMPOBpHeKZiRDoU+d6KEFXzNfLsWWT1kRhhgIVVqzB9WxoC+QYobcd4wk+M+/zI9ChS
	+05uxVDFWAWV3AhGvKYuXvkIE7MsqqGgj1FiCWHFW8IZdphAtp1RDgIVo18MJzzuoarSUWExmME
	vif+qkR5Kx7RfGtjebqlVZN0X22NcGfZ5V1/eGZ8LZc4zh18i1u9qIzwOg9u0l0v/wlk8L0Ym8J
	kOs6+e4rgneF9DROrd2eGvGRIR18BTj1GFhTOndIJg3K4TA5eU2nC5kfutD4FcSCR62hVwMB3K+
	htG8ZUuF/npPRGpTPXA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e66ef831b1mr477644785a.1.1753953687520;
        Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEalnbAwcLIJLmez0p2ygenNgK4rxww+Q/pnP8/kWW85eDmOZo38Kalj+JOb4MmxyAgyaqYWA==
X-Received: by 2002:a05:620a:2546:b0:7e6:39a2:3ebe with SMTP id af79cd13be357-7e66ef831b1mr477642985a.1.1753953687115;
        Thu, 31 Jul 2025 02:21:27 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a14a0sm79370966b.33.2025.07.31.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 02:21:26 -0700 (PDT)
Message-ID: <b34ae465-c227-41eb-8492-4a2e761cb3f3@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:24 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2][next] drm/msm: replace minor->dev->dev with dev->dev
To: Colin Ian King <colin.i.king@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731081854.2120404-1-colin.i.king@gmail.com>
 <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-3-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HlAaYuQZTOS6O01EM9u3fMsXhuIwHtbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2MyBTYWx0ZWRfX5TxtJfzhMJSG
 otumN0WkaOfTJaWfs/Is0jFWMwrzq6Gst/PYaCueVjOiFEVDRdXEx5AjrRw/ggKbw7gDU6tFoUt
 YwBR2EAkR6NQIS/Sz9KAkSdOUn65bdByUS+Wsk4KDt2u9moQRDwdaLz1T7ZfVcTwbUK45gjlPzd
 iQurH5fH/umSHdkPOvVWVQHQ8dsaUTECsMV5tlJ4rS7yqPPeRVHaVVb9hxICatOJzE0OIWEUmkh
 Y4HVnqWsBcJOIB5SZnDqCyRvPwVmDIyfU4p4vegVvL1dXap+1GtR157v4TrdxuNED5L/Bh2slxe
 hXAEzdRIb8HMvWYTMJV3IokMYdQVrxUUgSNezpD+w8GL+Jf4alpYWjoU2s92kEzM60xA7xbfH90
 vAt5TaH0tFu2PXyJrpoQFvl7GgIA9LfJrhOdiRrIfaYhL/wlnYrWpwhn57NzJFbJUvxq6hrR
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688b3598 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=fM4dGe8XGJNefiYG4oUA:9 a=QEXdDO2ut3YA:10 a=LXDWoPVop_EA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HlAaYuQZTOS6O01EM9u3fMsXhuIwHtbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=648
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310063

On 7/31/25 10:18 AM, Colin Ian King wrote:
> The pointer dev has been set to minor->dev, so replace minor->dev->dev
> with dev->dev in the DRM_DEV_ERROR messages.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
