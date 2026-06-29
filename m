Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A6175A84
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Jun 2026 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782714853; cv=none; b=sPqkbKY6REXqYj4U6W/B9R4QryEoB7Zl1D4iliZsQYnDbcarssD0fSVO0jM4p0Wn3irSw54PJvTALPzmn2xx1574/LiCH/51/JoXQJeMdiQ4PwEKZYdiI/LnsUU7sjSVgETQ7oL/OdSAthy/xbq+zzACFKCqId2DROzZHHwKsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782714853; c=relaxed/simple;
	bh=VhRTQ8FqFqIhV14nNEqakbGwjGePfDpH5VBKDIP01OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQcBT9GYck95JNs4qwnSv2v7I1B2k9HiHWIK1QBKEikmLdRDR7qEdT4cqwNTvgnVt9RiT5KGMryc+DLVUi8s70vNcqGikc2bkifJv/B4uH0kJWhn/wn1KN2SMvTGMPCnPJA1AOB4Mm7w6GHYoL/S3qt/hnNpCCNNJyYAKigJjgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hR6tOKKb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hR6tOKKb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493a5392c60so5845835e9.2
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Jun 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782714851; x=1783319651; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deDbtmrhTXIdh4Sf08VPUmvpFowe+xk92+r1s9mAVGU=;
        b=hR6tOKKbQS6BKmHavQar7rRd0t9HKW3XDQWoKb9bYprUGMKxv7G15mxt2ERYlmRmvU
         e7Wfdub4Nm4Duq5dZO1d44zkmjjixVbWKuZ/edtJS5vsi6fJaE35G2AK17kuZLXlCYbe
         XGby1DSo5nX91f4nF2Zqk5afojRwCrd24adJiaOAvzQ4q9nTjLNadj0D6p7Zl3vDAVxa
         zTGQ2cyJg1Kdt06ZNb76i+E5fmUtbEN33DErNTN8cwQrgB8p9NvjcvmZIYlrPzIpSuor
         sEqAuKdJnJxniyE5XeIHlK92V4d8nZRCOBy8wC0I9y24ASncQkRsY/5cuNd0FDLzBjQr
         KCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782714851; x=1783319651;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=deDbtmrhTXIdh4Sf08VPUmvpFowe+xk92+r1s9mAVGU=;
        b=ix2jIQJkK3VFy5KdsGgyP8LzwMbkFOOFXcypi/MGDw+pKh51kDlXZEeiEzj6Luv63W
         9DzXpii9GCpVGdBL8V4S45AIToLnhwACOQQ7qQ50KgdpnwWrrbMzZE1hX8MelEZB1JF4
         B8RQ5cZ3Q7dZVy+5oewZz8fUjHO9SdCoPMIEMUVCh2Nu6N3fjXBmTwrI6sYrMlKLFBMc
         54wIOdWjv7EfPeqGePKnGfQ8/o1cPS1q5UPH0XbOUcrbwC2y2pJgWzuOeo6gU8JQQpYR
         DzoP/rWDFS6bQmBbg/bfjsgrcBFL8vTDeFxwTyLyQv4g4TZKs3yj7y6SHV/FwSGl0nGd
         elCg==
X-Forwarded-Encrypted: i=1; AFNElJ8MDJZ3G8RDUKu3VrNOG58eoP3jq2FDE7f10iBZRP3e8XPhM7MvLJ0udWTzOnySOEKpCJmANF3da0Kur80zKgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkOhDwhhB1k5GhCDLHBl6fh7lFiqyJofkbZ3hIcgcky3+ReG5p
	PWGNAQUe6RF4alQBl1/y5fZ7f9Gb026jyj1+DxFHB2jSvzgPd1VbWfwD
X-Gm-Gg: AfdE7cmFxGZkQ8ixaHkUqJUVM/f+ao0gyJRh3Wslvh8bK7eqpc1numRkLU6j5xAoGG5
	MHBENm+98hrRMTsRP4eOCQW4eiSICBGlKqTu2ofeqWKoDE0WafxbjEETNMh2KSeQ80V5+FUm2tB
	rOvBGgzD0TxPyIdr6rolonwliKHXbOkQ2P4mbUbzLWOZPvcpr2zwj4+ofIJ30lm/vuIvRUGxhGK
	8Nf+il5eco4Cw1XJw3neS6dIWs7PiP3xNqHoXnL9bO4ggVqBwVgX8OpUWrDdRGbRc00yblWcnRP
	AFpTX2UOXjQKZuNSv9avn+S9ndOPbIvyPgcwfKArGb4vmutZJX7Dv5Iy/oZqjCRZ/+TaXgJwr31
	5cEClocbmGfBwcMqfvD0oEhhRNAVPQQYIEkdDDSsMXy/cINeY03uR9sT3vCQgli3KFPCpHfsQ9C
	AFnZmIsXxmsA==
X-Received: by 2002:a05:600c:3f16:b0:493:a5f9:d341 with SMTP id 5b1f17b1804b1-493a5f9d611mr70376585e9.15.1782714850503;
        Sun, 28 Jun 2026 23:34:10 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49271c1bb11sm186749385e9.4.2026.06.28.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:34:09 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:34:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Martin Krastev <martin.krastev@broadcom.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix NULL vs error pointer bug in
 vmw_prime_import_sg_table()
Message-ID: <akIR3WlKLCiCTb5T@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The vmw_prime_import_sg_table() function is expected to return error
pointers on error and not NULL.  Otherwise it leads to a NULL dereference
in the caller drm_gem_prime_import_dev().

Change the NULL to ERR_PTR(-ENOMEM).

Fixes: b32233acceff ("drm/vmwgfx: Fix prime import/export")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 39f8c46550c2..f25db04f8777 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -184,7 +184,7 @@ struct drm_gem_object *vmw_prime_import_sg_table(struct drm_device *dev,
 {
 	int ret;
 	struct vmw_private *dev_priv = vmw_priv(dev);
-	struct drm_gem_object *gem = NULL;
+	struct drm_gem_object *gem = ERR_PTR(-ENOMEM);
 	struct vmw_bo *vbo;
 	struct vmw_bo_params params = {
 		.domain = (dev_priv->has_mob) ? VMW_BO_DOMAIN_SYS : VMW_BO_DOMAIN_VRAM,
-- 
2.53.0

