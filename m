Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4644730EF84
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Mar 2026 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773507831; cv=none; b=X1I739x4J0GMwszYNDTpGRSOhvblT+7BucsFi5m12TWcteiSJSKwnt0nLST1rQ/v6lhAid+m+8FTCJ+zshhFWeSKFnmOPpq/9RLA455BCCn6Z3BHkmxEB+zJbw27w5fcSzTzt7VB5CHA5l8izuj9lPmLgMhNMenhU0vbVA8tm4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773507831; c=relaxed/simple;
	bh=BECZ2kWUv9/sN/1vY2tcda5a7XzLvGpcZP8UN42zdk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UKNkt+nCha8pcqpgVcywHcFMET7psSeYQiaoGizfr5yiLC0KXCdhbbnttKUFzWrEJ1WkJYUD64Ht99JL5KhHchQrvJXGwmzNAI3+4j8gHKKUWuxl6ePIJR5+knktvYCr37gDZ/v2flodKWeiud2VL0NR3CZ316F8M3hPczoqxCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfnd3g7Y; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfnd3g7Y"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so26921985e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Mar 2026 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773507828; x=1774112628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KVES9EBO2t19jyDyTJ/K+Tu3EVOBdgA74w8xUim9e9E=;
        b=jfnd3g7Y+QiaVtJOna+E/eiNUpOkEVyEphKKNlKn+T76b2oU+OMk2hUMOPsZN4P7V2
         aXufnB0E3blnAnBi/VfEp53m1a5eg2PtCOMckDOmg4U7Wc+eoGKXsSq+Z9NeTwpb022T
         1YeKfZzfaQ9Q6PYjeA75ptDpiCQA1dzwHIGAZADT4GwaYESwwhpN1EyRaSdSfYkMwIFA
         S9HA2w54UN7nf14vjJdiy7FKL+JVjge5ifMXNErjvadxQoMl6nydXuU+QLjsaJiE5vdH
         YMo5P1xmOxbgb7Jpe9Di/Zsc0t5+QtP/7MWAWtyRh5kVNTqZUg7ZFwt/lAjH7wqIJ2bQ
         XDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773507828; x=1774112628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVES9EBO2t19jyDyTJ/K+Tu3EVOBdgA74w8xUim9e9E=;
        b=CFgkIgBpwCevN3e98/63kZQZ1218BWY/+5/cwMrQ+LKUKpFmtJKxBZTlxaMv4wTRPe
         OZF6/kkockU8gCqzbLBFZCCb2MbQ/ZyTwDC7rYCdfATFd2fpJ+C7Lg7dYbr+SF8A5wDQ
         AKSVei/yyLbKUvfztPzfGBfNVtIC4cDvFe0DCR4gRJAjYSPjOcIpRCmiCRqvBGksfif3
         vkJLRQjxhZRhgqzWoo16NAaZtHIfyxiULnpOEK0QX2ma2q0I3Ua+ZTmA3h/rG6ijW2i7
         2jOxi6/5+hJKGuv1yVC4iN6IlsZmuhuMmXip/z4NMTqfG6ojIB3p0mFPHj9qOHk/liXO
         HTdg==
X-Gm-Message-State: AOJu0Yyjgl1FQI6QVSK9v9fTDbqfyEWYE7IjJuqAmVWkzgCmWKuVNlsr
	fq9VivjpS3MibEhCuc+QV7E0N1PCRAOZpyGy6IiO16Cjs0NP1W6pLvtTTmjg0tu/
X-Gm-Gg: ATEYQzxdo3spQKDMOc5VjahOASLj8eQ+q+hIvwYOcq2ryN70tsnYJIM5YiIn1QaD4Hn
	09G7EC8ENzJuXo0sDqk8APdA6e7zDldXIZfFr0y4LODEHUSjjUZ2Z8xXEPhIGn4ZQ8IBJAnSmBb
	atfeyJXzMEhKI1oanO2MbP9NziUhYTvhU2FIAUR8434IJak/hjQu8iA2pbf6Wbdbf2pNXE+4ZGn
	T6pNGiOE1kjAcRocBBeiCHcx9X1y7fkyoQA4pPtnKlvyO3PqJq2ju1D5Z8+SOZ1hREEUqRoUlek
	ZHBUH9BZLBjH4CPgwICdCVgPkIL1LKObsBn6TYGRWgrz4Tc/Idrn0Jvv2FL6dfJFsgSPD37QAf2
	UGbRAsxqo80IAoSE1FM1PkC84zVcNmjxORJqPWGqGqP+3qGjJt8PasEIi6jSsYLJpwP1R/dgJSs
	xe2NKtY7oAtXDCDl/17xlSeg==
X-Received: by 2002:a05:600c:3550:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4855670c971mr130625545e9.29.1773507828313;
        Sat, 14 Mar 2026 10:03:48 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm288880245e9.0.2026.03.14.10.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 10:03:47 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rishi Gupta <gupt21@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: mcp2221: Fix spelling mistake "Enfore" -> "Enforce"
Date: Sat, 14 Mar 2026 17:02:25 +0000
Message-ID: <20260314170225.1260440-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a module description. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index ea9f7ddd93a2..be80970ab48e 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -26,7 +26,7 @@ static bool gpio_mode_enforce;
 
 module_param(gpio_mode_enforce, bool, 0644);
 MODULE_PARM_DESC(gpio_mode_enforce,
-	 "Enfore GPIO mode for GP0 thru GP3 (default: false, will be used for IIO)");
+	 "Enforce GPIO mode for GP0 thru GP3 (default: false, will be used for IIO)");
 
 /* Commands codes in a raw output report */
 enum {
-- 
2.53.0

