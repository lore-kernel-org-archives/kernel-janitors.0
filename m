Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0E234994
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Jun 2026 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826351; cv=none; b=khGMq/r9/+9XP8bX0Fc0HCUAQVal9Uoa1kgDxQDJNwleqlFhjzNOo8JapuAmXf7fEGN+UGDsQ/YuzEJtv9m3zAD1eN2M53LpVGf01bPRFwylASmdOQwdFEZjtCT6CgmLb8t6pUxPejcsrXoh9e467iECDkrmSwJm6M5ZRKus3dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826351; c=relaxed/simple;
	bh=Am4eHW/2bxydGn6u+GJ0Edn+8tgWBsQ5y9QvwXUDRiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7ifXdxLQDYQkm5aMMnNnf1OHv3BMHX4RmI9J7CTWJ3DFGTFVkAbeZF8F6IrjxiXwImoaeLTHkGEUGClv+vSnpwkKUOmYAfUqX85Qz7SNnrw8UYiIX7MsUftdm2qyYfUGUsNLIe4SEbUiWJrmkdGnXIPwgWo/CwLbyWZaddPzjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZd7VTLk; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZd7VTLk"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-735f73287e2so2511830137.2
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jun 2026 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826350; x=1783431150; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+YCywkOkO70aRG21KZPW97TUrAbHKntR10JJ7tL/IY=;
        b=gZd7VTLk5nvaUhwYMPrpE6FLYvLaeJUs0WuSpJV3IVvI3pKU8slvabU6ZuEu6Edkv6
         rU9a0dfypk2BIepHJDJi4H5aGKUqfsXbiPw4ru5CJnjXP7jUa3YcncGMKp35g9T589kt
         B7S6/j/ItY4pPbAPrdTpcMOvAqE+7AfyMEHTczDrHdLBnnYfHjbcY4D/sJilAaUrhKgL
         OTJ7KXXtuJakHpRs7kp5mWqWbPtSQwkc5Pu5RU4oHlcZmmY3ZmHW32evxdW4S6LowZR/
         8wxNpuo2KVLo+wxzX0xfdNfHmEberCsW0dh3pmUNjuDMUSb2psm8F6dFuPazCqm+1t3d
         7mbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826350; x=1783431150;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+YCywkOkO70aRG21KZPW97TUrAbHKntR10JJ7tL/IY=;
        b=BeOqCaQZoAxLb8o963VC/6uD8Y9NAhA6o7SOKUihZOehd598C9Jsla2ZSxNu1fiPkp
         5Ri6U+o4b+j6taoMW2mcqpMGL28Sdx6XIBm/45OBYZ1zuXFdR3Hec/e56Ur9dTwGKJB3
         K4s65nN1427xkH2PJc3FXbx+ZTurRMHxQTKiotvlvg+J3vI536GqPROFq0SCCCAjBEuD
         tcwxh9bBx8IaKgfWM8QKtQ3Ifyu3i77qWii8YJetF7uo1RpmQkNEpy4EwdfkOnBKEnrV
         AARj+TLeK+67IzerdXRak/LQrzPUajXZHZd7euM6DsYXzei8NmhtIWLdsCzOOTpJxfkb
         WMZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp22Aq15ZNpZ7Ue/URSkBMrX8Fj4LSOEk/pyC/lnZBnRXaK7Xi5NFfXerU3vSIoJEibQOZEKGvOwn/QxfICuE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznWtg3z7GIoE6q2IwAN6WCTQwz/chgwRWz8Z5t6GXUHFznZ3cv
	6efXVF8uvJghb3aCGkFlSvjQxibtx5tYr6c93fcwKs8u3Nqq8Qx0AGMU
X-Gm-Gg: AfdE7cn9q8AIZjpReIVGq6xXuCsCtuvQeVYyTUZCzSMl5JqV4oxYYWEEreGFmMu4cz6
	dUKNk3JvyIWbaQ0fsx2DD0WhrRuH9x7wqCeDAJzSdHtTti2d29e4s4krox7TYW4goszBUjZanq/
	gIzDIzEC1VDmDfdw5Sx5SSvuHuy8UYG5fK4d7KPz/QqgyW+Jy/u+yUqLubnxcqCqIyVLtcdTTi+
	fCUU07D8HYFhkEioT60gpPYEO32ghq/nPpz9g/69rLb4/M0XNOpAoQdHIIs162ZbENfy9EL0tng
	iOtDISl3EA6lGaLoOpyIxG8ngydieg602oTxv7uGmgL3se/VjDw7HRl4IAV9PjkTsdYXr3FGhdJ
	pkFN6eIroU5pd7hew1inu1taox18iyMU9fKTzm4kl9UBnd9zsn9t2Qf16zdITw6qXQA1bSHFZgH
	vEOpGq
X-Received: by 2002:a05:6102:644b:b0:737:d243:33a9 with SMTP id ada2fe7eead31-73a38c35b92mr1717041137.22.1782826349559;
        Tue, 30 Jun 2026 06:32:29 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96965eb2affsm950502241.6.2026.06.30.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:32:28 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:32:23 +0300
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
Subject: [PATCH v2] drm/vmwgfx: Fix NULL vs error pointer bug in
 vmw_prime_import_sg_table()
Message-ID: <akPFZ-e9usvsYgf_@stanley.mountain>
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

Propagate the error code from vmw_bo_create().

Fixes: b32233acceff ("drm/vmwgfx: Fix prime import/export")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Propagate the error code from vmw_bo_create() instead of hardcoding
    -ENOMEM.

 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 39f8c46550c2..93a92ae625f8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -184,7 +184,7 @@ struct drm_gem_object *vmw_prime_import_sg_table(struct drm_device *dev,
 {
 	int ret;
 	struct vmw_private *dev_priv = vmw_priv(dev);
-	struct drm_gem_object *gem = NULL;
+	struct drm_gem_object *gem;
 	struct vmw_bo *vbo;
 	struct vmw_bo_params params = {
 		.domain = (dev_priv->has_mob) ? VMW_BO_DOMAIN_SYS : VMW_BO_DOMAIN_VRAM,
@@ -201,8 +201,10 @@ struct drm_gem_object *vmw_prime_import_sg_table(struct drm_device *dev,
 	dma_resv_lock(params.resv, NULL);
 
 	ret = vmw_bo_create(dev_priv, &params, &vbo);
-	if (ret != 0)
+	if (ret != 0) {
+		gem = ERR_PTR(ret);
 		goto out_no_bo;
+	}
 
 	vbo->tbo.base.funcs = &vmw_gem_object_funcs;
 
-- 
2.53.0

