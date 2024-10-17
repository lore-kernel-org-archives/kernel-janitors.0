Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BE0219CB0
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729197268; cv=none; b=f641QZ2ZRhIXQRJ82MQnkJp5WFyEXYuKWKsC3czltSev0+Ub7DnxYYvKxHus//2VPNOMeOuS15C+eTQYU+uNgEzuCagNHOWDuNDb1+KJaJkW/bGmhIyqr9yj4+zAs+IulR4eqb2ieEClA+KJFUFH2iNHXapNUEj4KibzoHR62g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729197268; c=relaxed/simple;
	bh=DpHYpfP4wfR+URtc3nLIT4CXA+r4pWyOSFTF/zEameU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jYJzxwG92mHcOOLN8kvkEx50E62vw2c79w883bDygmhcsLnaVL32SBabTX/4bltsJKChUBf5lT92UDNr3UgzhCjBTscEdEqEgzAaI8DbD07r+c49+cbPdxT79AqD7X5KyRsTmYR/Tl7e2zD4PlT6+qP/ss66eWruojtXIgPMlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZvdK54on; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZvdK54on"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a99f629a7aaso244562566b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729197261; x=1729802061; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGfGq8AYZ7Nk9tfcNf0RUEE9wnLOSE1tLqUZ0uRmdU8=;
        b=ZvdK54onCQZMwMu5h0gfjMtOM2ceD0nIXRT51Nmr7qtJjXHbV7JZew+pwlBj0Ha4JY
         bNmQ0J7nwwBcYf9N/Jo6MsYkCDMDHEbmz+RueYlY/USCt83DYEnq3u9ctkIS5w+GDuE+
         83MC4FrhpB6LP+c5US+AhegZFaeWFyuyc2IklgujaL4SYcbFKB/21mPmjw/cwvQnYQX3
         OsAi8Yaw8OdtWMI4EzhFmbdUqfAWJ2ji8EZ3LXHYqITvTA+vcz7UuWZH78hdD7U1Rx4f
         pgfcDVenGTdz+nAVZ7quikpHThYMIXE/8j45MIDWbZDIlraMvBjgfggTPDo2L59cmNDB
         h+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729197261; x=1729802061;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGfGq8AYZ7Nk9tfcNf0RUEE9wnLOSE1tLqUZ0uRmdU8=;
        b=sibwjuz68pGldsxsejRslIFhtu51KK/tHG8eAMTWNsl1PWuDEt5cAo1cg/ZqQ3XYN4
         5fo/32g3fXmg9obFFeMjasiUz/JADR949AMObGDQLySqYaTJVPQVTT9QQOB3oqXKhIRO
         1+jax+I62HXnovDH8ATRpvNAWnwWO7e15xhV45+pr1UtLdN4Qt+T5GkRtMmb7KfGI9Va
         hP2I7oBaPoe4VNgJs5Ez+CxKZOPk2NyU5+NSvG2ddkf6i749QRIRxw2UFXcMVP7XKU5m
         Pn0iaOL+k4CVXiSLk0DRQu8mDyp3rB4Z5O0i0dyWs6S0LJo1zv20oO25GnD3zVGYbvxA
         VYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWW6Is02sPbFaMufd6Zf7Fy7BcwUiDg82SOirP/lcltiTPepsP51k+3uOhtbz+TwwRSegBhKTNIVCrcp5EDxr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+tTqtcfhGu3SYkf8RvHXJMCTtrM7Em7PSsIokjskurBLK3BZ
	nM/loR3e1sDU5ecydRzFNowYz5iO4bAy3z0g16lv50vbX3h5IL9k6ENgahyM6uc=
X-Google-Smtp-Source: AGHT+IEmgPvX1kkIRYEDJUNIKySkuA4+HXCNFKzqTi2T8I5tzNgjLRaV5zSnWNszCG4Cmi9deiEQMQ==
X-Received: by 2002:a17:907:9404:b0:a99:ee26:f416 with SMTP id a640c23a62f3a-a9a4c2ef2a6mr454115166b.14.1729197260600;
        Thu, 17 Oct 2024 13:34:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c284dfsm9818466b.197.2024.10.17.13.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:34:19 -0700 (PDT)
Date: Thu, 17 Oct 2024 23:34:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Qian <ming.qian@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, TaoJiang <tao.jiang_2@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] media: imx-jpeg: Fix potential error pointer
 dereference in detach_pm()
Message-ID: <ZxF0yOCms6cldOlV@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The proble is on the first line:

	if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))

If jpeg->pd_dev[i] is an error pointer, then passing it to
pm_runtime_suspended() will lead to an Oops.  The other conditions
check for both error pointers and NULL, but it would be more clear to
use the IS_ERR_OR_NULL() check for that.

Fixes: fd0af4cd35da ("media: imx-jpeg: Ensure power suppliers be suspended before detach them")
Cc: <stable@vger.kernel.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: The buggy patch hasn't hit Linus's tree yet, but it's destined for stable so
    add a stable tag to this too.

 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index d8e946aebba2..918ab12edc9e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2679,11 +2679,12 @@ static void mxc_jpeg_detach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	int i;
 
 	for (i = 0; i < jpeg->num_domains; i++) {
-		if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]) &&
+		    !pm_runtime_suspended(jpeg->pd_dev[i]))
 			pm_runtime_force_suspend(jpeg->pd_dev[i]);
-		if (jpeg->pd_link[i] && !IS_ERR(jpeg->pd_link[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_link[i]))
 			device_link_del(jpeg->pd_link[i]);
-		if (jpeg->pd_dev[i] && !IS_ERR(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]))
 			dev_pm_domain_detach(jpeg->pd_dev[i], true);
 		jpeg->pd_dev[i] = NULL;
 		jpeg->pd_link[i] = NULL;
-- 
2.45.2

