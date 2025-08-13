Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D712C15B8
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063513; cv=none; b=l5Sf8KBPNvvr/Ua51Nd00rzKLtwLs3nQnN/MuOoa9rSHtkGNO+iNmucVvDC0hn0pmCfVZtPJ4yM6f+XYaN8ch/XIxz1PAsScu41VXlgQWyjv01tVu18QXL+IZhCTFXM49DcX/Zk+rCSp0is4THbTerVP/ODSN++Lp1NCSFIzIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063513; c=relaxed/simple;
	bh=fzZFTkI1YBLRXgkGQyHlhNXlI5c2OYsZxUptOiBrYXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jU3BcKBaqtaj8YK+b0QxRK8jHuE0d4BfIJy4sRJP5bTTimzyAeMLo3lFOgkuhb6ZE+Fdh2Rh9ule2DuKGm4YbnK57BXmn5QfpsOkSC+ogfMG1J99bcLkGYhCygnRIn4m26iU/Bp+ZNkpOEuWnf/AhuwXolxSc6zYFI1+jmsOmcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Df9ARZeA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Df9ARZeA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so2982455e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 22:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755063510; x=1755668310; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSRz9abu5aQzELA0uOlQhCMedyzZapyIkMjBs3LXrH4=;
        b=Df9ARZeA3DrLHSWNEEnxWrQ5gIArFSjE3/zj6q1D2rwFo1m33TqPayQF2RPq54ZPe8
         FSSgSx4BwtVqIW2h2/2ORogkFKfg0uevKKLsvHv0BJIwQmxUPeFVcuk6wdrSbxfNVq2I
         owUPYrAhzzfrBf/Z198xYxwtlLG1eeSHovTXQSK2UPCpVOJiERyOcaG5SrdAkwmx+P+y
         YxHR/JrZNeVsnPA+d08HhkfDlOOeiU6X/qrCjtmkCnCwXeLjWo0UMQHDEsYDpnczpBlD
         s7hRvPeK4zpF5nLqh7p+X+FWDfjoK3FXWyWu+0f2e8WKRpYMvHqgSqD4422ifRkb4cYh
         Et7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755063510; x=1755668310;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSRz9abu5aQzELA0uOlQhCMedyzZapyIkMjBs3LXrH4=;
        b=xARHPeiQpXjX5XLtxFK44WqvxRLJsLylHQv6ECaW70Qhz6JjzwlQRfBtwOLCoLHFwF
         32AUarbYeRDBvfjOyxRpV3sMafvqsdF/4UQ7Pcira9xwJQ2aQuqgNMCAA0wvRO3hXOhs
         0hoLTJUFVWbkv5UPudURxG+LQUfj3UD5cxlEZGuzY3up8nQCm/XZnf4lK8IZOV21+ouo
         P5L73G9mpmyr0Wl9oyJ9Bc7JtP6Sy3VyCagWzZF58c6cpR6GSQe3UjOV7+/taJHJWUif
         kPIW35M31KpNeCJJqZwRg6Zejif0WIuNw5ibkoTtD3OUI2Dmtr9gwTJf+27swnZMKRkq
         j0Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWPZ8jJAo7swgKTn4zn8RvXZ9Dd0woh3chJ6JYF1TWOlLjy3FRO0seFBJh3nP3I29z+PnU8Xl/Agy8icAUYjsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/YP0eE9nf4I9LT+OrL8zF11vjjxzkY4wH3b/URif2NUmGUuV
	+T5s0+jZ0FgtfOpw/ZqTJMRu+84Ll08vKQGrgjnhkhF0hLnNDeiqyr2WwGYcCtgB4WQ=
X-Gm-Gg: ASbGncsZCAZb7tmDHpNm7OUFNUWBaNczbSZT+t81b4x2kRdiShsC/Om5LxnGOgTUtYx
	JaZNDgHNlX2+SQkRrEZa2ZdI/k5UgY+BZG2Z4iSD32dRs7JNnHkiMiburGRS9UF1A48nwZpI0El
	jmCsBmngB+lrhUY2iYj49Im0XO1WmYOMPay0blRW8GE3Emq6QoWO378h+cxRJVY8pfp+f5IjEnc
	ns4wWES8WLmvsPFUTjfVo5lPV8NGQLkInO4oNf1muaiT5o+lMxnw9QBfk4L23lw0hf06j0iYVef
	UeJ1VbyS60f6o/VLQAheN/y7wn7IUhtna928ntgogEMQjDoRhzV93sZEDC4Hdh+2whcPLlu4jZC
	hOvOR7a7gf3NUNrUrqid/nK6FkfCHIyOvE7AItQ+zBx8=
X-Google-Smtp-Source: AGHT+IGMNq6WH1GciQTu/GojZM34h++XkL1Bi0HrE5XDg11LZyg1kX6e3Xci6YYgAcoFOrKZq5y/RQ==
X-Received: by 2002:a05:600c:c097:b0:459:e002:8b1e with SMTP id 5b1f17b1804b1-45a178db0f3mr2971585e9.13.1755063510347;
        Tue, 12 Aug 2025 22:38:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3abed3sm46298579f8f.10.2025.08.12.22.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:38:30 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:38:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: aggregator: Fix off by one in
 gpiochip_fwd_desc_add()
Message-ID: <aJwk0yBSCccGCjX3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "> chip->ngpio" comparison here needs to be ">= chip->ngpio",
otherwise it leads to an out of bounds access.  The fwd->valid_mask
bitmap only has chip->ngpio bits and the fwd->descs[] array has that
same number of elements.  These values are set in
devm_gpiochip_fwd_alloc().

Fixes: c44ce91b8ada ("gpio: aggregator: refactor the code to add GPIO desc in the forwarder")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-aggregator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 0ef6556f98b1..37600faf4a4b 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -744,7 +744,7 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
 {
 	struct gpio_chip *chip = &fwd->chip;
 
-	if (offset > chip->ngpio)
+	if (offset >= chip->ngpio)
 		return -EINVAL;
 
 	if (test_and_set_bit(offset, fwd->valid_mask))
-- 
2.47.2

