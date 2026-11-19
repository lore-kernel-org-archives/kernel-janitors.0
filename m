Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084529;
	b=4uMdU9AtKFFgcM9UrslM/Szut5VZVjaNYF+8XWPePJkVM1g5HXmnNcYHRSEI0VnDhhFx
	 80XmU4kDpo+y4dWVPccO6LgEVtkv0EmB8VrbwfxPBeZGp2WTOPXlrvaT33z7NNYjC4s52
	 O0yNPWqTwjJx8JSq5ZVFDi1iAJqn8c2WTP8tjgK86hDVbyqkvc21EZ7zoBhBGly03nyjq
	 cBPgwSqyY5XcDEQx4YnfXSWtXhhZSqOnnWkfT6w1bjgzZsJ/K0iC3GCi4krubLRM31e33
	 iuP7a+1zEROIXRb8E0tAytf71FIb2Ho3CMVEMeFlteCPywFXzl0xrVi0W7T/xW9g75g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
	b=uRj1weHBHd4QIyIQUGCLMEyKUgbUjmHxHbOP/o648+lEKr+0Ccfbq5E4xr8lZbrjnXBR
	 6M57GgMQbUMiwOHekuupEuJPMAoNHtiGFcbI/nC/K/ueXyxgQYl7akSV8AD6luyIvcqZk
	 ghSHck7bBTFi0Dh2zteFIabHP72fZr3mm6omLvkD0fNjdGmSyJb1bUTNdbUbFaEqhYW2z
	 xtEyP3cbq5s1sA5z1Pq4fiuBXnCZ9rUyCz0LRFL4RbMRQRMORSldt0qIqne9dA6M1kE69
	 z8h3M8ApGZtThIOu2ZuoAVOPxzV3BHxXn62TaeSCUuQVJXAiBwwDWlOJvYZ/fbn0f6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcfjQf6T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEs3TUN4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635D606A326
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 10:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4635D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcfjQf6T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEs3TUN4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ9xrKa3351581
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 10:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=; b=mcfjQf6TW5pUx3ik
	7wCEwTKM/pEtSHAzhdW41rpIfKhqj4q70h6/JeA5SWJgk6ZpSnYnVbrRx75oYPF3
	4z5kT6B9vpPg6GrVHxvN9Md/63GXQDNXlmgRtIHpHaPm9XyFe4BPkg5wTOfcVJas
	/YGBEh42IlsICnVQSN91glTcE4s6J94V2HfdjpbSrY2N9RUrNlFnSHNp6/zILFLu
	O2SFvLa8d0PnklJfX/XiCBQvz34gzWlqPSvF/e50ysT9TbekwAH391s6S0BAQ3e9
	NW1EZzIWD1HHjDK4HLJs0X1083GavdZLWya5MyrJRGc29FLCd6Jwz3cbYtUixSiU
	2jgfnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymg4bf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 10:35:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso396590485a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 02:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084526; x=1795689326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
        b=WEs3TUN49r7BzVVrpbPYgSUAmwgV1xmr9y5/y33hD+4EYg6iafwb6FTmPKVO8oHBeD
         zGvIwL19J870RNP6raf/In9ik+rDYBOJK7RkrW3RfgryBKkH/8k1czbAZMSTS1tLSo5c
         +C43d2ikNrTPck27fTbZe433Dw63ZlvELoHti0Ri9upfJZ8x3Z5YLjTouJg4cg9eAlM5
         Ebt2R674t8SNGkvzEfXpqwBO97Wvl7BIBNc0+npBmcOeiPRn4U4wkwoxWP4U3uXK5knx
         m51UpBqTr9NOHDMWoAs6dWM/+qcSP15DFIpYc7/zhdSjAhcG1SZ5H4t/kS9GThAUanz8
         gTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084526; x=1795689326;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
        b=jPKxkcv/dB0n/cJNXC7OPEG9SbSVvunRc+DgZYlNowN8GYDlWWYqj5SVn/7Jf54QwG
         U1Vjjut47qooxk9a/9WMGKF8Isjp00oLfOfnnG0RoTRGobMom2LriXnoAcPrQMRfq2u6
         hGQRmVrh+CLp+fr3YRn6DZ8KwORlV9oYipkOo33cxAAk/+7VC4BxhiLkaENJPW6zfEhv
         c2uG6Q63sx0UKPdbpUeL82LasEQS4ZGzHbuB3r00BEoOvFOponVZRVIwyfks7o7p+PzT
         VnkBOUoPPTkjX9PTSbY8MKxKfpt0bDNvIC/lh/HFPz1Uv/glmAvxWnCmSqqf1QS1k3sG
         Z1zA==
