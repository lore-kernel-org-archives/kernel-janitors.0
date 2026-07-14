Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5A40BCBB
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 16:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047443; cv=none; b=g7/YoOzxEnNR4e9vSAlU8v9FziThA0TJJGPoRRux7o+9tS6hQ+L7rfHJNbb4A5n3v3SBuR8FvQjRMpfB1RqoH6C2rXVOU7EKwFrlGmNZ1WZoCRF2YFDja2h4IC9A7ACNdHw+hG+x/SyEjxq8LJNuxAx4HkLMIMtDpNs8qtsmeqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047443; c=relaxed/simple;
	bh=qW96X5+3pvTy2yUg8+tq8uiP36vU8UXZPD0RUS9kypg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VCLI7Se8IwaffjJb0xs4h+nvkR0BuKfykWKOayHZ/nEO2OhQL+lGXDPMVVo5wMtE3z1r+u3LzivULWaZlDIqzMvsTaheKge/St4X8j2C4taXyV9CVoHyq/URXyFdpUjUzHBUUXde0V+ZIVeqplzzUqkpNvj54wU+Q3M2oz38I68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO1KOJ70; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO1KOJ70"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c733f15aso41173925e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 09:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784047440; x=1784652240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WS/LG8NLHrxUYbXTyAgZN6AxbMxAGqMIBf9Cy5n0BGk=;
        b=EO1KOJ70agqjN3JkTxr1ou8fiYBH7SxiyORz6m1HwUKmjAkVNiMYvHfSeyLK/4425D
         DJsMgvNhNArIzA52jhG/fTT+GPx2Vu5U0zmPkC67QN4N3PCqlfqHlNWd3/vUoHqWNUed
         nqsedIniRWJW8UckO+U8xzUuXZ+NQxcXyrBABJZvIoQlboZWeESo4P9JhHNGIEqP5ggg
         6a5DvngHLiGewPI3iDZgyzGtnoa+sr7Q9iZDwVw3xoVQhoF5p3MaZKI7LRvyTU4Wt+27
         oj/zdDgopamtwt0o+KQSazmY+KDYWNB0fqsR5l7s1OHdEPkJ/xgMsxkmTQclXj/MU+Gl
         nIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047440; x=1784652240;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WS/LG8NLHrxUYbXTyAgZN6AxbMxAGqMIBf9Cy5n0BGk=;
        b=Ml/9ojdHwj+Gp6Ug64E549qB+FAI/FiAvY1ZBE3goQx5/aOXw7JJB8IPkRTAPvJLSb
         wvLtb/o/mLPH8WWuPm9aVxXu4jIYVo4aAs7JFMktSMZD4JmCy/EQNZdZPB8HXOHnHOjY
         G5uk5lV0/PYwiJqRRHIycKvI2lYhDT2ly1D6f+QLAKhvjhaXDHEnKpmvOdqIqqx5Kgt+
         cs4KXMJJjbGHekF/ZCoY3e88ci1iWI/yxRtMdh7zo6xMK4twUDZuH/B6+MzX2Nt12tzJ
         4CsxMjG/L3xPF+xlC9ym2NYUg2GrXBN91jaE39u5U4lLYIFwvktlcA6ikv68ts96KsdB
         25PQ==
X-Gm-Message-State: AOJu0YwuAK3jbcZZY8iaI0iHM6UZ8JpJMr1dPMRQUv4hJ5w3lMULEObp
	Bq9PlMGDeSGdFx7qh6jra3q+RIVCwmNYyw81d3vcyzfWIsFdpI1G8T50
X-Gm-Gg: AfdE7cmzhKV3m/Aat2jg3R5MiPNIUD7/CP16GC/cM8VMYxn1hftKKmWqaSNgwK85n8Z
	8Nr5+AvWouV1kYpAzsaM2yCdOBHkpWWI3Qb3CRfy/WSdU57Fup0MKqmWwGGvJKJKpNTiajqzWXj
	SBNcubUgkYnCSguymQeY1lJevWKhVFlry6OdZHQ8+rW+E2CtnKfbKqwVPTA3ivMDWFx/8QvCnxf
	T0c+7hKZiJU8hBHATwlxCWXkXt8ZH9xdp1AbxEiWI9eXkXIYMwFh1Hw7GxoY9jMkrTc5WgHRZGe
	NKtJkWUsvNyyXJqbK1g+xAQ0FzYgBAyHBgeb9CVm/0iYwte3SDeSXMF4uTR8bWAZpGRwMA9ugYK
	Q1JmL5gIiKb5hrtq0tBEDcyL4UXPKr0XDZIkeRtkRJB6aiF8whuddOvF8rK+Mk14PN9AxcNb/kN
	sW8JcZr6PpNZGdzKyiLFk3jQ==
X-Received: by 2002:a05:600c:4754:b0:494:ca0e:880a with SMTP id 5b1f17b1804b1-495389d2ba4mr34447785e9.12.1784047440059;
        Tue, 14 Jul 2026 09:44:00 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm92705685e9.14.2026.07.14.09.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:43:59 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] spi: bcm2835: make read-only const array pinctrl_compats static
Date: Tue, 14 Jul 2026 17:42:15 +0100
Message-ID: <20260714164215.183809-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const array pinctrl_compats on the stack
at run time, instead make it static const char * const

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/spi/spi-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index ff94482fefcc..3d5255d75ff2 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1226,7 +1226,7 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
 	struct bcm2835_spidev *target = spi_get_ctldata(spi);
 	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
-	const char *pinctrl_compats[] = {
+	static const char * const pinctrl_compats[] = {
 		"brcm,bcm2835-gpio",
 		"brcm,bcm2711-gpio",
 		"brcm,bcm7211-gpio",
-- 
2.53.0

