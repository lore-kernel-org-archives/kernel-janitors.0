Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B425364BE
	for <kernel-janitors@vger.kernel.org>; Mon, 11 Mar 2024 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710154863; cv=none; b=WavxH0ShqWvLll7arTwVQIdMciRdROB0Gl9VWnetcifPo9c3AwglH5OxEexZLSqWyV0Pu/U7flWIAnsrwFL8OsZmv6ESxXz/wwkIEuQBlAj+m0q7DJMVLjuW3m9DzfPCfhCInV4/yRPn65YA0Igtjle1mNwrKo+SIGoz/SzNUWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710154863; c=relaxed/simple;
	bh=EJwC2X4/a4PrYYGENHc96zyVnf31IyxcNikfeTn9Iqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UBwietIibB9lXy0Q7B2lgM4IH9dl3v2e0SQsvVRQ3soRKfWgPdr/C4RxQiJDz34wDGq62bu+zeWkizKRw7A3dPx3OpxYdk2NBRyYwAFlsgQNRKipsBuoBRV/lBXAMzBjLsy6ip7arDPy7pP03Rkr81f+pweZWpun7xeQce4/mTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMl7D/G9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMl7D/G9"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5101cd91017so6893361e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Mar 2024 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710154859; x=1710759659; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S1M9CrsxURK9osAlAJKJLTrbinlvddAx/ivsJ1lbXFE=;
        b=UMl7D/G9HQJXCSTp48O4jUirKGfQnk+0/h8/npTw9iNhoJVsbUOn1ZhGdeY3DaBSgR
         Sajq+hsljsPELgy5rCNZUabvKvVtw0yuzcw2tUAbw6MmrIJL+E1oObRDaxVCExNcS47+
         5SziGTwcfcoI23xcfAvzBXnTNz/i3ztdvUvOOrNtZPiOZNwcCaq3h2gYwEOS6TUt26/i
         io0p7hM4KcTDSvxWgXzg8aSrrMzJl3Htul5/NR/wg09KNvYDYEG/NY9qVuCeKkDaMY8V
         k9EeGAnv188eugy44RfrJimlcWHGQz3ydTyipkTrQMj01xKe8tTleMCaXaVTD8dR+hy2
         HNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710154859; x=1710759659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S1M9CrsxURK9osAlAJKJLTrbinlvddAx/ivsJ1lbXFE=;
        b=Q+5epjohRC0V1VvzMfAnvudtTFaTiui09t58V43fUF5vgYWtEKY8QHpA0GqvS0iEdk
         0MLqYHWN3im4XvXisHLi9DNgEdL/W2Qdsv2FIfJMjfwJ3e3unGBPY73rYR7u5nQsc6yM
         Q1hsIaQIJYXKKVNuTxssQEHjnjHZq6F9oqbslurmrxtGshgTm6Bde/94LiS/W3jRGkIx
         /fyWCshkka0Kc4KpgHpph9ODYX/hRAD2yrcqRxRU7ZxKB3PZePh1rBqTbzwdf9v01dhs
         IsIlJ8t7l0Dm61/GJIXtywltjbXqKgEbkavDpl+PYqHLMuYhhboWMH3A/sIZBsBwhe0m
         XZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUdyoqn8huJm/BFYLUryXPB23Up7WQvnoX8okhJBJNkYaLeIYlVikOkJuPkeJ5cRrNtpKmee1uYIhjszDUfGur7VVEujncjmA7TgDuhFN/q
X-Gm-Message-State: AOJu0Yw/pzUz7aQlKVIoLdz5iaiuS31doAb3H9YdyYiwrRFxecVcul/T
	aZXe7KO9GXCrpZK4C36ZQZjg5te4NUvrEKVgjpvdTEMzfPVHbski0c9EUUL+XJU=
X-Google-Smtp-Source: AGHT+IFwCGdoVdTpdQaznB2idQvFXubh9UWyyPMuumHmhiYMoRkMnvTiGe/Fhx2f7ORUyE/itJx+5g==
X-Received: by 2002:a05:6512:ea2:b0:513:b0d4:da40 with SMTP id bi34-20020a0565120ea200b00513b0d4da40mr706289lfb.20.1710154857841;
        Mon, 11 Mar 2024 04:00:57 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id eo5-20020a056512480500b00513179f6c22sm1045933lfb.96.2024.03.11.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 04:00:57 -0700 (PDT)
Date: Mon, 11 Mar 2024 14:00:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: nomadik: remove BUG_ON() in nmk_gpio_populate_chip()
Message-ID: <ae643df0-3a3e-4270-8dbf-be390ee4b478@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Using BUG_ON() is discouraged and also the check wasn't done early
enough to prevent an out of bounds access.  Check earlier and return
an error instead of calling BUG().

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-nomadik.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 463a765620dc..5e2f9b51ece3 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -533,6 +533,11 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
+	if (id >= ARRAY_SIZE(nmk_gpio_chips)) {
+		dev_err(dev, "populate: invalid id: %u\n", id);
+		platform_device_put(gpio_pdev);
+		return ERR_PTR(-EINVAL);
+	}
 	/* Already populated? */
 	nmk_chip = nmk_gpio_chips[id];
 	if (nmk_chip) {
@@ -606,7 +611,6 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	}
 
 #ifdef CONFIG_PINCTRL_NOMADIK
-	BUG_ON(nmk_chip->bank >= ARRAY_SIZE(nmk_gpio_chips));
 	nmk_gpio_chips[id] = nmk_chip;
 #endif
 	return nmk_chip;
-- 
2.43.0

