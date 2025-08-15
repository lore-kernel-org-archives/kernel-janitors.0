Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2D287273
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Aug 2025 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755240593; cv=none; b=US1YfxSSJlfefN3hL8zVHl22/nFC1I2JCcEBLZbKnZoloz05BlZDvWLVUDDkMvoPCFcp/udM970ZQENpX3ZzywwWOEqx3Z7wOGmOEpnZSG2lmsgETbdm7KKsQXW87aLkMPo2wwmrIGTqk72YCjJA4HKRBgEVWNbQAOrCV4OwOa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755240593; c=relaxed/simple;
	bh=K0BHwWFqKTGMLEkMOxlrAMriYgYhyPgtOID8NF33Cos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ks85+pX3wpCNbZZTNrqNqvazc+IEqIy/dnv7jRXefN3PckYufafQGj8AtBCfUE641ev/INr5anjTmiIU71HFdDVQGdMn7Uxw+5SG10bzxMiQmNgITT9EPJK0dfBjBvK91so0mhtbhLhWf/iEy2AX1995Sx6wddzy7Elp0jzEmqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3fHIY9z; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3fHIY9z"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9d41cd38dso1122195f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Aug 2025 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755240590; x=1755845390; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ih8jyns5XfrAsfrJ/D/bA3PgscUwKaCWqo6J4z+BpH8=;
        b=T3fHIY9zqW4G7fclg6FbxU0TVJ4RzBWyVgIwy0FMq9M8OGgHjmwrFIUjNutCHo237w
         lsgKW+yMtXra8SCeXRazSOkUXMMbmSn/eymRl20hiuZKeNj4/lnoBQBVSg2Cpm+tm/p0
         YngPdpzAC0yxcbyziJRhmmZ7FnYVSnK8f6VJ6Mv8+2QfooLbdh0uKj3G5jGk3XSxVMbT
         RNSfRjes4oO7LaLqjIf5WqT2HGsgmwoHZwmAd0hV193CPM1Bw+Rn2P7dLF050JMerEVu
         OZ9joAdvdmPKDbrw/esmgnmZFTEWyqnGPPZEcserN1Pw+TykBbB4zZ1uB/Xbf3gI3pvM
         hRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755240590; x=1755845390;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ih8jyns5XfrAsfrJ/D/bA3PgscUwKaCWqo6J4z+BpH8=;
        b=Hkf6uyRVdcExg497b9ABi18FvWBDW6uIxTJMUFPDKAofM7udEstLzqHn4PDTWdC/F2
         madYF8WzAYfIC0q5O4leEW2hx+HB7RWUIRGvkaafB+owLLzvDVc3orjc7ASWMzr5onQF
         touHjZV1p38fsMGlKbkRwystBmyGi/ApFtsBxK4tnLZj4dypZCh1pEkcAFpkxabZMbjp
         OIYh/PEmHYouxRrBY8SyYNBF5Jh3L1zlwvquG1tXYUIFMRweB0ZXhr8f+7QURAedrbiz
         CYkl8Ebgf3/L1rObAmK5UWvrd0QYaOMY644VEHw6HOkIyrhGdT/YlxFpQbrbe1mUt9EX
         Xu9A==
X-Forwarded-Encrypted: i=1; AJvYcCVmdAYSBbsUfrQVtTzsIXgRtcr9mMGecuHX8OEse/CdBINRCnWewgJcN86GS0ToOzb/6p+Td9Z9s1yxgu6oqd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww7dsl9+oRhmv/ekoZBbdaRqES5k+po4dz8WE7cp/WVGa5PLet
	yhGGPlt+1X5mGFNCEDE+Y8Fgi9BkGv/1B1V6/xpIZ565n3V6JbIzJAkfyS9dGpV3moI=
X-Gm-Gg: ASbGncs1unOEaYc8/qgCIx617kjImTMI9HE7VGltYOoMBw+KFkvcEE76fHa2zT0Rtrw
	wa1wlP0EidH1c9QrbhgEPEt9XqFTqHwAjS6GO688K0Avs6ZhkjaoZWUjAWHlQBwRJsLNdB/gCA3
	Zv7CULRLCVMomsag+DFDu1XVk/Z3bJZ9M9bSWJ0tlqAEMCxcbP3ctGPEygR7ipdsLS3xZuvF6K6
	VF6zHjgLbedKYp+kX8FMCt4SWaMlJL43/UJawzIwprXUBGk3N/52lfBg7RcT3DL2rFW8O/ZUk7V
	SIUfalohgKnsDuXMOlYY3lrwSADVdpk8bNh5vy1M5y2ArxzU4jXA/T+zCyt074qTNW4VNLBYvWM
	cWU5BqS3sAIuiBb0pGh+sKIUqRKT7Rq9HObGZ/nQJt8Y=
X-Google-Smtp-Source: AGHT+IH+DBG1OPf6MaEZOCGobGhY9B0ySgxmVlsCJLQpN6vJTZ2E7j3xNdPM/PtvVjUbEs2woGDf+w==
X-Received: by 2002:a5d:5f88:0:b0:3b8:fa8c:f1b3 with SMTP id ffacd0b85a97d-3bb694adc61mr648544f8f.53.1755240590473;
        Thu, 14 Aug 2025 23:49:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c74876csm46766045e9.14.2025.08.14.23.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 23:49:50 -0700 (PDT)
Date: Fri, 15 Aug 2025 09:49:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Chang <jeff_chang@richtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] regulator: rt5133: Fix IS_ERR() vs NULL bug in
 rt5133_validate_vendor_info()
Message-ID: <aJ7YivhlWlE6ifw1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "priv->cdata" pointer isn't an error pointer, it should be a NULL
check instead.  Otherwise it leads to a NULL pointer dereference in the
caller, rt5133_probe().

Fixes: 714165e1c4b0 ("regulator: rt5133: Add RT5133 PMIC regulator Support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/rt5133-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/rt5133-regulator.c b/drivers/regulator/rt5133-regulator.c
index d0f367381fbb..a83a595c0609 100644
--- a/drivers/regulator/rt5133-regulator.c
+++ b/drivers/regulator/rt5133-regulator.c
@@ -510,7 +510,7 @@ static int rt5133_validate_vendor_info(struct rt5133_priv *priv)
 			break;
 		}
 	}
-	if (IS_ERR(priv->cdata)) {
+	if (!priv->cdata) {
 		dev_err(priv->dev, "Failed to find regualtor match version\n");
 		return -ENODEV;
 	}
-- 
2.47.2

