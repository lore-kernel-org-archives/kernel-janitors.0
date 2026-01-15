Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300FE326D62
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Jan 2026 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511158; cv=none; b=aGlRCu3IlompYk7YRg9dc/akZUgR7FvBYsfa9qErDzTH4wptwqQEYGOT9n2jQKGrA8XPpMIsZ/jWlm80HymJ6QYxKRv+DpKET7ox2nohuHsGrPJLl2pQ2WPF+Tnr0xXLG/NaSOeEXvnrWDGVmopFlNKEIYoRNr/oubeo7Zwmv0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511158; c=relaxed/simple;
	bh=5RKXFxtT/VqfxeXZRvOKOi5lh5LAaosbKx9LcDIwqZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oBQTivHiQW/iskiNFwrh3hAF/Yzh9VPwofCpu5EJ5gyi+csUvLACThIb/i43wGlclS97deR3MusMTw1IKFX4kv9tIiHodhy+mxk/mpo120uWLoqxE9/N7E10qNCmUZwJurLycIj+QNkTzZ/l+0Tpjiyw7qifsz7XfVdEeVqQHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l13oVhuM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HoDrXGR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l13oVhuM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HoDrXGR2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYWsb3113596
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Jan 2026 21:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=; b=l13oVhuMfVG9bJJC
	o3w4j4Dcm0fBhXvn/AW1LW9YGKandwyzAVGNoUQ+UDhD4dmAjY+hp07mdC9S1fCk
	tAWdHZRNFtvV8YjYzEPhMhZ2EvOLvKTWgNW7wu/Vj3ofVOrkNnfDrFOo3w6VocS4
	gBQGUxTl4kw1R3etUcDHof9VLHHrRAYtAu9MC0dopweshkNjAeEBUHBBltr4uF8V
	qxVH/iUYv4FDWbYFYtAFXAoW8IgNeVAt6X4YL10bDJjGojxo+i99xmiCeTMn4B0P
	cfur3HRG5GThOS/DIrNEjrXPGtwUx9kpy3RVld6F8THH9cLvG/8H7J42G9pSPFXL
	YkShlQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq2pm11us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Jan 2026 21:05:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8824d5b11easo31572236d6.3
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Jan 2026 13:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511153; x=1769115953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
        b=HoDrXGR2Fkk9p7NiteHvyWIaA33okKxrZPjpfLL6BXjAPAQA2u/eTMzguYRBF97xIv
         Iuu3ItjqGXMysqTIAKjY2Ny5Cw8xQztwjugCuGh6SuYa3GhYKZp0xRLGzNRaRgLagcQV
         1YI20pwxMlBw0spW0kmAyYrpz/nYPgfHcjaQqszJwdPj9umq+id3C0pS4Sbu5s67ZuTW
         W+F2sUuI/VXc1tydupI8bqaroKIqXFCo2qKFwau16XGXAzO27bEpLHauaYOgqZ+Y3HBs
         Ei1ASA/XFr2JWZ9QZsnBCaUejUCulcI2i4PDuinK8RZqQhD1WyajDmQn9mY0LW8nkZd7
         XVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511153; x=1769115953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
        b=kOy5zzYOqShGqdVTi86TWRpfv9x5oRbNlvTNvGUrWsXEwCVpAyXZUwx/Lrl8LD7kJj
         Hh1u29I78YSEy4WgbmfOCwV4FbyLYw8pp0f5nsooVn5L5ViXkpCyhSNCIRCtcbndbI2b
         1L7Ra5yBnyxlgyeWDYjFeUL7QENIbZYd0hFlxwhaBrl9grPJS5e1LFU8rDWfF2Vm6AEx
         VT8V3OyBJYwSLHhOMxxqLDa47GhYKAY7miXnbU0GS9ozi5ObuJQFbwG1C5DAicbYcJ94
         3BJofzAIsbpEIzB3dmVJqwLIPnigebzkQXo98TXRkwzcM90CRlqeOe2MVraOMoxlmUlH
         KVAg==
