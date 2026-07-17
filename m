Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F7030C163
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784308120; cv=none; b=lK0MnDhqThAK4dw8SCU/0ecvALgCe1PnnohPfRvxOQYEdcHA8JTL9otnRqktCdFtJKyk0l0MMpVp8NY/CvHwa/TKzUyLxogxIjaD3Y035xsGMPf0rPGSwVWJb1hcOuZAhiDOY0TwIm0IEh7P5wVbcRtVUkUWiMw5Bo5KX4qtNTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784308120; c=relaxed/simple;
	bh=v9rwAemXOjJTrviJF/bhq++m8F7SpFsDGXfJ0ogZaz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4KOrkGM2WGvgH2ISZ+nUva09kqvGLoYEJdUQ4hlmHqudL4DUMqEdCNOxi9kwHhEOehU02QTBlkgcl7gR7PQz7H7FqgRTZmsSk75hNFCe+Cd3C+gXxl9vxBXBkFekzr1sAHnOCoJDK9fxlGNqzeD4ALSzmc7G+AaAnU4mvc+p58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WedKg/rm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MN8MP1r7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WedKg/rm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MN8MP1r7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HGoOnr2478457
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 17:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	as3BzJOlBKPvMbzvYeL9WCvkFBQI6sOqi8ZlzCtZ3cw=; b=WedKg/rmLwpUri+Q
	XUEOxKQJXB8qmqreY5FSdEKcVqF8suGCye0K9URodZHGqEmgFxf1gKPjFzGlEoJa
	RBpMVn/DvaA/UTGXOLunm+alkCGlAcda1CjE9lGrcrNLxyRuuJNsjDbEBq5Cjv94
	xcy/cNnmNwNKVTmAJntJiOrj41l5wd9OaSZ9NfBS90SR1h3G37nHo80hQ+q10WQx
	fn0RUBlyoCxVi2pW4RMr0amBMlo8w2Auf3YR1bENULUIgof1KwkPrm6OQrkyYDHd
	A02oN8Wdfd1DVZ8nGTundh8jOhYD8RUpETTMIv44i85smz7Dl7C5uyWbSuTtQvwm
	RVcUyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfhtur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 17:08:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso8485396a91.1
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jul 2026 10:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784308117; x=1784912917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=as3BzJOlBKPvMbzvYeL9WCvkFBQI6sOqi8ZlzCtZ3cw=;
        b=MN8MP1r7kv3FZCYs+DEgQfl39OVgRfujazrcfw2Tcse2pkgVfReSr+c/E5RTUaUqwX
         VZgifGklWeEV8IFThDQL4F1KIUDhT3wIajXPpC/nW4lDhVMjCtnMwjvpTVJyjzapTJkp
         AFJ6YiSuv4VFOPQ88fc0Za+lEAGTuTGL4hAO/wKkDUlBk5zMcIWEldqQ4pAD0kjdSqKi
         iCVUti3cNuOvQW2R3PrLkkqfrTw+dkoguwKoFAcPcjRCL01FjHHjaX/OhX6dFF5cn3QR
         DkVGswv0AkGJ+8suTJ64xzKlvLDJuWOWS/oc8Xx8OWz0w4nNVD9gnH3E45w4ExbBhSyz
         miUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784308117; x=1784912917;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=as3BzJOlBKPvMbzvYeL9WCvkFBQI6sOqi8ZlzCtZ3cw=;
        b=kyuB1QvDlKv7aA8bxx8m/hg2Krgm6kZMm8S6Nv6ADosYiaTH7u/VqPBTeoqRDKyPE3
         VMuaWZw4e1NGgEGtj5cyFBmi16sh5dXj/qdGYZv5RCAxNngrvX4RSSlhh1vE9ZYw8/qY
         ZKz8WhgzBHx/vDnsWWX9fw/O/Nak5uT33ln5td+XyPT7F31eP8pfDHluwCUrVFI2/fkT
         HJRTDqsUbjG1wQ7VGSSnAFfO8+bJ6uF3a9lZpTTJl49RcyS/38Czj6n6zO5pfvvvDfCG
         SkJprzYB+NpwS3snkdpuHh0ZOcUQjyt+Tewgr0nSSwuFp1+/qtzuR5t3yTRXZBiJwd36
         j3dQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpzo/RSt6djsjEqjq3kLdLw3ArLT3eNyFJFRziZN4FQwt7AO6L/W0Do/hgTZ0i7dKcnC9oGgovVHs1LiTFYc3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy82RjiBPpBo+iKCZjtHex4/+9iDNnbFmhSdZvvbbJ6QdXqoNQK
	oGe+SI5TBd3s4OfX7sKVBoTPpWMMugosOxO45qAwepnjf+qW9YWvBSHtYLwbZUXDx/3SEewDd56
	0/bCHUeBOmFpibp0/lqrzApl9ULGWxvbic5p4Ap+vZaicdjn3w1XxcyVSbnbrnIIZypgw0mJYk0
	PDU/w=
