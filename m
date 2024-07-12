Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD8316F85A
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793144; cv=none; b=nioBNOSUD9WEhF9V99XugOnlCMadtUaDP1sOdT2is0KCdhK1IVdlQkWBs6Pi6M5vq0BPMB2u4KF3BNA0BF/HL9UMeuotP2v8u3U/+Bn84z2kmx9gkfgyi4JJaeFSHh9loxW3c6UDVMvVyyPukkJgIUMdf2PxeIOFr5BYO3G63PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793144; c=relaxed/simple;
	bh=s07sW+WzTiA93Z5y93aIN6vcb2Pd9mJhEo7g0I1uSsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdbLSjlUveG8e61Yv5a9zdgjMQEd1GRdTkdQj4UEDxbk0JULUCx8CUteysSRjD39ibejfo55SdismCgK0EWfq4LDbAwlr12WgfdpAFt1NWNDp2a4KXePNxylHuSz7mcdI0NIdVd0RYVHy5h0+kEP7sqLD3XMayT7Eaw1vCJ4Q70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZOW/a0rV; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZOW/a0rV"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d9dd7e5f6eso1075482b6e.2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793142; x=1721397942; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z6sW8CRsL35ZnaN7Vz3PXYaGIWLNI/xKoebh6l2Ns/Y=;
        b=ZOW/a0rVDxIcxMPg8nZP/cOz3YpCp0dQ+YEpZdlLDHoN5Pss2fpqWCBexDyac1BoJT
         OJe+0Pcc4g2Zw1j5grX35Jy0CTc3OMbfvQO2bWlqc9Ar3igl7eBDbHIGyJ2SsZTmP6+I
         WScyMhjtvvYS1VOmcJkm4m3K2doG0bV41PDaodCaoW3booM8qnvoDlUzUyrJuXOsIX1B
         pWzIrnx31045QLCZFSHtGuHMFDhALXUiLJ9eOiOfZId5xOw0p8yUXV4Odt1Z9SbW4d8F
         Cdf6jrMd1t8tJktsIm+63aUTm1r/btsKjIoYO+wXw/iJ3HYmCrGXUaD9fdqCMbQyiMCv
         uFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793142; x=1721397942;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6sW8CRsL35ZnaN7Vz3PXYaGIWLNI/xKoebh6l2Ns/Y=;
        b=UubsvFSRHGmZmBQOnnBZ5tcM5nQ2ysxKnp5AXSD1BhmGwXU4enkSpUMYEDOz1/7khB
         Yqb5qgTEMOPmLGEv/kVGzjBkn5GPAUqRssX3IGSw5KMY4Uh96nBBV4Mkxdt849F74QkX
         NJSV2i5jbsmU2Xp574G/bYRmBbZYIlC5yJS8/tokYchZCf5eAERadUchIE+z9yR7OoNs
         fM3lxA2MfqyECiMoTvTi/C1M//srCYl7HF5jVFbWNYy2R2IX2ygRPrJ+0nA1myjmL6y3
         1A9CCQCTViLHBdRs+lS3F7PLNnou5wCrroQp3ORp6vbOdT8Grwq9UmAYMcZIWekdKTqh
         5TVg==
X-Forwarded-Encrypted: i=1; AJvYcCXF8hC3fjHS3CZpVbdSd9FG/rvlH6pOgSeA9Gbj5zoHbTAyOR9MFRTDumEBdTuT0e+pVdpJt3XtmDZnjy3kFNH50jX88wv17QQHkVb7RU0j
X-Gm-Message-State: AOJu0Yy0qpwn5iVE4I5P5bAlO7rnzYHzVBWmAksaNBj4DfDNOhkfp6s4
	ZDc6vI2Xrbv4sr4EJGBL61G+Q1kv2aa8gjsFgrF08/JcGRyjDbR+0ET1Y3Y+XQ4=
X-Google-Smtp-Source: AGHT+IEysI9SGkIePZZKaS96R96m8ogDps9CeyaZpTkA7h39rNGBYZkG5ZiHjmniJk+GgmCSrDzh3A==
X-Received: by 2002:a05:6808:15a2:b0:3da:a793:f10e with SMTP id 5614622812f47-3daa793fe0amr4676841b6e.18.1720793142528;
        Fri, 12 Jul 2024 07:05:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d93acff82fsm1427548b6e.4.2024.07.12.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:05:42 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:05:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: bd96801: Delete unnecessary check in probe()
Message-ID: <01cd578f-127b-4c8b-a8c6-5e11a0a2555c@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "idesc" pointer points to the middle of rdesc[] array so it can't be
NULL.  Also rdesc isn't NULL.  Delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/bd96801-regulator.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 46ca81f18703..ec5b1a6b19e8 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -853,8 +853,6 @@ static int bd96801_probe(struct platform_device *pdev)
 			ldo_errs_arr[temp_notif_ldos] = rdesc[i].ldo_errs;
 			temp_notif_ldos++;
 		}
-		if (!idesc)
-			continue;
 
 		/* Register INTB handlers for configured protections */
 		for (j = 0; j < idesc->num_irqs; j++) {
-- 
2.43.0

