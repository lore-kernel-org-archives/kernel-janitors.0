Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E22472AE
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Sep 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613670; cv=none; b=OXh+35vuj51UoVl8SvYDB8EMuKepAwIKtGcWICpgtMqAPQEDj+PMD+NiOBEx9OZ+n8I6C/OKDfMzECanJJ/eDAM3Ho5BxTQo5i/xXrtcFR3mZzjWpgyG7EHizWLyHNFLvueOF3V20Uu4O8fY3Y2xe8CXEqaXrSH/1mHbTmSrxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613670; c=relaxed/simple;
	bh=b7wbpm7186exrmEXMnpKBlh8UDpja69phnBSq3imT24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxSNgGeonjCX9GC6Rs0zaGGO8DLxaSmcdYLoW4kR1hDzVpP1tV585rDB6F04QmTF49TC4FmLj7UGWQo5rkImqVWLwzh068qrexjvBjYLN8O4hN9DyFrLOtAOBFgv6zZRQXJIOo/gOqN0/vXnzJCPQmierMh7CXOFvbxBObRwJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4P9827M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dy0XPEzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4P9827M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dy0XPEzZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeTSA941346
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Sep 2026 16:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6c+vR2Xl2NMRz0OkFfpsOTaX2BCXiS4GI9DqBySoalE=; b=g4P9827Mh66irkRl
	91ExcjOaJCPoK54PQkY+q5QCdcS/izq0X1WKAEZ7B1VaMNnRLYlJ9NiyQ20olTBD
	EsZ0JRuEmtOHGDOXwWFoc4wl/mrO7bVZ45smjU7KnCjktw8hzuZvnMf/ej4UXRBb
	b75ibyiFtDPW4N5uVWHk2F/OPjVgofazhbOB2/DOAH56kRa7/XMpMTdMhuzGnwY9
	578dCAU6Y2eL+UVwNdGc5I/cBK/w+7EywvG4QWrr6qGpqgadUFMskkITzv7pbLJu
	5IzfXbOigin1qWC4LTtpVv6CMk0zJHXFvlIa2jEwU7XnHU8fMBur87OfZmkIqOyv
	BPbgiA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt12f2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Sep 2026 16:41:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7930cb5cd3aso2524728137.3
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Sep 2026 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613668; x=1791218468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c+vR2Xl2NMRz0OkFfpsOTaX2BCXiS4GI9DqBySoalE=;
        b=Dy0XPEzZvZWgKWJ1iAN8jgrwAMsYA1Rm1beoPKp2LxwT5w2tlWJRtqmuqU/UW+4cCz
         Mk3nri5YlSwc7sOoo/mxbbOhobT6H6W7vqGsjIkKV8Mjp/N/LRm9eELhupW2MWwS/vgK
         cMYYqcKpUbTD4WEpfHJQejK/FHvW/F3B7twNNWrI5zQgFgivjxprV7rSH2Ufcgi30b0M
         BXjvf0Wv1FIB1lr1/OAKQZ1i69ZMCiJ60fRdVFgrXA2o5kxF49YXn17CFdVWy+IPt4hS
         fc5BCvrPsPTcMTUYLUGjcCDtbZARGaSJkkBahw6RuuAPYNHD4ikaBiWG2CHRpQR5jymG
         LeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613668; x=1791218468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c+vR2Xl2NMRz0OkFfpsOTaX2BCXiS4GI9DqBySoalE=;
        b=ojWF/NCcUhWut5P4+BPVujZxaCbfIl9tBXBLIg7wyv89yDt4fXFc1hQ2u46abBV7wA
         KMv0HpaRtKeRn/IWgaVJsaUbDbEXbrEebrSGvC4P81dBgeO042NT4Eb/QRAukF5rmkP5
         7UrHv+Pk12905lufwo1OtzVkeXr+WxKxKeX1SytK6ERk3jIodMw49PkFFEzvNxO/46oL
         FQxDaRx0P7iYToSjfjxNUrL/Kgzf2YFbCbEE6BWjjzW433HeXVmXuI3bKiVv/bJzVGbK
         MEFkjgZcWLpehE3WVISqwiAaDQuNoDOaWiBa/HQi2SwWY5eqiYKQHA6t52P9kINDqDYz
         s1Xw==
