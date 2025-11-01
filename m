Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198982D12EF
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003634; cv=none; b=cGlgJp/ODggB0GwwC0n55hjJFk+IGNN6vaHFrKxzVsiVb9cCy8zknKd1qIWkpFtTCgHb0eeUU/TaLKD4AKbgxleZlVEtrqAF/zNrKf8jI8Lb2XFpLjAbzQLEPuOHBlG0r8O7pgBzwkIY4sB4HR4iqINDsWYV6TM6h8Pufsbdv98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003634; c=relaxed/simple;
	bh=rprqeoJfwBpFW+gsXZSt/F8Jo8zBJ8y+vgAA/x/wPfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sM+5/8L9K8gb1g26BLzZWs6CyCzHIWPY7dT6NnBWakHeo0g6kHid56uUCznM5ldaOfq2jz6+mHKYdwngBtLdcUMiEjCXcSJ8pRvQJngNIZFFLMbhWhITG1qHb5S0w9wXcbrgdQK8mYxdfh89YUWcYWfJtd4oxp5cDR39uzCt6Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x22h1lm5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x22h1lm5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4711b95226dso38437105e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003631; x=1762608431; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+EqGbBXvqXSCm047SOrrdUeNNQRu1BHO6Ywcm/gq0o=;
        b=x22h1lm5DK0LitEr4Owa7rw3LCi8ZLIK8d7/sM5Tfqy7I0jDq1crUIwPwAFO/VRntp
         1agobuX1KTagALULNM8fiU4xXwyw01sZS9WgTwFKyzOwX1BTRDQCMHvHHqnkoUY3hXY/
         UbRjAsILpWfXybMo6I+eQbCj4EBeCsOjd9BS92EwmRfYtjXGxyGlJqAU3e5lUMzn3LCE
         LshQcXH/dUcVUJYz7QPc5Tsr8/nqEkXJXRtWPnG3I3aOy2BiAmKFqsZGnjkUCRkzHosP
         f8aSrOgNldTSRN5o+H1OqNQz74iXpbBpLO1Cwvqk1+fpRIp8GplsbXz+enEyLQXE/P9e
         XOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003631; x=1762608431;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+EqGbBXvqXSCm047SOrrdUeNNQRu1BHO6Ywcm/gq0o=;
        b=m2tbj2MCrqMRBu/iBQhHoibU+ui8LoCZkb2Pq53rBdJixrOl6KJyBW4XPcJ1K+kDR9
         Bbzj37YKwOyAZN5Qz4tb+qcc6o6GmeXSsOTq+Zz1jVXrwOqHRZFN25whw8DK5GKXw4Vt
         RZla6iwTYEiuA3GTBUxrAhQuk9tJMvV5eQPfuSDP6W/HV91d1RLsZm7HXPAJ0l04i83C
         y6eaWcgx1Ud+LKEjmcl5ZhMK1UobDtpKVgDMMCk2nPb2Ef/4BIF06HZyKOyNYR+sbMnR
         xm20PmzhIPfKQYxmlVkqBNzJir0XGyKjsLLWmPKg7LSKbyMdmirWsbaL2TAx0P2h4h9t
         d9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCX9fzShrcIVybAsUAjadP81GbeYOorH4hZG9pkOzra7glu95UqiPlmGoxGSt1b3COIPWHXDe0uZb+ysATQTxGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxemFDmdy5a0u2WtIo6Ro5ZLGqs11OpYECVK/kFr7FH5d5NweQx
	AsawxMPOcK7I762SrGh0ZBihsB0ieHC6vG5FzGduLpM7VIWBqsDhF0AX6ZAVq/VL2sw=
X-Gm-Gg: ASbGncu9VUPpEwImY0JsL/MTC9bvNRHGiadUKc7KizGkDomp860Z3myBvYI7Fd1TgKg
	8JIlsMfrVc0CLQsid2hG4mcSrCVEgTv8985KMDXGhtY3yW2kEU/Loy+TZLQvxzUiadbssYx/PfR
	ewK5R6F+VfjeoBqaHwnxES8+HFtWJmKxZ73k84QVjHLSdFnmVFy+lkkO8nDZx+hD/GZue+Qwss5
	CEEvcIz80MV3oi/A/4BBT4wD3AfiRPrKA6mdoZTiUeeiQSYdm7ko6JR2Ao3fX+5q767AzL0YK7t
	XU3w37tIh/NWxbZlOa/K7wvuMrFuIObY568UgYS7DlkCzu1T3LHnLQxg0cHpeo+GN4Bea7TRnSE
	Bu2CC5D9eMys8V5GsPzPGf9MRJlZA3LuMzDuodijP7r7BuQGQloxDlxGIFc3bJuc+3Y4C+zCnka
	saivgRkQ==
X-Google-Smtp-Source: AGHT+IFdb7/zkRruK0oXQCY8hr8gJ7/w3OO6SCISIKc7LTj9giiBqFQHOldEq9+NA09bcOurjb6I3w==
X-Received: by 2002:a05:600c:3146:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-477307af7e0mr52252055e9.10.1762003631249;
        Sat, 01 Nov 2025 06:27:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c55dc6fsm47729965e9.14.2025.11.01.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:27:10 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:27:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] reset: rzg2l-usbphy-ctrl: Fix a NULL vs IS_ERR() bug in
 probe
Message-ID: <aQYKqxD6qCQwFCye@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_regmap_field_alloc() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: 58128aa88867 ("reset: rzg2l-usbphy-ctrl: Add support for USB PWRRDY")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index eea56687cd0a..4ecb9acb2641 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -158,8 +158,8 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	field.msb = __fls(args[1]);
 
 	pwrrdy = devm_regmap_field_alloc(dev, regmap, field);
-	if (!pwrrdy)
-		return -ENOMEM;
+	if (IS_ERR(pwrrdy))
+		return PTR_ERR(pwrrdy);
 
 	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
 
-- 
2.51.0

