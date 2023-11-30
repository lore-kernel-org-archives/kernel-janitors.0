Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ob9Yq46A"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D80210D4
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:26:35 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3331974c2d2so444615f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701329194; x=1701933994; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxfaT7Lx/SLvMXZ8BIazUPMWfseGLyrbhSm3CqW4/u4=;
        b=ob9Yq46AtWZwUTmefP1KR39gcE5Oq1jenZW7ksI4rWwkSmkciNf4vXXMKACA79LwWe
         4eFZluxYfHpyZBEAq8JPZr2hQmBtFUR6/ATVDyyy1mIZiq81pV0V1A2FkF7LhX48U0In
         P8xBuwcsg28T6e2ZOZBd8Tkv2oUmzzCftLj+Sm10+w0+6idlnaHcg4KKYhRW5hYUovLy
         M/rxTL/v/M4/i1zJ5z9Tkqnlz4sTZiH513Rg/OgWdiuKmX5BbzFTogMtumIOuyFqIXk9
         2qcYNe9mGCytC0zQvNsDFfMjg8CJ5q/Xy6EafLPpau8Xz/8BX09HZjiva9rzc/P7QARe
         yqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701329194; x=1701933994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxfaT7Lx/SLvMXZ8BIazUPMWfseGLyrbhSm3CqW4/u4=;
        b=SJl+DskPzEVyG9LGrfRqwhTmtzWWN4qJ2X92sI+49ZC91X/YqmBZEGp1tUpVrlwLCX
         HK82uU3wLHP0esZHJbf6k7tLY3/3jIrlOIPMPHELmyu21pKLVcDKdiJQU/f0CaDufRP+
         CCxhaGlXoIqtGczvVxg9f2su9r8BoCTfUEcs26OA7keRCFVi/7hrylhJXgMJAgrO3txt
         LLhA0kpZDKvbJTsRS8O3mHKXWLYlESoVUs2f02yPuqz2OGBXrgEyp8JG/Bxdq9+W/Vnl
         mgcDcgAMBVoUhqAVVEG/V5UA0dyP68CpaxUo+MTRRuTg4iOqEi13vqxfDnj3IftxFuUs
         x6yw==
X-Gm-Message-State: AOJu0YwuLEo+gr3KcxcMdpkn4g9dNwD/ItrATEoLPZ34zEGP/eGQUNWo
	mGw5OsLqPWVKIN9FT2oDZkpedA==
X-Google-Smtp-Source: AGHT+IEvR5GCRaBK6/l20FiBKNUdxPm6IPz8FnTeJNAeTaKjXHHuuKIh2lHQQWfzA51hiC4R/SwnJw==
X-Received: by 2002:adf:f88c:0:b0:319:7c0f:d920 with SMTP id u12-20020adff88c000000b003197c0fd920mr14168970wrp.57.1701329194008;
        Wed, 29 Nov 2023 23:26:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4cc6000000b00332f82265b8sm702358wrt.4.2023.11.29.23.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:26:33 -0800 (PST)
Date: Thu, 30 Nov 2023 10:26:29 +0300
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
Subject: [PATCH 1/2] drm/imagination: Fix error codes in pvr_device_clk_init()
Message-ID: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a cut and paste error so this code returns the wrong variable.

Fixes: 1f88f017e649 ("drm/imagination: Get GPU resources")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8499becf4fbb..e1dcc4e42087 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -105,12 +105,12 @@ static int pvr_device_clk_init(struct pvr_device *pvr_dev)
 
 	sys_clk = devm_clk_get_optional(drm_dev->dev, "sys");
 	if (IS_ERR(sys_clk))
-		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+		return dev_err_probe(drm_dev->dev, PTR_ERR(sys_clk),
 				     "failed to get sys clock\n");
 
 	mem_clk = devm_clk_get_optional(drm_dev->dev, "mem");
 	if (IS_ERR(mem_clk))
-		return dev_err_probe(drm_dev->dev, PTR_ERR(core_clk),
+		return dev_err_probe(drm_dev->dev, PTR_ERR(mem_clk),
 				     "failed to get mem clock\n");
 
 	pvr_dev->core_clk = core_clk;
-- 
2.42.0

