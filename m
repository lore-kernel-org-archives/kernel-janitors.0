Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69562283FFA
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Jun 2025 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200663; cv=none; b=ePXNmrgIoTUKyC9agpinil5sGOMcgVVumKTC/5Rw/Hp8uY2+kcPKQPekmXadgXIz6nFjF49vgQJRjcW3XRFcgRJjv7pFOgXodFkN0xsy1IjRMdN5ugLb39dl/t/vEa9Y6n3vqrOjYbP1ZdKsuScDsb2yO2Jsj8zumwv6IxYBxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200663; c=relaxed/simple;
	bh=atA00FElL1PdAn8QEx0N6GgZX//dcCoPP67oO9WxXfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7Hu3jN1wU19Gh1i0luXUSneeGhUMShpO3LNoyOtFlzx1jxQHSu7QdbNVnbQbD1bOJjrWzJoM0ybn5rXNtohWPwvZM+VTpAdo0lF1PJdnxaubaWaGZoK8Getbvtyu5s4Tdjxs4rAKWYc+WVueegtPg+q6V7UwfiL9EBE3nMwnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLBdE6Ky; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLBdE6Ky"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso17341195e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Jun 2025 02:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200660; x=1749805460; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+0n8NKWl3riyF7/7I5pRPKqW7VrVfcXJo61+Gw+kIg=;
        b=FLBdE6KyuWCOEJ6DiXopQgcFNtVLB0ly443e90Gh7P+zYuFY6tBGjir/iwBQc8CkOY
         62oNPoizn4tGbJn/app7aq2Ai2NEuqSQJMFK6rSJ7mFBSfeMXgKylT3g+Zu9JtpQmW1w
         /kUSJn3rAHmgmOqKshbeGuBdib1jBT09PqLx69EMYj448NQqfdI00M12OlVw7d9HWOjV
         z1/tdYqUi8/EkpvwvDiL7uQukUTL/1LFlLLr2EAM51MPm0VZZjJN0aZedogcXjXm+d2L
         k7rSfokygEUPo7ff5ziU+EsHh25FeAnw2lGQr3t3Sa8CCVFb/bOJ11/MbXRcVmMNnhvN
         Kq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200660; x=1749805460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+0n8NKWl3riyF7/7I5pRPKqW7VrVfcXJo61+Gw+kIg=;
        b=VPN3p/lL2NG9bSXGswSe6cBBHLmouKfnGnc2j5HHup3uwyNFymq40aCZXIVPYZuGNh
         JGPVS62n1oBY/3z3I29b7FJM/IB8DPxoE2yeDz0+Jt/zDBrfpehtix8BqZD3OuV7owey
         Ihd3r+TtVWwHsk1qbqDRSHlh85Klw3fiheMlDFb5cBKWyvLLfZ//FLTY4IdEgosK/4fi
         ddFvmwQSIzjAUBs5ci8bj8d3vSRLVLFhR/hk0NMWy8RD221Q6vPEwycjW7haBJTCGJ4B
         Pol0IHEcw26/s0Ir0pmC7HqS0mll1tlwoRSMfHi8YzzlOiBFI47Uc3FY67JE8AUITr5W
         e0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX/tM2c4XULqnbBUo1AolgsRJcYhMWrL4bsSkGDPpWgcKjihT/v5kK5WJqUh5XfAbcxVzzh9g1LmYhxvQqirWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8BPtxOsCvBKg77D9jGG2PCEeSpQGvqlZXX0ST9ZkNgeNqagZ
	vlfKfwH5teqFDpnwiCsscwoNv7haJNXLiUMpbCFF2NiMsQEQ/yzFzSs5igxXtBUt4PE=
X-Gm-Gg: ASbGnctFTUXqgOl4r4FzXEyAdROiXuLlx2qic8TNaB3AZn7PQijrrPUGJCvW7l1lHhW
	KWP8zWIwn6SvSoPgxrodUi8qQqnXKtOJudtLG6rxwdWfgFgfFXXi4BePovDrsRpfmdpwe/rkzQf
	0ZGRZnWPa0tkekB+8BYax8i16mlYDFVA5XZEaGeADVRULQ/L5aBI3Fkz3IzzGqWhZG1kApLyQiz
	y4EjxZDmDEw9qjlf0FtnItWgmqJyO3hqLOCk8MLSfckU1LTAWcT+C7jlFZ46FkOFv4iiearl5C6
	btcXlfBGxKxP5IZ/8P4/QsCS2nrQeW3txu06DEOqvlUYfko2GJCaCjcyeXVj+xcrgfE=
X-Google-Smtp-Source: AGHT+IEMgnQm6IyXJETnU1joAUlaC9jQwH6ZYJk+ZFID2NbYjHHTWiY2iKL9SlP/kooNnTgG9NsR4A==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4520147f41emr28594825e9.18.1749200659602;
        Fri, 06 Jun 2025 02:04:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4526e158428sm14173225e9.14.2025.06.06.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:18 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thangaraj Samynathan <thangaraj.s@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: spi-pci1xxxx: Fix error code in probe
Message-ID: <aEKvDrUxD19GWi0u@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return the error code if pci_alloc_irq_vectors() fails.  Don't return
success.

Fixes: b4608e944177 ("spi: spi-pci1xxxx: Fix Probe failure with Dual SPI instance with INTx interrupts")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-pci1xxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pci1xxxx.c b/drivers/spi/spi-pci1xxxx.c
index c6489e90b8b9..9112d8a1a0c8 100644
--- a/drivers/spi/spi-pci1xxxx.c
+++ b/drivers/spi/spi-pci1xxxx.c
@@ -765,7 +765,7 @@ static int pci1xxxx_spi_probe(struct pci_dev *pdev, const struct pci_device_id *
 							   PCI_IRQ_ALL_TYPES);
 			if (num_vector < 0) {
 				dev_err(&pdev->dev, "Error allocating MSI vectors\n");
-				return ret;
+				return num_vector;
 			}
 
 			init_completion(&spi_sub_ptr->spi_xfer_done);
-- 
2.47.2

