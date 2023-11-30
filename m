Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pxJZU+83"
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129A010EA
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:27:21 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9b5e50c1fso8616351fa.0
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701329239; x=1701934039; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7WLNcsSt42LaGfjZQ98cMh59wBp+UL1asBOR9zkijns=;
        b=pxJZU+83KLExIo4EmVxqCv8wdgHTuKTa7225bk6VrXC9IIu0WKgfUQ3gvAeWL1jqdj
         rFWYWksY/yTgjUTaoYhuwDosGUv1IgJQR8/+FxzDHdpDpWr3uDEVmX/7xjUSeUe0jBIG
         WPzq/STIBN81BIX6ERFOJXLFz4iIbm7NG/8kG9N2fzWNAG/jUyudqO1p9Q064ve0UJQs
         VUUODqPWM0V9kqERyQswuNGkDOHG310OLZ2kusrCQJKlmDMjCNM/U1NJBn6R+rdytAZ3
         5te/KyV4rbbgfhBAveiw+hBaBNa1fL2Faffj990MNBh8nDlocer0ikj1XG8haVdd/3GL
         Lkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701329239; x=1701934039;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WLNcsSt42LaGfjZQ98cMh59wBp+UL1asBOR9zkijns=;
        b=TbOvTxKlxYfrGaQH5RxGsFijn/kjEQUqPgY81fFCXCf9NahUBTcg8f3407LJ27Zhvd
         JfbOC6KmOdx2n5oSnH7rV8NoWan9gPPyuLc/T8Dne9hnu2jbtOuJ+4Z7V3Tef/pV8Sty
         7m5iHw7HgXfgLN2AAstRze+aVQcYKCQ2kIZpHSs8XYW/sqLQ2vRpMxWA6nidfcN3vgoK
         GR94iNlGJ08zWIDO02OhqCWczi0bAk/yfW1R7rbpy1BgnKvWOeF+KDEEIyTedpSx4tZV
         ccf9C8vHvD6w3/1BCtPmew4SqYix76gjs8lxEh5eIftnbbElNvKJ/azhf8vawomCXNOw
         VZeg==
X-Gm-Message-State: AOJu0Ywh58k+1wQ4Hr2M0VeNBa8oXhqAJkzVIvI8t3OwdQ83ozL2b6ya
	o32Ipg7wmbYJP41SvTEBXTflsw==
X-Google-Smtp-Source: AGHT+IHAz8JwF2cwklTl4K6IgQx7ErykCE5QzPE31FEM/rixp/mIlIv5wVKVj+dAewFSOm0L2zbr/g==
X-Received: by 2002:a2e:8606:0:b0:2c9:af18:2e8c with SMTP id a6-20020a2e8606000000b002c9af182e8cmr5027808lji.10.1701329239279;
        Wed, 29 Nov 2023 23:27:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b004053e9276easm4564118wmq.32.2023.11.29.23.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:27:19 -0800 (PST)
Date: Thu, 30 Nov 2023 10:27:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Donald Robson <donald.robson@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/imagination: fix off by one in pvr_vm_mips_init() error
 handling
Message-ID: <a2d3210b-290f-4397-9c3e-efdcca94d8ac@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the call to vmap() fails the "page_nr" is one element beyond the end
of the mips_data->pt_dma_addr[] and mips_data->pt_pages[] arrays.

The way that this is traditionally written is that we clean up the
partial loop iteration before the goto and then we can say
while (--i >= 0).  At that point we know that all the elements thus
far are initialized so we don't need to have NULL checks.

Fixes: 927f3e0253c1 ("drm/imagination: Implement MIPS firmware processor and MMU support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_vm_mips.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm_mips.c b/drivers/gpu/drm/imagination/pvr_vm_mips.c
index 7268cf6e630b..2bc7181a4c3e 100644
--- a/drivers/gpu/drm/imagination/pvr_vm_mips.c
+++ b/drivers/gpu/drm/imagination/pvr_vm_mips.c
@@ -57,6 +57,7 @@ pvr_vm_mips_init(struct pvr_device *pvr_dev)
 							       PAGE_SIZE, DMA_TO_DEVICE);
 		if (dma_mapping_error(dev, mips_data->pt_dma_addr[page_nr])) {
 			err = -ENOMEM;
+			__free_page(mips_data->pt_pages[page_nr]);
 			goto err_free_pages;
 		}
 	}
@@ -79,13 +80,11 @@ pvr_vm_mips_init(struct pvr_device *pvr_dev)
 	return 0;
 
 err_free_pages:
-	for (; page_nr >= 0; page_nr--) {
-		if (mips_data->pt_dma_addr[page_nr])
-			dma_unmap_page(from_pvr_device(pvr_dev)->dev,
-				       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
+	while (--page_nr >= 0) {
+		dma_unmap_page(from_pvr_device(pvr_dev)->dev,
+			       mips_data->pt_dma_addr[page_nr], PAGE_SIZE, DMA_TO_DEVICE);
 
-		if (mips_data->pt_pages[page_nr])
-			__free_page(mips_data->pt_pages[page_nr]);
+		__free_page(mips_data->pt_pages[page_nr]);
 	}
 
 	return err;
-- 
2.42.0

