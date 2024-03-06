Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A313173F
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Mar 2024 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709733156; cv=none; b=NQ2p4vTjWEPTkL/OBDSX/NnJvox4DFzeE0qL5mmAGBCCjhP14wNfqM9d84wApLjQdoyRrPqByJ5O0qWvgQ2cB4XkFWfehySe42MherpjBoFHJxVnB3Vgu3KJFhHgu4BoVoh3Qbr4KY3lotUDo6HMSFyorzrkggV0yJu1P9jwgWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709733156; c=relaxed/simple;
	bh=NE9uz7ZBHC0eNJ7adCmd/UKg5wS6nfgIQyX+/EqGsD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iwi/v9jL3kGTbw53NYSewWRHayUAMddXxirk6jHjorzMzJcLkTpPd7FaUHujBaXY/rP+4cXGouHC52aF+5T70LR470rmYfrC9vYHE+M4s+WZHxm6sEVu6pcFJCobr0zSGDY/3u5iaJZC4IbzWLRZTtFBMLtf0x6dmSEtBqZ4/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SF3fHshL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SF3fHshL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412e784060cso5307135e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Mar 2024 05:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709733153; x=1710337953; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0YUTY+l2RgN437PUSLue8tToMPkzTitFlDucsO/DZvk=;
        b=SF3fHshLBWpMwhVf6yPGPRVxa6UiZEFQryRg7bJTgLXzGbSKgVWRbfJ1fnsoj+vhqX
         oTDWKHFBt+ft+9Gpu1F1yP7yP84yhTl92N4jSsCZSPqdZDkWHV3Smjh/cnQDmJiDBzYz
         xJ3Qu7rHOTVYxcexam8O2qawja+LdLyEgeEIzsY2Jvs1C9IGpbEtbRMVCwWa9seXh1zG
         7cYI43iebWetqZGwQCSXf7EZOBPtEI/koral7bFSARid2aCN9PAoIDhvuyaq31lJpos2
         fJXgHmji7VevsldnLryk3/DlL51+V/lDaFzD3SmwbzbPyIEgVeG4NQpXeCue0LTb+IPa
         x0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709733153; x=1710337953;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YUTY+l2RgN437PUSLue8tToMPkzTitFlDucsO/DZvk=;
        b=jnR8FkL4HwCbaKmF1ye9qNup1r4hdmAK1aVMJxAxyxiZEfYlPkpwvEHOuPxq1uLfdY
         QyLGumH9jXt/izKD3O8BeAEZJm5rqrowWdDVGalWd0he649YZnZVHPyPT9t38+uL/xvq
         ES2DKbzCp/ZcHYwog9/yqgtUUjlXjhxIRJvY/eCl9spUiBF4vrlD6okZ9pspWCtdwHBw
         5KgF/0JZGwRJ6znItyVxEBsSVU57g4r+iQiWzHkeAP3Mjuq92YIXrUI2auZR1w4bDA4R
         JezM+N281zhsK6wt5s6cdgNhr+a2W7WyCkc9bkLkMawrIwDuByuCyC8lRZeds87wy66e
         xitw==
X-Forwarded-Encrypted: i=1; AJvYcCWC5xLPBaflf1k1h5Lfmeg+eT4eckxt3B5AtDfekqyr/q/fUILA0u2h+EmtUX4ytXZLjCHiMUMXXTEYF2Q5m2bXUL7dZr0zmAfoUSOdUiwk
X-Gm-Message-State: AOJu0YxwTRLuqaxY3rOichsK10MtQzntjpLAPu5VvdNh8TT9gIlSVs50
	j1XagquMlVtyCOEKZ+Uvge46bC7auggnupMf70b7i51lM5NztP6faFRIGBwGpSk=
X-Google-Smtp-Source: AGHT+IEVdyAZQURDM9SrFLVnut8Vs6bokwqor8I0IOn+wmMlR2loefoe4428fbp744qhAQ3KAOLUmg==
X-Received: by 2002:a05:600c:1391:b0:412:e0f7:ef52 with SMTP id u17-20020a05600c139100b00412e0f7ef52mr5183535wmf.19.1709733153251;
        Wed, 06 Mar 2024 05:52:33 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d604b000000b0033d9ee09b7asm17653491wrt.107.2024.03.06.05.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 05:52:33 -0800 (PST)
Date: Wed, 6 Mar 2024 16:52:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] regulator: lp8788-buck: fix copy and paste bug in
 lp8788_dvs_gpio_request()
Message-ID: <19f62cc2-bdcf-46f7-a5c5-971ef05e1ea7@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

"gpio2" as intended here, not "gpio1".

Fixes: 95daa868f22b ("regulator: lp8788-buck: Fully convert to GPIO descriptors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/lp8788-buck.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/lp8788-buck.c b/drivers/regulator/lp8788-buck.c
index 712eaa6ff8ab..2ade249ab6df 100644
--- a/drivers/regulator/lp8788-buck.c
+++ b/drivers/regulator/lp8788-buck.c
@@ -430,9 +430,9 @@ static int lp8788_dvs_gpio_request(struct platform_device *pdev,
 		gpiod_set_consumer_name(buck->gpio1, "LP8788_B2_DVS1");
 
 		buck->gpio2 = devm_gpiod_get_index(dev, "dvs", 1, GPIOD_OUT_LOW);
-		if (IS_ERR(buck->gpio1))
-			return PTR_ERR(buck->gpio1);
-		gpiod_set_consumer_name(buck->gpio1, "LP8788_B2_DVS2");
+		if (IS_ERR(buck->gpio2))
+			return PTR_ERR(buck->gpio2);
+		gpiod_set_consumer_name(buck->gpio2, "LP8788_B2_DVS2");
 
 		buck->dvs = pdata->buck2_dvs;
 		break;
-- 
2.43.0

