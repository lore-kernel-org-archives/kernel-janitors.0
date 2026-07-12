Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6330B535
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Jul 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863034; cv=none; b=I9talN3RHy7c9UuktPAPy4cFLpF+scNFhtBaUii2omhZBZceUl0ErnpSBevF7ZLml8q7NJnkc/JPCQMJkq6NZ9Resd4gusHcDR2wKqitY2emiazgC8sJdtLTMzYZGGWBtWZDkESaSnqRr5YXBS0oOqINKKgfAqoi3TdpZVDZGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863034; c=relaxed/simple;
	bh=lb/BAo8nt/synyDfbm+lEnhjYWT3KhROXJZc8197IhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=diiIfAN3ADUx6mpYv9e+klSRqUik6C4+zbfgg3/r8a4hbFm/XKJAg3Dj6I3/uu1peK1eAQkilZpLHcF9fhvCpYQkOflGSYNdoO846fVF24C1NdCWvii4C0OeUAlXLuuddVxizIhc+FwooHPFKk1f97JAo7ICnVttFaZbMojgJPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yk71QcsP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFnzSenR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yk71QcsP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFnzSenR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAcdsM2324521
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Jul 2026 13:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4uHhiyPDur1M8sX3vop9wkmPBwPJCdrUdMn078zxrjg=; b=Yk71QcsPfmUAcpUC
	ri8yyNK/LBXK3z7oCGi56+sC8lkTtaoIbICpaSXoI6gyN52T0Ah9a+Y3vh9+DB+H
	AKU3gmMiNqaxgQcqxC7bz9297hdJ3MzuDncRBqOGu5FFQqLv89JGYRKKd+LE1DSH
	cxz5HfyxEnp1ONorkGHNEDYXanVEMFSflDFybOJXwrSmaojBImpLTm9yN32JTySW
	nXvavCffINO6Z/BriIejal/N1nNssPwjmJTrI6Hb9dExke9UUg+/x8RnowOrFiYs
	h0uy45MkVBKf6vK2KApCfVq3dpquMXuhYtLFCNWhoxy+rGCaMdLa8zgDbsnFW+Z0
	41THug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehjvd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Sun, 12 Jul 2026 13:30:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc73f47bdcso40369295ad.3
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Jul 2026 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783863025; x=1784467825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uHhiyPDur1M8sX3vop9wkmPBwPJCdrUdMn078zxrjg=;
        b=KFnzSenRKG75KSFm37V4OJvAdEGjwr87WC9v/zM52Vx/KHxxbapalBe+/UL+ww3Cc3
         J2sfJy2vMhy2ZXn5yb87JoPYMneY5tF0vBxUjKCrx87tRFZAw9YtWzyrAmwQCE/9ByRc
         lGzBXTqH2lBoQgc31gUxH4re7x+sNT+VqQcU3jc7m+aMnc0oW4IumpWpVtdHb/j4JtCx
         qBhoxDbvlzLLzJXluRk0LzhwTLpLgqHvbHzsgaY3ZjP20lOgqcvG40pHsW3NW8WheuPn
         qm7PCxcG0W9ARH/4Xb5IPtqtdVAS4jiB4xgQFOUB2suWYlh9C6K2Qsde7VtKaaYPPR/0
         cXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783863025; x=1784467825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4uHhiyPDur1M8sX3vop9wkmPBwPJCdrUdMn078zxrjg=;
        b=sfTpYQ5KQalQMDkIrOJWdsgsKecvRR+2fTsxv2gN9M6dyGbpmfFXzIHdpT819ivYoM
         Tr54LFa/sVW74VKWAbLhpQ7xPmsC+gmga5f3mm3X8d1Yxa9Xs/3kOGiRvwrnXLTYvSaU
         wCWpMWiayO198To4O0pjabQxK/Q09eENDyC4BrqIBOIUmM1dTG1ynCqh4Uw0EWtQ80bd
         T+yG4aagBCopBgg8Zr1NWAaBiFB60M9K15zKJbfUZbATvjCFad70e1Tkge6uiZWM7q7N
         Sc/qd8mrqr6njmKSduQ23nLFI2YoXlsgmgi/67XqrTBxPyp2oZglCV/poXx1DfGtMODH
         ekdg==
X-Forwarded-Encrypted: i=1; AHgh+RoD3VFDX4y4/5OhJe41rCAcURSrKGwrncbC9GJmCabA62EUXMLQqri6RdkNzyFb8aqOx9Kkx7+EiitUVMmQPD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3NbCu+THnWG1ASIAdgAO6Qlq/DCMHl40a98EXmpjixTmUa/t
	zCLJ8fjQhzrGe6DJtIWqkfBMBFtF4xNdQxSNqef0FQfIcaAO0JA9wlRCBPXEAhx95ZAmJ2fL0Cx
	i92Rjs8BRmyE/NclSA9L9ltxEYiHKU6zfUMMC++WtYkVSJCdA4uGDouN/6eu3a+yMVKCJvv0=