X-Forwarded-Encrypted: i=1; AKwUvBy4ZHCKYOVd5Fv4QJEHc+m3zY52+KrcPEGCL09xkDFQ0jcFFcT1y2cq+7ow/SoPUE1xlXx6Jt37jg7j7DZh0VI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8zEjvHFmrVpWCkPynjtWLpeW8+HMe+Vptvkm9qkRySz9ZYzC6
	RZogjnimYVn+eLg0nkg94CGKrxloQPzsHqaDC4NtuwcHQ9Kvrcrxq3HxisgU79qq1arEysknAqD
	d5mNFwbOFSsMCzsSX/JkCjD/5Xhwp2N1Vzp1t/GrYNWmjT1J3hIvqdWat/CvYnbPYy+kFa6zKRw
	i0aqw=
X-Gm-Gg: AYBFou30bybNixIuRGXG4huCRCW88OodZsby1uwnqCODlO93z3LOIc91SPTeK+/7MB6
	WDgOm083cl2MHZyVR/PSuWEH2fv/PoyviPi1x0uhnUo83t0EZwUHUfXeqkm6CItN4HRj1Z9E2Le
	blSPfHPHNsegnmKTM9gv+E0LLJVKyAVBwuNPJR5n7+fClxMxXmvgJeueAlOZ3n0n5gG4426THue
	DR1uw3z7sypqXozDxSAonXwnWWUXILdUzIPqhDDQo7eVNnSjF5ZWY8GWiXgFkqz5Izwhl3j+5bB
	2ur7BU2H3h6FnIG8Q3J+OfIWJNKlMnjLqneerpimLKpZlg1ugyqd8um7fLloe9lFb/TtKUnZsIC
	H0kPxVSDT9PXEcgmskg==
X-Received: by 2002:a05:6102:5613:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7af1ecf76c6mr5100070137.27.1790613667671;
        Mon, 28 Sep 2026 09:41:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5613:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7af1ecf76c6mr5100048137.27.1790613666989;
        Mon, 28 Sep 2026 09:41:06 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.7.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a2acb4dsm28397941f8f.0.2026.09.28.09.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:41:06 -0700 (PDT)
Message-ID: <d009d500-e938-490f-8375-f016a2494984@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:41:04 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: gov_power_allocator: Use common error handling
 code in power_allocator_bind()
To: Markus Elfring <Markus.Elfring@web.de>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Lukasz Luba
 <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a3dc82f0-7333-465d-85b4-8034b1591442@web.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a3dc82f0-7333-465d-85b4-8034b1591442@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX1NbMbly3Lw58
 uSqJSn0YuoSiUIjxTyVGtw5M9Vhf9Rk5hbxh8XrRoppu/jQ0xFG3/KMcWl8uKxhgkg0aJyK5BF3
 7T/CmztYzeWTVGKIBOpIZ+JwPLyYMn9g3e0lm28ic9D0zqSxhMXqid1BhlSIzhYEU6+y/OSfW6E
 UK4TbpB5G6DOnj/JHpJW3GBbVmVn0GdwLFTtMeXO+IQTxx+0OoW+o+2MJ2ZyI+/zlBDBmirVRyY
 K3qW6kOUVEK+WBvG3eYzuBRSGOlVNPXv1Ggm+7SvpjLCKokVX+Fzc2luqLBk5ZXHBRvaqE1vElQ
 TZ0T3KpAJH+5ase/DKwYetA7oDKwAxy3koYh12/wEVwBzKvZl5UVMnpDLz5zzTHFx8Da8zpIVCS
 zdiYRLVpMZH0FZswHK0/I32/FfIKxtKVCB8oMaeyRgpm138rgC/coIydh1n/bA6IWpk9+t869sS
 U1HsRPfN1+l39hU43nA==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba98a4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=K71sKCzDSiMJbZmyObbiAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=FP58Ms26AAAA:8 a=HHdwwCC6DbPLjSqiHdUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 3Z8ekj27tW62kriGEN6hntpIe1K8BK_d
X-Proofpoint-GUID: 3Z8ekj27tW62kriGEN6hntpIe1K8BK_d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX/27wlO17IKIN
 GYneoPtsJYeytG/AVo5o37+8odrNkaAoO1TgmFvmvAhI5IhQAIjkiQpQ1YRsgirypQSfVuLSufk
 PTgI3eqRgDMC+KRWeevHbfm6iKHGMZc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280066

On 6/10/26 11:30, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 10 Jun 2026 11:20:37 +0200
> 
> Adjust labels so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
Applied, thanks
