Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C63AAF5B
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961610; cv=none; b=EMZzZ3g1tX6jixTZ+KXF3e7prICUi5/Oe5T42+JydwsdC/lIfzTzat/gJHavELloPF8QAyB+KZRi2xKISObhmtjz2y1N2kUQCXbq2If+Mcj7spGDu/suehGzxydVEwI/ytV8GpSXCLIfhJjfOEctc4BK8E/sZueDBmN6ysF6+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961610; c=relaxed/simple;
	bh=izXpRg5NB+9nlyNont/cYCyinl/3i4bKia3T2r4PYl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eroOP0vWKrYzc4nVoKeWUMXdF5Q6pk3txWnup3d/USX9aGcWGjx2SKlo6QrDpNoPLx6T6bUEmELxOh7bdBq1ueA2mJnSyhZ3etOXNIEQ7ELkWO3QjyncEctO3m3DDUAttvy8dfhadLgMk2qk02vlL0vIreb+xmegHoBcqaf+rPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mu35dJcK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ02qbed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mu35dJcK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ02qbed"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9deWF1533518
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 10:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpiPSSQW23w1jI70p7EhI/WPcr9sgeEzKZuyi79EAz0=; b=mu35dJcKtB1/VU1l
	MMyv3sHHPWLjNL23DTp/jjhRxV3f8VToHaqzybk10i4Qay64g2OdrZeNdv7t8MtV
	tssrNcsX5C/hBGFVc7Dd1A2xe51luuHhxynBSvhTg02tOs0gzxrpOTshBfvAS/Bd
	7C/wX7fugHVTVOcp6X53314gpLhBEnTq6uzqB2E4AK38wIp1CWxt0O95UEEBd0Fb
	UFDeGRhno9cuCiqnnTEDXFZlO+TgJ84WPBFQbPVELLZ4LYFnNVihaunIFn5H3JY3
	KBVSUUsuiWYd5ox41h/J5d0DFtVXepnIG8e3QfrgFfyCpw2N/RRyJZpRgvNcglOt
	cGoRPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1ggt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 10:13:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90786218dd0so7076836d6.1
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Aug 2026 03:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786961607; x=1787566407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpiPSSQW23w1jI70p7EhI/WPcr9sgeEzKZuyi79EAz0=;
        b=ZJ02qbedXD5JnGAiaHtNkqFyzxLlyCQhJS7AJQxDlEueyMpPbmzIYXfwuJfZnSm7qi
         jgPmnDfTv+38KO3oyXfD7qBaH5tW5K4REv5LNbRaJzc9UnnQ397yoLtDxfRPlzZradbV
         MSeoZ7V5okFwrULCz2ruYPwFFgUTkNUY5Gy5Wltq91i8uZ0N9Gu87tIvlLNC8O/sDr0f
         6pilB649yvIhS/TNSDMzH91Wjf2R8jD4Hujyh7GsUg9qxJJjku2xZTYy3KBARbOhp2ln
         Eam9LVto6R60azKDclOJzIid1AGFStkhuadIvTWHcfzagOlPCNdpkLrp0CsWAQs4eW9m
         Hl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961607; x=1787566407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpiPSSQW23w1jI70p7EhI/WPcr9sgeEzKZuyi79EAz0=;
        b=B/iLax6YfQVJMoYciR9irZevbYlseXCzCVeH5uQfFdelWyozAOmNqEf8Yb4ADL9+SW
         +C6rnjb9qfRggEddLb6jOaWsIcDq4hwOixpbtN6dzx5PtgXrmzSX+CSYt15OmYuQlMcO
         c8OzJJh4yBOX4FkEVo6TfsSLSdARFn68yqBHvqwyGn6R5JNLzJIhoBNz6JY7pimCyYIO
         ulh1BNNao9JCX5w2W4G9eQjWSeXdqj/sPqRKumhEcamR0BSQzg8uIFVv+YSWoIvyOErR
         8konWIuF5Z1FNtNEFCCIHx1txTdvBBTJVPPlOoCoHh31Ht1KN8gBsA9TDxvgFVUHnihV
         Nuuw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5KDKJqUqmr2D8fx5xRA/HifhSysJDUViCiRHrWHXBq43SwHi1dumwzl/cXfKHnOYzZs+XfVsmLJwMegvMM6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMTPokM1oMaYkP6DZcmxkKKBM/rggGhkYG4Q28Bnn7rkiWOOs
	YyE4bheZzE8WgBFUG53gEgxevXdY8/baGVNhiTRmTisq/0Yy7S5SlTHlT5rZLZOPufqmTBFTh6t
	4iuBEQ2IEAgNpWuRCGC4r/7PMegfM8edPv+mhstZqhHr0IX1UapEQkfxntVj72QGFDhdGqpg=
