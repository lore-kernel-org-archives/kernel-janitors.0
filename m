Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421BB28640C
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622756; cv=none; b=WQZTTxOJIVyt6NGSzFU8RNrAJln3wB5qfZm1p5Ndgvc6C77NTc4tXtIv7Kmt0lvekxeFE62R0YVgKF5DR6OdFOd5HxIOssjqNl6tD787IwcXilqKupFauxNB9vNfdEpCBhtiRq1J54uUF9EwXmW62lIthJ1m9klMrHvBIKvzxkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622756; c=relaxed/simple;
	bh=lRJd4xYfa+yPRmT0PBxC1GylBGh4XflCfKIDWQV83XA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6Xol27uBe4ZgaSW+qxkH5/H3rziMcNFDkep8isUqQHtZ9ON0u7IqMLzLWTWg4Zika3IWEl0Lb6w0cOWCMgGLUiiTHDkcijVaQ5joOtzw7MlS2CSKJYERTW13Nv3XI09RCwEQr4nkBPUWksSAinHaAdgIM8jWGi9lOL5BjOWf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v78yZPJJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v78yZPJJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso32244895e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746622751; x=1747227551; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1eEJtuq7GrzY5dXwcDM0d1snCcH02FgAiWny3L5OrE=;
        b=v78yZPJJHdKUYE3yGUWE+QulBGFUF0KDpZyXgJUR1TORcd2xLeWvHP5eZPInbR+Pc/
         43fcJ9bx+xJF4j1xVk4Tp7zPpWvKkZQDXwNaFbtbz8xhR0IXoA0uHRJO2vzYtZIgwQ49
         t2CfgG/XqE8fpMnKmcV81jOYRnFloB8CjTGxnDo8EGJVCiaey0pOjqMGBSDaHT+u/RMM
         b4Qh8QMKof8IOoSCkfPfRHbDMlXSHj+Ey+mmGdQvjMeFrhCgHCtC+My2qLpnEmv/1ab3
         dM6DnenSakFd9JKjmbAVnzErrGAgzeE7fmaqN6QXCsZHIw+QW65KFhPGEYsSptn8BCRy
         Rv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622751; x=1747227551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1eEJtuq7GrzY5dXwcDM0d1snCcH02FgAiWny3L5OrE=;
        b=kb0EogaS7J5cbGMez+QQv5852gR8OHZ+XBppA+4szVqE8RWlJXlK+0NyJdu0WR8bBg
         JBNNy2D4nzBend7C3JJs/12TM/6Fmr5EyeUOteKbRzgREnzYHAtnKWGqO1DaOBgF6jYQ
         U0tXRNFqClrpzhzfkQe7C6cCu5nv1Q3GyI0j/LA8zAgvf5cohXWLtgf9S+S1BXszGpth
         n+E9u/zV8J/wmifPkxtj4J/cRObfztofepmPnPihnYGmOPuaPgR/xsGDE+EWzkmWXBw5
         Iz1Zx7KjFUZUG/zXQB/KtGwfzxfwnsvali/Y5vkKWuk3nHVfVMYMvm7xURZyrU/Baz1i
         xNMw==
X-Forwarded-Encrypted: i=1; AJvYcCXi+Cka33P3IZNgLfvyY5Mjyi78jB5fxUxhb8zmTNNmYYF+eiUJWuSxC1od7usuvOsuDMnceBJvs2FrMDXyT+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSXvuuM7YWopopQeF86I7ucUtiAPQj4b94Jk2xwdQgPnFPNtY
	cbo0W3Adk4InwHo/leQkZJDZ2Pdiat7vKcH7kBtu8cflhbZ7kLe6N8SWQYBKZqaWxTSR0GS79t9
	c
X-Gm-Gg: ASbGncuTWcd9E3AVJsNJXpxEnkrZzBbdc4XzrJhKmRnr4/ZpWqCpojlrtORT4zK5oSn
	Oz8sD5LJWXBdMADIO8Hlb12GELXOwkBx193hOrg+8QBrzp2XhOqoO6rk2z+a+vlvkQaUgkRAB3Y
	2r+5nH84mVYWMsvrTxl0TdZ2GghWiRM6QyDZPkmq9NiS7FOB/wMU0UfDn3PJnH6sFyDxSMGmchM
	H+jjyRSLBxrwcuW37H8c1KVgMtgxZr3ECt2ojnfy+TQq4gEWDb2dbbiGVWtLg/2vUhIkMPkVEQt
	+hkoDyrPuIysKyet5afcCAPmJN9bLFcPES3hs8+S2jnOyQ==
X-Google-Smtp-Source: AGHT+IEML0lGruoGaC6m/maRixPfuTBc5q9w19VGichKR29Lwl10pmR3mhwH0QBjCnQho587rdGN3g==
X-Received: by 2002:a05:600c:4e16:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-441d44bb815mr27845495e9.2.1746622751582;
        Wed, 07 May 2025 05:59:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0af111559sm4920141f8f.47.2025.05.07.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:59:11 -0700 (PDT)
Date: Wed, 7 May 2025 15:59:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] regulator: tps65219: Fix erorr codes in probe()
Message-ID: <aBtZHEkgYGK33fWk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
instead of "error".  The "rdev" pointer is valid at this point so the
existing code returns a positive value instead of instead of a negative
error code.

Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/tps65219-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index b16b300d7f45..f5cd8e33e518 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -454,7 +454,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+			return dev_err_probe(tps->dev, error,
 					     "Failed to request %s IRQ %d: %d\n",
 					     irq_type->irq_name, irq, error);
 	}
@@ -477,7 +477,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+			return dev_err_probe(tps->dev, error,
 					     "Failed to request %s IRQ %d: %d\n",
 					     irq_type->irq_name, irq, error);
 	}
-- 
2.47.2

