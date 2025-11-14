Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF7A2D320E
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 05:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763097047; cv=none; b=s849U0JKv5cisM4LreL0bMkzaO8o/xeViXN4bw9GuNKE6hH1Qg/fOAf/0UWtHaDMnQ2de/AZMEAw356J6sP/uno8THvKwWcKseDerFUppltXwWDg2qdor4TNeXutAbepj99Gtu8h7w2q1Dn90hntFdT+uvqOlp2bK6OElX5nAj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763097047; c=relaxed/simple;
	bh=Q4pXtV18r3AUILF84nAG0PwuH4kuF3wDS2SVxJhFg14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1bzNpWfW9vqhzXQAUU+KLdqIloIp+GU0z1lS0OfujWbo6DaC1OMDrXRdVh9E3TSFTMHMBzHEC21EeF/dpVtIOFHsCXxrZlJvivjcbQQsdb4elFLeMZ1AYAwm+foBYdfue5f4GMqCC/k3FVFxPLyV/n/tWasUdrUMdiLALNPrWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oeh7SY9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5fdUeGf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oeh7SY9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5fdUeGf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb6601704225
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 05:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=44Ob5C/eoxZ2Iu9/axNE0sTh
	pLfy1097Mev4yzWFqq8=; b=Oeh7SY9LSjsB4E/J3e8aul8Ycz0iFAxs2afaa9I3
	3u2vK7s3FFheMWDDA5uCsQbLwSlNms6AkfpQ0A4jfiGQhtVU8WntONIcNdddbcja
	90chCVTHblcoE4B7lPygos6TOItlu/aX7qnnke0j4ZC2CPP1MH/Rrk5zoiMNtsnQ
	NkFv68mkDgh8zCDUkPowk6H9XbeLRQZEKx+BSdElk0SHZ42sobTGgrfbO5D+D20S
	4YPw9ycwcRMrQPK0QJ9cTnXC0Cn2416s172TsE3JwUcC3+zD/sdhaVYadt0SpHlG
	+ZI2UhnrkmmdCdq433zb/QsGJ5/GcLPe138YklXbAFU6fQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e8wrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Nov 2025 05:10:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so436758685a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Nov 2025 21:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763097044; x=1763701844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
        b=P5fdUeGffAIQBVX0U5GzVRPr1XV2iX/iHn6ktJAQAJjGTvA3grkrZwqvsS4tTc+1y+
         TZRtIQfQFfCOBBBIDOh975HsrwHjlGTqAvw75B/odd1P6opYrleNtK7TtUpy230M6Vga
         oWkB29hYSmw70p98X3qlAj2UT28YV8amgvUf0zRngUMEhCDSXnSUyjhv7L358rq4LB+y
         SOFv+YcS0IZE/XB+z9AguVI4Dg25OI3Rp3/n+3Z4vNo3yTftUKdXG0wl2oVGVRhKQd6Q
         oPqUxn5m3Zl62BEWIlXgkuBmq5FJ8RXO2lcQ7upWbuVxUv5fzEhaMqAHlG2OXN2D6VfX
         aZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763097044; x=1763701844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44Ob5C/eoxZ2Iu9/axNE0sThpLfy1097Mev4yzWFqq8=;
        b=APHFqK4CK8vNdBBk4asSrxtZry72gSG7A2V0MW6lzanjUQUreoD1iLMV8ODB+rpX8c
         oRCt0sFj4kv454nAPcoht3yF7qJtcn36zSuTdl+kBnkvdzrJ1CuVqJnksNhkU4m7WpMW
         YL2SHhw04xESFXBGtwrI+q33zdD0P6uJ20CmVFh0zBzXQXQ7VFDTHfpCDInOwmuNt+VI
         8x8fuVkvbPuaJm90iAINbZWv26oPvJn0y1lkLvosZRpnDA8YKBAZI5JnpNIrsnr/mO2g
         f7CPWmwBiobVtfYI8cqmHx8JcUDV02uHj3otGIZlhlaUchrJmjLy2nEYO3Lp0QjSdzJ+
         gaZg==
