Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776DD206E96
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086230; cv=none; b=lB1uJk1HI576mHgCO1WJXGTiLUQMWj/eEEquUdeTg0oCY6SQ7m+86jiSI1CZtHHbZSaHp8W3X9iSH3Q9fQ9NGoHsilGapwYOD8Hca3PFPDSMuVQmlDR790R/J8hY+1xcQG2OtALFXj2+CatXMC1XHgqf4OztAACzEbTTl+yLD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086230; c=relaxed/simple;
	bh=KWcWN0Jm2eUdhtHlZSZFOhv8Zx+tr8YDUBPTLQTMBgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NER/xGYaxNlmqnHCvYYI2f16pVxfcxEudJFax5iG3n6147uyDKocr2EYHAcSVdgTu5z7nksInCF2j247WErBQ3Om/1Gds1Pzh7VQPdNUaHZJuzgeGYIIvDjrAeeVz656IGbSaCDwyrlXSQWtQM4TdFPh58lvtXF5GlN1Rc4vShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=VefHAbya; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="VefHAbya"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea8ecacf16so1937643a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 06:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729086228; x=1729691028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPSkU20Itc6yAh+bZBbT2R0RT9oB/wml9mSdgooTOww=;
        b=VefHAbyajJ+EibY++LZu5yyNn8ulR6BdY4Xor9w+0ufoTXHxwawvH65ukuEch2Gmgs
         D4giuT05u9kSpUZ9VzhhX5V0nNeKJlYoU7YwZ0KMgYPYb34NR/LcuYtvESYJykH2cqDh
         yWu0zAMjnSJJsSO1+v8Ejr7/XR73n09RrvRyXPYTWx+DMA8/ischIZlALM3fMo6wTi07
         kmJlIPaOhBZLq5G5a47+tk8TQFm7/H9I0BunCss/tJR+1SRHEy3jxITB2d+UJBTlMnjR
         RULfdPFnO36GW0u7qDhNWewOC8akmqPiEt33zkobuFE7bmA0++KXjO4A0GmhgOdZOsAe
         QMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729086228; x=1729691028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPSkU20Itc6yAh+bZBbT2R0RT9oB/wml9mSdgooTOww=;
        b=ZPdmBXgS/AtObHokM6ZlTSopI/WqPss+0bh/Z3SY9+FNPnjk9m0sxctebHNCyM8D1l
         gzkWNsSFQPjELEVZsBD2d0JdQzJp+zqwGdtn7yWJkWZLQajdTC5h8tNTjA7g1mDNhdil
         Cc3g4/A7tqQKs0s3hEqcos+9siSoetR9rhcLTJJwn04b2fdq2HNq6PZcFlnHOhzFVJPN
         NL2Yi5X1FuHWqwj1FI+hCr60MFRZKRL3jlJ2V/ey8YAtpVuSLECewhs//7K00sqTQK1a
         yyI4qyItEKZPDnp3h748YzDYRQ3UAp9HxoPfV00PPqrRwhaL9jyUn2mAZs4yAsE1oLbn
         1wKg==
X-Forwarded-Encrypted: i=1; AJvYcCV/DeC8hZ+BLAb9gyqhN4DvpphzdLYFm1vzo+z1od8JjwC89sAd/JW9UOl71yPVodomfUmlNA7Nde67VVLmvOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdFIiheoAWo0VDU3NQDzuNoPnqtUszDf5gh58+IYehq6FS36aM
	NVkqbUyMfJiIKxdWDs+vZWRH8GCv87PR1h2Q0pJG53l5oRs2u6po64SQBH0O2qY=
X-Google-Smtp-Source: AGHT+IE1Q+vPA30KNlMFxGEt9h2r7Mf4JtaF8VKYh5yzDNUyMZMQT+8Yyx33/wO8c5gt6uUjOIGAxw==
X-Received: by 2002:a05:6a20:d49b:b0:1d7:cc6:53d0 with SMTP id adf61e73a8af0-1d8c9576f83mr22762980637.5.1729086227779;
        Wed, 16 Oct 2024 06:43:47 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.27])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20d17f84e9bsm28977495ad.19.2024.10.16.06.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 06:43:47 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: drew@pdp7.com,
	guoren@kernel.org,
	wefu@redhat.com,
	linus.walleij@linaro.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] pinctrl: th1520: Dereference pointer only after NULL check
Date: Wed, 16 Oct 2024 07:42:21 -0600
Message-ID: <20241016134223.4079-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer `func` is dereferenced before NULL check.
Move the dereference after the NULL check.

This issue was reported by Coverity Scan.
Report:
CID 1600802: (#1 of 1): Dereference before null check
(REVERSE_INULL)
check_after_deref: Null-checking func suggests that it
may be null, but it has already been dereferenced on all
paths leading to the check.

Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/pinctrl/pinctrl-th1520.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7474d8da32f9..07f8b51fb294 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -803,11 +803,13 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
-	enum th1520_muxtype muxtype = (uintptr_t)func->data;
+	enum th1520_muxtype muxtype;
 
 	if (!func)
 		return -EINVAL;
 
+	muxtype = (uintptr_t)func->data;
+
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
 				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
 				 muxtype);
-- 
2.43.0

