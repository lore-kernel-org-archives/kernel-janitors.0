Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A134BA50
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188810; cv=none; b=VfhzUurJ2B1CVsASLb03ahSVuw2sG616UtNoF3PmvmRh3rff2WxWgdrecpo0ztUhB64j9EzuAmLJNnkQqjWfkgqvc7omNFLqRrVNwpcFYS9le//L7hWhSfQZO1eKyIIr1odKAxWxIp0C5YCA/whEoSBGQzD5SBFnnt8C9/fbUEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188810; c=relaxed/simple;
	bh=ad7dUBhWdzfID7qn71J7LfWlieFdmy7vuvrHGqyZGng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bXGYxWnlHbd9i+hGnQZ70neU4BYznnruYB/FgFvvndJKvW61JaeLCwFdqHN1t4gsQD2jCBFdS2ANil5wk6XPlyxMORCN7KDOfGqRx2jbunoJpy++NEGbsoxTQL1eEjQ1zGySsfEcLrkP5nfI4T6SXcRbCDXQBmPIeM+CjUU35ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=exZcVjA3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="exZcVjA3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45f2fa8a1adso14911065e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188806; x=1758793606; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJAzy7TZLPpiK0Xxbzu1n/iJ3JX7fhsQtzUstUQDi6k=;
        b=exZcVjA323G6xMP+DMJYF2bGh9m6nYr93cFoSJ5XJQWr7XOsPxIlCvLTNkllFpYcWf
         J13CF9gdxP04R1GOExp4eiKh0ZKywwbWZoib4v3i69iXuFTYqCbau5tBTXoY3BlJ5pGd
         aGt2ZXzGWUZh5dSCzhWVEF4C8SDCiLEb4oHuMyyDnQ3hKTlFADST3DeTeHK+wXQvZQOB
         /xG6lABtGi0nb6FqtTMxqLH2AsZjl/yYZDXotHGgIMSIZrv+ExUVU4eIIV2CRkHB60Xh
         MrhPIRyxUZhCs5ViSK7yvNtKbhvK2BAS1nhZUjPhQqxI4AwAxohnODi7UcAkA+w2RZl7
         B6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188806; x=1758793606;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJAzy7TZLPpiK0Xxbzu1n/iJ3JX7fhsQtzUstUQDi6k=;
        b=lNC25q08kPPIKreU/LUPGYvEd+iJE2UB9Vkg73OlBTXPTk4nMLS8MBUNa547wEGmgc
         EZwjtkCGkQempFP2/h91q3nuysfCU2RIiOtg6gmhpc3osmVNDBMkIwmgTUgxw75CWY1y
         8EV1u2zI5VrSEHHtToJ5vsBLzr0bwIEfSPdIjVWSLeaThLe3IH6erhS3L+mtQD7NtqTU
         ErTaiLXxJ9Tr1t836UKww1lIVWshfWiJmXpQTqWBbcoBY2t34zqbntHLohXwSSDReefi
         3uvuiHs37tU0XIi31tHsRPa0SfPg4y/2GW6ynsVj606w6+P/OOVdciwoNOZEcuHFhsmj
         KaJg==
X-Forwarded-Encrypted: i=1; AJvYcCWcK5KYbbUodtFoWz4zeYoh/DY+oZjegJHk4/u+KW8aNQPnV2pJB7itQ+cMvYeyXAi0HhtZH6JzelzslwhJ5YE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKowSGTGQB5UTV5cdIZdi6N4Hi37gq7oZCm+cZVwv4QcOsVpUf
	H2iUTYrA81CGl49y/DURzoNUoUaOt7+5FhP4Ej3zqbwM7NDC7KRzCepExr9lik5QPs4=
X-Gm-Gg: ASbGncs0PqpggspCkjwkyz95KYBizSTVNdgjnCj6xPRN4nkipWINGPIA5t6JygSlVt3
	Dckt26mB+jEexANGLEkU2eFQhV/fW7hOaJW4Scd650Kec5rpGRD5O4UvF/p6SDHMUoxXEKnFw44
	1gLPQJaYELfMiL7dQtko0xMHLFuuSXLdU7uKYWSAnrM7lmPJ6KjExWkzX+SpxR2t2MSdGrQVD34
	TZwIn8QL3hnVxhxPsL1ZPdvbChcSxyQqCg7sWPl66mxyD3ogRdRHNteNP6sVQESp8RycZm6owqz
	oB77ScRspLWuF1GMTk+xeJSH+1UzsSOFxNx1bFj4Z3xsb1uUzjBs1z5l9Boh//2PSpSjneCDC0C
	jrhpMCCncFt3E8n+/r6Zci5L5VJd4gBAcFhLa3Ix623IuwQ==
X-Google-Smtp-Source: AGHT+IH1uv0RIxQ38Bm26GanPvGmDL+dRiH2jf2osh70wH0uYOlhbcgFH9gpcU5WdxVF0lInLAkHNQ==
X-Received: by 2002:a05:600c:8905:b0:459:d577:bd24 with SMTP id 5b1f17b1804b1-464f79bed6cmr20555095e9.7.1758188805990;
        Thu, 18 Sep 2025 02:46:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46138694957sm84698395e9.4.2025.09.18.02.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:46:45 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:46:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prike Liang <Prike.Liang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shashank Sharma <shashank.sharma@amd.com>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	"Jesse.Zhang" <Jesse.Zhang@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu/userq: Fix error codes in
 mes_userq_mqd_create()
Message-ID: <aMvVAsrczM9W2S7P@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return the error code if amdgpu_userq_input_va_validate() fails.  Don't
return success.

Fixes: 9e46b8bb0539 ("drm/amdgpu: validate userq buffer virtual address and size")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index 2db9b2c63693..775b0bd5d6c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -298,8 +298,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
 			goto free_mqd;
 		}
 
-		if (amdgpu_userq_input_va_validate(queue->vm, compute_mqd->eop_va,
-		    max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE)))
+		r = amdgpu_userq_input_va_validate(queue->vm, compute_mqd->eop_va,
+		    max_t(u32, PAGE_SIZE, AMDGPU_GPU_PAGE_SIZE));
+		if (r)
 			goto free_mqd;
 
 		userq_props->eop_gpu_addr = compute_mqd->eop_va;
@@ -330,8 +331,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
 		userq_props->tmz_queue =
 			mqd_user->flags & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
 
-		if (amdgpu_userq_input_va_validate(queue->vm, mqd_gfx_v11->shadow_va,
-		    shadow_info.shadow_size))
+		r = amdgpu_userq_input_va_validate(queue->vm, mqd_gfx_v11->shadow_va,
+		    shadow_info.shadow_size);
+		if (r)
 			goto free_mqd;
 
 		kfree(mqd_gfx_v11);
@@ -351,8 +353,9 @@ static int mes_userq_mqd_create(struct amdgpu_userq_mgr *uq_mgr,
 			goto free_mqd;
 		}
 
-		if (amdgpu_userq_input_va_validate(queue->vm, mqd_sdma_v11->csa_va,
-		    shadow_info.csa_size))
+		r = amdgpu_userq_input_va_validate(queue->vm, mqd_sdma_v11->csa_va,
+		    shadow_info.csa_size);
+		if (r)
 			goto free_mqd;
 
 		userq_props->csa_addr = mqd_sdma_v11->csa_va;
-- 
2.51.0

