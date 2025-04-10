Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34491F098E
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305795; cv=none; b=MfOOhdM4JfGhDJMV+M7qYM6AQzFLh4Q0QiV6trsYdl6aRUDn1bPyqgx2XGugcm9hZUMEa90gdtrE8Bsk8x3YdwWEfrIpLax1tRglopfIL8KM8OFmDz/2zStMOEblY9d8OtEFQ5vcuDaPRMR3pgBZyKzyxmdVNCfAknblwdBHPfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305795; c=relaxed/simple;
	bh=R5ybdCkyTddUlOPMRaGg48hM8Ao1y152Ju0ZZh/a96Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUlJ/wuOH9gq48JGm3YI51HUCZLm/rrrto6pvU5wvEjUkCLSB0CrLlxMiD9LzlV0qN3n62SrOYfvSRlWhgWeX0BuysU1pfO5RJ4A5NPeghhNk9gD4HtvukAoarq70ocwd46X+gfY/PJKw8W8NM1sXAh2YKyKdLalLUFvV9ipT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7ejBOia; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7ejBOia"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFLCD5008221
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 17:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3P5K8qIo++EOiyUEYlbHQXKSiyqq7I06DkfJB4A9SY=; b=e7ejBOiaL/xNwWLp
	VZOLe3WCzQY1MSDHQNqzKapEAntXx4ei//4KdJZUToV2SWi3IKd+3Y5F4khnbI4z
	iT+eagahFJhNg9ljUozGWBX+TlFVghLfUhlov2vUcsDnElXi6lNb5V8TyrFxg5II
	ACJ630wwSYlgGE5Ogap3BM9bfUw3NsPtjLlq72JSyr1WPYV54uLuMVGg0g58DxkK
	4IDOCy2yKvrooKKvp6plMIntdOU7Ef7xfLaddL6A4tWy4XfzfKRmqYdQr5ItxBSe
	/JDuGBZokpFMPKc0A1hv0XbehapPV26g9rP9m4UKw2hEpHxXpbvhvpw1H+RroBQz
	JNTtcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd07y3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 17:23:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225974c6272so8988055ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 10:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305791; x=1744910591;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3P5K8qIo++EOiyUEYlbHQXKSiyqq7I06DkfJB4A9SY=;
        b=kvrpn1zCdnU/PDCH1Wd9SwgSiYP0ZfAIX5af1jTlsHy+f96JjjSiqltWaOo7dwdg4r
         YduiHIxYcflD3bz/Q6w1WHWO75LSHYdlGG6OSF5Il1ccMh+fL0BRHI94U6m2ke+iS3Cs
         uBYbJwANIQZuiV7/Lsi7Zaku6ZnySHjHAjb7gWf7d0zqX0ZdiOMsgByouDvdzifm+xqV
         baVIO9kcO4g/ez1YmMQBjrLU+Nv2ixhtX4e/T0xGSEUr1Xbny9xywL2XDdEenXZzSzmZ
         nWZKT0xUfc4uGcQGhQgofUYfWQ/E+9klK2OsIrtlX6p7sXSglssW71BQJq7JNa2GRPSK
         qRJA==
X-Forwarded-Encrypted: i=1; AJvYcCUODlbIRmXMw3z1sEUzzgv4c+dh6vxUPxWRo3om+98vd1q1AQaUQqVMFp84ehSM7rhRe+6wSuyUxVfVCjrDVJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcr2ADAVhMCT4tpUDbxN2F7ifXSKmpVBcWnEGBQ703K3xnYSj3
	uEpZKjzOXQgPJ8TjpYk7hwX1kvVY5AV59AtOhVENvUydahw8OHY074RxtU/QHVPf02Gc8c0c72X
	HoVxA+jtm0AExcbcy3NYUCcrETvydrq8qM1KeItw3glk2qNGg+baFHOtNxtgXeEGWIB8=
X-Gm-Gg: ASbGnct5KA/m7sLKgYlemxF8BnF6Wn3oSB0yvmsLIRXmzDtvICscj1VYgfgStIoRnVn
	dStIFVQfcdBsuvsRy+VxjGhdQtvA4zNhxy4U9Y6JrqR3Wo2FlNsuVZF+Iz5iC0pnVno5dWlZ4o7
	0wNQOdIwQ0/AFlA7RJfP2vAVzMmyHirhC8TqPlcfXJ/P0HHFd9YYOteL5sS46Smr5mWm7k3mGgm
	h0msAPTmizQ+dBcjK8n0psAlueERr/ZrpZAK7uRBQDrPhCIVsGTOZmh747IhHeU+LCi/VXo+mOm
	YcxTiK/bE+H9tT6OiwurOZFyPd8OSC2Gahjo1qBDlcZnwEcUh/IzqKFkEBLs
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22b69430257mr54475945ad.1.1744305791341;
        Thu, 10 Apr 2025 10:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsOm6QHNFoIQoa9xAcmypmP2o9HLNTmyw9hqlhL3OGHmNMXVDtTazPYIXiQbNPMKCZ+GHi1A==
X-Received: by 2002:a17:903:19cb:b0:21f:6dcf:fd2b with SMTP id d9443c01a7336-22b69430257mr54475625ad.1.1744305790913;
        Thu, 10 Apr 2025 10:23:10 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.199.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccafa4sm33459025ad.235.2025.04.10.10.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 10:23:10 -0700 (PDT)
Message-ID: <bb5a6a55-14f9-a854-c8fd-e059d34e309f@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 22:53:06 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath12k: Fix buffer overflow in debugfs
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Dinesh Karthikeyan <quic_dinek@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <35daefbd-d493-41d9-b192-96177d521b40@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7DRqgG7zvUCZGo-ccl4iaveOx2O3_c0O
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f7fe80 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=wh/sLrVJ8DShde116VVCZg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gMk---j7fasVHRGPvsQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7DRqgG7zvUCZGo-ccl4iaveOx2O3_c0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=679 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100125



On 4/9/2025 4:31 PM, Dan Carpenter wrote:
> If the user tries to write more than 32 bytes then it results in memory
> corruption.  Fortunately, this is debugfs so it's limitted to root users.
> 
> Fixes: 3f73c24f28b3 ("wifi: ath12k: Add support to enable debugfs_htt_stats")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the fix!

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
