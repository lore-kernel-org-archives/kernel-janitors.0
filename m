Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBEA3A2E2E
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Jul 2026 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784473381; cv=none; b=q6U5vt5U3c/hloQTkkgu8WOyq793CJn8G6sRCqXgRN1+83yOFUA4K4+I94m/1GueVAknhAZptuZrOZtwUxSipyr+ZumMK7NIKbFy7Qg09fDwODyvMJhCbA+/z8gRQVNf+bV8IS6VTTG/9P5Cj5tXgEz1ZGaGSzLgKmFHf1SP3G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784473381; c=relaxed/simple;
	bh=nhs0cTRgQM2TX5BYnOhc4RVoOOZO0UckyHq9RgxyHX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GkELhg8p2+UAs/w+Z1zsz8eHVKTqd1rPNz/dhjNrF5nF/iDrRIKLkX5a3QET36lqXaVSME9KlGUukD/vm+4ke1toUxDrSksHYN2eW4UMnpSaHKOJfj/XItN1zuD5PqvmnQ5vyXMov3zZSp7rIRqv8591xJQyHlCf+g4jC2JnKLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8+WBJJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKfFI9uc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8+WBJJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKfFI9uc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JDvnUq3770097
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Jul 2026 15:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq9QnMonyLkUiObCO4jyCIbIMkb+aIpQ+1EkpngSiEY=; b=i8+WBJJXgOzBuTij
	gqMXaC+7RFv2NzgsdUIMeng8eae0brVZy5MBkO8J6pnlZjtQtTqOFBiSBDGbq/Rw
	ZXUrd8Ib7QNwO6JyslCyT0zIny9xI/xVLx+F9HA+HPGQ9ac/jgPrsWKMMAJ1JsCm
	zjOQfflnwahKg8dQLcSKQ9IgXSzgknXlALKZLiqguf+Eo6ZsiSeBnxGYRAavI/Fm
	PmUmIipbqqGQ7jkRWQLONUMvAr/m9HI7dloWPfTy6A3aqK7zLx0q5jSm8oYFuryD
	vYEwuekCah+FChsbmtjNEt974eU2Wx7VncU2AtapZaTDhm7f2zHfPWJ/Sq0wfT0N
	n0+05A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04sw0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Sun, 19 Jul 2026 15:02:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so9556750a91.1
        for <kernel-janitors@vger.kernel.org>; Sun, 19 Jul 2026 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784473378; x=1785078178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq9QnMonyLkUiObCO4jyCIbIMkb+aIpQ+1EkpngSiEY=;
        b=aKfFI9ucAx6yGIMfjBJ6VdzoWoNj9htNtBqUhZl0t4P3fpczxYq4ErNSdpcq9f+ntL
         2efBXVP/B8XeO/xmBc3fCI84IWiiAFt5RHVEiZ2L53MXAStYqrDKAWGDgIqCXOXZIDIr
         YE+LoN3vd0O6HuMYf4aQf+MKyTAsb5lMZhRu9JR8LCKJwH0rQS/t8MMP1Cf00ZAO/GxO
         zqTSmiPIfU/iMrgu3eIM8oH5gRaAvMWaa0Wmz0h6qOo1PU2ckDuc79YmMt6yUZThgPIq
         fPH3IE1eoZwFa4TZ9pRWx3wHJkjd5x6XNFUkqzCYbBQQALWn0GV/sI2hp/c/rGV8Neh7
         UXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473378; x=1785078178;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fq9QnMonyLkUiObCO4jyCIbIMkb+aIpQ+1EkpngSiEY=;
        b=WrvJQRH2tID5u2+tj6LnlpiaiVWcMtKMRjAZNbfomWdWW1FAkxgzNUTIMvSFnQvNBT
         0Z4LKpLc/p7EiHobwuoiLj3AQwQzR4rq2Vwn29oHbZenbX3+QNWxOe7Q4YHclAaNPdlQ
         EXoFkGHSGhRczmrNmjKECsQ6H3Mc920ohFnbxCekOs0DDshUcuC3DdHAZTLfkDm8V1rx
         A3xWC41KgjBgguHQy2bxJPAs2Q8dzV8zrewG5EqXCk6oR4ZoEl0mZxLFi78KyePljGN4
         CskAltK5OFXsr+VIx7yir7GZObLulAkRsBEL2IoY+ix3evWFc1aWojINrsD/oo2OPh19
         6Eyw==
