Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F95731E
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Apr 2024 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051896; cv=none; b=Z2i5kf+t3r9kLVBEDntju0HigAB7LBgJ/DcxlNQLr/uXW7VFO1mEU6Ghar/mkyr+Sx+TNY3w6QE/pCg6i9O6VL6LJGPJovkZW3ezhI515fGWd9RPIp8tzGc7JrLEEbzjhCGeOn3M8gqM37tHgkLpf6H2n1w/hpblY/xuz8MdLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051896; c=relaxed/simple;
	bh=i3dAA3EBuiwwRsOxrV8BH5VJ943ZUlY2pGSFcOqvWsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dmVzBtLVsWy9K1x8Pl3wedcZ48x+qgKU7Eg3xHMf6JMoR4YTOGZiK53uecvbD0B4w8aixi7r6UFUF01c67oszhbzcd6LIzkfojvTZi7ZR5HDoLQ9Fj1I3qLoULJg5IBRzDbfQItTwHpPs3JD20dzRdb5NntFKfijHw5cDPcTNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lW/riFUL; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lW/riFUL"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56899d9bf52so6286617a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Apr 2024 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712051893; x=1712656693; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ld5/UZMRVCPDO/dKTQcgFxFhH+C0bdjqoU583UYXs7Q=;
        b=lW/riFULRJeVOWDl3FOtQ1mA7mgZZs3VeDZJhMPuHixSaBW/YqAfASuUZr+yY3T477
         HuMkEpCUiKm1ONF2P4qWldjcuXHa+9et8ktaAQo6kfLRZ30L5cYzt7+ePek6EwbX18xR
         bwqJIQmOq26Hs5M/b/jDwdfxnNaoeEcoZdcx0S8zc7dnyPiSNoFDfUvCCDq4vpGQk6bG
         uL9xxE3ya/aTKjo/Ub49RpxPQhTPU+Sg/Eci1RI6vPihBC5hYGL5E9ZcEqwb4E30Sgv5
         bIV2UMScktdCSkLT44zMkIdn6pvi7XfwbfV7wPEV+fyYnRIKqWHri+FZwI39HXu1RAOj
         clLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051893; x=1712656693;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ld5/UZMRVCPDO/dKTQcgFxFhH+C0bdjqoU583UYXs7Q=;
        b=a9xG7afxQ72QtYGVgNJA+qFD4WT/pOFK8+k0QWaEAy9YpFqQBDKl51/B7vuaylreBD
         UhxJ30Ky5UXP4roKS55KnxFAZ9SDUnBCx9FzuIcONw+94gah/ui2DSX+hdLDh+LwAmxE
         M9H4ypmVU9WoeAHQ19o7mQKQIvBP+FzzMfxE+e3ayhir/nWaGbv/xBzNym6gJCDjP4Fd
         vkRSPj6iPwpnObw2XldHVN90aNij7AgH0E6QO5FvjMYDTt7mhuVtQ91seky7635gnkVP
         m6Q6/N72zcPjurKOcUghD2qtzXkbZ/2i7hK+9QV+eSoQrW66iuPTqUe2fRqggTx7ejnp
         z8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvK8YpidIOC95547rqYEMkYEHA0rmknfES1yN9ZP0kE8Opd8gtWU2mJCCzCRHbn/YeS6G2qzR99PCTTmpCLTq2XHSvOTIJ5UuDngaexbCk
X-Gm-Message-State: AOJu0YwXP4JQjyq02cqmPgHLsyLUdACVvVuey9Lpbxnna4sokRUTKLwG
	lCjQ8O3mnWrkYgx43T6zoIYwwV8IEq4akj5Up6IWQKb+oeHK1kCeGI2TKxkyg+0=
X-Google-Smtp-Source: AGHT+IFgDns4XbXtOdDo3mYfgf9w3lFqwUVjIK8JRoHpGzz1mCaGhgoZUM8ANRaz4ThKySFmuVQUqQ==
X-Received: by 2002:a50:d4cc:0:b0:56b:9925:38a with SMTP id e12-20020a50d4cc000000b0056b9925038amr7967208edj.38.1712051893318;
        Tue, 02 Apr 2024 02:58:13 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u22-20020aa7d556000000b0056c63ba1387sm5295464edr.86.2024.04.02.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:58:13 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:58:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Grant Likely <grant.likely@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix a couple -ENOMEM error codes
Message-ID: <cf5bbba5-427e-4940-b91e-925f9fa71f8d@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These error paths forgot to set the error code to -ENOMEM.

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fdd35249169f..a26b40aab261 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1264,8 +1264,10 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
 						 sizeof(*op_ctx->rsvd_page_tables.pages),
 						 GFP_KERNEL);
-	if (!op_ctx->rsvd_page_tables.pages)
+	if (!op_ctx->rsvd_page_tables.pages) {
+		ret = -ENOMEM;
 		goto err_cleanup;
+	}
 
 	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
 				    op_ctx->rsvd_page_tables.pages);
@@ -1318,8 +1320,10 @@ static int panthor_vm_prepare_unmap_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 		op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
 							 sizeof(*op_ctx->rsvd_page_tables.pages),
 							 GFP_KERNEL);
-		if (!op_ctx->rsvd_page_tables.pages)
+		if (!op_ctx->rsvd_page_tables.pages) {
+			ret = -ENOMEM;
 			goto err_cleanup;
+		}
 
 		ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
 					    op_ctx->rsvd_page_tables.pages);
-- 
2.43.0

