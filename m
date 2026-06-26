Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76143EA967
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Jun 2026 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470316; cv=none; b=eGVFJHPfLL3+eTWP7CsLCy0zIJpKXanyzHUbxxcg7G7AZgIFJRn/69m2r4Z6wfQGeX0ju0pPp7k6Z8bfdSPIZo9hLnGRVy0TKTi3bu/0QGj1FFtOCfSLxrrO8+m1+1rlvi7ZUVrqHQUU8axDZDZZXydAzv3THyP7GCAxzayzISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470316; c=relaxed/simple;
	bh=xki6Rg+f9VujDhsCScACR8JXl+gH6IVEyZSauehtbW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8wfT5y0so9g8yUw7CxNPydp0wu0in8n7rXazra2kQW+JmCaM/tWyDdBqqREc3uKG31ZxR7CcXaeF2mJig9v6YkCDXrw04zAXNIodcsdIlJLU3womy4ib7Ogxsl+P9xTgXhc+LcY/Tx8gycH8iL1Rv3BPrtvri/o25TWJizz9jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abAoocNV; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abAoocNV"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e943356247so596563a34.2
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Jun 2026 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782470311; x=1783075111; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEj0fPXIFdsm7jWY2EGFcG1jufuq5NId8KtSZrzl5fU=;
        b=abAoocNVKwtA7vtLNIUNNG2j6s+C8qkR6YpUekKUUyUx15kEbPlhdZPeybRas3t9tI
         uMmKDCN7K4BghVnjfd+0kiMtCXMjzFDemn5s2gX87QuEF/lJOD3VN1e06XbAPR1Aza/3
         N3SjHpcvB4OaH/EL3E6dmHP4nm+kaR9gD9xlPv60S90A9lm32M3gNDCy1EnfRalLHhW+
         yuZIxolpQCYbxaIL+laO0pa2PMbALUr2+bgFnXGFemdsmbLe4ZpNvyFUU9ghxEinsOxl
         ufTrUj8O1Jw1tkoKp9aFElLrBiv2xvkjeGPrjwPcyXjcLPu3doXWZ/UIX08uo2earXuU
         JwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782470311; x=1783075111;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEj0fPXIFdsm7jWY2EGFcG1jufuq5NId8KtSZrzl5fU=;
        b=Z6fzw0GrMYamj3qa3M/7iO2PyTpCDc+RpKdq9vErYRrugiiehtOiaW2jAThiZapi2i
         PlT2ADJsqYrNUB80hHbpP76k9EFDRYKgyI1p/WPCFD6bQii+O2xXu5CBYz8OGCyQ/mcL
         gmZqhm0PV7hkJdOLMqGAPDjj3G9FOwg+aXxjQr0swD8VW9AQZbnO09+oDNMXeqCPiVOU
         HnVupaahtsQY5k1oXbGEfoHyb07vo6Sut0tG78h3GKIASPISMNx+SE9xajdII6f/HGOI
         rd3VACK42VoxfzNCQ8SUysnc8jG/3MQNrEhiS9M9OvlM0YcR8zKFxLnkx3mGxJ6Jh1bL
         X8cQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/9X6U5j/Ltanw57s5/5slVhazf4OTOiRk8nRKyxeWtXHsHhgAmlg7tD7pf1dbD7F4ugvo/5kN2nqMTi6UHps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAloF6AvhCrlcV+wr3o1qg3AIQInuG84EFNs+6B1il4798J4Ka
	mZBGUFwqyTXlqA0WnOP2XvXHExtVd5GW0xre5XrhYk4bcag1VXT5QyyG
X-Gm-Gg: AfdE7cnOuiWNYjIqS1o54DB1b3OMVIg/5QjCaeREq7/vCPnhOmYGOULIxXtMzgIalx4
	ILAkzPoTIYbZqmxrAxFyldHmuQTfSOs+EasgQ3oEvrdw0V6mu1E9I1a4v9yYuAGjFFVpgViYhrz
	WVCb+wv8l8HFTW/e0pt5tQ9asfH2cPQDxME0lruSGibnmyTF9O4J1XB4qC510CXCgu3XkTJ3sX5
	zeIGuo3EX0qvNWqYXSTbVdRFJ23ckF4f46sqR63xvjNAxUGgDpObDLW9uo3nOJLOX9egiHcxB4A
	fQ7hvCBZCVjtpZqlQVkUnMh7zHVJjxr1hlY/Cd3T92IJ1bWSCSMdSfzAkiXEt0VD4+3eJ4Njs91
	Ezf1/cTF2BM6tYLEV1eybpc8PaqyuUmNvqe1qgNar4yo5slEoaYT+ZKTgUIGuNuACbf1TLzmUJF
	XGLxQa
X-Received: by 2002:a05:6808:1b21:b0:492:9333:4375 with SMTP id 5614622812f47-4929333651dmr4269146b6e.27.1782470310785;
        Fri, 26 Jun 2026 03:38:30 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4935545dad9sm1080530b6e.16.2026.06.26.03.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:38:29 -0700 (PDT)
Date: Fri, 26 Jun 2026 13:38:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v3] thermal/drivers/rcar: fix error checking in probe()
Message-ID: <aj5WnseULiwgmlWv@stanley.mountain>
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
call thermal_zone_device_enable() if not.  We can share same error check
for if either of these fail.

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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2: Use the correct fixes tag and re-write the check in a cleaner way.
v3: Share the same error checking as a further cleanup.  The
    thermal_add_hwmon_sysfs() and thermal_zone_device_enable() functions
    really do serve the same purpose even though their names are
    different.

 drivers/thermal/renesas/rcar_thermal.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..fd686da9252e 100644
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
@@ -506,11 +500,12 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			goto error_unregister;
 		}
 
-		if (chip->use_of_thermal) {
+		if (chip->use_of_thermal)
 			ret = thermal_add_hwmon_sysfs(priv->zone);
-			if (ret)
-				goto error_unregister;
-		}
+		else
+			ret = thermal_zone_device_enable(priv->zone);
+		if (ret)
+			goto error_unregister;
 
 		rcar_thermal_irq_enable(priv);
 
-- 
2.53.0

