Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA701925BC
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2026 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306196; cv=none; b=Jn9dXpMvJIYvYCDZjrlB1BRUi66+ID1CTAaKFjxtKBgMpsdK3mldSeJ6oaK6AGA7qYasOSGlCjORLgq6YzOON8sv01+7Q1aymtRy4GSVxOtF/t82Tb7AghfYWQHE2tm4USq5wdSxq8yc13oHKewsLX3f5/kcKS4U8hVqRAtT+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306196; c=relaxed/simple;
	bh=4wmUG9+jETW1+KM0ZXFsMsDz7lw3gBvAJtfCC3yXuug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tXaRpKa5H+PeGcEXS31Qhs+XQiV//PCiQHG0187oGjQpLfKHgqC0XAfGScJHLuh9a0ReYs+H1f4VHONjGXFcFdT1xh+p/mVkasAK6E5wwDOOXZICZ/z5z5gFf95yXkgbbBekk7qfnAVJjo83IdTkl+S7ppZIPmcwJ749TkulPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPenzY8G; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPenzY8G"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c0efc7ef797so155076666b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jun 2026 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306194; x=1782910994; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqbffuHROsrMfivcmxl/a0WRNEEypXicIfc5X1ORIW4=;
        b=TPenzY8G603F2SfksgutFmXYP8R0NY6G/BLUwo5OsLTTpwrkAnUD5pFaGsGcH5cy6p
         kh2lanK3JMuqDY5qK8Lg9K/Iccff7GNX2kKqGMC8onUe0KR3yrv+S506z0eur199+9ZN
         tU4xcJXuQVakabMkXAEd9F30kAZ7QsXBojikXUi+aFQSdqlfjoVCygPbk/sKXNPCoaOU
         fgKbS/BUbOs0itTRvXBnPIlaNkWQUB5Gp2KPb6fzKtX522bzT2mzd5a80BOmhiHQ3asO
         KlYgLtjN8QUeAEqYuFjWu+rSbhoE4sqJxkx3uxYeLZmNJyx0eeFBLLbZSSbRxigQXLPf
         sW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306194; x=1782910994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqbffuHROsrMfivcmxl/a0WRNEEypXicIfc5X1ORIW4=;
        b=UDN+FnfNAAIXzk98UZWwXsAgP5TT436AcpWBdtRg3XH6cLJuZA1BZuxQel2RR0leO7
         dtVZIA0gbfmhXaBlTLXXMqsCLly8YDgxBZmFwnSek6CpEPS/+IGT4szmTx40D1UUwPFH
         2x8AejlxkfAHEry3m2DZScJ8Ndw11gkp0t9RYvpI5WAKtg1LpBQL0cAodwVWKQl+JYpy
         ofJj821iWbYdEhn/DGy+z7zqlY+8n/5GeYhe2LwNAS5RZiBgPQ0wWM/Dv4fuU7HNdSBc
         BpVOjjYAC+2wj0LzPnFP6KX0d+5WCVG4EKmnjYMJOwMg6TzveXvEIxM05h0VOIJel6xF
         CwDw==
X-Forwarded-Encrypted: i=1; AFNElJ9lk90wEy/XUiN6tH3NsFQ/VIikgr9cGVvhx5iOMLqZzxNhjIx1gKJxsntQKP70OE2yAZWS5LHP5G338pJBdCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCdyjhbesqSLJmigWBWiPF4lNkXVBdPM3avJLeqCRdT6f/70Cs
	Z3pJMMfbk6A4mYOYKXcVqwpK4g3Cuyxw7LSymi53iiGlxMzsjTYV8rWA
X-Gm-Gg: AfdE7ckkQ7WXN7t86b9HS4bGOIdd6HRO959Vc8Nz9hDWAl+dA6VmfhrfIw7Gg0sw3Yy
	UZKibXK7PXsfVw8KjrvDAM2mEws1+np87yolm6xzUH+7oOcatkQrx/VUxZ1pmexMhTG9dWiePbK
	2yhco4QUoxNrpB9LMLQUwptEt9CcqJBxfQuL52mOmxeiNfd9U2/B5fNg3lv4u8V7jPkpupXXkaY
	qKTvEt31pyN0kICe6KBO3NdxPIkyil0+PcFWYQvCrP4Q7GrGY73TcO+kqtUCQRs3UUnG8fcpvFs
	7FmL3W5FjHohNMLXAbvYsfjI1RI7IwvmizIPaByQC1m7ttq3XVFeevf3e8BNdX593WzYHxT8UEE
	IEqLiSa20ed8tvAJREcH0i+fVetorIesFUfqWHywv4ExNRJwSEkuGZJ5G7JxR9k3205ICCBA+5S
	8X5LdfKbv7
X-Received: by 2002:a17:906:2081:b0:c11:f023:8414 with SMTP id a640c23a62f3a-c11f0238ac8mr89463366b.22.1782306193376;
        Wed, 24 Jun 2026 06:03:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e497e7dsm651298766b.5.2026.06.24.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:03:12 -0700 (PDT)
Date: Wed, 24 Jun 2026 16:02:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] thermal/drivers/rcar: fix error checking in probe()
Message-ID: <ajvVfSusxZfjNxVN@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code accidentally calls thermal_zone_device_enable() before checking
whether thermal_zone_device_register_with_trips() failed.  Move the call
until later to avoid an error pointer dereference of "priv->zone".

The driver works differently depending on if we are using OF thermal or
not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
call thermal_zone_device_enable() if not.

Moving the thermal_zone_device_enable() call is a bit cleaner as well.
The original code used a three step process to cleanup:
1. Call thermal_zone_device_unregister() to cleanup.
2. Set priv->zone to an error pointer to preserve the error code.
3. Set priv->zone to NULL to avoid a second call to
   thermal_zone_device_unregister() in the rcar_thermal_remove()
   function.

Now we can just do a direct goto error_unregister and rcar_thermal_remove()
handles the cleanup properly.

Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Use the correct fixes tag and re-write the check in a cleaner way.

 drivers/thermal/renesas/rcar_thermal.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..f8865b03ed23 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -492,12 +492,6 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
 						&rcar_thermal_zone_ops, NULL, 0,
 						idle);
-
-			ret = thermal_zone_device_enable(priv->zone);
-			if (ret) {
-				thermal_zone_device_unregister(priv->zone);
-				priv->zone = ERR_PTR(ret);
-			}
 		}
 		if (IS_ERR(priv->zone)) {
 			dev_err(dev, "can't register thermal zone\n");
@@ -510,6 +504,10 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			ret = thermal_add_hwmon_sysfs(priv->zone);
 			if (ret)
 				goto error_unregister;
+		} else {
+			ret = thermal_zone_device_enable(priv->zone);
+			if (ret)
+				goto error_unregister;
 		}
 
 		rcar_thermal_irq_enable(priv);
-- 
2.53.0

