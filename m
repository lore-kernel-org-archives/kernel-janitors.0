Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DF6439900
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 17:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222546; cv=none; b=qUsDZM02pJ9n3lqwXBatb6fJuThM4LVXNleAhFCUIvxs2nQA/cNYQAcunYfP6iYl6YEFrKmH7pm5ogkB9w+MWwRDkIhMIFP4GdRs1evjJSMq/C/PHsEjxlI1UfYHlLcrbARPX9Ec7i4I0M1LdubiXYdvMRzgmFXfUI/ESzImbOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222546; c=relaxed/simple;
	bh=Sfg3jH0UTIrgYU9/0unxDo09tpclglyzty17sunV6dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qw2R2Bj4xZe2YAETPxVz+O2sRBGq3RsuKs1N82JmU+/4K5tcYstZctYoQaF8qlsG7PZSu36weNvAJdDayt2EaincDMM4ozK21pgHDaiog7uTKYV+A81qDuP0ZdxQDcnUqxfzLn2ZVSV1xbT0GXIfW46yOZPgD0Re1Q9m03sBWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vf99CgNN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5GPZhjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vf99CgNN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5GPZhjZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSkgp3395516
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 17:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HdigXa7u/9/qM5dZQc/0RHIs0kDasDxkAbhkgLWMwW0=; b=Vf99CgNNQ8NRclie
	DDaakprN6lpMS5YhlgXmxX51iDhthdL9f3DHej3t8Q1j7GY8BrEJhzguxmpKX0bL
	QGnwwqb+9W/mcAAk3t4BaBlPQ+JEZRVaKWCyKIozTbauc9QoPtOW64nDReciDmKj
	vjflNL8wjXbRHItrGsfMqFAG1XL3qchJzsXWZmJQyCVMT2f4gIYxXvJp0dGs9LAT
	wQu2jeKOtRk6/rb44UxvLHeaxuOJ6UexqrER7yEw7dfhH/IYswiMHISXzhKg03y0
	DF8C2KiF8GCduodS9c92u45bvFgK871Ix5X+0wdy/C/wpY7UVOHgAg/3522vhbyI
	Rsm4Ww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym198w5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 17:22:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5424876a91.0
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784222542; x=1784827342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdigXa7u/9/qM5dZQc/0RHIs0kDasDxkAbhkgLWMwW0=;
        b=H5GPZhjZGh+Yejz7URTmmnlvD0oxlpRG9zOpiEy5zNtU7GE7R4+kT/+is7skpU4IpP
         xR8RY68oTyUJDLOnIRzzOc/7QL7eR9oQWO2DDQSZhwGFVC3RHqMyEg6BRGv0joYLHhDM
         bh9qUH8o+Bdv4OvPTnMeLpUyl6odluAgiCtKMGx5yhvyNl0G9E8DfcmI+B19lwHW00hZ
         W1Uj2vCyKByZ91tvgz/seZ6bNXKybmLaN1Aj0UU9oO4aJZomrdLSerLu6Q3mQnF3MT7i
         o/JibaFZMJJ/0e1E/oK6TUYrh2VsAhPvxC0UBLB6WydNJ06brZQh9kBEtvaNr9s9OYGE
         WkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222542; x=1784827342;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdigXa7u/9/qM5dZQc/0RHIs0kDasDxkAbhkgLWMwW0=;
        b=Z8mERkQVpwNxAZGeD0AvA5b/mv889VA7LqP7c3/ygzYQSw+n/cFeIVKBDs17IusFjR
         Ybqy4Srfn1CzFZ3Yu6Bigx1U5Ew7DRKtRiAt3mNIZiY41wz320d//kOin0QBcwOf1p9w
         xa+6fDtADFecbCmkoee07cqScRzfab1mHBG+crVHBGZBZ16YZOvJscLuL/KZ7gVJGOoQ
         rhoDWqXDfBrCo5K56BFX/X6EWjr5cX7sXBogyr9dHOBKOfDER0oVbmMKyoD7NgJ/drBM
         f6QM23IpTC1Q+09ObvnsYLwj3pP2lIUT1ARIhQVtSlzrZ6gwj2R7FVEjtLcd9bYWyUhl
         Xokw==
