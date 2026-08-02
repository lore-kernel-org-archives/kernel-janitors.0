Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BBC3C0A02
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Aug 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785683852; cv=none; b=CHPihCj634Nxyp4kXkMthu82wSn9yyBrOL0myBFfeVdrNLJHCnCf2agBctp3jB1BmmjCE735u+e7YIWGDdEw4Zsp6EdlcqtUOo8gDLV2F1Qz4SqV8sKDfVmvCfzk9TKwEaLolRSpqn3jAreoLTtDT1LhnVxdEAw/Rw9xWvWw4Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785683852; c=relaxed/simple;
	bh=kwKtCzHqVNLmvmbRWDtZ4qdaXhq1tzQF5H9RXZO09l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqmrMhz9MrU1sRMBPKZw7xLZDSFIB0Y98MBh8+sWRJJkuaxHNAl/UwXIbWOjWRS+mHeQg+WH8NDgA94ocu4JBwSyuYSne56Wk3R1wYZWfTOqVVkOk5isDKsy9j5WNMJ45hCcztnH/FqyPS1Z/XYuQOWf36bePmN0LSou7hxWisY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mD/ZIuNU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xkvq583R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mD/ZIuNU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xkvq583R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672Ebx1t2097483
	for <kernel-janitors@vger.kernel.org>; Sun, 2 Aug 2026 15:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4fKT3525c6PBfh1O3lI3Q8DpJjSKVVm/d7bmUxqPxLQ=; b=mD/ZIuNUTxXPOT20
	THiAYaenjRmX+viLFqYfjkQPJ1BwJb85Ale1ksqnpFcHjLTht4W0XcLWidSuSTQ1
	v/kwOxG/i2CyLge/P6Bevil6EWEFKRdKLEys65XnTjhNsxvSYd/gNnP0R/XP1q5G
	i7UpTeW+G1edK4Pc211M8g4RMYhh9Zr/7/NCmJED1FhiRohGjxudfdtAfWq3hc3H
	QgjbyIMH9K0R4Vr97nTPNeIATnAlvOb/S5iVUlJ38CNZ5hoNmaQiL7wTS2E+j5nK
	c8inK69HPDGXm+H0hEqNAfuUl4pWws5ylFo/J24QWUQWj79bB/2E3aRiKcC5br2p
	0as3sQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911b1qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Sun, 02 Aug 2026 15:17:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a098ea19so245432385a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Aug 2026 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785683841; x=1786288641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fKT3525c6PBfh1O3lI3Q8DpJjSKVVm/d7bmUxqPxLQ=;
        b=Xkvq583RGkkN+g16Vv9YA8ekSPL3Gon1sIrd3V8ncQ1eFEqTGq2hjRLFmPBDQ3Wz8/
         ZUiMCQZgyjTziLEdPZnCAdhuBs9zV/85PUgOKVLBDP62worjFoadFnbR2NOiFsv6YE0c
         A96euPghZenXbkxJTaDeFj/G4jcGmtSYQApYMpUKbwEVLIyhcA6a9By5qaIOyr1uAPpi
         paDOEhrpZL+V8+O2W3eC2YHaDDxIa0jssjHWbI5hgemrrszetG/F2ehT45eK9mUuRFiW
         PbjjggDjP7cDHV+ic41frJJDUilDm9P0HlMaeRY+iUMApy/S1Si9e8zJShmeO56pNB3H
         cMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785683841; x=1786288641;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fKT3525c6PBfh1O3lI3Q8DpJjSKVVm/d7bmUxqPxLQ=;
        b=jVH1fqWj9jKKyfQ8nRaFlCItroonPmEKvOQbxD4JRugkbnLH4Fv+YLr+rIeLmMzF3q
         MWhzXDZNSsy/u+OPkJbP1CXvcp6z1P9yNlOHCk46UZDlvSn+NXUYwKZhGjnAjgA1WvAu
         k1IAA6PwLR0hZQN54XQC3ebP1VMP+2SdFJnzQP9vO4VFQUEZSSBliqrqdz4KXEPy7q2V
         Ocwx+WwslT1uLbVOqrbk89ljJGzPC4TwJCiGQI/AspwNOQUdY/1d3LdGlSDVRSsges8a
         nikih7kCS+ywTV057q29DrtE+AaajsuUElOdRX2JsEc8t2F5/7LHUD8XKQgSZ0TGjGYN
         wHnQ==
