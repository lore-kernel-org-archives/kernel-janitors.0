Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389A2D5406
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864951; cv=none; b=XP56YwtZ+SZCbSqhs+xr4ajstspg24O5uUXoo+UokySrJic4A/NRPnOSAu56x4DxOjdMSndRVJRaTfCnlnx0TJ5FlqVZijr1i+frTb1P3hKW3xGD5auE94WhHZI7Av6X5/JPa9w9CS+6Ip6kt35LudWOO7y6f7Eexu+fUDgZSnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864951; c=relaxed/simple;
	bh=h750Dg9nVgGpkoaJBvLMDscZZNL/lSyHB9wANtywhQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r4B4RYISvz68Hc+tV6nMCwvQB6DLfKlfp4/xkP1OG9NBM0L63xuRu6JwL9B3PyB2tFupGqhm8OGRQehKDrMIR4/vyXRLAThgeMxIUeV3+4hk3iPc5VAFA8yCxwTlgHgAPZOFtgaHHm4QbzZ6rwJ3UEsmMJwt9xiNfmp8OPMTcEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ge96jNp4; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ge96jNp4"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-408d7e2b040so13554b6e.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864949; x=1751469749; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7AotgDT5LaYynHW/ZEfD1/SGeGKITLpNV/LQfaww2/4=;
        b=ge96jNp4OUGktaTmUKyIgT9WB/PInF/BjND0ftsxv+qeAWAmHGxO5qI0NpCbyncJWN
         m+eQlaYHbJ/6mOGvT4W4A/eJGWRvVXIU/Lc60Jf1lI3Zu2VsUR4SalQUIayjkSMvvbx4
         fsJ7ZYfrjXHYjZODXRjeisMOk/nHDEfGF0B76IPBHQ5umyOs11sk/arv2gJcnsf/atm2
         gfCmZ8IBzPH7VxuqBC4+JaE4yDFJhfj4QcI37iCEx+ee7rC/Y85T/WPK1mLDQwXhIsMv
         d7gPOw3rLU0eddqLvwmkhSQBe9HSf+AL9zoLuJkpb4y6ec9KkGkQplqgVAw1eFnx75/f
         OY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864949; x=1751469749;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AotgDT5LaYynHW/ZEfD1/SGeGKITLpNV/LQfaww2/4=;
        b=rZ9tUcFKLS38WVrAbHXMkFBzTYS90hezbsU0pLcNkJR5dCS5aS437U/7PO55zKg0zN
         LDsOLHK86R5nyExjTXur2YWLzkVqkwBXyrXz1rKDFdkQwRKpPx3mvcAvWWiIcBpXqNkr
         vknGlEcFS6LeIe5y8FBqcKbCKfdQUETDyl09PLcJ+9IW2eTGpqmg6JHEH5+tpgkPiBDZ
         XYoZbNe2JWcC93bNn+oJOfHdyZvlwUfnPGiO97Dug7xJNuzmZCnJ3K25h9YTQiHieIHj
         9Sv3tyPYCDMt2Ye1o8dfb8swiOh/dY1t26+081R1UdV6ByA1/4uqtoBRUKBnr8ZH7sis
         OMtg==
X-Forwarded-Encrypted: i=1; AJvYcCW1zSy/30ZpTXK4hR/xAcepVOj1HVv1v/k2QDvEGUfQRLvy7mUA953kbXXPXqCBytZdXlXFYcfvFWnZV394cHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4HjaStuMfPJjbQkMzoF2VEKAP5O8/QhcWEfvs/ejetZ/bjJs
	GTxMiGtTsgAVQLtkC4GlOdK+yv7XnuFA7CZCiU4XBVO48w+260mr7+nKK0eCPE/ptA02t5npeqX
	/pH5J
X-Gm-Gg: ASbGncu3RCHpTYndlgmXJfzR3IHKgqiqnDhwj85294YWEhg7KhDa8oKM+27ZikAlSto
	P7UiLNxwtkW0S2aEpBZBYF24scpYq6IRJPmxczuvnkmQ6ZIAo1iC2IU/n9/8KMGLzdJZj08FMZz
	D4dGq22QiK7jkkheS7E3O3NGfvi1mkRtjb+iS+sOW9OMHgDzgkY5Ms94RZyd+GK94jOefavRVUm
	2GRfK0ETNMU3FcrRJl8smjTNgQOWpBsCSK5WsXlR817dIQBrHiXrLJ2E6nyj9jfxVMwDQqXeMEt
	o8vj47hX2JUcWH9bMu/XUGtfPcu8GCU2gG6UzfcBY+TH8tyTr7jOzSNq+Wo8DUHEeli+pw==
X-Google-Smtp-Source: AGHT+IGsr3ucc8CyFqc6Gm9yOw1rdKd2Ohl95Xek/6xI6751ZImxrSCLvS3rUdnLDFx5jkH5lTS+2Q==
X-Received: by 2002:a05:6808:1817:b0:406:1e0c:3196 with SMTP id 5614622812f47-40b057f075amr3033719b6e.28.1750864949418;
        Wed, 25 Jun 2025 08:22:29 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d3f540sm2202840b6e.50.2025.06.25.08.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:29 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:27 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Min <Frank.Min@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Samuel Zhang <guoqing.zhang@amd.com>,
	Asad Kamal <asad.kamal@amd.com>, Ying Li <yingli12@amd.com>,
	Prike Liang <Prike.Liang@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: indent an if statement
Message-ID: <5827884c-f269-4e38-8202-2a3fce280ae3@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "return true;" line wasn't indented.  Also checkpatch likes when
we align the && conditions.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index d777c049747e..a0b50a8ac9c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -1400,8 +1400,8 @@ bool amdgpu_is_kicker_fw(struct amdgpu_device *adev)
 
 	for (i = 0; i < ARRAY_SIZE(kicker_device_list); i++) {
 		if (adev->pdev->device == kicker_device_list[i].device &&
-			adev->pdev->revision == kicker_device_list[i].revision)
-		return true;
+		    adev->pdev->revision == kicker_device_list[i].revision)
+			return true;
 	}
 
 	return false;
-- 
2.47.2