X-Forwarded-Encrypted: i=1; AJvYcCWYnHHBJ6nqTci6L3yHRZ7mJpqvvh5SymIm/bH2xTWgCUfTW9tu3O9f0/ThjwHkXYF49Bu75NmDf40mQXRGL5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalUwrYuYQxmYhzXj48S8KAmyYRNUh7HdZ0zKqF6cnJ+QN0po2
	jsyezWUVckK+tzul8mlx3TAqpkJ/PtkihL1EbrrhtQ/mLkBUMmzHN7U2JfBGlg3HUSSsXRsrbNo
	uMtMQDDQGeoDawU97FYcLL/5y8qBItYQBPFUxUN3267x6BYVb51vvKt2AjUHS8pvq3OBMeXs=
X-Gm-Gg: ASbGncvjqu7LZmnyK+xBg/aUL2/kKvEDzMxv+PLe///Yd58PwqNrX3WO4P9FVfpGv1N
	6Bg9yiSWuUWTc/a/mz3/l48pOmXpdHZMHeojby46rDY+V6TOtvJQLxJuYSF+Rc3mXfsLMVrV/OK
	1i9Qa78T7f8KkwcWzD5135ThXSVOyuTS1FqTFUCRUCwDPO3PtviEN0Kx9zSXz6gfpZu+/J++663
	8HeiiuDLWNoeo4/bLA4TiYBSle8thJfWMGqQi8d3HXXqn+VFKThnPASs1ha1WMOdrt7MeZgzpK0
	5B0ksdamAd2sO4bOWClgYXIfxcELT6OwbWqoHW7qS4Lsd8Rgh+0T7jCccIH3z/HMxS15PbenS/W
	8gKwHyVPaS8pQ0Rr4xVYN5jA0y5Zt6iHydtNMuukNjDEi9bzxVpWW7cVfVbXpOr/J73RWBs+0N8
	neF2Vsc/fsShQW
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id d75a77b69052e-4edf20e9f4bmr34512211cf.51.1763097043800;
        Thu, 13 Nov 2025 21:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6GjIlXHWYQldrxdWCXMS1QKmAQg9PVKQ1at1juGVNtZz0+QnY0nul8zlaGm4YiXDNCleLcQ==
X-Received: by 2002:ac8:7d49:0:b0:4d8:afdb:1264 with SMTP id d75a77b69052e-4edf20e9f4bmr34511941cf.51.1763097043256;
        Thu, 13 Nov 2025 21:10:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b9ee0sm818641e87.50.2025.11.13.21.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 21:10:41 -0800 (PST)
Date: Fri, 14 Nov 2025 07:10:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
Message-ID: <5gtcpea2cqjyagoy7ielhauetcqoo4b4dkfilma2drujn32oh6@gyaahiusmwfv>
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
 <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ccPfb3DM c=1 sm=1 tr=0 ts=6916b9d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RxLA63kN50J1D6vl5DIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: L72rz6R3DuBuM3G1WSQ0y9t3CGcDQ38x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAzOCBTYWx0ZWRfX/esncZ7jjIVf
 3YvXQbXD7/OxrIEnna00eXNkHazIdEMDVoOP4oW7CcJXHtZE11c/z+IbJ/7/Cf8eOVzp1Qq3VO3
 dmqz9tfh7C7zjzUVqadOxUdcTF29ZQSEnrCV6v+py7HFiEDpAdBIhmdYBB3eYlJq9RlDOr67cqH
 3T3UJXuDurhs4JQGGpdGAjriEJId7wsR8K1iHjqirXHG3tdxY4kue2JUO7dTblxaQuwZ/73hwN6
 4kA6lbt6FadI2vr2ovFbFlJGAuNY4nR1VjQ7USDRnhQs3IkVIBo5IMG/neFSh67vi83YoWJM4qo
 mabpEiQTztzfLp/EKh9zfHr/LtJ9b86SN7bPOKhuxfrD+siVOqv1JW7y+SLqnLHg7NHhR98QpkL
 4AsUDsPunqDx4lTEv0xIc977taPaIw==
X-Proofpoint-ORIG-GUID: L72rz6R3DuBuM3G1WSQ0y9t3CGcDQ38x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140038

On Thu, Oct 09, 2025 at 03:06:55PM -0700, Mahesh Bharadwaj Kannan wrote:
> On 10/9/2025 1:09 PM, Christophe JAILLET wrote:
> 
> > 'mixer' is only zeroed and is not use. Remove it.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
> >   1 file changed, 3 deletions(-)
> 
> Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>

WARNING: 'Acked-by:' is the preferred signature form

-- 
With best wishes
Dmitry
