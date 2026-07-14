Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD4639CCE9
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784048686; cv=none; b=MFFtD7lKgr/bq1ylnmX4KnP65tvLSQgAg+bKnuJSY9ML0JrjsT4CxHp4oRhXkpZeW3I+wvQqwJiqs3crbFVd2g7LqrwvK6QXzptmqN7VixFqYSlqmd6EBM+2V9AEQaqzXxYdLC1XphLhce/vCVh/A5ktUDm48R1IdjSNKDBeXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784048686; c=relaxed/simple;
	bh=AefdgQSpXV3ssbjNUmYM0AzKNLGHbhpbCMLs3U8ZwXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Avzq5QSP4GilsK9nfS4CKpZgnhCpYt1E9WKx0r1KunWS54KfjBfO4r0uVMGEIbOxGXiKIyKvNbBTwvva+gKxAi567W3t+Fsg7eKKiMKymFOwYKYQ+d6JPn+Pk1xmbHG+i4EkegRe8I0gyf1eRqkMMpSTUWTWSHEnSSZ1SXjgW5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOo7+4Xh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOo7+4Xh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b27c7451so14525525e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784048684; x=1784653484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxmDEh/NMeO7bStSuaxaeVMeCVKpnJ6+/yPoC+CqNQ=;
        b=MOo7+4Xh73HIvSEkRIbmQzunOulrLASHmhd1HrTG5itb0EgbgHYCMA5Owdgmh0DVFc
         P0lLAVAl9dMxDVvAyEfT1iqJGrZJ+Hq1TSnti10oKTyzsjS9GjcYq6qnCX5J6urS9DBC
         SAUCC/vdKZ0+bmyyzYpi581mRTeXgIPGKrDh2qWFdTSEFGWJ0H5hHP5DLFh1NCTb2kus
         Etk3Lf6osezLIBZMENqCT2KNmN6D0HfeMfE6ATQEBh8DxSv5+ktCzgjkv+rwbZXSAuxL
         TFckmK8I1vNvlfY21HPKLIA+mPkGq5OR7O/oHetHp4Zi+RYN4NQgdSIkhqxWCp1hwJQE
         94bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048684; x=1784653484;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uxmDEh/NMeO7bStSuaxaeVMeCVKpnJ6+/yPoC+CqNQ=;
        b=d7UbxZ7//jqTc+ceZ1vopLo9C+jQ8HuG/ZgjqP6hoVqujnIK+4YHBnJO6biqU0IQ/z
         cEIF0RwAcYMaRjgoZ7S9m+xMxarVgegwL+J5ai4l0jpD3UbHw672fMa2P6rqN3wtKjMT
         SwOsRNvaV7jbSzSklbrt7m8UlJ6TF8iaIj6X0mdkjWjeHc5jAbZdv37mjQ4JsqdLRmo3
         zn5Inzi+1OO+uUa15jjjTpz2coqZC6Ts/pYOEx2ZePtpamRqGFefFeabzSCjrpBcVWMC
         pOMbDy0aryOzMofobiwZ3qP+PNVB0oZGc64WnrlZBCEcFJ9U6lkRAFyYIcif4JY2grmM
         5MmA==
X-Gm-Message-State: AOJu0Ywut+m3dI3YOjRdTiB4LBfVqenFXTPwmeo3coXpzzvGf4pHO8Ol
	SU2BpQHmMUsz81Bp1EUlMKyAu3/gI5br0s4hKG1HP56zNgpqEnYQAIYT
X-Gm-Gg: AfdE7clKMB2CiYGJYy/rS5W2a5gdbNxE019+US2yxbljG4A4mBfT2+yDgU1x+p+Yx3d
	m2f+jGTbIXapDBO9FJRctspIyO+lAgAKcCUW8M054Aq3FFCJUK35ZXVmGTtAJBPgTKl8h7hbB3L
	Dzmg5WnsKATx1sBDIl622ImMU5NyZLleIvzHi9N1KwSXctPODQK4DUh78BUmWcs5yyCAvzb9mL9
	gkpzLhJ+kM2WAjaAQhyxhbnDSZ0lzruBw/BhOIEX2OP9Nj2lyF9xP5sVq++VZ9yL/w1m+h6Y+bH
	YARjTgm1CZ2Rm/DGpx3h4p3hZq4AE7p3WUSME9ix2p9KprA/wkNbfAtfPJJ+0yBqREG99rcn+z1
	OK37C2AaN6KMmAJIsKBUOWBynnuU4wHXHi5VQl56DNATh433duYRfW8a69OAqvHIcRBE0ehGzjd
	E/l0nAIbahiwc=
X-Received: by 2002:a05:600c:8b53:b0:493:f13c:9c03 with SMTP id 5b1f17b1804b1-493f88dc201mr134008955e9.19.1784048683759;
        Tue, 14 Jul 2026 10:04:43 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953b8d4352sm1710775e9.0.2026.07.14.10.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:04:43 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] gpio: bd72720: make read-only const arrays regs static
Date: Tue, 14 Jul 2026 18:02:58 +0100
Message-ID: <20260714170258.186766-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only const arrays regs on the stack at run
time, instead make them static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpio/gpio-bd72720.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bd72720.c b/drivers/gpio/gpio-bd72720.c
index 306e23411209..c124d964e4cf 100644
--- a/drivers/gpio/gpio-bd72720.c
+++ b/drivers/gpio/gpio-bd72720.c
@@ -85,9 +85,11 @@ static int bd72720gpi_get(struct bd72720_gpio *bdgpio, unsigned int reg_offset)
 static int bd72720gpo_get(struct bd72720_gpio *bdgpio,
 			  unsigned int offset)
 {
-	const int regs[] = { BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
-			     BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
-			     BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL };
+	static const int regs[] = {
+		BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
+		BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
+		BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL
+	};
 	int ret, val;
 
 	ret = regmap_read(bdgpio->regmap, regs[offset], &val);
@@ -111,9 +113,11 @@ static int bd72720gpo_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
 	struct bd72720_gpio *bdgpio = gpiochip_get_data(chip);
-	const int regs[] = { BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
-			     BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
-			     BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL };
+	static const int regs[] = {
+		BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
+		BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
+		BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL
+	};
 
 	if (BIT(offset) & bdgpio->gpio_is_input) {
 		dev_dbg(bdgpio->dev, "pin %d not output.\n", offset);
@@ -132,9 +136,11 @@ static int bd72720_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 				   unsigned long config)
 {
 	struct bd72720_gpio *bdgpio = gpiochip_get_data(chip);
-	const int regs[] = { BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
-			     BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
-			     BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL };
+	static const int regs[] = {
+		BD72720_REG_GPIO1_CTRL, BD72720_REG_GPIO2_CTRL,
+		BD72720_REG_GPIO3_CTRL, BD72720_REG_GPIO4_CTRL,
+		BD72720_REG_GPIO5_CTRL, BD72720_REG_EPDEN_CTRL
+	};
 
 	/*
 	 * We can only set the output mode, which makes sense only when output
-- 
2.53.0

