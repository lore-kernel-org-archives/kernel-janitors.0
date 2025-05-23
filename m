Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B418E34A
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748036770; cv=none; b=owDOyhCb5+Ja5YyXr749MuTo4HwLIvYz7ynb04m9KxdzfzHnYhFJTIVHDp6FjSgXhurkA5XwB8fJF/2MFV0Vfn1BjkdPklLjCITK9rDCpcXKjlqZauEKw1+YKReJOfvYbgONvcNsmiftC/urtUYxBsSGZofIJ4ZirR3MRrpqjQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748036770; c=relaxed/simple;
	bh=A51K5xpUMPokLjesXE6eLxcMndNUwGr0B0lfZyozeKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3WUlojEgbIJTHYTnhIPPZRQwSoTpZX1OY+mfpDpnl5do1MwtH68wcBaDbwWKSvXGLbuNkwn9puqW7UJIvKKFNrzM8Xw/0mnmxvCOOPCcWyqplyO5b6eHrhiTxSYd2EqZY92IFDGd8WTIgDSvpYN/V6C8BIpft+xhC1Gov7kbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PL1jbfw+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL1jbfw+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCiWtA006608
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 21:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YG4viRd+J1gzU3tCz8abXTyB
	kGIHyRuIeHUgXDp7eMs=; b=PL1jbfw+LKLtOs2zzBvEF0XU/8hYi6C0bic4cTPv
	U+qDupbcgkokUUiF8pxbx1BBk957jn/MITWdwvjI1/oA4IniBzKpxovm1cXkJL6H
	o0+ilAqG3AqauWdDUZxp7DdBcC6sl6qBgWR+J1eArlUYvpGPegiffFYffSL+vDi6
	sFsaMCunWn8rxAGSTR1Kx+VbWWtp6bJFdc2QZFHDcYhCYBpDYbLMhzSjnuFsM/Ef
	lZFg8aSCWJz84DpGq9/jpWIz4Q6wRKRY5TE3+CeavRpZhX+r9j2XcORnaoMzP3Qx
	+y1E09AozHyVH1GJOHyO7DVyj8UYwMZVwJcNsXlj2TmsMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0ud8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 21:46:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so81051585a.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 14:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748036766; x=1748641566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG4viRd+J1gzU3tCz8abXTyBkGIHyRuIeHUgXDp7eMs=;
        b=S8mxyX1KzBqP44bmTEjpHIpSG9USUC4TWwUcdnaaA5y7SWHZ55QEHg7DAJdfdqH+9k
         S7gD8DTo1ijTxA1F61ltxLTF5tnQZARrqXPK+o2X6pYB/Z90iKilSS+KqyWmi8Q8TtG3
         oiG9mOPYwWjxwtvJJ7q8sagv3fWfb60mQ3pu7IRq8T0dQdtt2u9pJor7YCNMCgNWudQk
         sBFofWlqtkgx+H9OlQpE8JZ2PS627wfmnM4dUJPtgIrIvWKtWAP813PJQMbRWtb0bIqC
         zm8ZxBFEIH9wh+y7kJJkzaxxKKqz3voA/3gaQSeQLdu3I+clGZsl85Z0e7XwINjzy32d
         kIqg==
X-Forwarded-Encrypted: i=1; AJvYcCUZzVM2ia3unqicPgBmjJQnJ0b/Zmgx7MhnX+JcL4Boynm8sf3XUcMIuWf3wgimFXpLDo7YTf7lnQSqC3aInY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2dOukUwdyc6VIMXDUQ0AIvO8CyptIrcBAzvGZWVxFKsGsU1D
	p8mA4rm+z740P3wXNZzXr5qacnQucfuq23fZukWVBHFYdzbPPQRM79OhGMFoTEj4nZyUzdmc9Wl
	iTOKbggdblsObmIlyipIe4Z0sMMF5QFHkJv09Qp66q+Tt9Huhxnkl6A63kYAjgayzjSFcGM0=
