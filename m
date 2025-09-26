Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87261D63CD
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758859408; cv=none; b=iN7jvlE5VqklWbyXV2phnwuIm/EEw2Bq4u/TToDnCRER8QbF8oFVeadzoqZccB1QvZ/TzSmht55n9aKDFuJczvEibogRLTI9hJsMHkPNZLWb9w84KQrKCKhjBymj9vI8WSB2QsfyIdtfGS7oahB7eglr1k5I5O+/Ts3bPqMx5g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758859408; c=relaxed/simple;
	bh=CMUvU7Q/eBR+laEBfAb7ZGtG2rKSkDFVZ54Tf8pVcwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A39CCU3hhPRyHt6qNHWCvZl7M93SgOBrOhAkIElTHettG/wYohw3dWIr807H7uCGqZRHG8OrWDtcHfHfuDtGp1rGdX1kFtDN2xCsvadE57yFFFnfQaG0iYkxvrxkMBzLMdBjEeuzGxtBCyGYAjPaxXkyaCczVEnpk5eudacDS8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C5LVsrD7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C5LVsrD7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso1369285f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Sep 2025 21:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758859405; x=1759464205; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P6T43NkvaDj01P2kx1drf+v8B79h0nA8PHSG7DCPm8Q=;
        b=C5LVsrD7/UCaewr6N0MlOvCA+xFcx0MbNr/0lR/82Q1SJ4hL3z3xYVxdVgDKRlmlU7
         V5oNniYYrv/Ar5i01vWX/2lTt8/fWEcCcngLuGuYklK35blRSUW9nfutCyJsPBYVkxtA
         CRbDRw90Z5J6NByc/CUB6w53ONR42xZnVfC6NeCia4bxszPRA+K/wdo2206rRXfqh//S
         370GJFljHk9oT6iiY0CuKrQDvSXU5sJM4yLGiyGftJGI7fqvVmFLzoPS/iIodMJzWYeY
         yF4d6fNa4XkpghA/bJzeOXofAISyeLqzIXKSuC4PiB5Y0ZMWURdKIn5JLAmw24ilsn7x
         WDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758859405; x=1759464205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6T43NkvaDj01P2kx1drf+v8B79h0nA8PHSG7DCPm8Q=;
        b=HI+m0mMBmcMw6LWrUmjgdifhfoy3/DA1Yt7/cYA1GTSTs+8yce3jPsxxOdC0+Q5zUp
         01AfU4VQ4g1vXOX5ft7V6cKV4+8DWvxDKfPs85ovGXtXa5t8zxXI8prpF43/bPg2fb50
         0X1TFHG162eKWhZk7ovUSKaqhSx3EPG4uUjcnH8Na4F9Bi04R0IDVIKaLX/Zzj9PrCw9
         HGXfWNv2aLhX/4kumGDs2+JLqLzWOgMaWbPkceys0Gh5oNp4hea0k3Vg7kxilWs6Og3o
         uGq/C4XwqZl2h8JMnIR/T1cFGfLXsXxEwLPrd4BCwqrz6IBX98ThpRqwZz88O86MDgU/
         C9lw==
X-Forwarded-Encrypted: i=1; AJvYcCVz4PKrjL62Q8fr2x72RixW56U2b0I49wa7HZuTPH273M8O5AceXPyTCVwzICvj9o86gGKnGPL/gunksfFHX4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGBBBN/h2mKmGIuHJ48wULRy8mWY3u7eAS2IE8VofgmVXbj94s
	3Xw8/f9Xaeafmr+6QqWyPoyB+EFBRD50t3GHwKhfopR4kfxDG40DDAthM9yDd9HyYHI=
X-Gm-Gg: ASbGncvU4B2qlvCcTBv3CeoZtOxvyUlP/oDuYo3Us/Pt4AAS1Cbq7VNT4a9qpPwAJRT
	/6XR7ACr1adg5aILnLaBlwW7CdbjOhmg1MnVK/w3Yn2KoFAW4nfzoA0AprMnzOBORfI+tGLo2iV
	yzsuJ5vmA4Dh3AULLQQGM8cBqUF/+HzVsjDDuaxTUpr/Fm1o5i7hZlTv+dMIR/wdPL2RP5n8yGI
	D2tdb5TdTaXX2S9fUit7A5GZ8om6DDH9aH8P3KT7k22F1s5Rg3mUQ+SlrmCXiO1YsBXwOzAiBwg
	q9dMyLE4+hQ70RRDBQaR4nME0v0wK+G/KyIRbpyCpHXI0vPA3jzxovm85QJVRRJDCLQP+TgSwWC
	PoMrAw3ONcgoOtawFec600DatGIpW3O9Ei/sBJa4=
X-Google-Smtp-Source: AGHT+IH8jSZ9cVpDSOMeLWUT/1JDNyhLeRJ9I2gTVKvtZXYra39O++P7RTag+3K6FCsm4O/uhokkGg==
X-Received: by 2002:a05:6000:1a8c:b0:3ee:1279:6e68 with SMTP id ffacd0b85a97d-40e4ce4baf5mr4739778f8f.47.1758859404873;
        Thu, 25 Sep 2025 21:03:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fe4237f32sm5197655f8f.63.2025.09.25.21.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:03:24 -0700 (PDT)
Date: Fri, 26 Sep 2025 07:03:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] clk: mmp: pxa1908: Fix IS_ERR() vs NULL check in probe()
Message-ID: <aNYQiRJDmOO0mEWs@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_auxiliary_device_create() function returns NULL on error, it
never returns error pointers.  Change the IS_ERR() check to a NULL check.

Fixes: a787ab591c38 ("clk: mmp: pxa1908: Instantiate power driver through auxiliary bus")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/mmp/clk-pxa1908-apmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa1908-apmu.c
index 7594a495a009..e374d7733f56 100644
--- a/drivers/clk/mmp/clk-pxa1908-apmu.c
+++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
@@ -97,8 +97,8 @@ static int pxa1908_apmu_probe(struct platform_device *pdev)
 		return PTR_ERR(pxa_unit->base);
 
 	adev = devm_auxiliary_device_create(&pdev->dev, "power", NULL);
-	if (IS_ERR(adev))
-		return dev_err_probe(&pdev->dev, PTR_ERR(adev),
+	if (!adev)
+		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Failed to register power controller\n");
 
 	mmp_clk_init(pdev->dev.of_node, &pxa_unit->unit, APMU_NR_CLKS);
-- 
2.51.0

