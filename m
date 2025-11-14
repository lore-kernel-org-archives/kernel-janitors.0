Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7103A32548B
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130398; cv=none; b=nD66idNJTX7T2+8Lgqfc7dTA3aBHx3xIlkuzh5mQQ1vrCENcIuivIjMBHeUVRI2lWNPwrKJMhDK23NmQgpxYdxUNVkTikjtxz6VWoHhkxkqvu7KpITgpm58tCa6GWK8uiJTp7dIVLnccwudYmqNMOn8INujP76Rgwu2TdqwlPog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130398; c=relaxed/simple;
	bh=c0Gy7uBbarXiXLRKShstYiimiNgErRbZVhb4Sdw4ZN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fg6aIEbVtbYVEZxMHbygVt/F+wKt+6XygFiuf4S8mTdOZ0xK18z0EX7l4f7fVEc56IqnkWXRCVfVRR1QbMaWcjSLAXZsWup5Hn3gSzjK2W+GanW3KMeowxrneBuY5v2JCdW7MUScpfqWeGJk0E7/+YhoAVMjv1Mk7ISVfLGYmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fkb/SFPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H34G7jgM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fkb/SFPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H34G7jgM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8OTCT1581110
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 14:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=; b=Fkb/SFPpPZe/enQM
	+UGfsfN+YDNnEEJVt/Rlbhe2LTpGowAMyvAb6tal4bo9EH71bFnc3kJK544mQOn5
	gBUcSwooifVSiJGc0aJ1h0kS230Px6rpQM6YFrGPMJRYjU5oT8QMVpmcRbccGIGZ
	UdFIDLE51fM7KBeFURGvm89W1937fgT5kEEMX/9HW0NBMdehTQFTDt6wSQmIqTzG
	HmmCnxzI4Gzebso8HINCkSpju0iVajLm/dcDbjBJEfk55OXFbelD5bax1ZrjpVKU
	wEtXRjxbZGsXk3ZQBvPM3747vcGOhwSEOQ5lHolgUre7Jf4i3jxFTXZRxj+jJtfP
	ZA7C0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ftewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 14:26:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edae6297a2so72998291cf.3
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130395; x=1763735195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
        b=H34G7jgMrSmNnnZzNEg5pdrobpTr57asDDc0QIjyMzvvyRvtzB/BolKG+iXOK2LmZ+
         mOU+AZ8N7/DpJd0GGUVWgxQS3lSWCzFSozHU/uogcH9anO6tqD9454W49CopRjLaPQIc
         q7zTdXiu1jbM9aFn1QSZItEyhaaALg46QQzldo+VASuNnzDB28VG9H3Xa89sW8ADNZtW
         uh2Y+zLSgNV58s7JJAVN7EQ40KMW3BkaZdiomkcjQ4cH6UFtu/KuEn0BjQ1azFMUyO5E
         8Pdop6EJriFbF47TclvuShu2+hyk6dzn0G6Fc5v47iTX7Jyb9jw9IsVoM6CMKbUKR4fW
         VdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130395; x=1763735195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H92ZsDgTbkUTKJhgAvgP79kB+seNOQREp3zo34zEY2w=;
        b=oqgUWjtCEKrkI5bh8FCr8q6mb1DhI1B0ybuHV4VCV94sElmR4Do6HqTuOfRw1YSmoc
         CwkKwcfBbkS49zp49NsqzbEa6+ASuN6xlXrtySs+kVKakEwgOp5RKgiluWH0MFmCvGzx
         vwtxXc8D1n3xg4nrsCpZ+rsO+pggKsgrtb2oyVmy0AhPYNGe7O+vqy4VTYNhM2Y3xWqj
         h1BdGOY9qUPtsYhpzbMd4dgNPlu/0Qq7pP1VFvc7KILuNRiBJmjC5sw8bJnqY5a4aw59
         NuDF1+DuVLMFay41jIDiEPHVzEIA+p5/Ylj85nOhCXvjEs/n+FW7sOltWks5HV4mEAg0
         nS7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXg8VaVlxDksDTTojhe6LeLsRQ2mmsGujZqBUe8z6AonptCfYOHVh2opgP44p1FVW76Lzb2TqYMDkUvwDLxhKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuScLdArDQMdwOXDRRoUCIFD4fYBs7KqFH6aaqd2zgWwbUucWN
	EHmZHvCUtrf/5Usk/+qzapcH0hrn5waaSIMyhWNwSCmfDw7CDXqzTcRG7OosMD+qi7gZJ+E0Ru3
	qKlxImfIE3lqOkyv6ifH3hdQbtIWV2T35sz4LuS8oGeMTbj6IJjAKK5vtcONY3oQd4Vo8yYM=
