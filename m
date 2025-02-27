Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2FA59
	for <kernel-janitors@vger.kernel.org>; Thu, 27 Feb 2025 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740644247; cv=none; b=Fib0vUKMN6ihZej3KpthFDUvvWKjwlookkiiM183Cj+MygBkX/RDI5cUhIMX8XTSENW1rOoHhjRmeKziQxS6iI+sO7iPJS83b7GwZNK8Cfdvya+VPsNpgZBqAnAfrBK2jQKRulG3U1inDexK87FJAr4uN2jpPKoIVLdzphq/+1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740644247; c=relaxed/simple;
	bh=HUyNiTnU+aOLznnW1m5zi/UsNeJTOoxstXeUp0gGLAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSS1TJuHuvW6wPdtWluFv+UWbwVtyoDuMhISXeBQN2+ksBrIyvD6IHa20aJRtpImeden+wPbm5A1gj+oUyO1lmR2vh7TUE/i75OVISvjP789RyZpW/R34Tu8xXgqm0dhBvRIF74V96x5iXtd6NRCvGDYxKAcwhoLLKBQXGxtgJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcZpFac2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcZpFac2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so869700a12.3
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Feb 2025 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740644243; x=1741249043; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m83FfewmrcIOWT4jSZsPTdpYjRVnsXVlTkxFr7lMkMw=;
        b=gcZpFac2mBRYJwPOBxppBLyuJjhrXtCrdPelDZTJjGDvOsHlH8Sg/ntcvyTJJHm22U
         syCep4pFQOMh5J45+L5QztpU2gT2C9jZ591qHymtIAc50US7xutGGk33FjoSgVZM/Z+t
         ZfrDydo9LGP5Gdz6mZFyeV7zr6D+15C6tgmxAbxg12q8gfrfUY3thp2Qzks2MgfYB9Om
         HiXEhPxu+iZgUCeEY92CM/muKEX9qhQLaJoyknw3TxV3O34gnSxqaiom/rry+lp6pYFV
         RMFMplno8x9g/XEMuZYgMsKO02h/Alti1XMVXq5e/b5wLuwLI8tqlXT3SvirrSJE2YRk
         dBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740644243; x=1741249043;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m83FfewmrcIOWT4jSZsPTdpYjRVnsXVlTkxFr7lMkMw=;
        b=UAwxVXw4AStEZdfStGZyMltdo/ZDaCcbjzyJ1ODUN7QNsru6AesJAtAdtFB07rikqm
         Q1GLAi2RnyeP2ahIJRl3dHTc0vQ65bLdRDVuR6STvZP5x/rbFbwnaZ7Y0D8gzFMtctve
         uwRK4LoEUu804EXTFZUjmI1WpViHt4GcmtG8p9kQodu90I6+VrreVW7oA6aSN3K8tABB
         jGUSEzqrCMdAXU+SbVLRNNzo1s1HBMg0uJmakNBsKHymUepeox9qALqInWsNkI7I6iVS
         gt1DPn8bKxfR1JAFAPNiFaWn/E2O6Ee4GS19b3IQx1ZpdjFt5++o5Nbq3myTT1u7ddRU
         p7xg==
X-Forwarded-Encrypted: i=1; AJvYcCUITfY4Evm7hndA6lVb9i6AFXXHLwpZu4Hh71MNb6dp3hqLaSPLfk/MvkBZ6F1cE4GlAp506u/WQHXooAsOU5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWAGI9GnT8jYea52DDZAmC5b/600oLWpgyeunW/g1YAyafaMDP
	jhH2xfc4ZPBwRfF2YV2ZZ9ATBW5ZfycN1I1hlA0XV1uKwleTr+WYgWzDHpa2L5s=
X-Gm-Gg: ASbGncsNFohlatAtCqy5AxL7wPMKZloe+InplXcw5k/sXsKEehz9jcO417kcQk721WM
	nOgNmZWTkvKxN1RbJ440VGVHymICf7xV1uxjCnVuY5d0JekNh/FnQ26ilWmtLFsTlShcP8r7o9m
	vVoXJ51KpQ0HXbBD+n+D+blK7ImSbcaRMVV8sqsoAQu07gDvN9LiqkPNxOO5qMbY7kwvBQnVWTY
	S2oZkKJqeAyfVRuThNi03f/PEEq3PCo2NnxSfzNs7DGNx3MDikcxnOl3vrwoOiXSgMAmWNMC+3o
	XMiILJEBEnp+YtADL+GMBkIHAiVOZ64=
X-Google-Smtp-Source: AGHT+IEbSrUluaN/703N3zoDpsqy6bXDIk3HAXQAYyzGSL1JmFS4898+4YMi9izrmbhfSu0hCLM0BA==
X-Received: by 2002:a05:6402:5285:b0:5e4:97bc:6577 with SMTP id 4fb4d7f45d1cf-5e497bc65dbmr10126655a12.20.1740644243331;
        Thu, 27 Feb 2025 00:17:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5e4c3fb4384sm740341a12.49.2025.02.27.00.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:17:22 -0800 (PST)
Date: Thu, 27 Feb 2025 11:17:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] [PATCH] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
Message-ID: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
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
 drivers/gpio/gpiolib.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e8678a6c82ea..d41812468e1c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2804,11 +2804,13 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 		ret = gpiochip_direction_input(guard.gc,
 					       gpio_chip_hwgpio(desc));
 	} else if (guard.gc->get_direction) {
-		ret = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
-		if (ret < 0)
-			return ret;
+		int dir;
+
+		dir = gpiochip_get_direction(guard.gc, gpio_chip_hwgpio(desc));
+		if (dir < 0)
+			return dir;
 
-		if (ret != GPIO_LINE_DIRECTION_IN) {
+		if (dir != GPIO_LINE_DIRECTION_IN) {
 			gpiod_warn(desc,
 				   "%s: missing direction_input() operation and line is output\n",
 				    __func__);
@@ -2851,12 +2853,14 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
-			ret = gpiochip_get_direction(guard.gc,
+			int dir;
+
+			dir = gpiochip_get_direction(guard.gc,
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

