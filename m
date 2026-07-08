Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F13B7757
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jul 2026 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509576; cv=none; b=c1hSWYbnV/Ykr2W7lSGQxBMOJxjKPsLhznUr47xsQKKyOYes/pY5rrMB2fNbka+dC0etp3Vye7jHm0qd+pBKxihncQWZPtX8zzdGIgesFsgROqrNkLJMi2qLUriG3df9vzdtro2lLm/+pmUZPYVoMEd1dAp7xL/Kvdf+R487mKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509576; c=relaxed/simple;
	bh=1Bu2bsvkEVqEImDM1RKDkfEvjpFS0t65Hu+YiLDoIKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/LGx2e+qOtYt6QX9Nqlz4WIYdE4bLxMPeHhp9W3xIdH/bWAo1SOCAjz6VWUYZPVgC+2fqEIVVEiwc9pTrPwrjxMiANglNVsLKVoVMSy9tOMIPUBoiS5EoqRsaqB7W5NrH4uRGyfrpfpqKJgdzGPZlihXPWbA23Dm2wAkpq3b2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nh3Y8m0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fP5fPdSR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nh3Y8m0q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fP5fPdSR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668895Ux2070465
	for <kernel-janitors@vger.kernel.org>; Wed, 8 Jul 2026 11:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTmYSciHNHuBsQCBS4o6R2d1sOrn6HJvwBfNDLCb/z8=; b=Nh3Y8m0qUtuZVVBk
	lQZbqP4LbQC6FDXuTwVmg742dHSix2M5A33Fd6Dja2sCBWaPv7imheQA8oIT5H35
	4yHQ9/fiFv8OQL019Y0puFTAO1PO1Y0dmfIc0qAktC4RdjA6XfE0wfwG4dT35zSl
	c/+UE7xGkxD6V7+vN3mjGp+xw8ZYDWgKxxdGgRFFbAfts9zT92cAOt1eZ53Jc3jI
	P6b3KueZZp5rbvvdBw4mfEbrZsOtQiiFm+HFIsBZV4DpeIkcZsEKY3k7nvHWDc4l
	/0YCqLOBTtk25g8POm0RWH75JiXUaiZ8LKI1sYYCkRwPBl95srqk29NBR5OHB/rl
	x3lkfA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5acgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Wed, 08 Jul 2026 11:19:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e3ae05d649so9460826d6.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jul 2026 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783509573; x=1784114373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTmYSciHNHuBsQCBS4o6R2d1sOrn6HJvwBfNDLCb/z8=;
        b=fP5fPdSRftGPlng/axL97gt8xgsTxaAhacEptviwhe3oE7lUIvIgYJAJwYFbIgmeVi
         ZqO/q4b5AOMvPxrabLtjDYMrByUfGlaNJ7oFnd3IsxEdOcjutxUJYW2Nio5ByRhUEfO6
         TgPwCgq/puJQsr+dZDFLSum9VR3iyk9Te47brB0xiEmaTYEazeyLTz/0rKk0XAsu5Nuw
         quCJpF10BMRZKWftSk33RULG/xiQNGfykbUrTyJCsreDOp7H4wmo8bdaGOQ5u6zsbem7
         UtVGcJWLhRub2ByHJ6Avq7ixDnOReUOwPp38tv2ne+I5ua2MiMP+99HtDi6qjnOUCIlx
         oxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509573; x=1784114373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oTmYSciHNHuBsQCBS4o6R2d1sOrn6HJvwBfNDLCb/z8=;
        b=S4eLK7AlX3kBB25RKwspzSkOknLgS+6Mke6tD2+hTNRiQirhwW7WjRxPAYdpf1oZ35
         CHgYr8n29mzDNUDsJ/fufFNmsgPVpzj1zvQdIheuGwoupUAE0hPVMn8WAMCJONkxjfvw
         vDVK+yY7GzzW9yoC21CYurBl/TzChpdsGwchCgbwR1xlxNd453crIOeabCo8IvH8Q+nb
         AUgLypf6DXQThXzwQTGtGix/2Rlfb7j18hMS6qRZe7VBpT1nX07iucoPvJ6hOuO3ewQh
         Kiqfwc65/L0xd0fK8W0BwsMJfvH34j9DVU3XigGoiz/hbse1l+yol4q1yMHMApq7WleS
         TCRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMgzAKjAr6O1mLB8eYaOlSxOHGzuDLeyM9VFAW13kpgadHvBYkcrTrYnW6gHTGZ/KxGPEDR707F1hUUcTweV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3N9etOFAX4czcSBjGzn21K5UKoY9Bgu8K5u3LCiRl7IhjjfrD
	qbbLxJjkdH2V6tDUm49dRKA8bTt5AjqGZKR72CGIeINZwWBSTI/8adjgbYwG/QohIQHZvn9tymd
	nEDtULyXRdMpeLmNzK8Wp+I/WTgEvZTIhTRL9M92f3rHcQiqBZi7fh3/4CW3iOn6/Lcv3fXQ=
