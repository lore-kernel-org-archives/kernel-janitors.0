Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F7B1ACEAC
	for <kernel-janitors@vger.kernel.org>; Sun,  6 Jul 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751802607; cv=none; b=nGuN0/gle0A/oFpAB+pOvIAM3yFyg3F+wH0WL9vIlgrsrEXBryTozZanFjKTwMHuSOa/ev6WMrh3+YcGVNdWBvTjMAR3AlTUwv8qqECfHiy74sjEcdIzHrLSowEHIi0GzVdbiDhRgHUJYf0y0msU/dpO7qFsK/Kx1ZRyKyMvqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751802607; c=relaxed/simple;
	bh=h1BsmiKChKnTyvXPWMsOwhS7bc/7uJacFkQzxL3fWk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKpIPF/ZndgfUB3v2RY8QiHiG6HIpWcxuItX4i4xPALtU6PHrOh0LyfsT0SHAfW0Sk2P+Iorz9O2hDWM2VUnqcFRwkawzuy9CDOj7lQ2D73J9IroGwM5tCtW4ZiCaMDSbk0msbsq6nKeJAKVf1UIsMAiI/jb4omzP8sPYkxJuj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Leacun/c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Leacun/c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5667URFh028284
	for <kernel-janitors@vger.kernel.org>; Sun, 6 Jul 2025 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9HNInpFc8Sm98uBUx5T9Cx61YxOobfap1a952dfyZc=; b=Leacun/cxyO4anBW
	d24A/fKZnr/yKL5yoR/0upUutLNvKKfe+EETlP7P9kQ7ng3gEy89PMxdI2cZUirm
	ZFIWfbiYxJXGvY22Qh/MhrLuCLodKYktGAb8rwNksiOCVbJGjF66p6otzCIL9Fuv
	kzoj2TKpfpzn4HiCrpv0HvS205AnZ7TR+htfQItZsetjbx7ZmvEZE9Za7j59rrnE
	qAx513Z8fSzzYRSCwCwLNOVfkBD8xYKLoPb+Yvr3JsllAx69AowytAOUB6awal1F
	+pZocxyFwGCqwxqPMvbOI1W1XiRrQzfH2ss1VtURH5CZaxrn+W5Ivzp2BrH2sMHK
	gyoypQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqc4ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <kernel-janitors@vger.kernel.org>; Sun, 06 Jul 2025 11:50:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d413a10b4cso347128585a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 06 Jul 2025 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751802604; x=1752407404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9HNInpFc8Sm98uBUx5T9Cx61YxOobfap1a952dfyZc=;
        b=bUhTVmom20s2RRW1lmK7g6FZCF8J7ScoxMBn2nEwqDpCOYIG8vQ/mCRAG9s5TMRTnS
         WAlvJOvoDhvhEGYqZEk9ILqH7a2dx0Im0sS388ajgTBaJDUym6B29x/75IuKetVw/4/r
         QHhQzF7yK7sy5F6wC3g4m6Ap7ZbRjIjcp+df/aSQ0sSW1EzxeYghx+up9VLiGcQ1Dxrq
         JKQUvB6obN+niie6F5jWt1pt4Vafd8O9mEGhVqissDK1SXan034VseOX9m/cVFhIjDo8
         h1nsChkG/dQ3Dgn1oQvL9qvQ0A/fwt8g/y96z5TEqCmfmowoZnLDq290fG/suDL7PIET
         TE5A==
X-Forwarded-Encrypted: i=1; AJvYcCWyBjlmR49qBsDjsoEYfzR+xXihkThVqf28T04r4HOV9cSC+7DxtReLF/k55zZ/3JecqrOdI3swlJM7ROkoYFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyBEQMUZmz1Mz5uyzF4dwo4fdi6YUfibjoq3LhCdjhG9EAEuv4
	7WcgtbBEHuokOdWFrT4pkVFZMb8xC1eZ/ogoAWuqGnaw/rw9VctOZ1z4q5ebCOEK57Hu173IGOC
	2ewmQ/QYGiTlJKik4RDhEkDzGXLaO/YSQ85LBQtnUecZV3VG/TzuntLz2N8RxiuIsLIJhTd8=
