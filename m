Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6242226D04
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603642; cv=none; b=SdoqXEJPtnXO+VElmzF+BWnbeqxCVdGkP8wkZyXrwh18RD9kA/hd9BRmQm8ewxlxQdV2/TTPEEgSOZhnORTC//wMbpYYuXAISfvc12wDQECz1lCAu6KcPUUVj8ep//2Wm4hhSPCokl7+owDx+TywuUP6pjhmNAxU3aQFFyrJbYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603642; c=relaxed/simple;
	bh=yZDLwHLfwqgSEJuN56eo4V3J1jrerAKvj2dir6+1stM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RI3w5UQ1DKVkOJHAklu5ZNzpxadLw40nIsZTI+1gdp3BSjSqErc3GaqEuh3MHevuze5TOzcqUiUV3ESVB9NF6PLQ915B8bjWBwp4kCBTKD0DXYGPTZtSlTrkgDR5UQ1SWI/Ub1/IGi78JPVHvlSANyIQ28UYrkLVVHw3QPdX8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X08vEahF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X08vEahF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3913d45a148so1221456f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603639; x=1742208439; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/usSyZvOMqcO02UgIaZS38RjkJHQ2qzt+JqdGQEbLM=;
        b=X08vEahFNpilP3mGBWbsQQoQZAhW+fNe4DupsbHI3vnfhtqnvVNyJ1dlMn2900ko1u
         8Q7R8lIZVi9nLGIBm7A6Jl1VEiVCnQeow+eacAr4yEtzktQ4T5YPmhftpOQvtkCKnAa4
         UBDMXQCJdZ4CeEDMacZIO4LnV4c5BwHNA38Fa/5SSzpLIbVVZvIst/Bi6VMQ0GHMI3DO
         WXgNq55ouwX+SiKSiyvdNZ+r/SDjsQ9L4Aa3wHRUwm6DVt7LOJyGIeP52Ze7ELpSkCLg
         jDBvS9F5MHuzLFh4BjWEqGG4rXZgRB6uATJiNseUBj1OQj6Ap9e2BvvwCF7iFCACPZ/D
         Q53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603639; x=1742208439;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/usSyZvOMqcO02UgIaZS38RjkJHQ2qzt+JqdGQEbLM=;
        b=SW3fL6j0tLtsF40nLgdo8PCRc+od6WKt5nYbUWXcvB76MFr+B7fDYI6KWPhHnXNDqL
         l+5PcaHhOK7HaSV6sPBooH27gAKfO+CIeF96pL/8+7+cA+8+rYhrYSnUN1mpv3PhzSyq
         9dYbS+T360rwt72jVlTe2Usy2KGQX09JDCDIQ120yUG535BaAPJFE94TIw9JJBQNvBUg
         SaH4axNxn4I4NlD+pMRTtHoA9KmD3zUEGAbNu3uu49Iv1UDXhsNkMuZEbJQG/ZBf084L
         VsTsKkTi1+Latf4wDFmTiKwv3+ENEGhb3zqwZb+NfZHTaC6KGmW7TP6z8AXXMzlS9eci
         L+TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYV1fD4GlryQVpC4RwD9xqWqabgcQvtD9LQGBAbGhhDV/0khLzCGD5pqDa9ZYKsAz0Vy1XtjNdpf9PqG9UYN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYODC+X/14kjxq9b42I9aNZxJM9YJJ6XgYW4POBK3YC15VraIE
	36AaNbKgNQROwBSSyFEzzBydP/loBppmgbjpYAvPmVGJrCMepkKrMDX6JQeegHg=
X-Gm-Gg: ASbGncsQHJHwLxn6n8Lu3lfO1uWGClv2IdMLPDRxy5B67NxVrEXxzePfAxomly5sYQS
	7zRvy746SqB3reT3jXMJSOFpqv7GYePtppFA3MEdCMWMM51DcYwfhOJZnRc9tokMjYj1z+Snxz+
	TFXzulxLDthj/QebvLLwo1nVEep+tfYBy7lwWyacGdXsdZT2jy/ObUvN8SGmsGxVco2UkmQRPJo
	OrLs5irTjPssw1D8OEiyRQ8ZFidx/U0gURvVBvYdom+urNtO4RcJHU24BzW6MIvWqTU8P4Su/mn
	fTEAEHxfhkjdow5/r/U7mYHTHrrjPY9kfgO4RdqiTNJ15T0boF5X7MYacEyM
X-Google-Smtp-Source: AGHT+IG0DRVFzL2VYuk4+0xwXKcyqK/IIpus26os/g6Pm2aV01RIKQYEWia+Sq3ARp2iOSgT/MR1WQ==
X-Received: by 2002:a05:6000:4105:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-39141c97c1bmr2940385f8f.54.1741603638928;
        Mon, 10 Mar 2025 03:47:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0195casm14715253f8f.53.2025.03.10.03.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:47:18 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:47:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Tim Huang <tim.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Likun Gao <Likun.Gao@amd.com>, Le Ma <le.ma@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Use tabs for indenting in
 amdgpu_sdma_reset_engine()
Message-ID: <2503b45f-751e-4b50-96fd-8dad33821c40@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This line has a seven space indent instead of a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
index 39669f8788a7..3a4cef896018 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
@@ -621,5 +621,5 @@ int amdgpu_sdma_reset_engine(struct amdgpu_device *adev, uint32_t instance_id, b
 	if (suspend_user_queues)
 		amdgpu_amdkfd_resume(adev, false);
 
-       return ret;
+	return ret;
 }
-- 
2.47.2

