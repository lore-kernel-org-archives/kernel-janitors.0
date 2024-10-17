Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B09219CB3
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729194044; cv=none; b=NVcdS8nNYJzXlPra3TX8JVcFLSfGcyJfHDHXI6gkArAXDop65ewPn3zZH3du9TmbBBBpPWeg3FX76KBGMFkPCyglKL0hG3bjARFNK//M4TsrxUMbELpwvcU7ypnPWZMlMDwWMtJprc1kKirZ3WCyX5IiWiU4qgLrNtjQ4l4hylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729194044; c=relaxed/simple;
	bh=IHi8t/Hjw1MvLyZq2tHFP9G1ZBIL5ssdRs8SQV2DQwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7YdBvAHP2rNOOLWGIVtRS1vO89nAo+L0Di35liwZMSKcgO4/WCJG1T/f34SK05+0fhX2S19AAy8PycFJxcbKCJ2YV57QtBpqciR5ex3/h3uAWY/wJeIADUrr1bKWNZWCk0yxesqA0nDH5h+IKrbzhNYVfOAQwHgoI9Nvk22YP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuZBcqne; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuZBcqne"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a156513a1so161857866b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729194036; x=1729798836; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OVlCn0UaUWh7bWeiu1Ka2GuXCsdMF034zBPeBiB8O4=;
        b=YuZBcqne1HtwK3dHYaTNwW++Fj98cHbIkIa4YpJxe3UoQs45T7zV0OxI/W7IS1qVsW
         yWPd/MayGSAr0A1QJ1H94CYhS4d+TGi2A5ZALoSbxFCwffQogMzxmD5yawmGEvLHb9qe
         ilnKkgsWf65c3ZRAh0u4OCflnBCl3BQj6tYBbCag0xu4CZuJ9YGHBIL6jeGBVHsLLqiF
         uldT4iQwJgdwnpbb44l2z+AAC+BO3LsCuwebPGHGUErPBiEg1WHIgdTvbch1+yVUWydK
         u4QMnkox0GFAk9rITTW2PfzHhzeKJ50zE7fVN/+WIYY33bNVH8OWIHhQMo2CFxrPHuY2
         dELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729194036; x=1729798836;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OVlCn0UaUWh7bWeiu1Ka2GuXCsdMF034zBPeBiB8O4=;
        b=qU4GVt6kVDC9/A2rzpDGfQUbcsgzJpTFccW1miiNaWL46wBvSn9fN6LzddOx9ddHzt
         Ak0pxuaskzKA9ykX5C5iMPqdxK+qyERBYmgHjJQxQ/Kg52XP18wpc2EfB9jyRJ6ecuaR
         sKt2zoj8K1kOtYvsMZNUajQyjTLaTbz4FBXJOoPR5mavzgYApmuD3eTy+GTC8uYOkbSJ
         pYzWCI+FlHQyaXfxtEhSPi/SfgCsT5p2Py8wtOoTd8sTG3Ya0UilTON6hINLvDUMapuQ
         LKBilqF7UgaA7KBVzPZ1ArQ93JDkZVaRaPuseJcR/Dhq84QMR0rLi7vfxBm8T2zRO8Kq
         hiKA==
X-Forwarded-Encrypted: i=1; AJvYcCUHbqy47t1nIlSNAckGKB4Pk6Jw6bR5WgU75ra5dHr0HC3yxskO31+VwGgBDDjHeoVxJztEdgQjXG+YNVPRnIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1gqgW6CyxUZKOmwAFKk1h5qafIkbPJvm4MOiWC3gkywUdfJf
	t7L6zUOhXktyb0zLUroAQsieKLr6EE4bMNV51oiXgxkUvyag1nI1AyyjOJAtdpQ=
X-Google-Smtp-Source: AGHT+IGB8YRLVexFRV2mAH/o1FOXGUr7in+Kju2Iz89bABqeFQYgpmZ27BOoxu2BX9pjvnrZofmNYw==
X-Received: by 2002:a17:907:f14d:b0:a9a:1792:f24 with SMTP id a640c23a62f3a-a9a34cbece0mr715958666b.24.1729194036034;
        Thu, 17 Oct 2024 12:40:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27212sm2902966b.201.2024.10.17.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:40:35 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:40:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
	Vignesh Chander <Vignesh.Chander@amd.com>,
	Shiwu Zhang <shiwu.zhang@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix a double lock bug
Message-ID: <2e19e095-c022-45a3-8bb3-9a9321bc1905@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was supposed to be an unlock instead of a lock.  The original
code will lead to a deadlock.

Fixes: ee52489d1210 ("drm/amdgpu: Place NPS mode request on unload")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis, not testing.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index fcdbcff57632..3be07bcfd117 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -1605,7 +1605,7 @@ int amdgpu_xgmi_request_nps_change(struct amdgpu_device *adev,
 					     gmc.xgmi.head)
 		adev->gmc.gmc_funcs->request_mem_partition_mode(tmp_adev,
 								cur_nps_mode);
-	mutex_lock(&hive->hive_lock);
+	mutex_unlock(&hive->hive_lock);
 
 	return r;
 }
-- 
2.45.2

