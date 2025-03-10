Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F475226D1B
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603630; cv=none; b=hmSp+EH7P53WY7QkYmMNz/vjtbhj3nkFfHF9ryf6Fuv+nS/p22kaG/T+ia6/adSDs1vT4fNnVpcurg3StKGaXhzK4aTGi+fo9IxjdOYISagJCdq8KT4cNoJ5YJkSg47BpPzISgN+ykEm40v3YR9SnIaZnHlM2TnSzEb4Wu+5O/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603630; c=relaxed/simple;
	bh=/XxoIMfAipEC21vhmED/mbxFc1B/+YiyisaMqIYoFhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTJTvqRgDxx6wdaFRgiHjMiI4a3YDyGNGcCt8h5rhM68CEx0XivFGNT9WX9lhxlhw+xndZWOpQMQrDkN2ZULtkbBDk6mUJb3BpoOJGE9U1qaRkVKv7iGw1/X5s2BZhP1zumYEezJbs9pzBSYk+T8VlKJyotErH+4ES9FBoiPrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mfpf2Ycf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mfpf2Ycf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso23803915e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603627; x=1742208427; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxe2UdMnuICWXIR/40yTHRWRgSj119FGmCYLgFhERXk=;
        b=mfpf2Ycf50Q86FMyR//PXr8vgQzPaysv5Fl1Uvbn6nKTzT0chNwJckKN5AS3Gz6UX4
         F4k3lwLMvHzvZeudG83vwYgEdi0C9piiN1Y5kUSuK9mzqq8cdkwT5+u+UoRxFB4cN9qg
         9mOvAaK4VnYA/ogwXZetucF9Bos9vKWwUrPYnKwsYVIqJ8OAggnIndpuKgZBUcIzrqqx
         FDMui0aWAgtCvDH65d1ZC6WpObbIfCU1duafRT5xBX5UPcKXnrrTPJ32ElDs5bpDPPUh
         gdEA07lIj0c3eWYjNAoxmEgRMk4I2atetK0Vch/oh1/89foZMFBb49iijT1wTatHNPmo
         eF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603627; x=1742208427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxe2UdMnuICWXIR/40yTHRWRgSj119FGmCYLgFhERXk=;
        b=KGu/AY4oeX5ePZKa0SXXO6L15vw4QMIJjfXOGGPkqqGNDlP+CKiji4yb25DymlFA49
         d3cwrNeWVq7oUjy0AAr87gwk+YhsNNgxlHFyle7Qd9k3U+3wCUx34KhSPfDNKtRwmML8
         7S/5M9eAzrl4tFyZtjRLtu25mfgaD9r4QCaDSZB0/qXfrT847rSm/v3E6jF+k8PUCCoK
         TX5VcI4by9h1ytYFip+/XWes/YuYH4R4Ocg8sMTbNZ3RoVxYNLyAArH5cxK27yLpxGnO
         iMtteo4nuVtCip1br0aQy9g6e6NxSzKjbAA1ulvfNAQoDcoZJBCmHmqNWikvZrlWgwFp
         iqSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrm1rr5qQhAZ8v5uQCmnxJI+fa3XLmz+cA2uJIJ0Ughe4XraLbrHpZulWPc5zK6HSMsH28RZP83tbhXnfQyGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2A2Y0YMlt7W2YVRk420uaDC8Qd7b6LQ4YtYfzM09At8tOvre
	9CsTucHblKbxkuX9dwqFvO6gscKl/Au2BDCwxDIWwKXwndFK3Eaeh/Uj4eoz4/A=
X-Gm-Gg: ASbGncuLOt7JhNf4iBa7gvetyFQPAmnUvlyY35a6r27m2H+X9Ya/RyULSSl178Z9qQq
	v6Ta3o/YggDBvzbh/KGxCyXbEfKKgC53J+vXZCjNqYzPP1DuYaAfr6jFGAEO/VFa7HgaqWh2XR4
	sV7p4/xXfcMDGpuRjzDly0QNAa7S16TNTkP0nsU0BTMgQQjm5l33vrUt8eZWHeFiXLnWYGQy0iA
	oDCsVssCLcL91gStkzLpr5RVi5Mf0WBiTSfK1yEGFy9yALeszN7ra9ZaVxBxvKpH3YiTD/2C5HL
	lA1n5fpY9hI41V+cfqwfxgE4MY7ES7B4xwOtJ3djcChSpFkt6Q==
X-Google-Smtp-Source: AGHT+IHZYEMjLRapPZhjVBke2kOIMDf3xY9p9R2H2E6KyfQ0Ja2SOjNPA2cXqXY6FK9cu+NqkjeCfw==
X-Received: by 2002:a05:600c:474c:b0:439:9b19:9e2d with SMTP id 5b1f17b1804b1-43c601e1393mr91960565e9.16.1741603626942;
        Mon, 10 Mar 2025 03:47:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8dad73sm142867745e9.19.2025.03.10.03.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:47:06 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:47:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
	"Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/gfx: delete stray tabs
Message-ID: <92b9d527-fa20-4e4d-a4ce-7c442df9df0e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These lines are indented one tab too far.  Delete the extra tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index a194bf3347cb..984e6ff6e463 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -2002,8 +2002,8 @@ void amdgpu_gfx_enforce_isolation_handler(struct work_struct *work)
 		if (adev->kfd.init_complete) {
 			WARN_ON_ONCE(!adev->gfx.kfd_sch_inactive[idx]);
 			WARN_ON_ONCE(adev->gfx.kfd_sch_req_count[idx]);
-				amdgpu_amdkfd_start_sched(adev, idx);
-				adev->gfx.kfd_sch_inactive[idx] = false;
+			amdgpu_amdkfd_start_sched(adev, idx);
+			adev->gfx.kfd_sch_inactive[idx] = false;
 		}
 	}
 	mutex_unlock(&adev->enforce_isolation_mutex);
-- 
2.47.2

