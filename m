Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6800828D841
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744313411; cv=none; b=FKzwcWCuYQsCfBZbiFwbqtG5D1Uy2qfUEE09sAnEapqZXHAfMypYXAv8exBqLTwDIpLMITsYPCdtuD97YTr+u6nCm551pfTnwaHBVf/tQPTvIQuzg3OUmM9yZczo3sCsuFUWTBj2EqkM4DKmtEP2Br06AgfldTZKEMLl/PVj858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744313411; c=relaxed/simple;
	bh=xRVQ4DyBJEj/EvwEdhh7WeX+e/QsEGh7neBOmh6+fgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzNOZjcE/pSD5WphG6oox2u0M4fd/zUVjTl4igkQneeK+MkuMECKqsZ5edysv6SEDgY5yt9sxVPsUUjlxFKPoaykfGQXHNgWS7FP32+fhUZdpxvOb7PBvT/ZYJ/5iOJO5qfdmd+oKNRR5Z/n9OpZ/CUtYQAeid0qHtWjj9RdCMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cj01MTYw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cj01MTYw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG1lIe000641
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 19:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xmOqzP4u+pl/ZdWWXRUlQS2t
	mT+CqYg1/8FByj9msJk=; b=cj01MTYwnP3NPdggXBrPcXP1VnXQKb/vyNjuywjL
	wTMg//l2o72exuPycgQv4sOAPc7Khu45IALyEkqzFpia38QgoGYqqCR6sT7/RJUo
	gfaAEbD9o2uS4muFO49oqZGagCushbqlY8UIxzF0b5JcaLNJV/ebMwtsxZTxsj+1
	gos6JwTM27v83nRgTyr+cU5X5sIW6+jiR7X+pfRMSNOqYI1Fofy5y4nY+2a80z8d
	I6rPv+9gc4juB+lPs2PpsL9TrBMRa0kF2f9y5XXFuokLUMPqGGsuLpfejkz3LsSL
	hJ6+zNlGZhiaHG+9w7f48oZJFLrswxn/rlggoCtvZ+aU8A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd303hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 19:30:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so219938385a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 12:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313408; x=1744918208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmOqzP4u+pl/ZdWWXRUlQS2tmT+CqYg1/8FByj9msJk=;
        b=K4zIqxa1fg+dsbH9I1/olS6dCgYkfTy2Q+m2tkmhi6SNf7U2sLd1yCF758gTF4+7hL
         rauYLcZrsm2X6ayQurGXoMva6z3sJdGEHw1PfDKf/W9w2tfzPXysPVpbK7flk7zpgDky
         tA58TVW3056rfPtrYW81FHTuxe+Yz+Yuj8h+oTXInR7ueYZxVDXdpLtVRuTqB1thMjT4
         eP5IU5dG08QUjuOTcs1GIv0S1hk5WUFAL5WUWJgGgwypVUTiCuq/Lhvxrbjgn36l39Jd
         qosbgzQfclAkM0wF3RIgEOiuZWHjFdcVO01psdnWRogUhkZOiNuXF9eoBVqlWMf1K5P+
         GaFw==
X-Forwarded-Encrypted: i=1; AJvYcCUnf446s4hOVngW7nAU91OztCxhH+EHUuCHXMIZg3S15HcP62tqfT/McjHlZ2c7lZxHf4hrURe81qUitaP5ZuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylcqjRMaS6x0sOdoFQXGBzExfIMBv2tPoMiD9+3SSylGWYZiJl
	6bq+qMyrPlm2mjewI6GYxo+I4zsnsgPSSKD1Paok1bFQtlhx5qTazN0FGoEsArggu8PyWcLi/j/
	IToV8pHk8wNjYsZKZyJdD3SjcMrDMq5SA7qw6VFLmF6X0UVW+GVC5OsiIwWjmPRxYnnk=
X-Gm-Gg: ASbGncuF/tRsCEauS0Di4DwdZe/5DZljdmFgW2CcIII0eFFDvsaOwv1sdGtIRILBLYT
	wIY9OvoDmZpNCQUWadR9EiZWMmLqJBR+bPu++/k9ABm6lg7AxPMQeX7lB43yt8X3x0Ro+MWnVer
	m7ocPrkLPue/9v6d3whMdNyoFHOmnTPJgkgV5kaBX3RFu3+8iOg30Hi2EqRt1C6ZNT2a+xLDi+A
	pJ1kPY1rpu4ZXyJGOb6n0tIm5cgh3r63LKQSLTT34hy+Qh6hj1A+qXoZbj/WjsoUmooplgqyfOG
	/MNDjjdVebIzq4lgK/A2PthOq8W8wypNTlkPvd6SJweBy0QJtuD48z/CE50A1XdUSllJE2lHHmM
	=
X-Received: by 2002:a05:620a:248c:b0:7c5:4348:183e with SMTP id af79cd13be357-7c7af0d400amr26914285a.20.1744313408113;
        Thu, 10 Apr 2025 12:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy0Yv3SFaPPo6VgdBieIMea7BQKaDgcTkqEdmLGwfF3jij9ifdIj6Lgirjn6F8+UXSuYGWow==
X-Received: by 2002:a05:620a:248c:b0:7c5:4348:183e with SMTP id af79cd13be357-7c7af0d400amr26909285a.20.1744313407804;
        Thu, 10 Apr 2025 12:30:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d239f48sm228966e87.97.2025.04.10.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:30:06 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:30:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Andy Yan <andy.yan@rock-chips.com>, Abel Vesa <abel.vesa@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/display: dp: delete some dead code
Message-ID: <qdzrybtfgfhrlru7xhv4a3nejnt2owhexpkpbhcxtojjjvyaz3@45vejwh5ffjl>
References: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
X-Proofpoint-ORIG-GUID: DK9zVJngfrRJPOl5dol3Wr03tFbY_3qq
X-Proofpoint-GUID: DK9zVJngfrRJPOl5dol3Wr03tFbY_3qq
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f81c41 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fLjeHktqZpDZhfEeQlAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=800 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100141

On Thu, Apr 10, 2025 at 07:25:14PM +0300, Dan Carpenter wrote:
> We re-worked this code a bit in commit af67978ee37e ("drm/display: dp:
> use new DCPD access helpers") but there was a little bit of stray
> dead code left over.  Clean it up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)


Fixes: af67978ee37e ("drm/display: dp: use new DCPD access helpers")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