X-Gm-Gg: AR+sD10nDkW9KgUvKi5AnKOZJaaKF+SEkknglCaNHVVKNrJh47LC8EM/lp0jVqfoQpT
	lZ7dfeHPnze2Cmoh2vPv3FAFFEEBhBOCYIIwYPE4IiFNpJTnfIWQdYgDoqWDi941hkkV3o9swJY
	cRj7TwcoV0vok5sMf1HPu/RsYcDJlSlngjeyPfgSTmsIKA5JQz6sNU1LgBYbL9vToOSX8H+5Rx4
	BS/UGZKyt/K2YRlFIXz2YWtqYpSN2HUTrf24wthSVOgsTC59wiN3xn730cYzhjVc6PSDOmYI1hg
	F4vDXdLX/sALRM2fFMJY32gexnSAWslRfpi82raOWJQkU3kCJpPzCHm9QxXRv6Mtlpzt1clMw4t
	4Eq15tI4jpXXdUq2lj7+OWvrF
X-Received: by 2002:ac8:5d06:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52d8514128cmr168763971cf.0.1786961607364;
        Mon, 17 Aug 2026 03:13:27 -0700 (PDT)
X-Received: by 2002:ac8:5d06:0:b0:51a:8945:312d with SMTP id d75a77b69052e-52d8514128cmr168763741cf.0.1786961606991;
        Mon, 17 Aug 2026 03:13:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8531625sm444479a12.12.2026.08.17.03.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 03:13:26 -0700 (PDT)
Message-ID: <841cb92e-f156-448a-89a7-b04f5b3591c4@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 12:13:24 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] soc: qcom: smem: Fix signedness bug in
 smem_dram_parse()
To: Dan Carpenter <error27@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <an1toQ-acGR0kOWj@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <an1toQ-acGR0kOWj@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82dec8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3q-kQouqzLBrfUuUvD8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: -rmXMpxZ3kvOeJWUUp02VhxBTKnqGiwn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX6pLkOV9i4x/f
 pPY6iNyCbi/IVXD53cJPE7FICw2KDxScTHxTsObgqfXyYH89FR9junMIRd7x1WBcqrauelChlD7
 tLvjZkTilEQXRj0+Zqhfot1OpL6IECtekGNcOlSjq1HQAgFR7CoYSbNrXb4tLMLcfXdwqKc99ph
 Wyx1PBWPLnvP+qzKNBRFddnG3gzdpeDmhWGtrGhlTDDlFyqXODTVZ8Ynhd0m+bD6PIpOxd5Hckn
 FnI2oQtfqIpdfj9KocCPbWkG2v6ibhSFzZfhtw04tvAURAubeG0zEcoaUG8ozcefykYaZ8ssEXq
 ANQf1/3ho5JqcC/7LH3qJnXP5qD6eKynmrTAovZz2OHapK+NzjeVgNGYNLASJO85dtLz8f3CeMZ
 p7oJCYv6Iq0pQ9r5Wlt+qs3T4EwgcUz8XQtYTmIBxPnUs9ttXlcC4+M7s3ZmW9Mbz+z7aBe6r3a
 DXKRM7T/9kMOk24bQeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX1Frr3JfGQEvD
 //OgYAZDi6IaE1hQWXsPUw077ENUWiyS0xfQXWfzhgft+ONUObmN5Eks0io/EMHxLsI8+01kMdW
 6PFJigfnwDLjh3vBtuSrWwrXkmk/jJs=
X-Proofpoint-ORIG-GUID: -rmXMpxZ3kvOeJWUUp02VhxBTKnqGiwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170075

On 8/13/26 9:09 AM, Dan Carpenter wrote:
> The "ver" variable is type "enum ddr_info_version".  Enum types are
> dependent on the compiler but in practical terms here, "ver" is
> basically an unsigned int.  It needs to be signed for the -EINVAL
> to be handled correctly.
> 
> Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
