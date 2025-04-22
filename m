Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E085A29CB4F
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360511; cv=none; b=ZRcpLTLg/0vits7FZBfNzh2vmMqLPdS7l3ebhDUvYZ2Y5s6HKEiXMZxS1rI7guuaYj9CbiwgGKE5YD5G9UJEVo2aSZWBRrtL7EDVyEMX+7PJ74QlADXhTI3iqM4DvbxHz6NaaJ0rdlEgnEKG49fDbokbzPUqXCz87wZLXNTsCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360511; c=relaxed/simple;
	bh=UsjQTI9DWmo6U6QiJHMG3Ibvb6nvqmDeHDkJXkSvevI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E76MNtj8TEFEP6tPKoiRvWA2/CzUTEwVtC41mlp0n5atNee344bNgUR0OclaHCAGd5r87ZXH8nZ0o1ByunU6bdfw0QykhnRzd1+ksIheBoLZluJE5BTegLDJ4l5R60t7Bcv5MLfnKlTvj/N6UOxKjBk8D/IyozYQSv366ZcT9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHWN2RQt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHWN2RQt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKqEnn000677
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 22:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFVnrpWb050fxv5AMU0KXMBJxaS68SUI9iug+FP01ew=; b=YHWN2RQtHNBMCJyD
	EYzx9fM5u9uwFTy6s+Nsav9rJpeYHPqbqLNF7mlqS8ucurabTU06FST6MJo02txz
	MdFM1bpQuAsNBtrvW1gb3XcfpvWr+owKEZzFUX2FudDC7Ko+eWpsfosaX1/RXAa/
	IcawMPcfhbAQlDw4eF44JMjm6Hcrfe2zaNo/Pp8RoeN6gAp1gfOgL6KoNa4SBf5r
	rf9IkTd5oMZjDlSEDUUHR2u3Tho0wQGH8VZmdrSX7Sw3O7UX6HND7Bmvwgyjc4tl
	ysJLLbLMA1WBH18a52TlT9DZYKEgX5zysNd8kbTIw88XuK+i5yjfuQ7FYO4g5EPu
	1Q+tYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1055d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 22:21:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c572339444so878505685a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 15:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360508; x=1745965308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFVnrpWb050fxv5AMU0KXMBJxaS68SUI9iug+FP01ew=;
        b=Uc01jBSt2LWrOI5pGXbZPn4OEGglaEEzs9e9fw9O4lO9QOyzIerXF2B+xi8mVC0IqN
         W+vGo/m1DOnojkusFh7Tcyznc5tqeZlJ88tOwaW8zLCLTQ590ESjQnULsakWUi0y01TS
         qlF7Ru+w5D1fKQzrR7L6J3Iyd7yZXfvoRsFyVmb1FfALE+LnV0kwTrDH4EzWFDd4M0HK
         ejDMEs+jnW8MDkZbmB5vNaobfR8QfvCIQcz/peq4DGL/SMKEDnoNXAAy/BuD42kWYxWJ
         kBeeI571+oW3f6/cj5wkuoR8JssI5uKLbGS7GA3rleXkYx9SoAZG1JjOWAy4ggfprwwZ
         5j5w==
X-Forwarded-Encrypted: i=1; AJvYcCUG2xG0I2mxs7XNiXglC3IKFGeRt8qP7QHsbXAfrIh+KHd993thn9eWlFmYjRUhSUUa1bh+mYtOQD8tCbwNyIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbxQlOFse+fQ6NzWcj3qt+0NvZiWnZh2YRMN+B1HMxxrLM48aC
	HO5jz3C1CIQRjzyu5f3VH6S7VshUiPQs0aQ1podfi412/2wNmsin3R46DPgwUuq4DkZHaPG7Vco
	nSOZYugQCPELhmOOqJMYDMw9XB5VQbiQo3OXy2888k+RKQTIfKRdgJnB3oP1cZWYIZVI=
X-Gm-Gg: ASbGnctTPjdEerCYfKEXsvkNxSRdV1vsX2tOineIehTltj0N1EPEokqw1y+E9Pj1Gwg
	NLC8oqxx3QVZlPCo4Kue/CVPoa0uSSINPICIEoQghimMeK4uMeYt6T/gu5YfyLRAxrv1kF0ETIs
	Zcs8/ybOgMuKH3gvivN9JcVM31y3AHRlNwz7ErM9dclKhK8hC79UKriF2/ESH35EQVbPHHzGZ7U
	Gi4847NbhEr3XKdGguNjsL+2ZrOPGSoYWxWi8j7Gwxqy5EAAzBX3kHjPVTLfTVBaUfUcPYLO+u+
	QFYAi6KswvN4tcV4q/1t2kfa1E4v/dYIi2S55PjrC9BKNzrIzERDM6cYELAMOUZH2McvMzgCnz9
	LneVeUaQok4gySLkecaEhgAcB
X-Received: by 2002:a05:620a:2586:b0:7c5:96b4:f5e5 with SMTP id af79cd13be357-7c927f849a9mr2413026485a.13.1745360507823;
        Tue, 22 Apr 2025 15:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOiwKU9TBLfD8mAj6HNCGwIQ6VsntnnuJ4wlLR80zdOsb9Oy9RmdN6FhXt95pYuyHYSfsmlg==
X-Received: by 2002:a05:620a:2586:b0:7c5:96b4:f5e5 with SMTP id af79cd13be357-7c927f849a9mr2413022085a.13.1745360507403;
        Tue, 22 Apr 2025 15:21:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090822ecdsm16630271fa.85.2025.04.22.15.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:21:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
Date: Wed, 23 Apr 2025 01:21:45 +0300
Message-Id: <174536050030.3678509.7013496889543262628.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f167608e392c6b4d7d7f6e45e3c21878feb60cbd.1744958833.git.christophe.jaillet@wanadoo.fr>
References: <f167608e392c6b4d7d7f6e45e3c21878feb60cbd.1744958833.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W3eDE8Ordvm6bIhUGAFMagPZNYXRx7Nr
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808167c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Epe2dFrVDL3RtkqF-aAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: W3eDE8Ordvm6bIhUGAFMagPZNYXRx7Nr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE2NyBTYWx0ZWRfX1Wa6N+oAcoE0 Nqjz8yzQYAKql1+DgAfpsBy1OzWLLK51NDkvlz6wovyQye89yFFXgw11ihiK+tfczJI8l/I5lFs BqxsA4Oviaqa1m7LE0zlsrpVkiB2K09ZKzD9RzK7I2jx/98NLZLWgHx0vcVO1dxdCkRoZUPNcOM
 uhXeC4Oogi9q9Ex9MFnv8DDzH3da9lnqY+40Oeb2G3SWnAHlH1qF0dfXo5xFMfx4I5opDAigWvo DwJETpKGrOkEZdul6GBK5+KnowRRdn3OKAMYY+WpnEM/LCyT14lI2wN7/94hj0EPoybK2HDRlqm EZOPsBf1O7nZGI+d2c80MjUiEBi37kxZ6LyFwqBX0rQlWoJXzOErp00mb0acVMoSTi3IEgujP6P
 BwClUgznrzQmAJBBc0eGH5PGL+M1GpOiWfIZgdrF+eqoHCQ3/sA6yV+QYg+5SWvfuGjpisqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220167


On Fri, 18 Apr 2025 08:48:16 +0200, Christophe JAILLET wrote:
> If lt9611uxc_audio_init() fails, some resources still need to be released
> before returning the error code.
> 
> Use the existing error handling path.
> 
> 

Applied, thanks!

[1/1] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
      commit: b848cd418aebdb313364b4843f41fae82281a823

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