X-Forwarded-Encrypted: i=1; AHgh+Rp51//IaYGeKQPUcDEfxVpT89cTcc8wEBk2iDi/ugHtDZykZDdOWuZfHpm9K2n+iph58bs3+oTGw1COHFKafmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC7zTCZ0vwlgsABlCUqLj8tyUNI3d2KcWPfj+cR2LYaAFQWaen
	6JZxHuDArwClEC5nD7o0z6Vk9qkB90rcdbQnDcKCNYC+QR+biz0JQiuyVdRn++Sbc6wuh1p/XNw
	0JSgJlYxK4al9IzeJHsNHPRf5owJJbKMpwMX7Fi0dJ0kceITb8syxcliYz+yrQSPql8/xSCVrNj
	WK8Pc=
X-Gm-Gg: AfdE7clNUjKXScUNPFQpHbmu8EkdRmx6SAiMx/c9e3iY2SkFyaJSk6WdZfnVaNvYu2d
	0gCmNn/ODCexXQE8Syohv1y6apHxw/1j1varv0Hbp3i0ZxgSq9FVD4sc3YiLXgDEDeSk9ZLserX
	D82XvwsFlp4288qkDQ71/Cz+91hcJrwLxXBO9Y93k+E8U7TXv6LmX/t+Yk4AVpJT+WN3YEDzjuo
	Yb33kGZFV9BD1L3eiqrO10UM//6R8WL07H4j6+Mcw4VNsotZ0HS6f94sByMM7okTfeQVNF0JKpF
	f3mJ5fQgVCcgODPSATtuussXzLEixgXFttwLK/IU5v2ejCxzu9qmfPmJpz6PN5YJosj0na615xG
	prhOY3eh61jJ9fOhyIphCvM2HQ4vg74oLhPvSoJe4oDR8
X-Received: by 2002:a17:90b:2b44:b0:38d:ee84:b1ff with SMTP id 98e67ed59e1d1-38e2a0f1b39mr7511854a91.40.1784222541609;
        Thu, 16 Jul 2026 10:22:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:38d:ee84:b1ff with SMTP id 98e67ed59e1d1-38e2a0f1b39mr7511814a91.40.1784222541049;
        Thu, 16 Jul 2026 10:22:21 -0700 (PDT)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0dcdsm11848627eec.31.2026.07.16.10.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:22:20 -0700 (PDT)
Message-ID: <4a3a6ebc-67b0-4120-b19b-10208c6cc6d1@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 22:52:16 +0530
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Constify struct ath12k_dp_arch_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59134e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=riUHQTvyFV0r_oIck2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX9AbYimj8C+ZX
 0du0PGlNeWU2byduX4Pwj6Dr2umENTsjyTb2YJCvDODKPlo4vR1kxkRL1RI/UsONAzrHXYRAtw6
 tv6b5ZQfe6ESfY+7xXrXPF29fXqPAHgDMrb7aRzkPquqFRkkdpBu90caIyy2AWXTNzm3yveHz6w
 l5QyNjG5VJbAFXIJRH1ZT66XFa+WTbguITXHWBdKlz/b3pKKwNijj9yxFEXJwjSbQDmVZcx5lf9
 u2BJr7tgLX+YJIikME5n0LE1ie0mFpWnev0c4c+cCB/ELLsiF4bwqesyxDBWIlMiAl+GcgZdjQq
 JnpS/VRzzSCZLscTIkjQG5hY6veKGyCclQeq+ByjsTZAvZ/cjOXW46seLkscEe14YB22B2s5Yj/
 VXaNV1jVF9/dYYuJgUW/QT4/1V1N/qPWAxibqRawRi/wJfjBRyKdwJn02zme1Nm91c7LqktMaI8
 YASDaqALyLQLB6rsf0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX1sg1vlasHZ+y
 T/owavBHSfKSew2vz/3vLH4JfXx9fEVwA/s+6uteiRKzSsaiPVNrwXmfuAOrHbOWfc+MhxgVwnf
 0sTUvRo8BJDQ9XKwbQ2RmzZQYf2j6uY=
X-Proofpoint-GUID: oG-rNv1rfvOCuBK_S1RcAzful-1F_yzv
X-Proofpoint-ORIG-GUID: oG-rNv1rfvOCuBK_S1RcAzful-1F_yzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160176

On 7/14/2026 2:09 PM, Christophe JAILLET wrote:
> 'struct ath12k_dp_arch_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     6318	   3384	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     6478	   3224	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
