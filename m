Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D22DFF28
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Dec 2025 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044109; cv=none; b=f8VDHjsAKBv3V7f58unUViZGuxGW/rc+D4LKZanxRahH9OtJ8JsUzCnp2QVrpBK2aSHiKuPEkc32BHWiJne/s+sIeJA+3EGXEcnHBdStVG4l6hXUDR3gqM4Tz7c8fnUtuIQ8Ja/svRh7hQEjm9BTXtmn8aIiMqOPnsGsx70blD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044109; c=relaxed/simple;
	bh=Y4MIFKXXZgC/iPN+B4pEmnFiQukI3Djws4heJHC2m5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6X3P19jIamPBd+uw9SztQQK1oXM3yS3zvc6MZ8NOEnvDeStKQUDg3tEE8MdRtERcMowzc2++jt84naw4COX58dg0dHkAmTnEhWrGIN07wLow7bk4BJDlKB2gXfNZpA4pUAvK/8NElQ26Rg4eBkoXFQ9azLY99WZJrHQ4scbYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZBUPpFx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZBUPpFx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb3801f7eso126156f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 23:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766044106; x=1766648906; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7ZE95SplxYAa2I5rD6vCrU8ZZMgFLy87k6hNcutigw=;
        b=uZBUPpFxMuu1/YOEedcG/UecMxjY2jwsbaNvQmTIUjGTjT32neOV9y8tTqRU58tX5P
         9krQAYk94L6BCD6nBcPMItXUzQ05QqVkkJFzIbHjBXtn5NTwBqBRvwDmTM4RuDv/CO56
         4pEiqP82AK4iLTri6dUA67j9qA0cY1RUsrPGLp8Xj7k7q1WTyQZ52q3SpkkODhWSmPHD
         XYqcR1YEI3/xHLB/KRsh7pk3aXNakTbScq7z0fte1nxtY5g2tbAEywaUdhSSltg9pZlc
         2U5Cjc2eqJIZkzg0vakvcnXGqfwbypqGMfL7pdpJfsnoogZOs89xmwrnqBRLFRqiDc+2
         QPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766044106; x=1766648906;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7ZE95SplxYAa2I5rD6vCrU8ZZMgFLy87k6hNcutigw=;
        b=qolG7MyaxgzwWf5xNlPxlgDTZLMNc8aSTpzZAigWVMJrQV78+1IxgFxrA1w1gd+356
         mLaeCCRYv/mIFL+BD2dDfMbWuHWCLUUw/vwFYVJhthwyNxkXZrIvH1MH7XtCet/k0zpY
         xu/tLEuh0qM8t2HZLSNlHYjz18EVUWYt//t8F9xSFwuD7KEnc818cLDqngbKlwlSVP67
         bwaIn0C+l5/1DYnEKFTyDLu5kQb0dhiCgy6I2RnMsMfTnaMu9BdOXZHjRooXlartaxKz
         M8gN3tHJ8Jse6j7htb2ls/kdubSiaDFUNPMikI1CXRBYgKND4f5nsegX48Qmnlic4ufW
         Q7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3GmkEhRY6zO/8ARSul3GNb44m5mbK4jh9rHTKoKfyb/jHwm+kIHN+t9k3X6YEQOl2rthPh3eUrbQPN+TL1DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9opyAhOsWComqkgePP7uH5cEMhIl9ojQdK1BvBpIjCMJXNHtl
	6u2QBxKV2NDDzBDEfM8DlnIUXb9cwv+ZPRq8xZJHEHEOHZpvMv5O5y4ekRA9rdi0iBs=
X-Gm-Gg: AY/fxX5r5H2aLfzCs5P1wVpsm9UVlD897htH+rFRw9qEt2CAdkuy/2O4UuWoGlO/mtT
	uOgm81+xuj5Lv1IERs+yV5PCFRPa5pe4LTRSSGGj6kiY4Qi3Jhcrce9gO/g+CKfisG0QIRHw0Jb
	tgfNNqcrVciLQPfNR7KqpGJSkZlHB9dZZMV3i4Zx4MCKonq0a20NOqX4Hddc2qTnjOgVos3ZqZz
	ZJ6ZIWbZS5QquJG0fK/bch7p3bY9K4PPf6B7Jfuw9GlVCv6R0AqILgnBnFxIG2cxq4ztKJn+/dW
	NK3zOopf5Vw1gz9FWOiWFjkUeihS5lkQ65j0SRAiuCrgoOWlzWb3Kvd5f7FdNSCuyR3WpOIr6Q5
	CVc07NzP3m6juoASmQGDCFRa0Y360KijigWqjV6GIGxdQif/BHVdSvPa+J/n4QwHiuydaAzKva1
	ei/jvan2VUw9X0XD2Z
X-Google-Smtp-Source: AGHT+IGTaiX6+GWVlWWsGKoSnaaCVhAOGUzRDquHUgw/uNubRmsnDIifoVO+9W063s/iHJmhvllI/A==
X-Received: by 2002:a5d:5d09:0:b0:42b:2a09:2e59 with SMTP id ffacd0b85a97d-42fb42d8644mr20214681f8f.0.1766044105681;
        Wed, 17 Dec 2025 23:48:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432449346c9sm3359309f8f.5.2025.12.17.23.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:48:25 -0800 (PST)
Date: Thu, 18 Dec 2025 10:48:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/panthor: unlock on error in
 panthor_ioctl_bo_create()
Message-ID: <aUOxxvXXtHHfFCcg@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call drm_dev_exit() before returning -EINVAL.

Fixes: cd2c9c3015e6 ("drm/panthor: Add flag to map GEM object Write-Back Cacheable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 98d4e8d867ed..165dddfde6ca 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -923,8 +923,10 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 	}
 
 	if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
-	    (args->flags & DRM_PANTHOR_BO_WB_MMAP))
-		return -EINVAL;
+	    (args->flags & DRM_PANTHOR_BO_WB_MMAP)) {
+		ret = -EINVAL;
+		goto out_dev_exit;
+	}
 
 	if (args->exclusive_vm_id) {
 		vm = panthor_vm_pool_get_vm(pfile->vms, args->exclusive_vm_id);
-- 
2.51.0

