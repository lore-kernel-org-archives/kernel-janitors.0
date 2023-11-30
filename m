Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dzn7XD0g"
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD349D5E
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:27:06 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-332c0c32d19so446073f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 23:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701329225; x=1701934025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x09g6G18OJ4KcEcTHhYJRdvLAtb4UmkCF9sOQ3/Txus=;
        b=Dzn7XD0gltIe0SPdCy+jw1iMN67c1mZ3QEdI6Gcv2J+6W0FIOjfzvr/ybeMzxDbC10
         rJl9ABvBF8O7Z3m+Gt0eoiZmW4i8I80hi0Bn/Yw0ePRqKZnJDVUkMN5ZZxnwXsRPLWzh
         EJHD8cpRXIDpCQMiHHvapyKhScdg+zSpTH43kbhC3+1iZh5qDeZZlZxFVVIn9K3nrM58
         daYja0xfgeVrEwDdG9Hm0jiNLNkJT4Rk/GIGAowGWUcrnVPcBCuB0wB8cRSgNUM8AkH4
         NZrHgvAr2ZMgGIUcsEbPhYaiowwBU48NBdp/XZ5/xBK8J2UJdvMGt1/E/FkLNVADMKr+
         hpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701329225; x=1701934025;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x09g6G18OJ4KcEcTHhYJRdvLAtb4UmkCF9sOQ3/Txus=;
        b=ro74fpwl9w5CbWmNSIF4rcSApxLeP6bVuSsQP5hVyLv79rXLbV+X2KoaqR0b2gskqJ
         CTfGqKlf+WeDRZg50ROJWoowYyeoR0AlTypIZDBDLWMlgMkNuyKlxpGqvFTEGFwXo1NO
         vr2FPNRC7PuDDhPiGdeFCfRS477MIubAFaDp+sIvD4kTDfgHU0wIXBPk0yWJ/7ecODdF
         /ye+G8r9MP5U8hSBkA1slg6K5Esrw77ZZtNYIlyWtfGvIIZp6DJYRyR+KjgY6663IVdw
         gPJd/OSQyeR40OGNK69raqs52BRNMuvSOuKQ2BZFf/pXm+uTbQkZRs1WCVc/TUpkbB+c
         vb+Q==
X-Gm-Message-State: AOJu0Yy+386ZGbzyBPpJ2hccfM3Ei+oNOntZ7owzl0KmLGzEzX3gQ2k5
	+Owfe1AMza/+5Ik5gYs/Ia2mEA==
X-Google-Smtp-Source: AGHT+IEPpmMxWY7kuPeVsp/4wZTQWAaoK7shEBxCxTgQhdfynB/VG26OKEMXa8H2xecLoUqmGYdG9A==
X-Received: by 2002:a5d:5987:0:b0:333:145c:ac01 with SMTP id n7-20020a5d5987000000b00333145cac01mr4260949wri.44.1701329225311;
        Wed, 29 Nov 2023 23:27:05 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d6092000000b003142e438e8csm693983wrt.26.2023.11.29.23.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:27:04 -0800 (PST)
Date: Thu, 30 Nov 2023 10:27:01 +0300
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
Subject: [PATCH 2/2] drm/imagination: Fix IS_ERR() vs NULL bug in
 pvr_request_firmware()
Message-ID: <384288de-a779-46c7-869d-b3c63462e12b@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
X-Mailer: git-send-email haha only kidding

The pvr_build_firmware_filename() function returns NULL on error.  It
doesn't return error pointers.

Fixes: f99f5f3ea7ef ("drm/imagination: Add GPU ID parsing and firmware loading")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/imagination/pvr_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index e1dcc4e42087..5389aea7ff21 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -286,8 +286,8 @@ pvr_request_firmware(struct pvr_device *pvr_dev)
 
 	filename = pvr_build_firmware_filename(pvr_dev, "powervr/rogue",
 					       PVR_FW_VERSION_MAJOR);
-	if (IS_ERR(filename))
-		return PTR_ERR(filename);
+	if (!filename)
+		return -ENOMEM;
 
 	/*
 	 * This function takes a copy of &filename, meaning we can free our
-- 
2.42.0