X-Forwarded-Encrypted: i=1; AJvYcCUBrUfaYlgRyioqI386lJDrGBDY4NbpYTZGHb8abPBzMHvckymYjaxSH/9NiddZ9YmZYhpq/WpYjJVgQ5BnBmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuZEwCeZCNqEWCy7OO/bS4ta6lg6B/aOLKYdY/ZQWbtDEHGH+B
	2Yp2TwyWLuFZSZ8LF+PtiieSgV4mspv25Mrpgpn3Ua+k6G3kosYouJbZzBppEOGWUXiVC2ZEWIs
	xFzhQrfHjiRAyjiBb2RCKvq3JWFsWSXL9Fb72B83bePZEO31fgHum6miyVFbWePfoTetzD/4=
X-Gm-Gg: AY/fxX65iioaiTWbdfLI4ly4PanchVRd0RteTtXWkupy+SjmjF47fb1iZm+B3v27h4Y
	6GUj+mE7zxmw+YARtCMkZobv5P76NPSzHWPA1aCNFggrg8sgNVK+SR6JAJ4jhM3eZGtfsseElI3
	I0zVMKiED3BXYdKur4nc3G3y66jmjvxhI+G+xaBLa4rgjVnsqQZghdmaMBZa/OLc90MQtWW1NJz
	tXcOkR2y08xXHJVCkyS0sXjBpOCL+LSHnUllAuDD2wQ0UHTgndZkt8PYh8J4qbS79mEyBzr1B1W
	MrsUQbyzpgtLA7StCNoJY7rVorx4ejixAcgbP0xMXvuVYHtWAKwr5KKNP1yPIE+px55adRhVdE4
	d6vU7LIzJ8PBDuY4RQXrhUDUoOn9beL0L+2JWagoIBiV4/WvTUc/hS1sCAZa4aqL1LUHbEttE2O
	5sDw3uqF7tOOlKsos+YmkuFhc=
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8c6a68d9299mr104179985a.21.1768511153479;
        Thu, 15 Jan 2026 13:05:53 -0800 (PST)
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id af79cd13be357-8c6a68d9299mr104176285a.21.1768511153011;
        Thu, 15 Jan 2026 13:05:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Date: Thu, 15 Jan 2026 23:05:50 +0200
Message-ID: <176851027323.3933285.5242543959069807337.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: n6UnIucethJp7K-m22hQOYFLQakoyX01
X-Authority-Analysis: v=2.4 cv=TNlIilla c=1 sm=1 tr=0 ts=696956b2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=vfcw8cltYcJMyB0lYhkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: n6UnIucethJp7K-m22hQOYFLQakoyX01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX2mC/RFuJj6sg
 8hskjL/1OSTRZiumG3iE7w46GPt2m1exFlTJj7eaxYUOuptetqQAo9/+PZ/ezjVogYu6BDNLL0o
 0mky4RMlLaSDk162pRpdbAz3seqfrzL5gQoa+GC54QmCoDFmUuOJpYRZD33n7lUjrehrovDwuPD
 mC+9GYurE5xfDrEnixK95cPVBUvViVb8OB+li85l1CkmPZGEXrnVDizgLqPwvrN1nSr4XkH2RLc
 sy57JVUQwolyTq4xCeAki2/uSt27KHcoWgRkGSxrcGP4X7QQDJi5KAfHNN3eELMsS8LBzReWpfO
 jZhcoNz7zrg+SL6ecSI8hTZ2nmLCBE/rQCAh7aZ1+FRbbUYi3MC2/Q7y1Kn/ybHSqPDyI1KGDnP
 SN7snNuSZJPN0qMgqJDKAu8M0DMbugKFv2jNq7xMStKGB4tPYvzn/x4HttyYlYZuhL9be9CqV4J
 6aMF+H7k3/yykmo4RCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Thu, 08 Jan 2026 22:57:22 +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm: remove some dead code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/37d2e108de4d

Best regards,
-- 
With best wishes
Dmitry


