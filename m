Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB2227E86
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603654; cv=none; b=d88GX//Rp8J1Oc7G7sG6yO5L4GY8vKbfDe/jL1aEJk712mbI5tVjorkELHs/cCCiUfEgXx0IihIB9MqC9yJOSHto847IVziXWlP6FiU8Mse2vsoYE6fWd/y23kXdEt3HBUQkO6EAX2B2EcUx/Z7dQsMXRKpQwTF/NlhMOL0g2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603654; c=relaxed/simple;
	bh=jdP/eKZQYM28TtBJS491PMB9Uu5FsjtBa5QxRx4Jcxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9BuMZrEuuPStx+w2vqc5ZIXX1jZNjk6o2rlO0fluOVR5BfeK2Fh6foCYrS25lfeRsz3ziankiBdoEZU1XQe5f/fWgXgiQ3+RT0giFY10D5HlU44Jcm3mKB8+upw05D4ImfhMBLdGecJDnAAVJUKco1jiLLKB/XESo1S9b1Z2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RElzG8fW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RElzG8fW"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso6581045e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603650; x=1742208450; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sR/CcMTKsdlA9AlU4rM5jg8thXN0o1ZO9YRyBCXqGLI=;
        b=RElzG8fW9AMZ7UESFP+oQnWFlfRSRHj7BQ3Ja3SlkAmIIBEiH3lofJq3dvOmGCBaLL
         DA2rz4g6kQJHTilwfLEG2n/t0n82xJV8HPPcYBaRy4YdImak1KGdgWpjXglL9v8QpPTN
         V0SuegDTqn+qiW5P6xiYLqxsK+CzWyubuiOrLJXXYLYyh3k47CyO9vEiBxblgQc+egn7
         sAZEPysH2euzmVdywy6iF+23cqykP2xYDUZYUpQHnXf7G/0xG3mn/NhyFevSI96asuZU
         Zd9v5fzZSPuMyRDkhIqIyCJ/7pkUBNQj0Qs6Q7TrPVDbI0UI1IRlx9N0cH1EhSr0Pvp+
         xqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603650; x=1742208450;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sR/CcMTKsdlA9AlU4rM5jg8thXN0o1ZO9YRyBCXqGLI=;
        b=teExvsUZYef09g2nIcCOforKx060DACWuaE5eP8fiBXKgbhdpX4/qyfjlb/0ML0yMv
         xvZwWR2BwZBbB+Qa9+IKZAp4Qw1gJ9STikW4EbOerNE81GNaSgEkNzCjuPjb0T3dYBm7
         vyqGq3gz2Hq6Ftp9fiIy7uPipAqrmNkZWyoktQR/IUt/G5HkdnC3Nf0vY+ddEi8eK8Be
         i2//Jh/IwiCLjVwGIIT4eMkI1ubSSHHTrFmkDtbAr249PEnGCClTUrvk7T4si2+042Rj
         wU4TI+UkAbBP6dgrJRsC0QCTqEiblXM3RX5WKisEo9E8gSCOuYnZH6ohCdnIMaMB9OA9
         dSdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgMCcKCMHGHApVw5hWC+J3XWG14B1/7Ml8Pgb+56vdDuy1RrKxptGMHALjOrFynjCmXDE8v9Lu57SsyRUXHYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV57dTZXisTbookqxkOwOYisxiQeOirGU6qo0ZTEl13F13E6bS
	RjohOKuF8pettr0lIBffK2OsBMhPPZO2jPjQrwdeqj1HVdmyFkmGc+hUEO4CEf8i9SeRd22AvEu
	D
X-Gm-Gg: ASbGncvDOCH94NAg7jfNt7lKqSXi4saA21g7l2jFiT/SQNkohbAfQz9cC36Henm6SiC
	vu8d+UwHrS8iklP0EBIaHj7GSELiqDYNxrvPSVBxnd84sqNfX3FlsQKCZskyFNZrE0NbMvjG6P9
	wWGdgU303FC5Ghgckl3gPvIpZBYw/MbFdcilXuRxjgEaBKM+M8Us8Nnb54vmUn+JKtaQtTCCW9I
	WfU4C7q3dxLy8Di9mKfReyyltWlXmM06FlzPinzeNtCzRp+AkGGFDarX8fdBrIBwMDSpTDFOnlA
	ZthITvKKqQEwaKcJ7dGMTuplENVZLPLVYU/twTsK6bFvsvEWK6RybuX3GA2Y
X-Google-Smtp-Source: AGHT+IG8QM+WxzxCzm0SZiOEb6aIF64Be3WE+Zs9nuUEYTEOzCjQ3A3RPLHlKVFRDpcen2hFRlv+hw==
X-Received: by 2002:a5d:5f45:0:b0:390:fb37:1bd with SMTP id ffacd0b85a97d-39132da8e47mr7295090f8f.46.1741603649926;
        Mon, 10 Mar 2025 03:47:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c01952dsm14227332f8f.45.2025.03.10.03.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:47:29 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:47:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdkfd: delete stray tab in kfd_dbg_set_mes_debug_mode()
Message-ID: <ece8324f-0d58-4c83-adca-7187f730c56f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These lines are indented one tab more than they should be.  Delete
the stray tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 12456c61ffa5..ba99e0f258ae 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -357,12 +357,12 @@ int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd, bool sq_trap_en)
 		return 0;
 
 	if (!pdd->proc_ctx_cpu_ptr) {
-			r = amdgpu_amdkfd_alloc_gtt_mem(adev,
-				AMDGPU_MES_PROC_CTX_SIZE,
-				&pdd->proc_ctx_bo,
-				&pdd->proc_ctx_gpu_addr,
-				&pdd->proc_ctx_cpu_ptr,
-				false);
+		r = amdgpu_amdkfd_alloc_gtt_mem(adev,
+			AMDGPU_MES_PROC_CTX_SIZE,
+			&pdd->proc_ctx_bo,
+			&pdd->proc_ctx_gpu_addr,
+			&pdd->proc_ctx_cpu_ptr,
+			false);
 		if (r) {
 			dev_err(adev->dev,
 			"failed to allocate process context bo\n");
-- 
2.47.2

