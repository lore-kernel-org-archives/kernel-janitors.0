Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626207;
	b=p9R0Nug9+1akb7Rh7cBQnRNAtyEH+RiFuABZ6fm2uTnnhNc9nvCAViGy7d8E4U2QAgI1
	 PYXVAFyNli8Uh3EwrMj2AFt9q7qmxwuKkLXz8n521XSMjOOPUb0vpkbotiC0n9N/TV+qi
	 6Cr2Bs0c7sRK64hGGOtyZU5DcXHV7LfFOEGKKKW1THvZr05+ydGylIkAQ94Te2dyOWKV8
	 YC1F1SXnYyM/NvKTrQ1aCNSbF2mg6ooKj0zqXwCVojOjkt9LhL9R4nJ+lh5ksrsB3inWm
	 IYZSem5tastjDtiddFE8hazGL8sZxAWTnl5N0Kp2nenbxt/OvRfCs9UN8vh2IxknQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MaHSdSC68YCgPi3lz8iuASH0f6ZOoGx8qQJK3v92RQY=;
	b=QyKn3L1RN8VR+ubzhP2WdoC5z/fNbLnKBefy4YBulNSE3QaxAg8odRJD8515E4dqL/jV
	 Zz3tbxVeR1QODjHa9cMJySjucqOxVfanOawgtf7P5gD0tq6KcAHE8xZFDTxAQzOJJhPPs
	 yEg6o3D37XLiXGHetIOmUAJtO0ijjsRpwDpN4OM+rmb4qOJCHNbmvDFPry23C4vBLC6Jo
	 akIf8FGBRj1d7DSL1lIeSHsrIQcHn2Jyap+d5gTUaP3ePHmYSJdlUrQsR5z80htGpWPNh
	 Y7a5L9uC5yD/Wa3gqC53w97zBXpI1SDVhogdyuYDTDFm+9/f/1RuX0o/HFWDj1ek96Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZutqRrGj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF3VqCj7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C2606A333
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Nov 2026 13:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470C2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZutqRrGj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF3VqCj7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAL3t756924
	for <kernel-janitors@vger.kernel.org>; Mon, 2 Nov 2026 13:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MaHSdSC68YCgPi3lz8iuASH0
	f6ZOoGx8qQJK3v92RQY=; b=ZutqRrGj9Qy7ij4ckTkadu5YKgyRayrkWPiVgddp
	TrmgYQVhehE4pI8aHMq9UfhDc0LNhNLjZdcD8Sd+I5ltaJF+gPj74JhqOWGvrk52
	NPGe/HEcu02bQxGOS3pksJ7JXFNNhcd+ewnxudTifFrlYLih5FnUnWvsJe5J6Siy
	Pj+aVjwow/37215QXQhfgZMa2nmZOGjZetepgLzfFMx42tTtjmfeM6/OkCBjZ9QP
	v/R2xZwpWvu/PxmGIudZWZfKkLEIGkjPOpWyEmdV1YVHGVmLzG7dlGs/aiRPsCiS
	4HciFR09ADNU+5Mq+7bhky/t/GfbRkE43fa8PY4IK3miKA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1ssvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Mon, 02 Nov 2026 13:29:48 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo569025241.1
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Nov 2026 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626187; x=1794230987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MaHSdSC68YCgPi3lz8iuASH0f6ZOoGx8qQJK3v92RQY=;
        b=FF3VqCj7/p782XIzRyJTXW9i8Pt808MrlF7U9B0/BrjVwU7KJ4yPmHdkbkDNN+7LS4
         qnwkgh4ivqGk2Usqcj/xQkT0fIQcap0xhBvBSEJvLsj5GgIfk833hcwaKa9ffUSUUBQS
         8Ts2z79Hpp4doEhaPtmBicILLG1p1vnGtK4InDxQH7PXVLXRjrUZLmW5Ae10ntKbDwuJ
         +eysul4BuMFAPxGffAr3y3MvCfLEkumnlj2arb7FmqrWSZmM81BsxL1dr4aS+LR9rOzs
         aUmhCrju5yNJGSeaKTp/0n1WLSR8/FPoOFvhISt8BpIFRYizmpCxEV9+UddZAU34WHNp
         ki4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626187; x=1794230987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaHSdSC68YCgPi3lz8iuASH0f6ZOoGx8qQJK3v92RQY=;
        b=FpmmpM1Bjl+ElvK3qaNiIMMAxiAff+KXdjstqVGUAgcF1zVsXuHRVvyD5oXKMtpek3
         3/hCkbM4qvNa81c/TMgEy7xXr7JjqTa7IoGv7xT1SO96C2RcPApRCLTAm8zzAjXDcxjv
         cvF+Pr07FwsGIoN02nTWCaWllV0nYPFJZUTC31jTZ3ye5LFYZSN/PIVeco3bTvS40PJl
         AKLOFZb3SW7sa5uudHMABav9YsRlqgG3rE9+VAZQ0GOwtOUJlGWtLo2/JLAUZzXAvlre
         luQIvbXtgPJCZV1e6sdBO8m3XZ1b+KBL4oD9fDNWHSIL86SpUdljIlGPaDj+/I0tafu9
         hPIg==
