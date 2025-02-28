Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEFA1C3029
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747835; cv=none; b=EP2OneGWzA+g/W4TLBsG6Z+EDY2mCOzTuhmOaPBZRGSrPcvXSYU4PsK6mGXx485lkG3qbCr9Ln6vgkCck6mNzyQ8jFOuPYJz4sl+IXEZ5qHvwXyvQ3xkEEfkpPvaxAyR7oHQrvJ76DUr0xFOmdKYzTqT+n4D853AuW+uM+nNmEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747835; c=relaxed/simple;
	bh=Z8rGjEwAbkQIKDGpIgchx0Zd6LwZtQmZVWPouVyY5Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LDsxoQvivqfxKkg/9aXjNv/mUoItZ7LNuU1pfkv3LgPHIArY00LpvL4AvZS4uXVYpuICSIcz4xIvdw1pGQH5borNmQpsR4MWZtRnKuvoT9pk32ErZ5LNccTwrCEhb0QOfO8jyJ7mH7p3cwfUnNdEpIOxruQoj8MJ7W9hGB7ycxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rYeDt1yY; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rYeDt1yY"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbb12bea54so389207666b.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 05:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740747831; x=1741352631; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1trOWLfDHP4Lned1Ql8h/v5AxbpHf6CxozuPbBuR2Y=;
        b=rYeDt1yYp8TRWQlyv/1WOgwNdTFiHjsN4qf70XLnziYZMlypo+0sBYTbjA/PPzUxJT
         LJuGD4br2HWN3rlYuLdanl96GMbQlmYNUvJ2oDihL9ftMABophzYNU1UQefe8MRxfiPw
         Qi/wQtzgWW/UEoABmT/qnULU1kQJ0HJmEc9HjBtKz0gA90J22U6Bfi5ri4y06OlrjjCV
         vnYwmbt4roDaK6aiJ6fnTPxYONpuY5hJmrHs/LM3ySilM1URWf0h/3JcO5pEHS2Vv5Lm
         r/kQEa+bgjlqYVY7JDonOztK0RfPLDU5517AdEvszoDrieM+ZovmQOZo09PXwHsOFFYD
         JOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747831; x=1741352631;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1trOWLfDHP4Lned1Ql8h/v5AxbpHf6CxozuPbBuR2Y=;
        b=UG0P5DZhdoNV1NNQ0WlsG2/66L8WDaZ+dNe21k5wWKGU98FRgni55iEUtAiFTvfPgv
         Pl34uZVxZw4zCfthVjqnbfGK3DrS1kvm05X0H/Jz+YzlBeJcCm+YDetz7dva/bfCwpq0
         X2lIercJQ31JGTetNuRF676lsZaQDszZP4s5dslYmOV3/K9KX5fDKBJYHFWEZfDVgyxS
         nFpWbvfpdrg5ERN3k8olldM/S1doa60HpwrtKQcVxNubogWHa6YcINt9o51c6jq97mtd
         nmuKqMjOex4+cnvyvvb2iz2sVYD3LtEMXpbfZZLx35005MwzBbGtSCt/ryxeezzdbjN0
         u6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXLI4HoltPQ0V6qT9QOMt8QAoIOvaKH4bmNGI10i7O5N03npMslwWCKLGP2/D/aGa8gOaTawnd2k2jztCGAR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw53FrsH7D287TShvTb50bDoXzX6bLBz01klbHwYOxYq2duUhYg
	2t+9yf3fraw+gY385i52vuvMQTwlM1neS56IG8onsNlfp7dJeddyXEGuJkMs7FY=
X-Gm-Gg: ASbGncsfnE2kvRyVDlKhPytKaEqHas//gvswYRIr6xasVvhbwfdQ0jT/ocb2rQIcihd
	3dQLPMtsi1Fypy5V0a8cJJmaGlOI8niS5NxdO5/zLlkPLLLJkmlFtnqGORTOzjHQD4SQLDoyXcM
	B6uJvGnyMRHd5iNTvz3aTvlVg7JfoWVgMNik5PZBaq8fco1P9jBCiGsBdwQWwsP/x/w6L0jXwKq
	slwWimEInMeV4k7j2eWzbJdYIqRfij/h/00X/n6oAmJ5stOKBG0L0zhOY2ptoA06v3T/wC6Ar8a
	N4fG7uD/hQ5w+TIQL0F8Z9IS8NRYHEU=
X-Google-Smtp-Source: AGHT+IGI0U1QQ6xl3jx/qP6oyTFFJ0RWte83MkP/j58HtoWMmmQKVFraR3Usn8taD2oS4b7G6pMqgA==
X-Received: by 2002:a17:907:9450:b0:abb:b092:dad9 with SMTP id a640c23a62f3a-abf265b809amr329695066b.37.1740747831479;
        Fri, 28 Feb 2025 05:03:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c756f6csm290365066b.141.2025.02.28.05.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:03:51 -0800 (PST)
Date: Fri, 28 Feb 2025 16:03:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
Message-ID: <254f3925-3015-4c9d-aac5-bb9b4b2cd2c5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The gpiod_direction_input_nonotify() function is supposed to return zero
if the direction for the pin is input.  But instead it accidentally
returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
in gpiochip_request_own_desc().  The callers dereference it and it leads
to a crash.

I changed gpiod_direction_output_raw_commit() just for consistency but
returning GPIO_LINE_DIRECTION_OUT (0) is fine.

Cc: stable@vger.kernel.org
Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_direction()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Rebased on top of v6.14-rc4 to make this easier to backport.

 drivers/gpio/gpiolib.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fc19df5a64c2..3aee877c8aa1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2740,12 +2740,14 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 		ret = guard.gc->direction_input(guard.gc,
 						gpio_chip_hwgpio(desc));
 	} else if (guard.gc->get_direction) {
-		ret = guard.gc->get_direction(guard.gc,
+		int dir;
+
+		dir = guard.gc->get_direction(guard.gc,
 					      gpio_chip_hwgpio(desc));
-		if (ret < 0)
-			return ret;
+		if (dir < 0)
+			return dir;
 
-		if (ret != GPIO_LINE_DIRECTION_IN) {
+		if (dir != GPIO_LINE_DIRECTION_IN) {
 			gpiod_warn(desc,
 				   "%s: missing direction_input() operation and line is output\n",
 				    __func__);
@@ -2788,12 +2790,14 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
-			ret = guard.gc->get_direction(guard.gc,
+			int dir;
+
+			dir = guard.gc->get_direction(guard.gc,
 						      gpio_chip_hwgpio(desc));
-			if (ret < 0)
-				return ret;
+			if (dir < 0)
+				return dir;
 
-			if (ret != GPIO_LINE_DIRECTION_OUT) {
+			if (dir != GPIO_LINE_DIRECTION_OUT) {
 				gpiod_warn(desc,
 					   "%s: missing direction_output() operation\n",
 					   __func__);
-- 
2.47.2