X-Gm-Gg: ASbGncsKc/qU3aVESuBLwQNSUGVgG4mFx7aRNaiG6qv2TkKH2nzDaC564tJOxbMVPv5
	ptiWzN3RFs0hhuHcwqWHKEcGHX+PpQwYZHmVUv32KGYrCv0VMuiB5jokP8uQJP0w7Vqw7W3QuhJ
	BzhMGSgnRa3WcfSt4Hf6nQ0f6FJBIGrSr+GjZO0lqgYIX12VQssUnmOD6budaLK60iP1+KZYaY2
	NvObcre80J/TzLjGfbTPFUKhgDzK77knEjK7zVXRR/lE1hSal6Y8rsiQILpSpQj5zJ/AErH6XJ6
	Uz7SOobS+A4lcMBv3xn6WLoTc8iy3hk4+BCoeQlp3TUfxWnrjsU8q6N+7LHKaODeY0gwedv3QSA
	=
X-Received: by 2002:a05:620a:27c3:b0:7ce:ca97:a6bf with SMTP id af79cd13be357-7ceecc166b2mr146502585a.41.1748036766402;
        Fri, 23 May 2025 14:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtKjp4VMExAhHDbSXwWDUa9R+2e6ssRs7xky+iVHD5hTNFkKSYPwh2y5Pdk3RKrIoEHeQZ1A==
X-Received: by 2002:a05:620a:27c3:b0:7ce:ca97:a6bf with SMTP id af79cd13be357-7ceecc166b2mr146499685a.41.1748036766120;
        Fri, 23 May 2025 14:46:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f34d56sm3971854e87.80.2025.05.23.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 14:46:05 -0700 (PDT)
Date: Sat, 24 May 2025 00:46:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/plane: Fix error pointer vs NULL bug in
 create_in_format_blob()
Message-ID: <r3rars6vn5wubijcixmpb753dv7vrg7h6yukbpsgl2svn5pudq@xbnkzn6euh3u>
References: <aDCdRKZHmCPwaJWp@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDCdRKZHmCPwaJWp@stanley.mountain>
X-Proofpoint-GUID: _mttAfQYa6l5yxejfCr5ecU1voCQYw3k
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830ec9f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2C2ebHZnuNSfagipGo4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _mttAfQYa6l5yxejfCr5ecU1voCQYw3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5OSBTYWx0ZWRfXwC3XRFtd4Yen
 uDo5hFOPBOSsEVeXXX0YvN4Yejg96aQVhrStjN7K9is4CypXP3dhVClKAYube7SN79pGU4xuTcX
 m1Czp5eYUx+iOoNngUE9w5z4QJmA3DFOdObR7QiTzefJbsnI6OansNn9SAzEVzz/uT+AHLyDIKr
 jTU4iceNE9mXuFKNsEHPWk65c3ULT9C9ApyDH6/0HX7kSHKZ8MRjUxHQPSiJRctbgGWBQO0EP8b
 7bHCryDzHW5cwdJZBfavNP7M4+msUUbQHa9S0z77BQ0edFqCP0BfW80OwFgsoUfSfhdmTT5hsvY
 egpP1jMGAFaM2jRnnpC6P1BkYwI1ftTq+EuvOPhdZ0cRVsE2U1fM2TIAgzoogPzVL/X1EGpQ377
 lxL/X3e5PYh7aEtMoJQ1num8zznK1nUliMi9HU7BXLPISI75I3Uv9XBAEJwv9o7bvhqALAas
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=805 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230199

On Fri, May 23, 2025 at 07:07:32PM +0300, Dan Carpenter wrote:
> The callers expect to receive error pointers on error but
> create_in_format_blob() returns NULL.  Change it to return error
> pointers.
> 
> Fixes: 0d6dcd741c26 ("drm/plane: modify create_in_formats to acommodate async")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