X-Gm-Gg: AfdE7cnpm3B6Wwe0fFM7w8rno4crX8ThS83uyJ5j5ImxLJ0/R3yfXypzwgihkp+JCEn
	Ep0U4eqTF3sNdCxCIk+zlaGIoiJveTHwKC1QnI+MEXxlmVIonKw6/xnteC3sTO+nOe8Hha3Xi05
	nK/wwY+2d/lP5XBzIc+UfgojIIrcF7oakl1txNWXiCjUHoWQ8TmLcCxeKsuiDAK0voI980JvGQi
	0dFF25zcwmLsZOgUH/G6ifkMmcM9BOTra78p3gBF09Rgxgf+k2s7Emp+iryjBZeQvJDtD+TPxPQ
	n95c35/YtzmLDauACOaMVfhuTGIAZVjPGdwny+fGmZHaRSDzesGmMhuHXuFL5JTwvPv21YsrwNZ
	rBRUFrz/YmIEudk6uFaPP8EaW5VdA6witPXcm/f/zhaJUa7TcneC1n8N/EQ==
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr3604171a91.30.1784308116605;
        Fri, 17 Jul 2026 10:08:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3942:b0:37f:9ce1:cda8 with SMTP id 98e67ed59e1d1-38e4b59469cmr3604119a91.30.1784308115921;
        Fri, 17 Jul 2026 10:08:35 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm8941834eec.31.2026.07.17.10.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 10:08:35 -0700 (PDT)
Message-ID: <9d7093ab-dd98-441b-9ccc-ee0b7fad7923@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:08:34 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: cfg80211: Constify struct cfg80211_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <5aace954b6ef5c42017b83a1bffb859618e9498a.1784013180.git.christophe.jaillet@wanadoo.fr>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5aace954b6ef5c42017b83a1bffb859618e9498a.1784013180.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE3NSBTYWx0ZWRfXwC0LG3vpHaLy
 vtGQ5i304AJJ6YV1hne+uLmcDGBh7+V8NuiDSXNO6gbbJ+qh88+fJhIxfSPY6aL9Wy9ognqdwrZ
 Ea4UQW38/LCsR4DRWcz0wSG4WxTJ8OvGxFM6dGs01JbvWQSgEWAkc2HBycieicDg9EiCO47hphF
 JpcghQSQL/T/bvB863HKxdacGQkLf2tgGOwEJrjT7T3Y/cqKlt0qn5hRI+17NqEGy6pl7fntaXs
 9lZ/irtuSqWL/J8BaBKKQidS8D7n105NQYr1acAZERhF8dkcElVy9JFMQbnwhP/z/up3Y6/eITd
 pl0VCZ4NYvPds74MPwexafXC613acAtzwpXxDKFMk6CxH8exLWzenHoM/SUZvNJqkS42H9xS3jL
 L+gJ02E9Yd9dM3FhSqaPM29mIg/AXJZtmxlQDjO+OL6Z2KVJTic6QSvdIn429gK6+IV78eQAslQ
 UFpPMGWUim9OOJa6HNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE3NSBTYWx0ZWRfX1jpmTdlPv7lb
 8S/U/DzFm1LyjmTn3QnmlainVA94+68t0uLyscLVwqsa+H1QCJ6RXTOekb+d/5UvhYdjHO7c5/r
 IP2fe6eCH1CUznZPbTzoaI16ZvPP30U=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a6195 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NKF_ESviEq-D5M3B6qQA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 0jASbeAQgx84vUvu1ZY1yvTJE3GNCCHA
X-Proofpoint-ORIG-GUID: 0jASbeAQgx84vUvu1ZY1yvTJE3GNCCHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170175

On 7/14/2026 12:14 AM, Christophe JAILLET wrote:

subject tags should be wifi: ath6kl:

I can fix this when I take the patch if there are no other comments

> 'struct cfg80211_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>  143726	  34579	    192	 178497	  2b941	drivers/net/wireless/ath/ath6kl/cfg80211.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>  144814	  33491	    192	 178497	  2b941	drivers/net/wireless/ath/ath6kl/cfg80211.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> ---
>  drivers/net/wireless/ath/ath6kl/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireless/ath/ath6kl/cfg80211.c
> index cc0f2c45fc3a..ecde91159b54 100644
> --- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
> +++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
> @@ -3437,7 +3437,7 @@ ath6kl_mgmt_stypes[NUM_NL80211_IFTYPES] = {
>  	},
>  };
>  
> -static struct cfg80211_ops ath6kl_cfg80211_ops = {
> +static const struct cfg80211_ops ath6kl_cfg80211_ops = {
>  	.add_virtual_intf = ath6kl_cfg80211_add_iface,
>  	.del_virtual_intf = ath6kl_cfg80211_del_iface,
>  	.change_virtual_intf = ath6kl_cfg80211_change_iface,

