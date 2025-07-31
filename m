Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C503C291C19
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953680; cv=none; b=CFqeKyOGxDXwzRbZ/g23+KTualUb8Dhaaah7nfo0lIk9Y4hLrVAsmNXF9hU068XgTdpEnMBv9/7kk8HwtquZLsjJvqt+z9VRXUCPHJ7d2USMhD3wkFn9nAMzZeIuYmlXWXeNy7JRwt+amgumyEgUnj7Y4Jh/UxPd3p6CFMMJAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953680; c=relaxed/simple;
	bh=qlDKy5v33MNBCPwvxdICUi44jXxFlSdLVNybQ4r9BTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjIVvdLMUL+JIo7I/KfV3rKz/Mv49Q0MTb/PrFDCkLRU0ryCqEmEAqXpQ+7wAD6SZQBsQBYsyZMiAZ9YjHSrbNftkO+aiLxiR5KlYyjiYKrReGfZivnjgf/AtRjaJ4PAQMUL1wkVtLb2H/2QDLQbbqZ7zigcajdHBkUXtBKvbaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSeyS4kk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSeyS4kk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fTLX008187
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 09:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=; b=pSeyS4kk+WgAAnwY
	BnB9TcCKMH7aFAq7f4JT8nTSkiiIP6AVWRZ1X+GXkGtRSHQjNEJD1rjszDN1tHqE
	Ig4CmpPgC1chcXjQd+xX9pUKIspPBfQCQdLbZnboz3J9Po361Iwz9rZRiAX0HO8h
	nUmFiqiHXD+8ft8mI+etNuBqHaDfeeBUK6oxAGXeDTMwN1CClupFeEm90Gu28Adx
	ebfkUGVuUxG15rliIYw/9fHrP3e+HvVj48d3SN3PA6f/HGndAPQ52EVZBLI25tPT
	jiCoZsXrzYGNz9yv31Lm2bj/19xS3LXrZfhZ4A2cW1on2SA+fiLncQ9PTDWgjSoK
	JZrQYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2q116-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 09:21:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab61b91608so2337781cf.3
        for <kernel-janitors@vger.kernel.org>; Thu, 31 Jul 2025 02:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753953677; x=1754558477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyAiPZN05+p3QMCIsbsm3CJ18gwqmsxE7OQUlpLa+6Y=;
        b=VKhjotEHorcZ67EKkZ2Ef1OszZJyoGGJzyJGRZSz0qSCoPwLbfcYgW55IvbBqQjglT
         4VQtcjFwcSjn5C/TLDNz+JzAOSOX65kKO6jIIiswddBb1sBFpenhOzIoguW3Es0axXpS
         TysYSt5/Z1jxkcePZCmxyCxD+W+yRWaeA6SeNpoFkL31Xr1rtUZlhWKl4xSjVV5fVKlg
         vcT0Y6cQPVScfZyZQEozwGxVoVBoRoLCnf8C/MAqT+QrgWqkPjBaS2VwHzpQpgpLRrHb
         aJmREw96xK782Fv8PNCeBVpCg5iHVFMcc+slhREzi7j+kyGzdOQ4yLNzfGLvMUe3se5A
         QnAA==
X-Gm-Message-State: AOJu0YzmOAMknuA9soE+Ls1qs3cu5RTbyqEXb27XyXnbGPDa7W1plMtk
	TCL7y6bdqXVR2tGncKr8WWPc6dJ2hp8NL89um+MhrAEmZSa61KC67LfaHFW0cgPDt6cAWU9wdds
	SUe83WJNJdHCHgembBMRqIAivovv9YH79q+DTo3ARH+KaJ1Cq9yV3dsA1cmj9AKvjLR6pHag=
X-Gm-Gg: ASbGncuP5gdizH69zEmDn37JbLV4cD+WFpzenfDQiy5Y3r7K2SeahTz0qLyGPja2LI2
	ggC0OFhpBFuP2lVJx/7B0stKIA3w9ScFhZ60ORJkkMiASzfKwFIzlRUGvsW4nHuqjAJq8tt4+G4
	is1+Iy8PS1YTgvprlzMPG6uA1a/kcxoHZJB/ZY2C25cFhNclONg2iYjOSWqZBc9zPttDga1WZ+3
	zhRUW0TgaF9cus5PofLzjRrRFvdj32fUXqntvzoSuBMlPjdb3/JkFzsm/Jmn08ZGQF6YLV/uNha
	ByhVxXh3OjAX9vQ3Lk8BPUUSPY2NFP7tvyKwrlspDquKhwVlZ0ZGtQWiULpj54B7zUcD3xCv9so
	cVOFEZqsIdq5ak3T/Vg==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id d75a77b69052e-4aedbc5d109mr47967001cf.11.1753953676644;
        Thu, 31 Jul 2025 02:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg7y3Mzh8kLpvXdgFmJK6NcsIZpRA/EOh3rdkLqhLgosRXc0fkF06g5WZgKCLXL9Gc73OGlA==
X-Received: by 2002:ac8:7f4d:0:b0:4ab:72c1:cf31 with SMTP id d75a77b69052e-4aedbc5d109mr47966681cf.11.1753953675720;
        Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3792sm79613466b.50.2025.07.31.02.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 02:21:15 -0700 (PDT)
Message-ID: <304124f3-3686-4a04-808c-7ee84356966e@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:21:12 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2][next][V2] Fix dereference of pointer minor before
 null check
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
 <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250731081854.2120404-2-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Hzn_2v3ymtP4a3V_hAZ6GRr4SMnaM8rF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2NCBTYWx0ZWRfXylt8edKiUYrn
 sOwQRD8ddw48NFPM/GAebfLJXmcH5TIZPUxZT26YmFWAK77T22+I06oQ8yTYuxSzeb5/ylr8bzw
 TzhaT1y0+HqVKKr8GZctseySE2YDwgqzXyWdgSClOSFqRyG2kKG661/6rqGrPJRZ5/VNNdjqTiK
 Lw8c5/YxkGCD6hWXGUWPSUyph5iqbYVkRy1o0fRFbuaeZxmxEsyJp9n5fYkIcQWFRK+42sQ+MMD
 A5ibsTEsoNMl6VXQE6zQrZnpAEvpUNNoUvaALYhsw3keEb0xecwuPpr95cuukh/xHS/E+zp8HCn
 g3UWitgR6q17/6NEqCehLEdY7nMvStVRN/UP8DYdd5oqyhklVyfagRjx9N+oXZpH0HHzZZdFUUC
 EAaI6VUsy2xVMAgT+2CckmlQfk+eQZ0zUuUEUG/2A+kA6lNQYvDT5c+lLLQv6ppv6e2Lm2Hf
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688b358d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=uhsglmO2XhRCQ2AnPp4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Hzn_2v3ymtP4a3V_hAZ6GRr4SMnaM8rF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310064

On 7/31/25 10:18 AM, Colin Ian King wrote:
> Currently the pointer minor is being dereferenced before it is null
> checked, leading to a potential null pointer dereference issue. Fix this
> by dereferencing the pointer only after it has been null checked.
> 
> Fixes: 4f89cf40d01e ("drm/msm: bail out late_init_minor() if it is not a GPU device")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
