Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB4727467A
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Jun 2025 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647393; cv=none; b=IL/i5fZ3IClvFRGOTlwBos9Xe/8vnwGX1zerjy0fgyIXco6ASeRhrbcWwNDONnTC9L5iAjSjDt+OubfzOyu7BcTWTrU3PWzt2cGymuRTDI9UXzN/OfAfZn9E+m7F6R617kAcwJPAHp9aRcCyJ6J8pJCT/l3vjdXPsq9IDCnkYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647393; c=relaxed/simple;
	bh=L2yruaMlTjnh6snqZlpt4phoeh5TVI4kMDcp31WpKUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P25yBjN0/4TjgtJf4PnXOjgpms3ac0tXe7x1m/5HlmS7PZCg4NYEX1w6Rf007ntEURty5pCPSR56C1NCF74zJOLynHmY9gFMQCoHwmDMM24UeKYzPN9J0C8FzN8HxE4Rw6O2+wLQabc91Wo2UlGY0yB6wHJFyzhHmYgVEGWVgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3KnW3Uh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3KnW3Uh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a528243636so4009174f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Jun 2025 06:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647389; x=1750252189; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
        b=L3KnW3UhmSOCJ6NAkkrydI6OhuvBQlJ7G3QK54wpYUZzW1wCelUqiscAOSqkCACntn
         zvIv/vnKO5gynA35/c/IPrpNt65kXIMc+GdWoikR0Kn6ZNMpzYLNciqHJ49U/EhU/S59
         IouqO1dFu86kadaRqSI604ybwh+w534FqyohYGG9usoFIs30XHMX0LUSBIzwpxZGnY9f
         ArhnNMjfnO0aMmx1Z6Wh4xTaAqZRevqTMYtOCG1GwQq379dHg5RPzdZDWVPEUHgYXISq
         Myh1B1Dj6DOVoD69p9E07cOyMvMfAU1BK8ED4R6s9Le+/Ol0UvGykGwoAsLrUf/8XRbS
         h3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647389; x=1750252189;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
        b=KSvd/wzljQtLjCNZWD4FHObwrePydOmohDL548F1OdZ7EAtfdQ38GwFnXsq/W2MVaB
         CIV3cBAK+5xhL26POivj19f+1+/pr3I0t27mWfYnT/bSso6CmxCQkd7BKwesT08cW78k
         cI/K52z6p1WCWb2gAZ+20K2ZJEhDUKRH/GmZB1UMmekulFD19qa3RQVUtJaFL8I5Gj7Y
         xACQhUUPUGRu76uePAbgQpiLS+0dK3CghxGp3qLnl4m6bmII/Z4R9LAT+4EZRTfETuTH
         xv+H4xyOPqcQGz3THC22qf3e7OSurFd/hf76KGI57jucrTP8uadxlVNf/u4T5l7GlhMz
         Y/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV84pvTLeHHdjY7OgUwpfuUGLqgQs9d9WUSN3eNTywumYOcLK1lc2tu0dbUKIVYa5uxgDNxegVQ/hRSnjulf94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Rzb0CS+VYUx7GXjcZ1Jd5dWpSJwE71WICR5x55pU33nHWGzt
	g89paQt/c66KIeWq41iYMl9XekRq4PqLGf73bnAM63RUoBnayeNeNMM4234733l8rtE=
X-Gm-Gg: ASbGnctuAn6uj8w+wE20C0ttpFkbjcYRMIv2qDXRMVikTBUibVGUoVSFrZrwvzPV+cP
	8ai/h6vLmF1NSngoLsbZ2+ApvvlSWbS5XT0UM5/BtcfzIGEK2EvW7N2JALoRyFrJycllDeqFeCA
	l4UVchEoB38XFIOabwiBpFjRSlCOxp0rYEaZI2f5o8eKUqYM9qMOO4oDjDZWBd5z8DTwrT9xr/t
	VMyIx4hvgX7rCGBu5VtmWHLLoOiawLUpJCS0KlPTfI5iOD+N6IN7wtsvcP/bAgMuMBiSnPRmHca
	XnkqW06O0lx5t1sGHODkpSx8P514yzkVOYNraspfwVBqHlPjiudUv4Jv6+nx9OcpQY8=
X-Google-Smtp-Source: AGHT+IEBRO+SagBJ4t0nPcz40k+JfMlWO7SvxBp7cy9P/imnH5Z03hsajw0WU0mj5IxyTgoNyCPJNA==
X-Received: by 2002:a05:6000:2204:b0:3a4:fc0a:33ca with SMTP id ffacd0b85a97d-3a558a926a5mr2258868f8f.4.1749647389545;
        Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53246b678sm15078061f8f.101.2025.06.11.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:09:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: stm32-ospi: clean up on error in probe()
Message-ID: <aEmAGTUzzKZlLe3K@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If reset_control_acquire() fails, then we can't return directly.
We need to do a little clean up first.

Fixes: cf2c3eceb757 ("spi: stm32-ospi: Make usage of reset_control_acquire/release() API")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index db6b1cfc970f..4ab7e86f4bd5 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -937,8 +937,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 		goto err_pm_enable;
 
 	ret = reset_control_acquire(ospi->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+	if (ret) {
+		dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+		goto err_pm_resume;
+	}
 
 	reset_control_assert(ospi->rstc);
 	udelay(2);
-- 
2.47.2