X-Gm-Message-State: AOJu0YxxV4dpUAFvqosv0JGQ82dflPohwpIRVnqN5CcOdn9rq9BshiJO
	tl2yqxOqPddSylTF11/dy16hHXJlBck9ha5MLSipTyVvjQrY0ilxU2TRbmELh+71nkThN+86j3d
	d/hhbC9ixR+mjRI/rrJvoWAm5US9hiD8n8l3rxO6XetssIq3qPjx9O6g3qGnmv0bLSytH+4M=
X-Gm-Gg: AR+sD12Ndo/Oom6plnhRqrcVJrvYBN5xgQc9oyASGauudGPBNdeD9uDsiDlQMA+ypjk
	/Uu2clHL3qKS5dmQj4cRggosX2LA9QhVomaSFt/oCqO/gHAJF2Ao8HoTttWTu2wnfbiNfodBLMu
	Fet4WhOCmUq2MwbsCRnZTXOhQR05gY1KAuGcQjQR3ZBnT+nEquZwXZv/StyyVU2oSTxN+fGbous
	1xaKBSCQw5fYV6PEifpoC70hNJqF2eURnqjnMolqZmGP5r8T6LVCRWNXk/xBuSe6KGbep8JKLMs
	AAThebnWMFsX2c9pzzAH7GrwPL281Rjfzo95YPU2orjdoBjrrqsTrwaV/l1volMiXDGDNa7uCU0
	M5I/rVt14kFQMisurgX/rQ/SLw7EXzhl6y5vIXoEUVjt/p82k0t4=
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr155597341cf.12.1785683841324;
        Sun, 02 Aug 2026 08:17:21 -0700 (PDT)
X-Received: by 2002:a05:622a:5916:b0:51c:15c5:2bf7 with SMTP id d75a77b69052e-52b56695898mr155596841cf.12.1785683840851;
        Sun, 02 Aug 2026 08:17:20 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b4bdc7sm88966865e9.0.2026.08.02.08.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 08:17:20 -0700 (PDT)
Message-ID: <7f0c699e-a530-490e-bfed-21840ec07861@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 17:17:19 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: BCM47XX: drop unneeded semicolon
Content-Language: en-US
To: Julia Lawall <Julia.Lawall@inria.fr>, Hauke Mehrtens <hauke@hauke-m.de>
Cc: kernel-janitors@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801191002.1383835-16-Julia.Lawall@inria.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260801191002.1383835-16-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEzNyBTYWx0ZWRfX3yF43oJOGLfO
 YiDUznxdZxvpyIj6eiw40GETGU+xnkI2LB9Au8VPgSFWTnWpji35w+uGiofLv0tl3y5oqs41zvj
 rLLJoY6X78s76UBExBXBDzN6WSaSPfg=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a6f5f87 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jl7ze4wIOUVbGjB-TOu77Dj28GZkW9IB
X-Proofpoint-ORIG-GUID: jl7ze4wIOUVbGjB-TOu77Dj28GZkW9IB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEzNyBTYWx0ZWRfXzcaKh1IwAlfk
 xflJwyEFRmpzuDuW0SKLDbJKqd/5F0DJj58QlOdEziK0R+JnNGJDa2HheBiMNFoowgvfUjmcY6J
 bgzHa49/PprhiKja+xDc8plIs9qNYst1R/YseRrhy+R9OxKvikMM+I0WSq1gCyCuLuULFD4Icp5
 mahPeqzARIv6HfUMmPswQ2+p1sVJqaStWEIggVx7W/2bya04uj/F983jXmC/IONrFvejatfC1Dm
 /FBp1q/tn6BTub1p59gb4EAXs4Z0E0PONWxQ6Kj9+3xP8Lns9S8/vZuti6tIwbPYP5IKs8khhLk
 7cdcOo239c/nd7/60hc/VoH1HdMh1P5FcMWOaYKaZSjh5BLsUbIrFYrI9HS5C459mBvT1sZJdCe
 GtJaOKxxgl4g9UrdLzcCNY7W8j//S/UCT+/gZNhlfBtXiD0iLD5noyIoCdDZrtIJr2i8/xar3mn
 jGs4TshMeXHfNQwUSVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020137

On 1/8/26 21:10, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   arch/mips/bcm47xx/buttons.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