X-Gm-Gg: ASbGnctZWxfq+swh5AxiaRpZWwZqcDWLZhOVxvxYyETW8fBc/lggEW7Y6lHE2wIMExm
	dfSUmhzZwMRO5cB3Yeln5VjKJve/KYTgQXAsxbdj/AoFdSL+kpBq4sPgpZL+UKKC7+eV7fjMTrX
	XofAvewb813jZ2y5FCuI9mgWTwvHLZSZixgh02govl7PCdo5iP0oI5hooBCqmGecu0VTZkyqwDz
	HENRJfuZUrvddg/qXpFXL4IpK0JMxy1ZbZ+6USOuNxHcUle9UYg3djbjk91+UFi9kPI+QCAu/T4
	XzE8jei5hY2D6XlzPVXWvA74fvRwhsKLMKBEaEt80JWF+dRwWgLwv/FkvJNfd5WYi/Noamrqyhc
	aNqHwPAr7sSiV9aUqUmJfGtcQMdr5CjKlFfxVZ3Nlqr1RM6GN9fxe7mNdU7MAWELWsrpbrvbHQw
	8IwEVqfTZTrml5
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id d75a77b69052e-4edf2171bfemr44962601cf.82.1763130395498;
        Fri, 14 Nov 2025 06:26:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4YqVYNVjL/1B7NeGIRe8IGvJOuyU+4Oeto661Y2vEKRPzlrXHYqZMVbHPWOIM+paqpNmJNg==
X-Received: by 2002:ac8:59c5:0:b0:4eb:9e22:794f with SMTP id d75a77b69052e-4edf2171bfemr44962121cf.82.1763130394913;
        Fri, 14 Nov 2025 06:26:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()
Date: Fri, 14 Nov 2025 16:26:28 +0200
Message-ID: <176312947286.1737000.3509947007748162020.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=69173c1c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=UqLjAnsgJHsByH5YNvQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: zDbPIRpj8s1bZpkUN_awam5lfjohKG6F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX2M7kWEYvQC+s
 dsVB25e0hJxsMtb5D+BcKiqE29xn5j6aQwnBA1zXyjTbshKH6WrCqBEGdqf00vONKTMGuIF2nU8
 h/IgzJhnfE6XX8WuD7DwPoWkz7BBmY33O189vdmohUiMoF2MyxuH9zqQEUyYatZ/oXP0GfujiWE
 5BooyHXjUp2G4fiq4xEAPD2I6ujomqQlCO3VQ91EWrHXorowSZ7RU/7FPT61dhbxCTPvRaXfdAS
 JUnsbnTxiCbPIrBgqKrX+NpPO9S1eKWb6IgcmWuvjjkSck7H9eNeS41puBOxOUDm+az4am9GAPM
 k8VkULKA1SaNGYZWiCoe0KgTZ2KDtGYm5qs1H8YyijWLQlG0fBWD5oKqIze05eU4mXaOAPDWLyK
 A48esOXWk4Oyia7UEJ7ZVlXJcngKiA==
X-Proofpoint-ORIG-GUID: zDbPIRpj8s1bZpkUN_awam5lfjohKG6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116

On Thu, 09 Oct 2025 22:09:32 +0200, Christophe JAILLET wrote:
> 'mixer' is only zeroed and is not use. Remove it.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: Remove dead-code in dpu_encoder_helper_reset_mixers()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/762dd3eb0c0f

Best regards,
-- 
With best wishes
Dmitry


