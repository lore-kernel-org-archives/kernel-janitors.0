Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B9018E342
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143367; cv=none; b=h3vi2UHrGxHwE72KbJejwzaDqoe5wHULFzOeKuRRuPiZmajnAE5UXot1HPnirc1yMJE7qula86kbBRcS4O0sCWYjjFbaNx5eEBYjdmcFBIzBUblmKonsnVYfNeAjNsgUzJCgTh3DccEnSv81YENj6JZiJMXDWOWHz6zbBTRDJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143367; c=relaxed/simple;
	bh=6rtUYcIz3xm63JUpK8NzVborqyrGoiRibCxvD6FDPOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXoywvcl6gILzsB8wOCkyGQFv+DVZQA02Mp983xW0gLbngcXcIIss/2dJN1on/csxg8GpGNz7V/tPxInOUP1vxvmTR0dzpX5mNAcDPlgMIrKPzKFkIkU83EdE2kPiUHtBx4N46HVmJEZriepSatccfPZndECPn1YqecFEDFSlgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQ4XsKl5; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQ4XsKl5"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso2218647e87.0
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724143364; x=1724748164; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PP/VAgEIyHL1KqSWiO//9a8kNH8xXXjnkMKoqwockA=;
        b=vQ4XsKl5OYUeowSx5itoMpdeZ2TZujx+22Y+U1I4R7X9WB9Zggbrk7SFTNE4Ftdpz5
         6+4di6mznYeXOnHZb05xR7vyvHJScFWc+5oimSnM2BNcRhuVJxtBzx19fFkAoHT0+f1I
         giJOH2EeoClbM59STQ3kMJjc4EwvI1w1YTn7GGnG7vq9ScyuCNRsI+ecUAEHgnMCXiRQ
         NeR6NXI1/m8+UzU8asA4KQY/cW7reiMpaY8ehY6Wp5cmOp9lJF+6vcVRoO8Pynlh8owh
         qsp7ZZSD6MsR62yhjUfdPUzBGcy3J2HqJ3AwBPkEIpdX62myyBZ6zVAkAcXbPb9HSvKF
         jgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143364; x=1724748164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PP/VAgEIyHL1KqSWiO//9a8kNH8xXXjnkMKoqwockA=;
        b=VUTisrsnMub2FTB/wS9UuHaMo8qV4qciCyUTOZ7Xp0nKCEJZOPXhpXFlr2SmfYzjcB
         v3RM1AgadpvlLeQqum43LmuTWK3QOIK73LQGtG7PMXpkFGyrLuBXuKFManqW5UFFA+7b
         9LQh+DVjyqj8+gnZF56fLKMnc2Oe54rqx3hX1x6MMHT9vzaANqwVRgNnBNQODkPpCXCP
         0eUerBqviXCowgrAm9ru9oPffok0p3X1omBym6c6j0rqd1NvmpS9fXtPRkcYveM0mU3q
         CXY4jZBWrOS2tORqAV/Y/o1Wh+dqkvdyEIOlhEQkNJu2pSuCmmDtEUPW482zSmEvvMwm
         GERA==
X-Forwarded-Encrypted: i=1; AJvYcCVNx+JAod5SGakXynxiMogd8V1u6nU/ZIYFgcql3rqWgMeTp8INgholdrdajk6raX5Ujc0YonK+LiNekx9qGPlWzToNil0PVtmA9SpRhMu6
X-Gm-Message-State: AOJu0YwV2nQfRQt5PRKmzCQaeVPSEM5RqYXzkdmLUved/+qLj5MjT7XD
	93jhwMxPGClp8IjbRobuFGlwDLDk4eYNJbYB7IGuqfWUjwxCfXF1rho2ev7DVbQ=
X-Google-Smtp-Source: AGHT+IHyMvSwXLRRmCjKbTOz+MEieevfpO33ioQwKGl2Doy+5ysz84GRgquXIJdiF2lrdI+nfWga3w==
X-Received: by 2002:a05:6512:6ce:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-5331c6dca58mr8439534e87.42.1724143364033;
        Tue, 20 Aug 2024 01:42:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396c306sm731716766b.208.2024.08.20.01.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 01:42:43 -0700 (PDT)
Date: Tue, 20 Aug 2024 11:42:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] irqchip/riscv-aplic: Fix an IS_ERR() vs NULL bug in probe()
Message-ID: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_ioremap_resource() function doesn't return NULL, it
returns error pointers.  Fix the error handling to match.

Fixes: 2333df5ae51e ("irqchip: Add RISC-V advanced PLIC driver for direct-mode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index 28dd175b5764..981fad6fb8f7 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -175,9 +175,9 @@ static int aplic_probe(struct platform_device *pdev)
 
 	/* Map the MMIO registers */
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (!regs) {
+	if (IS_ERR(regs)) {
 		dev_err(dev, "failed map MMIO registers\n");
-		return -ENOMEM;
+		return PTR_ERR(regs);
 	}
 
 	/*
-- 
2.43.0

