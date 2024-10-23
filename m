Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D749156F53
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672262; cv=none; b=ARKgMRaLzNOm5jyrvAeox7N9qU1oCr4w99bNTKYoRQP/31Bs3bjYK6cqmPEUH5Ez3g/ZdL64TASVzj0zvYlzaBgZhAkMeGlfZxacwHa6ZmSD96Qgi9Kys0GLI5WTobuGvwqUUMD15XC4W9/5Ptsp5wAxIDBWS2ry4QVjtFUMUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672262; c=relaxed/simple;
	bh=OdA/Lx/g/+rhQ0Eyv42s39kdQJ47dqmOO55WQ9F/BNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DOUDf+CRWQ0N0vmIyo9SUt05Sad5PhhSIVTp7YtGM17sIY5jyhXdx0VyghmNjfePrF50YUv2OxHsM6y2eluCUroa5GBt5gTm9o/VeCQsGPBszrD5kAg1vmSHkUo5/UTQkqr45hhCqeVMs/LBKuvyJ+ZuPpoJmjvylkMaMXRvpgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCffsi8r; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCffsi8r"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d495d217bso6258570f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Oct 2024 01:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729672259; x=1730277059; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJjPAsY+OlQh98BPt/llnxV3HvdF91YFt70SYWdsuBw=;
        b=UCffsi8ruJeTbOB+j7Ita1rNp5XIQYORV4U4xd1kLr3gJsfTp2Eky9MjmnpvE0aNb2
         pk7lzbpud6jko6DJyrxuvm79bc/f8UPsCOjbUcW98QmumfFLiAoPYnbgSKpiA609wFoP
         vFJ9IBwRXeCD++rhCJj07wxdjiqhr8QSkdNdBqzg+bg0Exr9p11qQgogbT2nqmrILBnm
         jbQbSNbwYXY6Z8HOt/dTgqMM1Uynpee82hM9QQZUTgYZsje4MY7qBArIACjyo8pcYA3t
         IrxK5fM3h6STIsF1hEwQgC9w2483mS7uqPmHyuf8M2hkhGft89NzqHxy8rEbPwznqRls
         CoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672259; x=1730277059;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJjPAsY+OlQh98BPt/llnxV3HvdF91YFt70SYWdsuBw=;
        b=wWU1boyWWEK+mXG5jUdT0L6prCb0B9TEBToJ7Ea1c0eVlc0z0rHAS8ZWNZk7r+k/cs
         WesL7cVkcMYPBfxVi8uELrQ9tjHLbB9R3reYFthsQ4YKJ1SKnhc1d/P0W3ZMSK3S1nJ8
         c+eHVwvqbt2I3CuWmaiQkZRJzkagjdsClC6SEgTFAkR1FnIpKkT+cRHkQsEuKg/bR3sH
         rKWJPcgEnk0zlx49/tmiFPa1KYJpUqw3lvKLNK6Ylux2oeEnOK0+JO1Wc9ze/a2CgRXI
         memQpHgW028wfCAucNUNU6AAg4pJFr3XQn2u1uSFSIOAu/xfloIp+C1MqZEFBWY63KcI
         3uMw==
X-Forwarded-Encrypted: i=1; AJvYcCWrlMheISfJAg/ZUDSl0K4jsFlT/c7+RFg4v+EDSU2nq4gXXP+6F4N+XXf9qxpkE3CVeEyCoDXthloTpYGh6u4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYWgSICIfqABUIHkmw4NMckdkJKoWsCFwfhF+9Cs88BnhbVfIe
	Wx7lTwZLdUTTUTMVjvKKEvwELdHkffm+VgQ2lifSSSM7CeRwp0KOXvlhvSs/K64=
X-Google-Smtp-Source: AGHT+IHPU6nYNwgDM+9I4opxX+G8CARI27qe3xwEGfD9/YcLKJqmhTD/E8EfYj2M4UlFJjONaqKbmA==
X-Received: by 2002:a5d:51c4:0:b0:37d:47e0:45fb with SMTP id ffacd0b85a97d-37efcf060f6mr1389418f8f.21.1729672259340;
        Wed, 23 Oct 2024 01:30:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a58cc2sm8381119f8f.54.2024.10.23.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:30:58 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:30:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: raspberrypi: Do some cleanup in probe()
Message-ID: <fff40b7a-20cd-4933-9534-1f72435bded8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If devm_clk_get() fails then we need to free "cfe" before returning.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..1da58b07c1d3 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -2343,9 +2343,11 @@ static int cfe_probe(struct platform_device *pdev)
 
 	/* TODO: Enable clock only when running. */
 	cfe->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(cfe->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cfe->clk),
-				     "clock not found\n");
+	if (IS_ERR(cfe->clk)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(cfe->clk),
+				    "clock not found\n");
+		goto err_cfe_put;
+	}
 
 	cfe->mdev.dev = &pdev->dev;
 	cfe->mdev.ops = &cfe_media_device_ops;
-- 
2.45.2