X-Forwarded-Encrypted: i=1; AHgh+RrGfvOAge4/RboLFznrBbtH0ZVPq8aGumVayrWVLOuSihnORzRf8kjmOrWigxdVspXpCz1AtJL0Go+thgG67S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoRVg8ENt6lQD/4R22vMLiK793+c3A5bPQ8gsck4YL5b+gOz8s
	Eq9LCe7mYKYnKoI8vi4yH5Kp1jDX6/DOXfoO99xBY51KP1lMSmBpjp08c3uaUgW8zvUS4jFytky
	7tXok/dDDOxgHymCUJ/qJlOjoFfn4WV1bQyD5wwxDN9rUNFquGfoQ+qLLAdG3AaYlDimxHQfP5n
	oE1hU=
X-Gm-Gg: AfdE7clDCvoB5KFCgDAP8HIM0NH7E8LS2zEBPqJlTqyFm12uG+cOIscNsYd6Ua6AyZz
	WF5h1OQj7obVHbhFV5JZuOGqjHT6S724Y+jeoJkpD5ZR1XdLqLBd41jINt58AIt3va7KuzviDs0
	UNsf5J8N54/HBk6xTGmjEQK9ZbR3mfkLdCe8ozRy3Wb9PgppL91hORjDTkXAKSn/jX53cl5jeoL
	oilVIH36TSWh47G71F3Woh+A8oHETWEGc7IdbDHpxkXdh2u098DESFUJkrsyWdKLCzXmTv6zQfM
	pBP7Cjg8b57Zz6RoUsavANp1LTyH/agIK26xmSq5TXjMUfOOYvNm44t7RikBz8pBRL/WVf8iNEf
	T7kNG9F34XZfCB5LK0a8rmW7OPEcTrI9eRQfvTowCa1rr61UWzXeElig=
X-Received: by 2002:a17:90b:58ee:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38e4b588b44mr9985530a91.38.1784473377705;
        Sun, 19 Jul 2026 08:02:57 -0700 (PDT)
X-Received: by 2002:a17:90b:58ee:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38e4b588b44mr9985475a91.38.1784473376951;
        Sun, 19 Jul 2026 08:02:56 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm24638707eec.11.2026.07.19.08.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:02:55 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org
In-Reply-To: <5aace954b6ef5c42017b83a1bffb859618e9498a.1784013180.git.christophe.jaillet@wanadoo.fr>
References: <5aace954b6ef5c42017b83a1bffb859618e9498a.1784013180.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] wifi: cfg80211: Constify struct cfg80211_ops
Message-Id: <178447337569.3680261.4077948974065934846.b4-ty@oss.qualcomm.com>
Date: Sun, 19 Jul 2026 08:02:55 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5ce722 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9dWoPoYX7bWxMb2dZPYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDE2NiBTYWx0ZWRfX0vGgx1+IR3wz
 WSP8+hp33S3dB7X/msgOqFhtdbgIVZWWJHBNo6un9ODu16HbwpVLCScUbE+c3xLoL4lGF5bbczL
 QAw3y3sUQ/I/iO1eSZnc7XcqjUXFh/s2PprFljxGuGxH7W/rUtOLEJvAKzz29s18yX0W/QLauYc
 Weg/Vz6cORtD3X0kfuQXiPznFjNWfu5SqhFl5h80sQyqR9GbZ2z/8bcJwSwvDYn7otqua0Y1jr6
 FcioDULSM6n+JSiGNdzTOoRL10GpsBgBe1d0O/P+wGpjCH1NQ3zYBU/FIHtcFMimn2vfp6nVU37
 Z6wwX1VMxrwNVEQEXG5yPBPBoY5dgUSfQHbFarwQVUupysGnxuWyTnZNaTf5qnnHcg6qQFXi65f
 oCc14NqnBs9VMnfUKiTOsp7kb9OgY0Nb3ZqcOJyQKXlffXg8yGzbyk2ATaBBv2uzh8/L5FGGCDH
 XZ4d2on07IYXGsXaEgg==
X-Proofpoint-ORIG-GUID: 1-80yha4ntDsY8FAKfuoFirvLORfdadn
X-Proofpoint-GUID: 1-80yha4ntDsY8FAKfuoFirvLORfdadn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDE2NiBTYWx0ZWRfX8jiZZLv6Dc2q
 qpHXUWACYb2mW1hmD9Ouj0n+PUpbAcWb1jl5wBFcjglcYVT9PiGqem1C8j+HoC8yYKc6YzJbA/v
 +3Q/RTqfG6uAySqIMnx0iYh/hD+linM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190166


On Tue, 14 Jul 2026 09:14:00 +0200, Christophe JAILLET wrote:
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
> [...]

Applied, thanks!

[1/1] wifi: cfg80211: Constify struct cfg80211_ops
      commit: 612701854b588759c0df3094197d415869ada159

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

