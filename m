Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rtj/Jkfc"
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06089D44
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Dec 2023 06:37:30 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3333074512bso463546f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Dec 2023 06:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701873448; x=1702478248; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VW3Q3pYivZ0nqLu9afJmoH7SdepQ5nT0zPYa9KiyjuA=;
        b=rtj/JkfcEE84dqHxkBKomp1ycakWlsQRrhgUqH3GQY0T07ZsCAsPOSKxSl+Qyf1Mya
         zRVXmdfYqMZq5wIgUhFJyQHCSb25QWPliz5+EiaxXmDUGdOMEfPwq4APYJGF4Nw5Rw1m
         b+dzqAOlBAJqnVAu0uB5nrIqaLI+wAYOCRIbofJe+MiPFS/xtOAbhBv0GTkILE0lPIKd
         wZeSVsNlR3q4JSZrF+xSUJGZuH3IdrcgisEa8EiMxdPHxllFCn21FzrA0ZxEZoZX8nAN
         qb/kB0+04d4GlWPotK69WIZn0G2A5t8U5cymMpb2SHQWvKKGnj3OuO0PPdsVN1ys68bq
         uDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701873448; x=1702478248;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VW3Q3pYivZ0nqLu9afJmoH7SdepQ5nT0zPYa9KiyjuA=;
        b=RLZVUB/j2o9NK14TOmwpe6UaumLNgONiXpJuqKmuaEXWdVm1YccyUI7UZBQdEGJKXi
         NuDqForICTDQAv4UutFcS+PDv6LTQWwLGbzwb4CL9NNuUwfjD9I3S4CBv+bf6efHUzo/
         d1ZEPw1tbzxny0QieXNbbzXtb5VDprd0pZ0aOPWsW0Rix74vHHSYT5IFTd/cmVBDAWGY
         iDWVD4JvhPj7UHcB8bVRyIxanqI/uFwuin7kHVW/FuT5Gvl82qAIsCoR9wYzu37t0kjp
         ABPRryb6qMNaJGPchvzHhkyy+H0wcEv3nLQgjzXgb+uuUGLLTWV4VPqW6KMt4G1ZZRTF
         6ezw==
X-Gm-Message-State: AOJu0Yw9a+q+oSM6a9/xsm/0ZRCIcpa35R2Bxy2u+jDH9Iyc/8gMENm2
	pvRWkcFxavOa2gnBANOPSXOjCg==
X-Google-Smtp-Source: AGHT+IGEfgHWhI3i0hf5O74h0s9YQTUHmBfTR0yRIKQM71/4+mYNuyHDYdRRnr1gnYUuNd8DlAYpWg==
X-Received: by 2002:a05:600c:4e90:b0:40b:5e56:7b68 with SMTP id f16-20020a05600c4e9000b0040b5e567b68mr1640147wmq.177.1701873448401;
        Wed, 06 Dec 2023 06:37:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id fa10-20020a05600c518a00b00405442edc69sm25776814wmb.14.2023.12.06.06.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:37:27 -0800 (PST)
Date: Wed, 6 Dec 2023 17:37:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Donald Robson <donald.robson@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sarah Walker <sarah.walker@imgtec.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/imagination: Move dereference after NULL check in
 pvr_mmu_backing_page_init()
Message-ID: <13f4278e-af9c-4092-9196-bc0e6b76f1eb@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code dereferences "page->pvr_dev" and then checked for NULL on the
next line.  Re-order it to avoid a potential NULL pointer dereference.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index c8562bfc0dcd..4fe70610ed94 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -316,12 +316,14 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
 static void
 pvr_mmu_backing_page_fini(struct pvr_mmu_backing_page *page)
 {
-	struct device *dev = from_pvr_device(page->pvr_dev)->dev;
+	struct device *dev;
 
 	/* Do nothing if no allocation is present. */
 	if (!page->pvr_dev)
 		return;
 
+	dev = from_pvr_device(page->pvr_dev)->dev;
+
 	dma_unmap_page(dev, page->dma_addr, PVR_MMU_BACKING_PAGE_SIZE,
 		       DMA_TO_DEVICE);
 
-- 
2.42.0

