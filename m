Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA8815B0FA
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837399; cv=none; b=WnQp68pyUsGWm7tC2SRbEUxEQ7n2uM9SMgK+ngBi7iZ6oR20+KFYU8LWGh3IDcQ31Xk1Hz4xwdMI+Ily6lxmEaWIOlSCzgSopJhsK7dZL5L92srYuRXWkjro2mKZMHxDOhVw934IAF1f9PE+cYjN/9+lV4bFL5+6tHI+MQZtjuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837399; c=relaxed/simple;
	bh=0Yb568f1XdkBjyBiCIrW28MFVKJ0UvlZ6ZIGIqUjI78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EkjYc+DW7SnT+OBtyidbX+4qfG9Da9JVahWZlvY0axPCTeQT754bvL9lqEzvjnHu4CUgR4xBUC6B4SMM8P/gE1F6CWgllZsGHDmTpvlT+TW0nu2fgsGQHBQD2lwq+yM2/vHOn0lxQGXY51fZIj7VNGi7CRNIBdab2iQx7fAn7I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8FFTEq6; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8FFTEq6"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-260f863109cso3622519fac.1
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721837397; x=1722442197; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2jZhMoing7DWC/lOhFYXVidQ2q+B0OoDl/QuVCkLmg=;
        b=y8FFTEq6afb+ua2bcsCFIJmN1KVKOWZAe6UQ/ZSR3ooWEnw2s1jtuZbe5Xg/ZlvI6c
         iGJEx/ZRZKIK5yVPYRBUm9k8T3JYggRNv1Q1lZHeauF6IJoY5fXiYjAyO76dVpD/Dz5u
         sxLcG6q3NoYlUm4vJoGvjYOcGnMak68t995K3jbSENjqxMWHGEUIk+oacnokFe3Eve/9
         QG+B5tP/0dYIgxn/j+jYB+p16AOxwk1Hnmyzx553csvAOV22BXSBsBTxpIDtpWFCDcWR
         yR5+XrJ/QX7PMj+cXnB5Tfoe+nABlkmNSO8p30k/xMMQsenQDe5h8jN8CICendPcHjHP
         Nwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721837397; x=1722442197;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2jZhMoing7DWC/lOhFYXVidQ2q+B0OoDl/QuVCkLmg=;
        b=Pay/igAtheNQCeuw3hCN9ywND1EiwtW060tJlvUmnQScogQWWx42uK2/wdbESIo99a
         j1U5syngOq6O3ehGHYIaOaskv+FC3WI4CxYSH/WxZqV9TKTv1XKG/u/zHvtEleP8SQoQ
         ZZokmfblQ47RwDkimp9JjEJKlJj2/kTQuMrruM/cLqcZPyRgySbzdKHdeH6fV7tOdzi+
         4aSC8QJkOlEdHF7Ui8yzCoUnSN/WvskH1+iq/AZmTpO4c28JnbkuVs29V8M+lkS9U003
         HzyESnoBjpUEsPQFJ2JAQrA3hC7+PbYruAM8RkffBMl8BGyJ9FbvlNhXN5thgVn4XxeU
         QNqw==
X-Forwarded-Encrypted: i=1; AJvYcCXwCdcFlB6iq84Dv7q/1nGwxw7qrCOJaMkiEfW+E7UTSsMshXriB9lUkgJg6p+XCjITzZwG5/5poarVCjPV5/vM12vnwG+TfYJJ4rdZiD2K
X-Gm-Message-State: AOJu0Yyh8GmZ9tQ4jIcqraRSIyCvcurpAKyC820SRXhqcGma9axssd+Q
	cTNINXAEEsAjkdfeoO+4G4VFCUsOx1MifvBIgvqfpOHunjdFq9me7mzkLqJZCqY=
X-Google-Smtp-Source: AGHT+IHCvg+D37qFDPSAV2DjfuTODsZ2i9ctUl1JsN9tBVVXcEXaPTGM2Fzh7+EL/qLQElF4DzvcQw==
X-Received: by 2002:a05:6870:c190:b0:260:fdda:5068 with SMTP id 586e51a60fabf-2648ca35f3emr2882513fac.4.1721837397103;
        Wed, 24 Jul 2024 09:09:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:23ae:46cb:84b6:1002])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db0331a01bsm637378b6e.55.2024.07.24.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:09:56 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:09:54 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/client: Fix error code in drm_client_buffer_vmap_local()
Message-ID: <89d13df3-747c-4c5d-b122-d081aef5110a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function accidentally returns zero/success on the failure path.
It leads to locking issues and an uninitialized *map_copy in the
caller.

Fixes: b4b0193e83cb ("drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 2803ac111bbd..bfedcbf516db 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -355,7 +355,7 @@ int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 
 err_drm_gem_vmap_unlocked:
 	drm_gem_unlock(gem);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap_local);
 
-- 
2.43.0

