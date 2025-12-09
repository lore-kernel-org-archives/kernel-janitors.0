Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF52749C4
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765263264; cv=none; b=g4+bNKKsFTKKGK3xF78o49AQIHHZxJ+PNcVLhOkNhbK/a4fnVWA8Yt+0rXUyROtMPEvaCshAVzKNGPRXe1wroWBD5CqE2nYp/vdBRjD+I2skvM4fh/LShNo4vGwrH2zE6AgN54A0OYrlSzaZSXCWC/UTj3ELw0PlpoIzXGvP790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765263264; c=relaxed/simple;
	bh=hn2o08cYQrDfV3tQqT9H+rDfpVyTSZK15G0g+VQZnTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V14QKr52JrHr2Gg3ozrTC4jnoCIOFcpWeE5u4CHpEUMmrky+b50ufeNeeyuqO5jDdYX5imsLpWoX3Du64jNHhARWxtUU3KgDbBUr4OwgUEgzsgp5n1ymagjKGF5GYCTO20NpwS2HYvNI5b9PxN10wUWOIrffJM7zO++2EBQRVCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/WbV2pU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/WbV2pU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a1c28778so66876825e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Dec 2025 22:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765263261; x=1765868061; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LrpXhu7xOFIDAiCO1bWkupxvjMEzxIC/867vkdzs4XE=;
        b=V/WbV2pUsErdFG7eVuq4BenaT1JHWXizpPV/Ik3/xJ15sk3GsjxshjZkWko3PvvoDW
         +cJEzZV7aUydq5k2HUbi78BpBJVimjv8heZSkPqhKiUTmoE1wTJytOVobpD1AmXROcSu
         vFrWUYSalrc4jiWlsIhSZpCGGiwB+/XOBunNNAdvn+ckE/Anl1b8o65aotne29Qu4uJf
         ITrO8ZheGjuC5njizV6lpKK9hw+cDsB2Zbgk3nFd5PfZ4JA9dvSGFFwv+LcIne2kAdvj
         MDAirXDofQQ1vx6bwGhK3xTkQlCiXG04hfCbHWYDSqwkQo1IjdHh+QScQL10oGLA/Uv9
         yPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263261; x=1765868061;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrpXhu7xOFIDAiCO1bWkupxvjMEzxIC/867vkdzs4XE=;
        b=kcLj7z1Fao8+Hq09w6ZzA1kXjDKCq/H9JsVkJ8mDghtpOkNfH45rA8kHLC0h/5UHdH
         pOj7Yr0mEIAq59MRQEnPJwtIBz790KWneneFCXhO9NOq3rTAFoYrE66Gnok/JgfJpbta
         c+zGE8k+HuKdI+K87VqO5ja5WFvFnclTnDgj4U2SQ5ipnJRDtWrCCOtGqoliTY9holzA
         r4wNWVioQJHGuYPNo6yURfU1jDllw58sJxlUIB/flxmfwN2BAUqyEcOx7ovdHQegUk91
         vpG9Zc4dJ47FotCnvxQvwcbV/qHHKuj/8zUt2sb54qZvkcZv9ZHgNEYO+/HNxK1Nz53h
         GAIg==
X-Forwarded-Encrypted: i=1; AJvYcCV8F1HapmUKOaPGQWDMVdhUuwdfHoNJD29q5IelfF4UcX98P5SVJdylU9zp3leJmauw7z0u662r8pBjHDgQF3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwvQfcAGXplJ5K/YFEsl36XW0jpHiVFtVTdCSZQmpgAFlD57TD
	Lb+Youh63z9JaFQP6WHo6oH/kt473gVYBRW8rzVvbLc1SM4kqUXLx1eXZZg7+GPnyDo=
X-Gm-Gg: ASbGncuJCHDw+InAtcOVTo4evFthKrpJa47xOF/cInjii7QUbtqKGuwgwdkV3WBNTkq
	266EobPg3W7086/pcFhtwpwNizfdtlwWuLhaMzd6j7YOWXpcSADOm7ILMHMorBL/dTkATTokr6l
	I4/qzQnBGKUsqqz+ZkGJsd0N0DdK4eXMzILirbhY/Vh+XMiQR5IPs5UNlR2TwGkRUjAxWSnv/2X
	kRha1aWjNP3XPD/D/SIA/nZect2UIWFKjxz8+rZ7wZiizFLX2FKpfBpIBuiEa1geB/QXO2WjM8J
	5GN0S+QWudmAf574xOcZitKWBWFoMqBz1wghkZLGoFRDQ4sdIgEf4LaKNglAh9oC769ecK7IfV7
	rhQc3uM4AxDSn05Aak11APNKbHr1AT65eiL0nGm+0HozjjGP4sKs0oHpdyTDFyqYwdV5j3/nAYr
	pBCcqNMMuCVZQyYJL5+dr1PV8VOMI=
X-Google-Smtp-Source: AGHT+IFBOp5hL9jg9TvJQOI4BfDjItpdTFn6DjQubuLwhWGI1xvay3ngK24RTkv5+aMtVyoGM7FLpw==
X-Received: by 2002:a05:600c:a00f:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-47939dfdfe8mr111271245e9.14.1765263260606;
        Mon, 08 Dec 2025 22:54:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d6969d3sm23265865e9.12.2025.12.08.22.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:54:20 -0800 (PST)
Date: Tue, 9 Dec 2025 09:54:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] irqchip/mchp-eic: Fix error code in mchp_eic_domain_alloc()
Message-ID: <aTfHmOz6IBpTIPU5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the irq_domain_translate_twocell() function sets "hwirq" to >=
MCHP_EIC_NIRQ (2) then it would result in an out of bounds access.
The code here checks for invalid values, but doesn't set the error
code.  Return -EINVAL in that case, instead of returning success.

Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-mchp-eic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index 2474fa467a05..31093a8ab67c 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -170,7 +170,7 @@ static int mchp_eic_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	ret = irq_domain_translate_twocell(domain, fwspec, &hwirq, &type);
 	if (ret || hwirq >= MCHP_EIC_NIRQ)
-		return ret;
+		return ret ?: -EINVAL;
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-- 
2.51.0

