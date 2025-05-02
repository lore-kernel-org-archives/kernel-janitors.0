Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EF919DF4F
	for <kernel-janitors@vger.kernel.org>; Fri,  2 May 2025 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175177; cv=none; b=JTyYpmMwadM+YxIVX/XR9Fkor75f6aYIw4+an6191WBOoPaRU9cDuRRcEiuEL8ejHNq/ehKX/qb7iRlOkztm93xRCWdpSjoy9k9LedAbKkrqyzMCL0mUigC7lnJxHrIvonvqV0GHCxKSkqD3MhjKcI+Zvf87W1fS4OtI5yDmzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175177; c=relaxed/simple;
	bh=Fc6VGyglFbCU4Zg5Mw2hQNZJJof9kthAbyW2Wut9M2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOVUnR4C/19z/C2ICXje3LIVcTjpqpxblCIaSu6z6wfKghu586JqINxpOUSLsQuAoEGw59kjpeEUcJo30i+2hwkZ5H8mNUVBd/yzSZH5q75KU7k8QwGPFmHhh2BksfEaHnTZ+fwlZ2+KaAflK4sBOh8+QFyO7i+iPbz3w4NuFLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgkeSmGo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgkeSmGo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so955535f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 02 May 2025 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746175173; x=1746779973; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=pgkeSmGoxGb3NfuIJob4Qla0scUPSMXoTsndHmbdmjevpXYIfbDx4MAZn4oT6YbLOm
         xw0IrMORmI9j9tflWnq3tb+KApmrfvvNjN5AQhARq+w+0R5nmLM9mnMKFqCS5XJPyHxo
         ZGy4DKfP0RBUJXBZsDPWD3ETQHuMl8oOD/lLf24/i+dn38TW/79l2ayYffez7wkm2LB6
         E0vFUMDR1QP3WqhZwGzws5jaC+Bu7ylByJz58gdyGInOUsMUythMtSzs2KESFQncXLsF
         nIyZ795yXc42yqI0ohwTiiqGI0EFaOaE6ACA90QLsHmK26oLqIN//JN+vcHHfpJhFdED
         g1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175173; x=1746779973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTp1n3CXi4d/IkYoP7iNGIaUGP0jg9QVzJw7i5UhA5Y=;
        b=LC1qBEbzwnV0vGm0wl42+mj4v0/HsRe+InKya+GPul7Nin4zmNaEqjSdNRx6SRxVOn
         w14Y2BUYViIIzOvm0DKdsPMF3ZC37ZssJeZFlbiWl8D5qAxLJvoXwXt5jvhJkus6O0By
         Pec1EJ5OCpPX6UzsK5lZZdtsR/mL3WxlnKd07ARVrrQCbEIgbrqlyEriz+h1V2Xx8fnf
         l2oPje/bhVCqc6WlJHhNV+J9jLXkwXbdBvMu7zzF1Io0dF5RyUDM3aBawcJXUl8JLDYk
         CBxa/Vh9PAdkQR6PrwWVjqkiq0BgwV4WC5C7hQkTjc0VySEkyGrY4lOpi8w7DW7DYP6o
         AlXw==
X-Forwarded-Encrypted: i=1; AJvYcCVhSCi8pI7KafSZZwCbwgIIo+tbEh+EKE6uoRwTPe7UlLHT5wUdeysrmV8EgR2k7iPblJnzS0nueFbtSuUKxBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWP+Lr5jOPgALRdvSu2NHXR+9FP3q4/GUcosbksZ9DvoBkuKTL
	p4anlFnMOr5gU8r/y+OZw1ZkOUzUebuIimvMVXO6R7RItcpJ5kMr9/KLJxbxriM=
X-Gm-Gg: ASbGncty/JqGz0NGxA+t5K03OhUdHqbeIgM3sH/YDUAaLLvoB0/FnCby+INLgZeroRh
	Hok3zCcpn5r3fERoDf7ZJ7FnHS2OKmblPkAUkeHsnqv6nPYxPa6sx5kJ2WRiDWdqcf6uVsyfGly
	A1THf+YX58G9aKSKn+kmSMPvH6waeFK1X2Ow0SJTQH3kUtjqxjQxZI+vNJXfRyZazXcu2bltvBs
	huFw/f+VZMKfSkzAbyBfg18XTuOCr9hAsqA0YnhJnWBHuzNH8jporRIcvWZQQx3Xs4QiciRTLTn
	AKeRJ5SmWAxLvEY3VqKP96dDjp6TLeghLRF2XodsRDKfEg==
X-Google-Smtp-Source: AGHT+IGb74sv8hsGiSyin0BDmnbpMA2IZnPZBnAg8xwnjuUfYCPDX9NlYI/bGPAEUyHsmHQ+F3zSMg==
X-Received: by 2002:a5d:588b:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-3a099adeae2mr1444276f8f.35.1746175173327;
        Fri, 02 May 2025 01:39:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0d2csm1473852f8f.2.2025.05.02.01.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:39:32 -0700 (PDT)
Date: Fri, 2 May 2025 11:39:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBSEwag_ducqOwy7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
a negative error code instead.

Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It's hard to know what the patch prefix should be here.  Ideally when we
add a new driver we would use the patch prefix for the driver.

Tired: subsystem: Add driver XXX
Wired: subsystem: XXX: Add driver for XXX

 drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
index 6a369b1c7d86..8754bb4f8b56 100644
--- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
@@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
 	desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
 	if (!desc) {
 		dev_err(dev, "failed to prepare DMA descriptor\n");
-		ret = PTR_ERR(desc);
+		ret = -ENOMEM;
 		goto err;
 	}
 	desc->callback = ls1x_nand_dma_callback;
-- 
2.47.2