X-Gm-Gg: ASbGncsrWntbjEfixvaTXcMOrANlVl5W4/JJPlAWLWhgW9Sbmsdf1fRc8PaKfWHIig7
	rC+Gxd3PK9+RhJPBr4eubsFaw5iMrq4i5L555ctNpjkqmOZ26y/izLiHGoxFTecIOWU5Bn1SVDt
	dzZlXmozHesc6jw3d1Z7/WDcy42lUlWTpITxyDjuZSWq96KxQnqz3hpU/MZHiMxpmsjvVU8fqOd
	ayysVZqsHdIV4zD/T/T5JPWYp2GN9O1rByXakVITRY0Jo7wbns+3mIDBXgmIUWCEZ+IKPjVoqmA
	R1q2BUyqnJzRP5V6MyD1MLsxx2JoybXMuzgF1Gt2VIgUUH5W35GdkXD1s738Tt6VrVFDvpBMgQB
	BijuXeGmT1qcwzDoJFZdBGWm7ocGY6DMQtqA=
X-Received: by 2002:a05:620a:4710:b0:7d4:4d55:98f9 with SMTP id af79cd13be357-7d5f2877ceemr597278585a.28.1751802603990;
        Sun, 06 Jul 2025 04:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb6W9CB14eZN8lAc1Ju+O/wZfg00R2RD3YvSB64DN3t3zQ6bM27TvwmM+CwZjrSQ0NktwoPQ==
X-Received: by 2002:a05:620a:4710:b0:7d4:4d55:98f9 with SMTP id af79cd13be357-7d5f2877ceemr597275885a.28.1751802603572;
        Sun, 06 Jul 2025 04:50:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d8f2fsm940440e87.78.2025.07.06.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:50:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
        Arun R Murthy <arun.r.murthy@intel.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>, Dave Airlie <airlied@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Clean up white space in drm_edp_backlight_probe_state()
Date: Sun,  6 Jul 2025 14:50:01 +0300
Message-Id: <175180259610.2709906.15531384408565663524.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
References: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686a62ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=bpLDS-e79snoD0d2c9UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7JFBHEDkb608Nfc2q-JwL-ou8Kb3UhRd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MyBTYWx0ZWRfX4a/ANYzc22ez
 km9OdFJizXSKIplL02BCPy1S79G8Cin3I/PxNQSUyjFCrq/lDBszjK7lYP471MQMIcZVNn3+fuO
 d1dsM4x1ME/Knd6ZsCqIIWSns1bKO4dJLb+SyT+jpeK4P/tIgJtV/+wZ2NBCRlc1ZbI9V4ZPYfD
 tp+FRxXJgk7JzMI7Fyyj/PjpchNcPuBToqVXMzE32OtbqSbHkocvmcE7MmPbbU8YF4N8PfNughn
 KZ/IkNModfM87oaq/MvlCxj2ZJZ0JP8us+IN2VIZfmRYRmLBZlxWSyPERDOR7/+nxyxjKtY27ZC
 oM5GVynsc1br/BeTg7T5IuiSt7BO416a38tM1rHlbSSYFzSCwADattKPjq3EPJzit/ObLsGQaV1
 RCD9cKCBoJUQHBpB0ZxqO9SboFkmOl0IpFNl3czgjz6jxG98USqHglDddebBIfpY65Nifqrb
X-Proofpoint-GUID: 7JFBHEDkb608Nfc2q-JwL-ou8Kb3UhRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060073

On Wed, 02 Jul 2025 07:55:10 -0500, Dan Carpenter wrote:
> This code needs to be indented one more tab.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/dp: Clean up white space in drm_edp_backlight_probe_state()
      commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a

Best regards,
-- 
With best wishes
Dmitry