X-Gm-Gg: AfdE7clOvQMBahu+Cvv1VOfWwWmjoqjrefKojiFTS+fM5V1goFh126x/luZHJyCfVW6
	xCKZJZxmCTLQG3zEnWvl98uBatU7MMyxQd9y2mm23Ux+fmh6Pu06XhgXZgzeBziKgrXQhqBTZCt
	P4z7FnXizRN9tzGGnWazIKND8msd1zqWtEPyYylqhe2zC1sj0Ff/XSvjvWlpeESdbmpBgjFtQvA
	LkxN+MmrjA/W3XJ+6OSvCnE068p9egS3rbVc1dMwhWsKTZ9/kksw+cjNT07sDa7hlXVHNOVImwA
	Tc1r048LwyQBRSAywoAfkvash0nTQC6n2I1UnMBd8e4AWghPLFijaFs4EKPGduC/LOc8d/Bnf5a
	CJDingXiyo0ocEd7nUnPQtuBtkLG1IKv3Qa8imC5qSKbFZTBsuRA9ZEcmD351B/Rp3uXchMGUoT
	DdKqujBOs=
X-Received: by 2002:a17:902:f68c:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ce9eab4f48mr68185505ad.13.1783863025148;
        Sun, 12 Jul 2026 06:30:25 -0700 (PDT)
X-Received: by 2002:a17:902:f68c:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2ce9eab4f48mr68185185ad.13.1783863024679;
        Sun, 12 Jul 2026 06:30:24 -0700 (PDT)
Received: from [10.133.33.247] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm85304465ad.31.2026.07.12.06.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 06:30:24 -0700 (PDT)
Message-ID: <c0800c49-3435-4e89-87b2-21dfa20ae58b@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 21:30:16 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: Fix an IS_ERR() vs NULL bug in
 spear1340_set_cpu_rate()
To: Dan Carpenter <error27@gmail.com>, Deepak Sikri <deepak.sikri@st.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <alFJNUllC3JOKv6z@stanley.mountain>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <alFJNUllC3JOKv6z@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE0MiBTYWx0ZWRfX3RMvd2nq4bzt
 sd4oiNDOgfe2a49GRUbUgDQHgTJ/kio9pWY03sMlGbctPb4vQtnTA9GcRQssUHyzPSsruPhOwJF
 QY3cH02PmD9hesrGZ6Wstah2JdRou1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE0MiBTYWx0ZWRfX58CiR5WCStou
 77FiFZW/LS8P1p0glPsvD7NV1L7vrSmlJIiwdFCNSKtr2t8plZbeQoGhLnK7qOFFKa72lOrCv86
 iVaFqc5v6cVyYx4J7gyXvXECQpp1qKQOqeOxLsapmqNj2f3H0/Af2rUYZqKaFGBmuf9jjpQr06P
 yseQ2w0qUxx3ICWNSYg0uiFnKzkZ4lV4J+cuy5/OwvvPM3o+aKvqOHNLBwV5Z/iRqpyWASVK3D3
 siKcER1Hh2YVg+46MG0YCY8BHSsOzU/JYVgKM0dlZp68OJKGYfOmhlE5g+glQHCYAkdyf9AS7ZN
 0temehYicPWqj+YTg3ul0GNJre+70K9xMsIv5EtOIcQ3U3swWsbUbKM1M5RQczKvz1IiZIAqQLA
 WMZzwz9wIT/tPH9y02alCYf5Fmo3c7SA8JtAjxrIkxhS/XQ6g/oxwuMfNT8GSrl6cQaxgxWrcdo
 WMSVniBwjovfj3A02XA==
X-Proofpoint-GUID: PoxS7oDHpYBiEB0JS9Urx7PZKpOEXzHM
X-Proofpoint-ORIG-GUID: PoxS7oDHpYBiEB0JS9Urx7PZKpOEXzHM
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a5396f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=N0crexS4lfU0QNQj-gkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120142

On 7/11/2026 3:34 AM, Dan Carpenter wrote:
> The clk_get_parent() function doesn't return error pointers, it returns
> NULL on error.  Update the error checking to match.
> 
> Fixes: 420993221175 ("cpufreq: SPEAr: Add CPUFreq driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Nice catch, thanks for the fix.

Nit: the subject is too generic and can be misread as a cpufreq core
fix. It is better to scope it to the driver, e.g. "cpufreq: spear: ...".

With that:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/spear-cpufreq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
> index 81a0780b2ebf..ffe5eda82f0b 100644
> --- a/drivers/cpufreq/spear-cpufreq.c
> +++ b/drivers/cpufreq/spear-cpufreq.c
> @@ -79,9 +79,9 @@ static int spear1340_set_cpu_rate(struct clk *sys_pclk, unsigned long newfreq)
>   	int ret = 0;
>   
>   	sys_clk = clk_get_parent(spear_cpufreq.clk);
> -	if (IS_ERR(sys_clk)) {
> +	if (!sys_clk) {
>   		pr_err("failed to get cpu's parent (sys) clock\n");
> -		return PTR_ERR(sys_clk);
> +		return -EINVAL;
>   	}
>   
>   	/* Set the rate of the source clock before changing the parent */


-- 
Thx and BRs,
Zhongqiu Han
