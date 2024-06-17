Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638F192B94
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616698; cv=none; b=Zfda0zccuzMMjBV/tAJgQfx3xcqzfVkVLhW2Ot5Rdbjg3XX+HTco+4zKXJxdKrjAWfjjWS5m3GrfssnZiESUNltjG9+BuB5r566T3yMS0yHbnKi8U/PtKqA0f41jgadKfho2nl78Vv+UcuexXZevbGGa6/9/AEQ2KJGfF2Jsb4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616698; c=relaxed/simple;
	bh=fRmLFWtad0MeVfCzJRA49BbTleCC61mmZxAFsL6FegQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJQUr+GFkCxxdhvXJCwDdpkwx1i9BmPMenX0MIHQQBBiYFmCn1f/dxjuU1KRTzbSsSbZxyUKNm/j6HBicAlF2klr2VRqgJzTKjHUmD0zxmquvDVd6ZjuWT+UdGMNnI0cYnsJsvpfomIhl000rQNoXdQSGNNupwHDj7KLCzwgUmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0OO7ZoJ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0OO7ZoJ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso44978381fa.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616694; x=1719221494; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIKWXjEnV/JvaI/YdcZiIYzxlyFqw0Iq/qRXLaIf03Q=;
        b=x0OO7ZoJl49oJhq0ieXzpJJr+3gLU1YvJuDb3UA61aLIlPef09wrEnFtAcAEVEhssv
         T5aAin03VqfyFkWmBAvbnMTp28Ea8DwukfEuMKhtID/45UdJrZTITMYVD3n+RALPUTpn
         Uhqziz6kB4AlR9gMYjItAuohJK4+6vj/nROl1we/5iMIPmTlDsFVGjfDMvZa+sh1flPY
         PVY4cE5dJ4sF3oMKTzwhPK55TEiSxHmiRi1glIxpI+sUoX8YJatxZxp6GsPAik0Kb9sw
         /1ukV49jpq7HOzzFNhsXjAlhFJaSYChu7GY6UxUtB7NW2Hc4EfNk0J5NBTI8gb7YD0eP
         bo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616694; x=1719221494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIKWXjEnV/JvaI/YdcZiIYzxlyFqw0Iq/qRXLaIf03Q=;
        b=DFNoqv2hC2JARKBXR0G7T0sfb5GidAW2hwy3lv/yPEQTpOjOaUo3wX5mM2rmzov5Br
         lMujcXZ2J5ggyQnb1wJ7B5z+Jw08X2/vSfKsU5PFMkycGtGk/nd7OxHSSX2frUsltttW
         DDWSMD1UJLsLSXwqGi+Bnku/+gnpbY63jU4A63gWcoCe7r5Av1jWLpcanykN7x2NkbIm
         Vi4nF0J8+1OJIUqfGXkepfDF5dqTSLwKDP1Qz7cKVWAQhBVv85VcfR7MsZCR6tE3NIH9
         jEje8SeJ6eA6gPOtFFsB0K1TRv59suRekx13kBfsnjbVwukv2s3wtdzqM1cpOCLSY/Wn
         NYIA==
X-Forwarded-Encrypted: i=1; AJvYcCXwxdOBup+HNoLxqGowpeBbNbYcWv8dnHZjYg+tY92pGMaPMH1uXSLPvdOyWDzWgevmWHT7v67WgBmHiX6xL0HBtW1YpC4zMBcDvCA+zFHy
X-Gm-Message-State: AOJu0YxzTC/Ffi43iCTYWIQhrLhQ0wrQXHEZomckA5cDnaDQN5bXU5KU
	ZVoaXDEH8gbp/JU6VNd8K7LN2ueFRPIKUgUCKvuV+9cx0EYcf79yyz52k+jJ/3c=
X-Google-Smtp-Source: AGHT+IEODBDEsxxAci2aBLEEjswUYh1kr6DsZMBMYgj0029fdsBS+kjBKhpqZUVlxzZYUPOZnGGZNw==
X-Received: by 2002:a2e:9217:0:b0:2ec:2617:ad4 with SMTP id 38308e7fff4ca-2ec26170c7bmr29025681fa.43.1718616694419;
        Mon, 17 Jun 2024 02:31:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4229447eaa5sm186875575e9.48.2024.06.17.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:31:34 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:31:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: musb: da8xx: fix a resource leak in probe()
Message-ID: <69af1b1d-d3f4-492b-bcea-359ca5949f30@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call usb_phy_generic_unregister() if of_platform_populate() fails.

Fixes: d6299b6efbf6 ("usb: musb: Add support of CPPI 4.1 DMA controller to DA8xx")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/musb/da8xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index fcf06dcf2d61..953094c1930c 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -560,7 +560,7 @@ static int da8xx_probe(struct platform_device *pdev)
 	ret = of_platform_populate(pdev->dev.of_node, NULL,
 				   da8xx_auxdata_lookup, &pdev->dev);
 	if (ret)
-		return ret;
+		goto err_unregister_phy;
 
 	pinfo = da8xx_dev_info;
 	pinfo.parent = &pdev->dev;
@@ -575,9 +575,13 @@ static int da8xx_probe(struct platform_device *pdev)
 	ret = PTR_ERR_OR_ZERO(glue->musb);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
-		usb_phy_generic_unregister(glue->usb_phy);
+		goto err_unregister_phy;
 	}
 
+	return 0;
+
+err_unregister_phy:
+	usb_phy_generic_unregister(glue->usb_phy);
 	return ret;
 }
 
-- 
2.43.0

