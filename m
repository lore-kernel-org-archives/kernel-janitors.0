Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099C1EE7B7
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 16:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302364; cv=none; b=lbJqaAQxRz/O3emzdfhv9igcwQSYx91tKPov1iU/fqVWbJawkw5xzFxk8uTTibX3nHaH+BWB0SJh4iGZPCvNXCCjZlf1t0xvPsSNqtwY5ekDxBA/ZWEGJ61xazyV6biIDsSLdVXylZc+EJi5BC5P/t9eze7EPVJCItNw6HFIVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302364; c=relaxed/simple;
	bh=qdNQpt1IxuK26bC1rgtZNTumpElowFEQmphU0VoR6QU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbAO1/MQO+S6sfuAe17yJedQCDYlz09xOwRQc9y4kMxs9TwP2AV6IOpDEobOjznG2HHMIp90ULIcxRaFeQm4TLyqfPpKxPJaYM9FtBoji7NDUVwCVYm2EIHzbFVuXutrrxpW5p2d9B2sHMiooYIzpOQ9tQb9ScS0MxgKdwRXDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C56gbxfp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C56gbxfp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so8978935e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Apr 2025 09:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744302360; x=1744907160; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4B/rb3eqZsvw3yjsS1uWgq6RoSmyPvIP2UaYAZZK0nc=;
        b=C56gbxfpcxB8JnIIr4uckCEX7zTTl1+4ICtPmtdXZZBBg8R/MV0LZzhMjcpfHfUacn
         gRKRvJNRn9BegvxN3UqUc8XTFTIugyQnCeocolbUxifHOPt+vwLH+CI6wemlarfh6XvN
         2QlqYSg3saQ70oljbcqln+h80O6eDeNbYosvGBzv/Mv8yXG9FphZxEprWX6Z4c/lVHy4
         p0tgE53fyQRjj6jb9U66QmbFAn/nUx245Nsc7NtMdCFxf5ciMNkDcBg5FRk0xajVmEbk
         //CJ6/ibTeycHRbvplJmFOx6ByrRvqHX6i2E4S+7abmMIzJ+Z2/KnOz01ApR/MfphYCu
         5aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302360; x=1744907160;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4B/rb3eqZsvw3yjsS1uWgq6RoSmyPvIP2UaYAZZK0nc=;
        b=gQUYrMTd5OsypudbszX4Bx9iXW950L+5NR+dBgWjaWAzqPmj6/+QFrxmx3IFF7rP3k
         zDtrmMxaMkOh37rySa9bqIz36gnplHznk8P0CyUmv+kDvDNGNE6D+kIvUjCB8XrrhPZr
         ioc80DMs5gZTwnhiscU+QI2Lp/E25a4FXIGLok1kT/yjuMzbwZsqRJdWAXezJj3x2j49
         VVDebDuMAJvnLymmchtAyaXsOzf2hPugT4IESrohQV/sbLnutzJ5A+C7zUVtk2qcEuOC
         Xz99BRnfaIpHBKQ9KzkhtYbwcI5TQq75MAzRo4CRXHahpzy1Rvk9q74jfZIGLpV13IAQ
         GpMw==
X-Forwarded-Encrypted: i=1; AJvYcCUdnYcrraBsi6R+k6R5YWWzzB43d9rkeSjABHerTpQ8Xkp7PMqV6v6lTbdksjpcElBo/OLWADNZe+fsRFMmE0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjr05YA6HKzvRf3GnEiSQEVEY3LxtVLdUzCdvB06zwYv8M+a7
	gK3dyrKn+jfwVuxEz8TtrAxT9bipumgvWkg/AckitJO/AZ7697iUUkLFbIE05Tw=
X-Gm-Gg: ASbGnctDAGxBwRAVu2X81YPSKk3SUJDy6R50M+cM5l4HDZhGBLW9Bh07Q/n4xkXxBpo
	m6LOTBWMFc1jid3Qrp1aCv5oVlZMeYhMTnVd7lAyCvbRELA9q40O/gtVB1JK5wYoCAc6FdW9w6I
	IxIWdkoyvV9wp/whsC28iqC2TJoZZFlUSJnIgl1ZJdSRTTPm9XOVVTPHtSukwUX7+GA3oj0+piY
	DuFzDm7LVtJt3b4NkJMZ2zlK3q0jNJHRdJMUv08A5n5COmkHFIXCWNls3m5hiiprhwotxNJE7Vt
	3vsksUucnFe96t/VYDtcRlAODNN1nBY4HwsqIs3h7CkkKA==
X-Google-Smtp-Source: AGHT+IHlDUACoR6HuZ5lIjnATvfRIBZPmJdAtBlTqtWbFzHfLPmS+68O7mhgc9NM65uSvBvM+8cTrw==
X-Received: by 2002:a05:600c:19d0:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43f2ffa2ee7mr34541075e9.31.1744302360514;
        Thu, 10 Apr 2025 09:26:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893773c1sm5166880f8f.24.2025.04.10.09.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 09:26:00 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:25:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/syncobj: Fix leak in
 drm_syncobj_import_sync_file_fence()
Message-ID: <c715ef30-9d91-46f3-8a0f-1039f3d25e7d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to cleanup if the chain = dma_fence_chain_alloc() allocation
fails.  Now that we have multiple error returns in this function, switch
to using an unwind ladder for cleanup.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_syncobj.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 636cd83ca29e..c136d0c772dc 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -745,21 +745,24 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret;
 
 	if (!fence)
 		return -EINVAL;
 
 	syncobj = drm_syncobj_find(file_private, handle);
 	if (!syncobj) {
-		dma_fence_put(fence);
-		return -ENOENT;
+		ret = -ENOENT;
+		goto err_put_fence;
 	}
 
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
-			return -ENOMEM;
+		if (!chain) {
+			ret = -ENOMEM;
+			goto err_put_syncobj;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
@@ -769,6 +772,13 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
 	return 0;
+
+err_put_syncobj:
+	drm_syncobj_put(syncobj);
+err_put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-- 
2.47.2