X-Forwarded-Encrypted: i=1; AL+hErElA+FYvTlfwFsVLVn17w6Vaqe9GU+hLCWuJq+VF6jtjoQiDlCAPfZhm4lMO548Xb66qzDnoY98m8tL2lHB9ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O4bqO9hlbDSYdRoKD3k9cvua5CahbU7yCWfjGeyOCTqMTsh5A
	98RjVpQR2pHECj7xEZjDMBIG6V2tkZ/nPv1yYrHEb2Vjd50CvKSeAOmhgi5+yjova1IWaiIklgA
	CLSRJSc1fc0lujFbdG5H8w3S0BTdE/FrR5mE0h6wApTd6lJ8xsKQSwVEGvLuRHS2cJozagDg=
X-Gm-Gg: AYBFou38yuy6XTT/LMo4l/TjCEiW7mwC5F4rwybtXxc0J4SWHnBVsa6meLGECHcrvD8
	YkxgT/SrQzhmXOgy0cxOwqfVpVW5/aVa1G7YTQZqF3UVCRl9n8bBxv3b2O+5w5I+vqt+CWUMV7t
	7ALgbOoehR0AQXo2f5zJyRBfcltYGBCQw4wJ1x/V6c9Pbv4RliJy9r/a9sYnf6m0J9L0KxfYlSf
	t50ni8DGiKBFa6zO8lPq72Bip92T9XDEOPN56fovo9X+0xRUlThbsVwKNC86e17fIOZgvf3LSuB
	W3GaAFuoVQda5INFlnp9Yr27p+tOz6GXzif8455tR5p2y+FCYXicFJfjfs9YYyOGEZxQbBeYEOg
	0QijnUyjtsPLWrgVb9rnLhJpX7K+oRBd+8W6Ne+VRQRzk5bCJsU1FGoSuxey8virvYisR/fFlck
	g=
X-Received: by 2002:a05:620a:4551:b0:949:873d:3dbf with SMTP id af79cd13be357-949995e0f87mr931934685a.59.1795084526323;
        Thu, 19 Nov 2026 02:35:26 -0800 (PST)
X-Received: by 2002:a05:620a:4551:b0:949:873d:3dbf with SMTP id af79cd13be357-949995e0f87mr931931185a.59.1795084525819;
        Thu, 19 Nov 2026 02:35:25 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm10237506f8f.44.2026.11.19.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:35:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jiawen Liu <1298662399@qq.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
        Dan Carpenter <error27@gmail.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle debounce clock preparation failure
Date: Thu, 19 Nov 2026 11:35:23 +0100
Message-ID: <179508449069.49049.11977204683056699145.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
References: <tencent_B4F504456790E8BA3C4EAB80F4BFB6954E08@qq.com> <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfX+9CJc/L77nM/
 UzyARlT7DaiSh9lr8BpHjP5CDWktixmXp96b/Dyixz2WDhoQ01GjFFnEJ9Fg8RCWRiRGZONITh2
 kPZ1n5RK0lLu6ZlO9ZriXsC2b9HWowo=
X-Proofpoint-GUID: XB4VHLNmA0IttaF4x40r2SGutnCzEmjb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfX75mn2sgrbBnd
 IW+7qzS/YFO5AUH4auJFi2sVylHzuqyxHO3GXo4i7lVC7LHEUeOPNmkJOpf2blxKgdrN3G6sJQl
 d0fBettYjWLbbGE5stgbs3Vkr748DVV33mNcGsCzZcAIUSeGldw30e9es2ZZz8rkd+wFbZVURKr
 jPE6j12zQ1hltnW5EvVa+4aa4D0SIIOqcJ0jGvbux1lJPb7NaOK1wyn1WAX5fX5ojCdzcij9QwR
 GNk6l0K7b8vxQtYm8TQLfbHJ8HoMOZlrWzyJkMYi/nFhbLyrBWgOkqmnbXkKuBAkFGY1fYX8YsI
 TWjX5dwN4KnfBCT3CsmGG5mwFWnuU8mSwoGrSlE3ngVwnFaro0PxqN5UsRQeahvqgOTjSOtez9y
 7uGWhU6T7yMAXTJOSYX78MLlutQ6YLurXkC4zsQ+Fjsyztc+qw8X45mtfvdUGm2nHbwBM0FPGz8
 BdvB2ZWBts4X4ZqHzGQ==
X-Proofpoint-ORIG-GUID: XB4VHLNmA0IttaF4x40r2SGutnCzEmjb
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afed0f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AXu-sfnRVQekOsvvnCgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190042


On Mon, 09 Nov 2026 17:42:04 +0400, Jiawen Liu wrote:
> omap_gpio_probe() ignores the return value of clk_prepare() for the
> debounce clock. If preparation fails, the driver still treats debounce as
> available and may use or unprepare a clock that was not prepared.
> 
> Use devm_clk_get_prepared() and disable debounce if the clock cannot be
> obtained or prepared. This keeps the existing behavior for clock lookup
> failures. Remove both manual clk_unprepare() calls because the managed
> clock is released on probe failure and device removal.
> 
> [...]

I dropped the development history from the commit message. Next time please
don't send new revisions as replies to earlier threads.

[1/1] gpio: omap: handle debounce clock preparation failure
      https://git.kernel.org/brgl/c/9df982f1f283d2f2a9aad764dff92e36ed764e16

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
