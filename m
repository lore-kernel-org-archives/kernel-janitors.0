Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20B3839F4
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000092; cv=none; b=dwH5R98sjzR6HYWT1b7oIUW1OtEch1AH6gEPbDbCBXK5OYRxUSo0QAs48F6kOSR+r8lfssDSCwsr8B/eAfqxaZ+gAqxVERciB32bk4ln/yt+Nzyx81NPa/q9z/SlYau3lUyOdyGdRijWeFqzI8o45+yhKYogbHHaOrzZST3Ktow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000092; c=relaxed/simple;
	bh=Y3M4/XazFS4JvfwkyeTT5R0L6rzIdjKz52NtK4YKQm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvjxzK344D4K8NDjQs6P76S3xJeFn48XBGcHChqBtWueb88pLcxkuH5CaHwGl4lByIhqo469fa18V3bHrjDBRt9hWFpIYQ49zA9s0Ei9khZaMdyUbh23acE55eZjlT+w28g+6W2KnQBA7cq9osub/PrF/jR+vI2KxgZImrR17Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWFDrQmm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWFDrQmm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so67981285e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000089; x=1746604889; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVsI8LQZj8BwCLrRgRJ4kPnlB5Zuoj8Y+TGCFkKkR4M=;
        b=PWFDrQmmt05SQIAgbofflHWch6k1udxDTnOz1iBMY3ws/BfOs77aYC1ZEPcFRxIoIY
         JiRiH8Cx4KKf+JUJrgUCcO20uxv1dSArGASouEZiuuPXD2UUg+M0cOWWNvNkcvQZjxvT
         vN11H4ySY9neBVliRfqioR8qqsDt2IQ/CrkD4p6qqQgEFYgxxcghIE8qOWi+UM6EZArB
         EchQYKffuZTTEz7zZodUcaN+Mu2+k7VgFqRc1wt6nveRkwghS9904oxm3Z9RT7M1XW2p
         iD5NGrKpWKQvnGzdphPQrXLRJ6YBj2XU9ZTZi/RPk4zlHRi5AXFcJu3SW5isQWjAgKNe
         k1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000089; x=1746604889;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVsI8LQZj8BwCLrRgRJ4kPnlB5Zuoj8Y+TGCFkKkR4M=;
        b=Ukqmk5CgI1JBXv/0Ra0/yeRNn9XKrm+CokLV4zmkDtyDPWwPpsHZ6m/SNpCjIiDrxm
         z/114ANEfucRYB2VznNf82bCnxtDlXFERKA8ATbX95gdr43c100k1YdymAYVaZ1WdVDX
         nT4/ANr/5IXg1z7PrpEgCCDVns7/UiFsjbkkdCsu36IfUUwie3nMDeKGVCMARoJMV7yi
         NEhZBYu77bPPSI2kQZgk06cZv77itbTpRV0dt3rzWTpIxaucHfcRxQkiWAAz7AlrNdvW
         PABucp4niYEe7lioAer7EYVuj7ZLu2HEydL9hrlM6JDfkfkhWict/cDNRyAo9sjk2Aug
         A38w==
X-Forwarded-Encrypted: i=1; AJvYcCUBEFt6VqCwpY/FMOcADen+QhzswXL8NNeZBDYCfu1bi8cyTQpNDY4gAbcaVkizqWgzg8vGgogtVMPO3Haj/08=@vger.kernel.org
X-Gm-Message-State: AOJu0YyziO8MKUDxcFqhjhtlA6KDuVuJMlXK1dVRNUryxGz/HVQDuYG7
	cXJ54bl1BaKpeRpN1Djnne4Rv4PRcnIj49fM7nIYVpoi6ZZcyIMzlbrBkvmW/Tg=
X-Gm-Gg: ASbGncuItmqNMjgwryDz/7gjxchuieDk06I5SuegIJOaqcpFIFHgN3yNfS8e1okIToP
	APpCm8SGd3gfOvh5zu7P8trYyHsNdNgqxi0xqqOC6Xqw6/FLqVFsIRC7KOJYDWxKuEJO1ic+zjb
	vxWg4Ce7N9rdEgnCQD7ySwL+qSLz240Okm+mzktAJzeD25U/dWdn/vVhamWvxhVIXiN6F0OJhY1
	I5rY9VZSlnpwBkXWerRKITvfRHIB++WLIrfYxUI8mhbp6cvmLYMRkOnCtkbLPcZ+3ToKfbDooov
	pSm3pb7JWqwAFmN63H11XnlcgMSWnw2aSSV3R5VLuNvKFQ==
X-Google-Smtp-Source: AGHT+IGSWw5YzFLfOEVeGZ2sMxce5ruW0SonDB1/HWE46YfPkACQqdVyQiIV6naiuky8x9154Y7AYg==
X-Received: by 2002:a05:600c:35cc:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-441b1f33a80mr15531415e9.12.1746000088903;
        Wed, 30 Apr 2025 01:01:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b5951asm15364615e9.0.2025.04.30.01.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:01:28 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:01:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu/userq: Call unreserve on error in
 amdgpu_userq_fence_read_wptr()
Message-ID: <aBHY1IPONYHyybrf@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error path should call amdgpu_bo_unreserve() before returning.

Fixes: d8675102ba32 ("drm/amdgpu: add vm root BO lock before accessing the vm")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index be068e8e37d1..57169a8224be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -373,6 +373,7 @@ static int amdgpu_userq_fence_read_wptr(struct amdgpu_usermode_queue *queue,
 
 	mapping = amdgpu_vm_bo_lookup_mapping(queue->vm, addr >> PAGE_SHIFT);
 	if (!mapping) {
+		amdgpu_bo_unreserve(queue->vm->root.bo);
 		DRM_ERROR("Failed to lookup amdgpu_bo_va_mapping\n");
 		return -EINVAL;
 	}
-- 
2.47.2

