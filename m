Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F2C15DBAE
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793104; cv=none; b=ibxrfA6mA8IYkRJpmR/hkS89KAP4bRobHMAP+Aa/er5R1ZHAc0DBA1Gy5Plu+L51IiqznZFi3jA+ixP9qpwQeSzXI5UWaKC4piQr9cTwHj1l5wshdgYXuJuwPitSIHxSs+1lbtqiclWN8cNSUYEeTW4eYBmft5rngiP3nyVpIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793104; c=relaxed/simple;
	bh=IKwu4IeO4ctIHCAUeLuXDVYmpaVD4J5Qf/i0s0LEYt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qK3sYGlGlWMeOwfXD+Rb5oR8gF4ENb9YYRN7l9ZZvea42TZlZhIo5JqRdVLBnRYOAAZ4LC+CF4qE1uc2iEiYUkWVE+83U/BwXaIJD1EWMR/8a/0SiP9hH0x8MPXvFEU9W31rHj84GwL0cXCoMQPYodHE2R01DS5fmHq+4U+0QYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPlI1DtF; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPlI1DtF"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-70446231242so1018873a34.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793102; x=1721397902; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VghSScXg0SnQ65hjRgRRdsd386IPCF3v3rBLbMWrDA4=;
        b=pPlI1DtFjrYkcc5iP02KyHctwNmU/dTI846uBcmcoxncvXHALoYXSwrqT8TOXx1yBx
         0T8wToDuig/+P6PRdOhTXiAXD6OekG6YAjA0oP6z22IVIQkg4eES9waj7O7Mfg3L6gsO
         yDyXrHJryRziT8/BmH94Pkb5DtdX6yYwnkXRePuFAH8pkfIrLyUbPAKYpqT2e355ascl
         E0jjB6ysjZZqB7YOdEsr4GbGAFtHEMMeB+Xukk3k6Sb6WdCaq4DkYCqH3n9wuygnCqLx
         fNw7uNBEhRQfLQ32pCiCujgoDRy37f0+H+FLvEPEx1YfLnM+YQeXbMJjd+ORLYUzBvir
         feig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793102; x=1721397902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VghSScXg0SnQ65hjRgRRdsd386IPCF3v3rBLbMWrDA4=;
        b=BIzwE2/gtJDTGRnaujeb3kUWcqQx3ER6O9MWCaP29iBXeTSx6wjsd1saCj8VJLI2n+
         QiuH3WEeg2tPumjp87dFvA/RIzFY1/nHardZBEli+9ME+WekRZ9rimSsOCAnfU8//oZ4
         uwMz1trjSmBOL4lvxChF4UAiuDby9BFn/rjFEohBPFWToj61SUcE7i1xuDavoRzhyP2k
         rjl1wSDTHz4j8pVg0Q3oCM3l9gQK5j0Kj2F81r6b/1FOGQ64c9O+XRUJI3jVBLAfZLNP
         QxhxYSq0RXp+mAYPBOr9uNc0XQT8ZJ3JcdR3MaJNZVwWjg3VHDcfj63Q/VLb1PzPOl5e
         0RhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdmtlOJy/C7ejml0yNGcPJw6AzvqtiWDsFGAUY5XPsPsT3juGW6Mls/QilM9eYEQXZ+++Hw5OT+cP7WsQxUVB8HuGE5j4CF6A56xsOknpI
X-Gm-Message-State: AOJu0YxAERx5/XUqavLPbX+Kj2u9jjIA8alqgDBChLvBKRaTcNPhbIO7
	90U/rwmwit2is+A1mPHIfAJHvrSzNXrY+WXjEvUUPUI+34EiPpBctTkHlwHm+kM=
X-Google-Smtp-Source: AGHT+IFA0p4jpx4ZTZg5gSmdCsyYovFZ3XvuMQom8jLmz1vaX/2ViXszD44aiF1MHSHh4j1LYznztQ==
X-Received: by 2002:a9d:759a:0:b0:703:7a17:f267 with SMTP id 46e09a7af769-7037a17f53dmr12708239a34.26.1720793102310;
        Fri, 12 Jul 2024 07:05:02 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70559902e6esm847390a34.35.2024.07.12.07.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:05:02 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:04:59 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] nvme: apple: remove some dead code
Message-ID: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

platform_get_irq() never returns zero so we can remove his dead code.
Checking for zero is a historical artifact from over ten years ago.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/nvme/host/apple.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index b1387dc459a3..f5a3a4e8b1e5 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1417,10 +1417,6 @@ static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
 		ret = anv->irq;
 		goto put_dev;
 	}
-	if (!anv->irq) {
-		ret = -ENXIO;
-		goto put_dev;
-	}
 
 	anv->mmio_coproc = devm_platform_ioremap_resource_byname(pdev, "ans");
 	if (IS_ERR(anv->mmio_coproc)) {
-- 
2.43.0

