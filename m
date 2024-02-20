Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6C5FDA2
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708419750; cv=none; b=lPICwm7EXWRNwXwNvkDohtZ9T6XZJssJU/V6btjBto4rJ/eG8ZbnuNhcvihDmd0vKPD22gcPof/wldwyRQ7XIXMCoR6IrFtVtCXEJQlHvHf3EZrdAdrLRv74jLSwdzsxObQV2H0w2wSwkG8wlL8yO1YztjRQivyAlou0N6xE+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708419750; c=relaxed/simple;
	bh=KkdvrdrLCm8OQrPK+czFlLaYo1JrtJ3rNvWITsPyWBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1LuyIUeOu7Jg4ehZa6Xs4BcFbvluYcmKDkItf//ujpWU41Ne0ST5jTI11wKItwb7dprXvFBd/DdvinLx4u8OT61GVgexqk6j0kyScS3P5rUSKjYKFVIGVYmFvTaNIWHoogQi+zx9I9M2iKOfm6zLTjB7WedVaOmWH3Z5+0tQSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOmbZDsK; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOmbZDsK"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso6309099a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 01:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708419746; x=1709024546; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GySeikmcOETTtUkW23ZAy9xSze7pMX1co+DBAoFFtok=;
        b=QOmbZDsKVf456Rt1SEqnuEMm6ISAY/uOQiVOsumKacdQuMzI+ZNGvlP9HQx9KHJrV9
         JsG6DT4ojiIczo55/f00NxW4Dzcrwo6/qFoLCNCZ4deduCvMVIkFj39bzDLpZo9ybzdj
         8b7SBDBiCaLRnZwGybRgHabikWpEn1GLhxenYGjTSblRXhXYfnIVjMjyJO495g4dTj/s
         eziSs1WdXHnTOsw497Q2TRSkifAZP+QXL9Zjt5U2lEUnI1DMKBkmGcXZ4spW9D6FRW1m
         Ln4Nl/FxFHok5iOdFx4uGHQ0ePd5YRRl+ipT4Buvptcf9ntO0NyTRWAEoQT7GpMlVVfk
         itTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419747; x=1709024547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GySeikmcOETTtUkW23ZAy9xSze7pMX1co+DBAoFFtok=;
        b=UoZZWtKnAzsQiO9UZbqzYwuwGqpfICBYp0lHABj/+Cj2dXs8B1baQ2eJg1tvCtQWjh
         8ummhTgoHn3Gy6Zp6TIaRPBsjljoI532OUqlqpOH5CfzHTJ2xeoP2k9egiBSKcmvsRCg
         yS5QCQLYH3knpvZ6FU65geKpnoNvq2TXf2Z8ccRVK++YKN8uHOiPs6AKRojqXpbzTz4h
         KUsS8mtgu/YXiJTaFxu/11Q4oDM8VcKmekdePiEEckpCNh2iVQM2ZqB0+C5m/Lh0s5Y4
         gWVO6XeQnB7awLepHfWKVVMd3F7GKIJ+UPhwWWpjLbrD8ahxuUWZCxU8BOqSCcOWhGTA
         ygvA==
X-Forwarded-Encrypted: i=1; AJvYcCWAtqFsEjWr4eeWL5+77MwvZsVV/gjHtdt9Lct1pVfapeLpIwUJ2Cr2LTDOtAb2v7sHw3LbQbbfqLdLgiPO8Oreyx6cNS7YY1SI5AcVDg7Y
X-Gm-Message-State: AOJu0Ywg47XyxthKzLNbr8fs9rcVcIve02L7MPBGvAV/dlu+ucomn+Oz
	b+xXaMKZqM6zkjpufskj1scd8mdfofevKbh5zzSmgeqFCOqwQ5kbDuXPLrR7UGg=
X-Google-Smtp-Source: AGHT+IGRNgfAmknQQNAQTmkYMX7dHuxxFdKG4tPqJyx65Xsqquei5GLgk/bTHagMZc1sLtAZLPPT+g==
X-Received: by 2002:a17:906:594b:b0:a3e:9df6:7f0a with SMTP id g11-20020a170906594b00b00a3e9df67f0amr3294880ejr.68.1708419746720;
        Tue, 20 Feb 2024 01:02:26 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id wb8-20020a170907d50800b00a3e9c4fa24esm1757200ejc.96.2024.02.20.01.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:02:26 -0800 (PST)
Date: Tue, 20 Feb 2024 12:02:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Davis <afd@ti.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] power: reset: xgene-reboot: Fix a NULL vs IS_ERR() test
Message-ID: <fe1b90d0-7234-4e03-accc-69a119f6a7eb@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_ioremap_resource() function returns error points.  It
never returns NULL.  Update the check accordingly.

Fixes: 7ddfd33c6ee5 ("power: reset: xgene-reboot: Use devm_platform_ioremap_resource() helper")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/power/reset/xgene-reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/reset/xgene-reboot.c b/drivers/power/reset/xgene-reboot.c
index 867162dfe7ea..b5eee19bac42 100644
--- a/drivers/power/reset/xgene-reboot.c
+++ b/drivers/power/reset/xgene-reboot.c
@@ -51,9 +51,9 @@ static int xgene_reboot_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->csr = devm_platform_ioremap_resource(pdev, 0);
-	if (!ctx->csr) {
+	if (IS_ERR(ctx->csr)) {
 		dev_err(dev, "can not map resource\n");
-		return -ENODEV;
+		return PTR_ERR(ctx->csr);
 	}
 
 	if (of_property_read_u32(dev->of_node, "mask", &ctx->mask))
-- 
2.43.0