X-Forwarded-Encrypted: i=1; AKwUvBxtQH7Z0e6CvU2Sh+Bu+RuBAqDH1R2tGUAubw2BMjsQ5kez4MZlxTHg9rc9had5pfWPRGf7eEWNW6xUVI5CNc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RK6R2fuys/sgkNKWLPM/ROrr7joW8N7p95InsdmlVFAL1D8HA
	dLz7kl0fbicfkNFTGf54uXy9eT4Ct0akwtANd7/0zxWm1N/5PAlU6zPlOuA77eT1JxqXuewcN2Q
	4tKUCnZ/j4paMCwAQ5zHgFtU2bYftnOiorgu/WKzH5NqPV6A80zpF+zibovWY7ZU46twsnmQ=
X-Gm-Gg: AYBFou0cUM0E8oVTmF1BI8yB1z6N1n3oiQTwC/ZhQjr/mPSQJlPuD0Wvj7wEPil7xHi
	F3aeYlqd66Yoec9vWISVBcWuPkxkdxLElqxlcoS6yKCoedTR5f914kPgQ/qmw9AEScEUD5UKP0c
	R0e81F4upBAo7ZyRL/QlbhbZuqck07J/m1vcaLuyTcTw4g1ARiicAmUDBU682VtqIYxra1X8dXM
	GbDhRqSZMluFp8sVD+PlhnYA6CPuKwLPgytUTT8SFtBGFcdQZUL08pZUBRkqtRyQ8Vt4QR8BmoU
	ycc37UkrGy1oc5ApcaidTU6u24+yRU1bd58ha0tlsVhkQNCSV+WkdkAl+WkRddim5vtsGqz10Mc
	RO41LCfUexwZKJCDGKtYJAXcW2QP6qdmRGgyKYu6MYc7WS1QWlhMJPsPYdfp2p5w=
X-Received: by 2002:a05:6102:5486:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d0728c1b0amr3490571137.34.1793626187281;
        Mon, 02 Nov 2026 05:29:47 -0800 (PST)
X-Received: by 2002:a05:6102:5486:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7d0728c1b0amr3490562137.34.1793626186628;
        Mon, 02 Nov 2026 05:29:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm21455580f8f.32.2026.11.02.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:29:45 -0800 (PST)
Date: Mon, 2 Nov 2026 15:29:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] powercap: dtpm: Constify some structures
Message-ID: <ujl42bbqnsbakun4wffbtgtytojsntebdyt65vlpgxbz6mr2s7@cjqsl5j2kbm2>
References: <a4737f7c69e044d35348c1e9c7f69f229070d29b.1793524483.git.christophe.jaillet@wanadoo.fr>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4737f7c69e044d35348c1e9c7f69f229070d29b.1793524483.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-ORIG-GUID: 87wvvuujtktgq5Tn76JUO9dpzfq0AC-C
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8904c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5Yrv_TkWLuZ8LgkGlGMA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX17H07KXYrVel
 Ur/JwAEeCwUrZwzIttEWkiLAyEPal7YUBEPkGihjkZxrLbtajxj8VYNkO2ldg0KN4JFLPvxzYBb
 MIef0wZJgEQ3K7dITmhz5MgmMzXbQIeK/OWjaTVOCwjLl1+Cjl7ptjOJJBrt1GbThFN4UxuFt0m
 VvfjTH8/HeFGtnfD4DOlMi/6A+5CEwJeNQgPiTiTVXcr20ORDZIG4gXez6uKtqyz3Vbrt5NfB1p
 UgL7z0M0JtfvPM43cMOtHGcc9gPsq/jojOLMU9tzhbwwdFwQcOfqMTh0VO8qRd2SaslpJMU5Zuw
 d3qIdx579pfN4ipXilDS8LFgaoGIamFLcxpVHtw/GOLBQX1szX5zgzzTJl/9MH0KoqwG+/mUv0o
 JLPyVvoe49/JGC0dhOVyRIEhiK/Fv9qWzGZdbpLfUgXoBIsg/bSP7tDqUwcTS7A72xp6YuSY5GA
 JRuivPgRmQ3v4Ihyxbg==
X-Proofpoint-GUID: 87wvvuujtktgq5Tn76JUO9dpzfq0AC-C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfXyxnFpcp9OHrX
 KOw+3le35X3Og0yexWbXDSkPKVilivezfQq3czgoZFd2u5jhmVsZUvHyT6m2f8nUsM4qdluNapY
 4Yj3CXrkQlyMRxZEQPwLvI7L6SucIzE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-11-01 10:15:06, Christophe JAILLET wrote:
> 'struct powercap_zone_constraint_ops', 'struct powercap_zone_ops' and the
> 'dtpm_node_callback_t' array are not modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   22049	   7736	    128	  29913	   74d9	drivers/powercap/dtpm.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   22273	   7512	    128	  29913	   74d9	drivers/powercap/dtpm.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Seems straightforward enough for me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
