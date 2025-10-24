Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3025D540
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Oct 2025 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761286769; cv=none; b=nsM/hdDJnPQ41yxiGM2Or4KWJKGgQYov+5V6xnM5UOEMccjHwhiPL/1Pn4xRSde1u8yLEZiN5aVOTHq6OJ4Lhg3cNmiYsS4rpL5pU+nlwEfnXKCP24I8X8ZYCW4dXiBgHH/caJnRiCECSKtvfrow9myeURInQAPrTOKW1yd+glA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761286769; c=relaxed/simple;
	bh=MjiIMaVHnxv85Sm0BB/UlJ62CEBZJOgW3U0C8rO6buI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bU7rOELgrJJBH/kLaCywKBhOzTslkFMD0J9W5nndZyAZjai+xWJ9vnY/pCeyqepCO9T+ZIT50xXg4J39eW5cpg9UZwvDQb32+vWWbSAAyZ78i9M7YzgkR63OmUifP54nk3QRT7LuxwvmxzCeseL9xngH99gpxLJSJPfi56i6wSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atL7cSc5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atL7cSc5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-427091cd4fdso975543f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Oct 2025 23:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761286766; x=1761891566; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuW7JMitWdY//EYRZ6hUg7/sC/5FBOcO0+pu8iYSN+U=;
        b=atL7cSc5/Ej7zPQ7n2QKen4qg1yhVqDWtKpvlEK43J03d791ymvxss64cDsU2+C9+P
         FklFpCf/E0YNZmocWnGM/vjbp/eoyp4LwMvnvGiRW9751fI9HMh/GVxTuC+P+sD7dNrZ
         Xi6nD/kMIS+tK5VbrCrfoupVlqwHVZNTzk2baUBQNGBmOpr3gcUCUFQOXFday8GDNTpU
         hmvgTkqhcokaic4v2eoUh1AqfzUGUZT5iQVqkfB58EpgMYB6L2H900gf5GyfVcCeC4ne
         0fe4tuRtrkndVfYQhpMjvgVLCjtfofyEXVaTU2OmCL0UXX+2BL3olqZbtZ5CvIBThutg
         8UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761286766; x=1761891566;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuW7JMitWdY//EYRZ6hUg7/sC/5FBOcO0+pu8iYSN+U=;
        b=l30GlSmPmOyUeOk5Nk76aLJ+CiBpE6xm0hrXiPmoa55g/CNjMRoSsRgMF+PhieSatC
         56xHCVBXWDhIOOZt4VatSTTQpKnHy3CQvEosw664if9CViKfrdv5BJgW1U1OhJV4wNDw
         vZnsN0vaxfTtRQ26c2+cpyE+Agtf7bj+pqPPMLx0FGN0sEJIHczAhegtC9S4x3j0Z7G0
         OaQDlQP6rN1mEV6mKV0cBttgnNV1SBuZLhUBJ7km4CnEDQXsG2/HPE9Jh4adBUljHpD3
         JsKT3BbbmG/Kv8mLyxGi0nx9xixS4UH5OJIICjffQyJNHxfoSeKYtDB6H7WOYFOl9oIq
         0X9g==
X-Forwarded-Encrypted: i=1; AJvYcCUJlX4V7MXrEuazmuTDeHeL7i8gM9u+Ixd0MjVFoCn9a7wtuRUwg+VUvXMWZ+unRu0aZ/jKcSS7ydExob0TyQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjofaLDWrdQ8g6pJpb7em3G1PPDZ/p3FxbZQKoRm1nlE9Bp1Dw
	FwYQ8i9q3MWZXq6+94bbUNnS072dnir0+bK5t2J1fwlyCnGol+od++ppQyG+pkfynxU=
X-Gm-Gg: ASbGncuiJzhRWID8IKr+2SBva7p8vRkW5XJDN6RTQHIHIeV1/DeLdwRxDCo1XkVemoe
	JdrJoUzNWponF2qh83lA8+ZwZAJzKA455CkQL9/A46CEXPI8ZfLb4VC5alOEW8KNE+msZpoEgv/
	Ql+eBaH6hg0GhoSzkvX1JwYYRITTWUTytstXIGHNWQdB3TdhBmTCOD5DK/GtLB6m3VBJC7Trhuj
	hoxkiN4qPvX/fbCB5JKvKooUQwmE2ZtrtUuIpLc/6WLOL3ErvObT4ErUozSsY/AI8bZfVdM1rzx
	2rVdnbpD87Xa/RT2B1ku/gb9TXTj0jhansYXFD06/mSS4M9QZjEo+UQrZRNjvinEOmt5L3QnQQA
	Qrf97PMFM7It5BttZxajsX2E8eFkYSKJEeib2Atkvt8jXB+J1VDMUXCCUxxB6lGSkr4j+2kjaMu
	FMBenV/ebkP7nIR8AG
X-Google-Smtp-Source: AGHT+IGuaT91f6JlqW4V0ICbs5URxpfktlg0GOQ7b4e28m0jHXiomSrIXCP/t5AqtpgGIxAmYlkf2Q==
X-Received: by 2002:a05:6000:200c:b0:428:3ef4:9a10 with SMTP id ffacd0b85a97d-4283ef49ddamr15607904f8f.54.1761286766184;
        Thu, 23 Oct 2025 23:19:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429898adf78sm8054566f8f.32.2025.10.23.23.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 23:19:25 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:19:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Walle <mwalle@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <aPsaaf0h343Ba7c1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_ioremap_resource() function doesn't return NULL, it
returns error pointers.  Fix the checking to match.

Fixes: e88500247dc3 ("gpio: add QIXIS FPGA GPIO controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-qixis-fpga.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
index 54c2c76822d5..6e67f43ac0bd 100644
--- a/drivers/gpio/gpio-qixis-fpga.c
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -56,8 +56,8 @@ static int qixis_cpld_gpio_probe(struct platform_device *pdev)
 		 * create our own from the MMIO space.
 		 */
 		reg = devm_platform_ioremap_resource(pdev, 0);
-		if (!reg)
-			return -ENODEV;
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
 
 		regmap = devm_regmap_init_mmio(&pdev->dev, reg, &regmap_config_8r_8v);
 		if (!regmap)
-- 
2.51.0

