Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A9036DA04
	for <kernel-janitors@vger.kernel.org>; Mon, 23 Mar 2026 22:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305915; cv=none; b=qfi2E87yMK4DeQlyGFPxBojsVT3Zg/cCTQUXqQd8WjGBlEj9YEZP6fiBkuQrfTGRsjLVELJMYoVKlclbxNAqT17tmgaOAppy/SpVOUMVwL3o3GRzFoFUgm5I5VhoY5Aav/7QNc9baqpoaKOHaW1VaGTD3MnHJsV8/wFDQaWLozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305915; c=relaxed/simple;
	bh=jePR/G1lFiYQ0Bq5k4AUIX/4orWKBtLQQjeDBLmnmrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a8Tg7K9qTIXTph18x/mw6SVvIEXkbg/xi07I+FS/0ADyL+Ut/DJsn7rHP8yJJXPPRGy/n4WwW8CjTznEu2wcp72zZBZqWvVqi41FRCEpZTefQVyeEYVYWx9B9N33uLGHRG4LUrQ/s5x2vahgMkR+Xs67IUivDrfks/2H6pNXXwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ6TbIYW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ6TbIYW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so31657125e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Mar 2026 15:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774305913; x=1774910713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66u/VBwHFIYtSS0ffR+AH+e9AgRhJBGf6jfFuy18y7Q=;
        b=nJ6TbIYWHeyilFAHxJUCze0iMf+zc9OJfp6NOuLgyrU+G7PgG5Aiy73vEcXi4bBcsb
         //L03847T2r9KMjUnKPYn/+i2gB0nVsFnB35QfjpYUkXgdkxwND+yRDF21tgrnWe+DyC
         STZ89lbKoqJMWkxJSD6l7i+47TDxALwubW5HIcCOgGEaNhVol58ailsNUlHM4meAa+9Q
         RELXk6eOyzOnBC/YjkBePJIbkAX/D2v2UxzFFo+inHTk/QfT//uQSLudAlP8r36+AfYK
         qhxrrl0QMBoiPMGSEX0jbANFewATCCy0+59dWEl3hdyK7kMsqOCO+LhoRZQRFB+DJ17Y
         pC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305913; x=1774910713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66u/VBwHFIYtSS0ffR+AH+e9AgRhJBGf6jfFuy18y7Q=;
        b=rzhhPWZwbVa8JdaeOa8fnuGFh59siVfB1to7p8t9ugJNHtsowk9O5Rp1Suyt3ZITKW
         6r2f5ulYeLb4KIzwIkAgfPxMpvqeUYjWES0zUdEv4dstw/Mmmg7xglPh3SQFm39r/ntp
         NRcnVS6h+GqPWg5yXz+hnofB4k9ajnm7Mtjv1FDuHk7Jam5P/WcJHCkviojnyHMXBfbY
         PL6NkxvSBXerumQDFYeqtvH8WFSMbCcyPTZsE06KN3tYJiYMoJUGbvk/oA8YsNxh0LkI
         X5u8RB5AnTGXwUmjRI3Y2P8lxNShKZl3O7I62P2khsQEOvzeU10Yf1H6yz4ERZKOCvWL
         oHEQ==
X-Gm-Message-State: AOJu0YyXxgnAEc3/gcdmN+72ovTKfjBSiN/LrmP0rleuei/1+DU9okuK
	2HTnKiDi/GpnHd1bR2vn5AL0q9gNZAIhdhCTILHZIKZuThyLzMqXDeDU
X-Gm-Gg: ATEYQzyTEQGUuVuKwYC1kfMgowkGcNYfWp5tedzYRXmLo74uAl7zHEJLdBP4w0ZuYXE
	hy0aQxy/GJttYUlQzF5SrnXCfXjZk5tqBhDLM5YzC98XRqJUCwzBcHA6rCiQiaWGrw2hS4+DL+K
	4WscrA+Yh1SeI5HHPrdMEA0uf64WuVrXBLWlI9BseBi/LzRWJvTYROHNf4wPV8if6SS+Mj7m+NO
	t5IRsCi+eor5z5px8InRirz2kpbwelCIAbuCr6MpR9lAy6VO+m7Nhcr5wYogi1ABV4s2AnJV/FU
	fwLWrepBICYn5O6+48X0HPcFhyPbAs3fysymHlqG+zgubs2X1KTNJu2p2nVOjUsLdAvhg3AgZpL
	CIc17JdvnF1x31xAEFiba+yCk8+dNfrfK3qzKLvXr1GhtWzqKgDpckuwcuFPHq/B5WZQ2yMeCka
	MGAs3mpSHR7LsaFQ4uP8/SzA==
X-Received: by 2002:a05:600c:1d15:b0:485:2ce2:4c75 with SMTP id 5b1f17b1804b1-486febbc648mr193158595e9.1.1774305912768;
        Mon, 23 Mar 2026 15:45:12 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6d5fd9sm4775495e9.4.2026.03.23.15.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:45:12 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][nexr] drm/amdgpu/mes12_1: emove extra ; from declaration statement
Date: Mon, 23 Mar 2026 22:43:48 +0000
Message-ID: <20260323224348.343495-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a declaration statement that has a ;; at the end, remove the
extraneous ;

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_v12_1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_1.c
index 5dcc2c32644a..0e9089544769 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v12_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_1.c
@@ -2227,7 +2227,7 @@ static int mes_v12_1_self_test(struct amdgpu_device *adev, int xcc_id)
 	struct amdgpu_bo *meta_bo = NULL, *ctx_bo = NULL;
 	void *meta_ptr = NULL, *ctx_ptr = NULL;
 	u64 meta_gpu_addr, ctx_gpu_addr;
-	int size, i, r, pasid;;
+	int size, i, r, pasid;
 
 	pasid = amdgpu_pasid_alloc(16);
 	if (pasid < 0)
-- 
2.53.0

