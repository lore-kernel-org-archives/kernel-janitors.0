Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B361429B
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710582334; cv=none; b=i31omTRhF+XMPHkm5juUPXdpt9dsjlsuhIndj1mTjy7cb4OX0CgYwNEi6q81ji0zUpQ2Ti+dgw8Wm4kB244J3lg3RM559sfOf6rTQMLCXYrNt8CUwLTFuY0U3Pl2gg/pPO9W8+lpY1RoZJE38TEqClb7Xuo9XywT+shYOFHX9co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710582334; c=relaxed/simple;
	bh=hbczFDATHkIyK0WzorFo1BmIzgN2WzvtB9k8WKOd2N4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwVC8vN5fLZAKHCFRdOIEzGhhuR6dPN6jKfftKs91GdHBGt6WVON+7K6zqNeuSl6ivs0i9GNFf746ysG0yEArKq249coPvESzDPJwh7R0mRt9L5mPoo6JRM/pmX1704FiCuMhuP5WfxD+uErIPhUkp0g9lHZuJYB6Smp26et/LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URsKJsqH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URsKJsqH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so708728f8f.0
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710582331; x=1711187131; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmf+EhkCbPD4zN6pmu9jbRwb1AOtk+4/VyFIevrMxPI=;
        b=URsKJsqHFHevktRcEID69N0aFN6S4C4yStmpHwkKdUdTs5Z0c9FCrBWnLvtWlYVscr
         c3013fwa/nGjaeF2le1XKVEJ+XSGw+4BoZ3Hr3/NS0E5HeuA+8tr+oLa46GRQpquZhXz
         EP61wBYAR+MHyxg2lZXAVJghLXRWajf//W1vjp6vO8uTV87iZmwZ183PLAdLR7UwsWu5
         1RhaJ60ZOz4DpYI+A+XMNDuUXHd75eYtUGCr7zJOOih+/B52OBVb9QRmbBEnLsYghux3
         tMYNY+uw6ZCKgZ9nWUsJNLC2gCQUgpuxH7LJ1uN0khAJM6LzZrzd30FmJ4YVo/RW1X7i
         S1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710582331; x=1711187131;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmf+EhkCbPD4zN6pmu9jbRwb1AOtk+4/VyFIevrMxPI=;
        b=LzcrHlXtChKpKiepXyrVtkGWYQ/vUjn9N8IuiMUQKzJDsqsKfNajUlw234Cx6dWqQf
         Kva/T1lVJhbZEn3CuJ2f+qaAZWglPQQrUE4z9UAw5OYsRY9s+3OleEWkJB7uNJQLf0/5
         n89uwaA40rxCNvh1CEuBCfeU8FdUkxMRRfKPgVFqKtO1MEns7i3g898L8ZIyETl1vkGw
         l6HMlOCCNjZHoxEW2VUyGMgazFudwjQz2g4TxBtPmAVeLbAnk/NHyDJwfNuZN2xiN+tF
         QAgBgSAn/H3RmH/LfH4OPpLqEGwMczqwLQo6z3Yv3Qy+phlrVUJ9S8PAyj30U5ey89bD
         JgmA==
X-Forwarded-Encrypted: i=1; AJvYcCVuW6CTrpkcP1KlkbTaLCAeSOi46Fu4UrB+0AHV6yNKYoVNTL1XEy6WeUi7rzK4k5+UPdVsaK5XkYiyF1crw8+HAAfJAIYD8KuHVsFP1OLB
X-Gm-Message-State: AOJu0YykuvT6tpZX83KgBOwDXLhYite+zs0wuuV4cfnSRMH1lObGsFOE
	M74LYJc27VCe/XQk/vuuxZIPvw3PS3EStTp7njtxI8yN1qKqZbC/XDSNAvuzgvE=
X-Google-Smtp-Source: AGHT+IHauOfu90GrAhcslu1pR8/IgIcfemYw9G775rZSF8H7HGHaPyO9in3oux43aPDC6swiuJd29w==
X-Received: by 2002:a5d:6a89:0:b0:33e:c236:ccb1 with SMTP id s9-20020a5d6a89000000b0033ec236ccb1mr7746624wru.15.1710582330925;
        Sat, 16 Mar 2024 02:45:30 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bs8-20020a056000070800b0033e3a24f17esm5221863wrb.76.2024.03.16.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:45:30 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:45:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Message-ID: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "num_levels" variable is used to store error codes from
device_property_count_u32() so it needs to be signed.  This doesn't
cause an issue at runtime because devm_kcalloc() won't allocate negative
sizes.  However, it's still worth fixing.

Fixes: b54c828bdba9 ("backlight: mp3309c: Make use of device properties")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/backlight/mp3309c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index c80a1481e742..4e98e60417d2 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -205,8 +205,9 @@ static int mp3309c_parse_fwnode(struct mp3309c_chip *chip,
 				struct mp3309c_platform_data *pdata)
 {
 	int ret, i;
-	unsigned int num_levels, tmp_value;
+	unsigned int tmp_value;
 	struct device *dev = chip->dev;
+	int num_levels;
 
 	if (!dev_fwnode(dev))
 		return dev_err_probe(dev, -ENODEV, "failed to get firmware node\n");
-- 
2.43.0

