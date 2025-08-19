Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942D33115A1
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596387; cv=none; b=DgRlNvhpbXoFSj31yzaar6y8QYOccGyBqipDu/9oIBWy4wnhdOXVXqbGwuMKM4Y875duJhiVT5G/4KSyp6mmWzwQ08LrnbP/7E/YG4P2F/xYDQ5cXcNXLDmFUFTMK55cIH4BKCYxadYlOnx9N4KtYiKo5HbGM6l9QxFdOh1MWOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596387; c=relaxed/simple;
	bh=CfV42cEPw8lWB0t0dITt7ACs1R/IcMKpBkeea2hlqWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O7FWrTL6HgG9sX5atj0GFgdLPXJ53I/6p1gBiMUVL2k6ScQDlu3Rswq5O9dmNiVYCjI+YNKrKmUInT3jciJaVKeVqj8etfXPBjscMFlNWkkALqDhRvd7yEYiF2KOmLe2skz3ga9JTK+L23bmRNQmXYRehZxA859MgPl8qYu2LHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIoMt6qf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIoMt6qf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b0becf5so27532245e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596384; x=1756201184; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ybn3YmMAxEA0Eee9hCzXqIV+SQtPmXHBsQojxOHa/s=;
        b=bIoMt6qfJ2e6rnhvsGoCBzmHxajT9W/3pCdj3TwYmSKgMIkgWxtJB69lwWODrk++/e
         uSVLBHt+UHTJOACI9pxlLTkGv/WSJVgS5Tn+AFFwAhYiBN3G8M96KUI94dysOowyFkSq
         H0GAoAsNIpXJvyyO3zYdQFiP8z5th2X5zHx4Cno3iJvASMoJaLQrd0h4azA4kQnqNZuj
         /eQzrk/1/zsb3YjkN+XkFblnRrlIr3CV0p8qeYaR6VS9+/mygj2Lk9vbMBo/afSFhy2c
         KCgqqsLZkQKrINfwB3kWt3UYvMLNmgQm7TDUdBvjOVjJM3lRNweH0OaXqDlAetLl2U2e
         QTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596384; x=1756201184;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ybn3YmMAxEA0Eee9hCzXqIV+SQtPmXHBsQojxOHa/s=;
        b=DdM5zrFpUii/sq8Eyk9l9cC0EaTEle7rpfNMZ92F3tyBlipVcF2wpWY+vfRvSOMpg1
         qFpBsqwyZBLWSCDxE0QiyvPL1FCUhqKePX8Q5BruP5TDjvQrwqJow77rR0hPw+gwf85D
         2tz/xih4ztG/BLmFXALUunici7vLu+ghNzwtGQhRs9mHGeasLNr/b6gIiDzRKuOSbj8g
         mnD44uMY2X5HKZEdcjwCAu/aH33vHv7Rudz9IJn5UsN/E842KGkhHrsyWvJaK5ACiVYa
         RUbO+CO/0RZJD4qeLVF8nm1L6yeWF/D0JQtrq8ZpmOorbQOZfzei5e1De19MLtFSFDy4
         eTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXunEAYc5aBaAYFOJkqDx0SgNfnx7vsORMqy5HMbSEG/LF+0D5aJqfffpytd79e2FETqTBM/TOtMvS5janCPTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZYWbYFwFAVt2RKeAB0KnXW7cf5vef9bDk2h1vu4mDktIivnEh
	0omIAb8Uw0OJSNPiaTxtadaTqqblEvF0jeAvdxQjocfaWgD1BURKJJJpnecUh74AVQ+IrTaE2F8
	glOx2
X-Gm-Gg: ASbGnctyP6/O9SDNnXSBCNzOt5s6k6w4j4u33UxfV+x5GECRSuJK5jSJV7ZDbOKjKJa
	mJTxweYTCCUSlHn3i9P7B3qAazEmkQK/YnH5RVtvwgGPfWOVdvNfQEpV/aMgVhkhbJMWyZHMzoC
	2QEyAHJcdYFbFTc5r027Lv4A5yTEcDVnMCDR9ONhKFWZdUOZqMfgZrTfk/JDj6u+xsfgd8BUz+o
	gHGfKUWO0EilgkvDohBopP+cq7EOtYpdltpg2zjEH8Nrt0kQqk3qEYEmrgO2OUpQDNZnDqwnMHV
	pNV4552Dmgib8nxVe/HJibnE++0ADcO6wfplk1OWnR5EDwt1hMLyuevxevkXTEwrz/x3wOeSxFk
	aAXqqBl6uzIJUi9fch0ImlMvYs2FkM6R9dpNDffAqtaA=
X-Google-Smtp-Source: AGHT+IEaFIhVwX9haJqJj9y8XmIJjJBEgfC6H62/4M1ejGfKBt/x5SRVvWKacOOoQ6lNE8CMUtGT0A==
X-Received: by 2002:a05:600c:4fc7:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45b43dc5099mr19675405e9.10.1755596383877;
        Tue, 19 Aug 2025 02:39:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c773e57sm218767735e9.23.2025.08.19.02.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:39:43 -0700 (PDT)
Date: Tue, 19 Aug 2025 12:39:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Song Qiang <songqiang1304521@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] io: proximity: vl53l0x-i2c: Fix error code in probe()
Message-ID: <aKRGXFJxf2bdQE-Q@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Commit 65e8202f0322 ("iio: Remove error prints for
devm_add_action_or_reset()") accidentally introduce a bug where we
returned "ret" but the error code was stored in "error" if
devm_add_action_or_reset() failed.  Using two variables to store error
codes is unnecessary and confusing.  Delete the "error" variable and use
"ret" everywhere instead.

Fixes: 65e8202f0322 ("iio: Remove error prints for devm_add_action_or_reset()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/proximity/vl53l0x-i2c.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/vl53l0x-i2c.c b/drivers/iio/proximity/vl53l0x-i2c.c
index 696340ec027a..ad3e46d47fa8 100644
--- a/drivers/iio/proximity/vl53l0x-i2c.c
+++ b/drivers/iio/proximity/vl53l0x-i2c.c
@@ -311,7 +311,6 @@ static int vl53l0x_probe(struct i2c_client *client)
 {
 	struct vl53l0x_data *data;
 	struct iio_dev *indio_dev;
-	int error;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
@@ -344,13 +343,13 @@ static int vl53l0x_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, PTR_ERR(data->reset_gpio),
 				     "Cannot get reset GPIO\n");
 
-	error = vl53l0x_power_on(data);
-	if (error)
-		return dev_err_probe(&client->dev, error,
+	ret = vl53l0x_power_on(data);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
 				     "Failed to power on the chip\n");
 
-	error = devm_add_action_or_reset(&client->dev, vl53l0x_power_off, data);
-	if (error)
+	ret = devm_add_action_or_reset(&client->dev, vl53l0x_power_off, data);
+	if (ret)
 		return ret;
 
 	indio_dev->name = "vl53l0x";
-- 
2.47.2

