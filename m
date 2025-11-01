Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361EC17AE11
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003554; cv=none; b=pPtVTckqCHubQ3QlQqSH2azJeQOpqMfwXtwNyEH26vv1ft3FpvLGdsyPpwM5ZSKCvqVRnd3Elh/+2CnlOmOW+FDtVk6MTkyHq6euRWxleNIJCSxZSdSBQ5P4U/MplL93hcEMvFXVI6rSexyzSC5SkbYoQ98dfirl025WwrZOYkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003554; c=relaxed/simple;
	bh=Mc1wsSOnWuVBW5U3mmx+TYZyVd9CGG8SkUFXpUY1mqo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbzhiqgEqG3N4IVVjHA/X+0kw0RLLbKgNZr34R++zUEEscMB9386pQZHSYI2efY9xrnX8zg0fzXgk+tbjy2d4+x0JzmWcT/GbnUsdRF6ofvVOrT+S85hGNO0po3Ef8Tcg4gFc7HvqxrMSttGiG3R4o2x5Fd2zL0DozcHcBw1Wdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eH6/Ao1X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eH6/Ao1X"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47710acf715so15059575e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003551; x=1762608351; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kefLFDRMJrK9HnSrDfYpLnvqtBuSL8Qun0L1purZEqI=;
        b=eH6/Ao1XjBYqaHdXLBpygJfeBPrFmBZvJ828MYS/cDd9KmUK5/7GERD/wKsFl9luz2
         qbcoq5u4wMQlgdCAKrY2Xqsfa09+EMa1GH9HGgkjT7OPWC3OPrP5UBYd+sytptJfrXOd
         ZVfF8ceZNDCpDRYsaOTZy577y6aWobLFpvSOC4Pbg0uU9dsOyxfIsI0foQWfObzKgdJU
         ZoytmCWFiSXB20QvuojVKsBvI6bJ1sXs+gRHpMmFKG5J2nPEqT8+/arT3a4VOLv9nFhM
         ypX0Rf3k16h9oXI8d2LjNJZqgg9wXazRZUmvuac44wd/32Ivrfa3xU4n+Zkg4kcIqkiD
         vP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003551; x=1762608351;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kefLFDRMJrK9HnSrDfYpLnvqtBuSL8Qun0L1purZEqI=;
        b=o9EVS2CfM7ouhMMQMV+ADeBDT/xGHR+I47b8baNCVUnntI3vSBvCHPcxNXxojCrctv
         IlTqKWY3edCCuJeofOJCWDBCvuEMlL/QcCZCOou+NsC823vPJmueEvgE43QzJ3KrWSxe
         e7/hIYPoQNN4Mp4Vvco3WUHKOqWWEdUev3RoBv1GunF9lrDIeTMKWK8VjNJx/z86lCQa
         tYjLvJKWXtXKV2LgJwoliDOshln7J2dPj69VumLiGX7RVLl0wRVrWJsRNlsVEPsKuxRi
         c6TLnxpoNIOOvR0u6TiT3kD8G1k2UxP8oDJij7+Ih6T3WitAFFassPqLk/GY4SpwPLfF
         DZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK2Kcg+ytRDcZAQhgPNg6GbZg4gnIyRaTaiLleK7+9EmgJ3ayyiYO8vczcIX8uc5VVppvAR85SY5kWoMI7urI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbUJtUuFgS74ZhPQVGeGP4h4yuggWPRHTsSTAMithya7MffUH
	wIP7PaUaLSXg5Jt1/xa/OcL2lGi56bYx+PYP4xlXajl6eAMINar+joUCxxD88/2JTjA=
X-Gm-Gg: ASbGncvNTR2SEijPWHsUEGAUoLyjRXPO9RodY7f1Y0+hRJ4YK2Olz88v8yVulS6DYrI
	L8Rtf1QSqSyZyhu+1GFbR5v/+7SNgrfnpicVnoTq/s/RIt+1S7054n85cHR1wLyAWI4zWjTxD5H
	tnHxoS0p6XruBCBxr5D+SurNOpKdu5U+mBwST6aGFqc+dqOpZEisG0D+GVI+hTMJr7QKvoJJHYr
	dt/dx1+shPAM6UfHpQY4Nc+fbxBR8Dmm+oHDARTHQq2g+YqSL5n4Q+8dGEqFLVD0gxP2wjoKCE0
	5KdcYGGUjW8Kk01N96mDhgrK9lt3F7ynEuBy4WT/m/BAZHBkZatx4ztpERaax6iXIBa5sv53EbB
	QAiEYbw9ZM2y91tzyEslV2zuAqloo3BsXXrHCOJQN4BWS9OlkNJmfvbLMINtbmxB8pLEh6dKGFm
	0txsOhQUZiilYE6EvT
X-Google-Smtp-Source: AGHT+IHg6f3fIsXsLrLzGR7r5NdaH5rE26INwWReTi4lRgX0CdFFywAF4j5hbZstscw0VD02x8o6vg==
X-Received: by 2002:a05:600c:c4a7:b0:475:de81:563a with SMTP id 5b1f17b1804b1-477308b22a2mr64707215e9.33.1762003551417;
        Sat, 01 Nov 2025 06:25:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c2e674csm49318355e9.4.2025.11.01.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:51 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: onenand: Pass correct pointer to IRQ handler
Message-ID: <aQYKXGSoLqCLNqKg@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was supposed to pass "onenand" instead of "&onenand" with the
ampersand.  Passing a random stack address which will be gone when the
function ends makes no sense.  However the good thing is that the pointer
is never used, so this doesn't cause a problem at run time.

Fixes: e23abf4b7743 ("mtd: OneNAND: S5PC110: Implement DMA interrupt method")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/nand/onenand/onenand_samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/onenand_samsung.c b/drivers/mtd/nand/onenand/onenand_samsung.c
index f37a6138e461..6d6aa709a21f 100644
--- a/drivers/mtd/nand/onenand/onenand_samsung.c
+++ b/drivers/mtd/nand/onenand/onenand_samsung.c
@@ -906,7 +906,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 			err = devm_request_irq(&pdev->dev, r->start,
 					       s5pc110_onenand_irq,
 					       IRQF_SHARED, "onenand",
-					       &onenand);
+					       onenand);
 			if (err) {
 				dev_err(&pdev->dev, "failed to get irq\n");
 				return err;
-- 
2.51.0

