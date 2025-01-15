Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67322F38B
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924119; cv=none; b=Nq+Mly6dZsGTw8e7KbgcVe4gQ8V/uBsMOlqfI0g916qz+ryTtBpgEHVo/Ezhtq6XZmCkD3ze8QCNdRtKXiRzpZBoGTsWRf9UmjrC0ieUkcYPEAgR6PJQL7bTfALHtlQ07Ppcg4cSES53BU+gsgvYP0va6EaiD0mWFkmfOpvTMd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924119; c=relaxed/simple;
	bh=93Zf6r6djTsOLjTwFwQbsL4xCusRovQNhv2ba7R6CRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g5NmIo3LYKaPVu2ewc02WRvJO5xtMkcDeEYxvf9obT1z01aR/mw7ZyRm9+2QlZqM2lyvAUHP5fcb/c9jHb4NsB4wQ+d7xKHdCUug0GSJNtUlnQp8Bwl6MaKEMyILNRwfpj8E9xJ0t1wCQuELQI3kWxnDbx5Wd/xBcPPoceeQYdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tiwZg4eN; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tiwZg4eN"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso913950166b.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736924116; x=1737528916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKBt5/R3U0Riotc/EXMrk2lAFncNvsaicQi2el/Oz1E=;
        b=tiwZg4eNkMCQTIuLSSaWe8AFU4NrkteMjU1mRT6lcKvRz4vY+smtNulsSNIWk1tQix
         MPcclIgP+smcS6d/QrKT+gBn4eHFMp1UguEPXQXbQIxcSmdekVdql4H2Ss/mzG/3m7I8
         l8WEA0EE+lmzImzcKVY8jzPm6/wwkJ6VpoBioszN4Me+KXYqFQrMVa8YRIMIMhDGpIBD
         SwsY3N68xcIfrKnoaILDdV6VXgRLEaKEauMmnDPhShd2V3Jy7/dzBfk4oNK9vAP4QzHX
         4Fi1YhwydsBYK8RL1E1KaKWzVkIdQHgFYSu+1b/xPhoC+MvQjZb5Hgpeb5vl5ESbN6Dy
         +RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924116; x=1737528916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKBt5/R3U0Riotc/EXMrk2lAFncNvsaicQi2el/Oz1E=;
        b=DprM8owL6zd8XwYtYmqQ3DOx8oHXCLOcd6HX2UXUnSDqt9qcAkEfMWHnePRHU012VD
         FCIW4MWHx/xMF+r+yPQYJ4kuYuzTihn+I8WJH9X4QQxSgJOLZG+N8h8Vhzj4L0HUjQBX
         PKAFz6V7WiLEPdVQR5bTJeqrmLOW91v6+Kgk5/yoQVvL7GH5UXVwf6it7ZSfxCNqciU9
         w/H54Rnn9AEj35Sx72uz2gtXeMzsO4FknhHZh6MJh5xmwIFdaEidftEioyiOXslBz6ny
         sVyUcXxC57PXe+ivqLdNxFOA62OTNqiaK8jMvl4c6YwJc+9AzY5WPVN1v5dteupJFSNz
         igkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4o5ZnBPQrhLGhlboLan+s+zp4TiLL/UPVt4EcMQfQhCNeRx5DFtw86IYaf+uBsl4FEedtU68bCiYeJu3o8vw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdw4WZKni1pThI6gYRyM4b4vJ+lps+wF6skTL8O4f6DbCdSszL
	XiFdb5bs7ICs3HG7C/VKvI3Jsb7YQnxWJQ8yGWkuWYjXQTa02NScAxhE13RSCc8=
X-Gm-Gg: ASbGncs6C3qrgIlJiuHo0XwWcc0YhJalQvHgherD5Ki4Dt3KaFkJTguKQ4pJ6UXphUz
	U2Ei56GCwWc4sK41zKpqXDv2j1Rsmkr2huE/SK81R+ClCZIeWkfV1KKthJiVgR0GbPvV6xmCI/g
	6r5VNATeNE1DY5DssG+xUN0cuRysXMYJAHLpIrjS3UudHjScnSHEX5dsHJ2+5i/tRUZId6G7GpY
	Q992sWbHOk/mkwvxT0IWwcvgjPn8QOwhWqZNdkY7Pdn6wCTAfbXTAFBy4cIcw==
X-Google-Smtp-Source: AGHT+IExCD1XX9izJi90Kdc42+9qhGwcjFZAxBY7JMxh2yX9I9+lBRCI+6LTlP3SWrBy5me6fxhpIw==
X-Received: by 2002:a05:6402:354a:b0:5d2:7396:b0ed with SMTP id 4fb4d7f45d1cf-5d972e0e3abmr58693927a12.14.1736924115733;
        Tue, 14 Jan 2025 22:55:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90da11esm726930166b.69.2025.01.14.22.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:55:15 -0800 (PST)
Date: Wed, 15 Jan 2025 09:55:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: renesas: rz-ssi: Clean up on error in probe()
Message-ID: <14864a18-c256-4c7d-b064-ba1400bed894@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call rz_ssi_release_dma_channels() on these error paths to clean up from
rz_ssi_dma_request().

Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/renesas/rz-ssi.c | 42 ++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 3a0af4ca7ab6..4b3016282717 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1150,35 +1150,47 @@ static int rz_ssi_probe(struct platform_device *pdev)
 		ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
 		if (ssi->irq_tx == -ENXIO && ssi->irq_rx == -ENXIO) {
 			ssi->irq_rt = platform_get_irq_byname(pdev, "dma_rt");
-			if (ssi->irq_rt < 0)
-				return ssi->irq_rt;
+			if (ssi->irq_rt < 0) {
+				ret = ssi->irq_rt;
+				goto err_release_dma_chs;
+			}
 
 			ret = devm_request_irq(dev, ssi->irq_rt,
 					       &rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
-			if (ret < 0)
-				return dev_err_probe(dev, ret,
-						     "irq request error (dma_rt)\n");
+			if (ret < 0) {
+				dev_err_probe(dev, ret,
+					      "irq request error (dma_rt)\n");
+				goto err_release_dma_chs;
+			}
 		} else {
-			if (ssi->irq_tx < 0)
-				return ssi->irq_tx;
+			if (ssi->irq_tx < 0) {
+				ret = ssi->irq_tx;
+				goto err_release_dma_chs;
+			}
 
-			if (ssi->irq_rx < 0)
-				return ssi->irq_rx;
+			if (ssi->irq_rx < 0) {
+				ret = ssi->irq_rx;
+				goto err_release_dma_chs;
+			}
 
 			ret = devm_request_irq(dev, ssi->irq_tx,
 					       &rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
-			if (ret < 0)
-				return dev_err_probe(dev, ret,
-						"irq request error (dma_tx)\n");
+			if (ret < 0) {
+				dev_err_probe(dev, ret,
+					      "irq request error (dma_tx)\n");
+				goto err_release_dma_chs;
+			}
 
 			ret = devm_request_irq(dev, ssi->irq_rx,
 					       &rz_ssi_interrupt, 0,
 					       dev_name(dev), ssi);
-			if (ret < 0)
-				return dev_err_probe(dev, ret,
-						"irq request error (dma_rx)\n");
+			if (ret < 0) {
+				dev_err_probe(dev, ret,
+					      "irq request error (dma_rx)\n");
+				goto err_release_dma_chs;
+			}
 		}
 	}
 
-- 
2.45.2