X-Gm-Gg: AfdE7cn//RjIvWK/bIe9GTDiCSfOdMAGocdz+6zjJRhSVcx1ja3ClTPC1myafLnM//2
	rTPlwHoBUNesJyXx26tzW4yI7t/mfk+5wXRxTyD20jGQCtSzg4q48PwWgA0+qfVBw7Bt3Fe8TfN
	HQU7R1JIIVCgWVaUtBWk1TTa4VB3vsGGXivPf4i7Pte2dZxtKJmY6KAWBqN66HYZdSQa/9m9iue
	1lr0RZF8bt9CDjf3BGVchoT2TcSv2EK9vrK3pIShIjpthztqE9px8SlkTzcjTxBKwyj1hDf5IUh
	3iREzG86iyru3q0nUYkf5GYEWagJA5WYNumJdMazSzEQ5ABqBh8F5ezIpNODNz11ldvD21w9+pR
	p83A7KHqRHAJoLbzFTy0tjfld2ICk3LpKl1QhYR7TTHBhhjVAqzou4xzV4k/Vavtnnpu40kUI4Q
	==
X-Received: by 2002:a05:622a:1104:b0:51c:1c2c:a8bc with SMTP id d75a77b69052e-51c8b45709bmr20330891cf.37.1783509572936;
        Wed, 08 Jul 2026 04:19:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1104:b0:51c:1c2c:a8bc with SMTP id d75a77b69052e-51c8b45709bmr20330641cf.37.1783509572493;
        Wed, 08 Jul 2026 04:19:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9094:f7db:443e:b97f? ([2a05:6e02:1041:c10:9094:f7db:443e:b97f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbb410sm134729405e9.12.2026.07.08.04.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 04:19:31 -0700 (PDT)
Message-ID: <91e4b9ac-7967-4e8c-af3e-9d29fa813fef@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 13:19:30 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal/drivers/rcar: fix error checking in probe()
To: Dan Carpenter <error27@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aj5WnseULiwgmlWv@stanley.mountain>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aj5WnseULiwgmlWv@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e3245 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=8aaFJO-Im-9i58NN_ysA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX4NmFYBO3MKZo
 ZQDNqYmf9UmDapTJE1S7O1a2XjJ7JYa48uWt3K6XOgsDXE15+GtICv3HDmKsEjGVYnVklDJxgiS
 H01VfjPIVOGRigTDXp5zmfIOhGh23T4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExMCBTYWx0ZWRfX2TvY3QMQ7khe
 AC++AnObsozDvooJGmBynOmu2zYDkZ60BtcBw7VBIEYDFS/5Fbh+QOkqwA9XeKfYdijc9nsThLS
 7BtW5Ur2jdFY/wlK4MZ+C3Q0KMaMu+p5ceclhENsGB4apMkTcElRf1J9AlDPNrskjsLg+bPOwAg
 3kQlNPTNrKNXzSgWx5j3XMt2N5g4pQ9W41RzZdKa9ZLMFFy/ZIP4tJp2W8i4JEWgZ5oZ7OxQLJC
 gelk90+vE2APBi9Y1qePBxNypdQDkYkvQuojCaBrFHNPHS8t1aPe5H2teZJRjT2N/PN2rgjgTkm
 BJWyU/CEgFATD215cxnEB+eqfOblRLByuus0YCPPchmSRvP7nFK8JQZCjudEj8Y3J1Hmo7ce5J4
 V3zYEYkcTqQ3RYgm8tkBF0tl4WkOznbFXT9DLuNpsL5W7QdGZ3f7Tl4wf6IScL/tinK3+Qn4blb
 lI3B6FRvOXMdntgHPaQ==
X-Proofpoint-ORIG-GUID: CmUTeXYj9AsEJ6xnwW8xk8MhF1LRHwVi
X-Proofpoint-GUID: CmUTeXYj9AsEJ6xnwW8xk8MhF1LRHwVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080110

On 6/26/26 12:38, Dan Carpenter wrote:
> This code accidentally calls thermal_zone_device_enable() before checking
> whether thermal_zone_device_register_with_trips() failed.  Move the call
> until later to avoid an error pointer dereference of "priv->zone".
> 
> The driver works differently depending on if we are using OF thermal or
> not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
> call thermal_zone_device_enable() if not.  We can share same error check
> for if either of these fail.
> 
> Moving the thermal_zone_device_enable() call is a bit cleaner as well.
> The original code used a three step process to cleanup:
> 1. Call thermal_zone_device_unregister() to cleanup.
> 2. Set priv->zone to an error pointer to preserve the error code.
> 3. Set priv->zone to NULL to avoid a second call to
>     thermal_zone_device_unregister() in the rcar_thermal_remove()
>     function.
> 
> Now we can just do a direct goto error_unregister and rcar_thermal_remove()
> handles the cleanup properly.
> 
> Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied, thanks
