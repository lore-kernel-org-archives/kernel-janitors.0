Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E708269815
	for <kernel-janitors@vger.kernel.org>; Tue, 18 Feb 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883961; cv=none; b=tYeUctGBkTIaGr5S6YjypruFsBwbCeo0+HY2QyjVlJ6ReaHJGofUUOn0HUnTuJFtV5GnYkcLmsBR65mbbybAnHrPswQ46+x/YPCAHW6Kq7yC++0iih2x8nIUZCu15Rf7quLImvAnPETbe0KjR2hF7w4Q1sa+oRh8QFtRl5WijgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883961; c=relaxed/simple;
	bh=4qkh8yLy8dDdZM21T9lsKyPTqQzhKGIVigwfv4cqQ2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8K2f0OKIKQ8BQ745Oi8FZaxCCxfarLYBRJHd0ygCJBgyCzljwybHDYibp6keQDeyBM7nTKeyBeZWWO7v4QFzYnWpOGrPlmNL9mHE2Y4hA4ZFFCjvujNq7PoLRkMMxr4KBz5D5qANDNRpNbTNemmnLbGWKyFq6KdfTUnuakUAOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SfuWBYV0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SfuWBYV0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abadccdfe5aso673654766b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Feb 2025 05:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739883955; x=1740488755; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kasHUX4bzeiCrVBmf7mcD2rXkVNVkykZ6gjvVSR3ULQ=;
        b=SfuWBYV0e6WFQq9q6DWaRHs/D5VVlhArm4iAsWWis9S4c+B9STONknQ5vwHbX72XHK
         A24MtlGLOISPMGcoX50Z+GkIgI/CWynSiHxOxNBUIamyUs7QoBMwf3822Ayj7evV0VFK
         gw51z18ADrNYGjdZHHTyO7bZr2ua7FLKOfKS2EgX4wdjePcm7cxCIIOZ7VtGy2mJ7wWs
         ydsNRX6MpmBvMeQwlz/Zvo20fOm8P3Oc3tvs9t/0WvuZlB2sX8/kDmcSIYHXBrBF8ewb
         E3wRtC7clgMxSu++ZpIkmCEOiGOsIjkE/grgOJrpl4utZl385xMeBARkMPzrFd4KPxjv
         Acew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883955; x=1740488755;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kasHUX4bzeiCrVBmf7mcD2rXkVNVkykZ6gjvVSR3ULQ=;
        b=D3zM81F0ggQkPrzEPRjQ/pBGhsr+Jj3QLEsnvrZ676EMOihSEuyNLtOcc1rrdapRLY
         qqIpH78MPG2RuKchED8KxbHccx/VI3mYYcjtFti+1JUbFa4moR8mOc9G/Sl/RachWzU2
         nb6C0dEmCpZ0ovAgCX07yosplex4X6Wu6XEHgM4rANAGaG8v8Pnan7SuqXKGj9la5kGh
         W8V/hJgfQcw2xJ70mR24SK9pPGDgmbg21dshDAcviHAMkxpZPemKaf4FAdBsfwVD0O5u
         W1AJxFa0+Fsw+UiioI9BODj4/Mel6R9MY1JnoWM0NXOo5kbefxPGkTzIfe9xtIsFynzT
         wFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0pn3m/pPpimStabrA1em4J9KYA9n2jZECyO9f+ZXfc949qERgh5qZAKRzpa7sNrcC2x4tZCBcXOLcX8+MC10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUD7bpUuBKCvBQoJ+SFPy481Zp57UXb4Fd+WKCJmi4E0VJ8FU
	e59rn1JIH31h6/+tTS3BxO6JBvQLGH1Dn1sIcm//bm3CIZVjtw9rgF7ZH+QiHBDiBe/liALe4X/
	h
X-Gm-Gg: ASbGncvqmkuv0vAw2H0FBL+8F70ESrHbOm+m30xI7MTo+4A4wMsB4Evr3/EdzBLkV8v
	pVsLkVTQChfXQLe2aA2ukKuudmCDjP2vh2/Dss37KnCkXIuRZT+GQHSgO2htZNVtlfqC+3Ogjgd
	MR2RepE8kID1Lv2esIXFpkRx7B1Y3PYyAAs701EnOnKyQa3MJkIqy6zni2eS83PsjuJRlg+/qda
	VKG0Y3QukwtFnRCUGONO27oYqwexx2Ta3P1P2DVYvcU/mXhZwTdasDa6q+VV8X5PXjdZV28q8RT
	eAYByEaKr48B09nvt1lw
X-Google-Smtp-Source: AGHT+IF2qeAel4OTdeuho/BN/9zq3dRQjnmGfMFgYzkqOj53acAaPZ+YeAFgAYZN9+aL4nEgHblvKA==
X-Received: by 2002:a17:907:1c21:b0:ab7:faca:a323 with SMTP id a640c23a62f3a-abb70d677c5mr1438999266b.39.1739883954756;
        Tue, 18 Feb 2025 05:05:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abba9bd6e3asm261505566b.58.2025.02.18.05.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:05:54 -0800 (PST)
Date: Tue, 18 Feb 2025 16:05:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: i2c: imx214: Fix uninitialized variable in
 imx214_set_ctrl()
Message-ID: <1e4da85e-b975-4638-bd14-09ba0675d9d6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

You can't pass uninitialized "ret" variables to cci_write().  It has to
start as zero.

Fixes: 4f0aeba4f155 ("media: i2c: imx214: Convert to CCI register access helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/i2c/imx214.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 6c3f6f3c8b1f..68775ee8256e 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -795,7 +795,7 @@ static int imx214_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct imx214, ctrls);
 	const struct v4l2_mbus_framefmt *format = NULL;
 	struct v4l2_subdev_state *state;
-	int ret;
+	int ret = 0;
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
-- 
2.47.2

