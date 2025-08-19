Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB620C48A
	for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615780; cv=none; b=s5BivQm195UrHXllRfsNzRdvv5SCbc6TV5irS2bO3+7BLu05916zyC61AJth0DzcVoGukMUiXU79Hhio7baBY0oaQC/lhJsGlKKmjzRQ+vT1eLXDGCOkNXoNOKTl89SETTN+b8JESzF1eYEy4H1Fdm4wGRWL684jzAoV0ClsTAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615780; c=relaxed/simple;
	bh=nDsBN31ZPTJxWv5+xI/XKIMoevKJa238JoEMH3TkX7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYA3AfkaOYQbymCOCxrDENHl6RW6gkTaCIoYqd5oCdDOd68LC8xACnxMsTv98nK4r69ZWeQ//PRmAAEvqZaw4z7eQkEe2zpAFe/+FCOzlzslI35ypvopHkNoEMjb23SiNWYZM4temBACRjTsBcfVls2F4bViyC8u9+vXqCwP8Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lM46UYUv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lM46UYUv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3bb2fb3a48aso2093171f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Aug 2025 08:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755615777; x=1756220577; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7444yQJ0rbL29maRl29fRLR2UuJK6Q0bhtUk89IdD0=;
        b=lM46UYUvzuwBGRf6sqgIXwzjuOMkbQsnmFtz2+R8hLhfxzivfroRVDUEcjweD5prk8
         bRg1SE5HuXpjI9KO2/heIhzQ0cFW4ERxBT+XWl5NnmvXQMf6mXfdQVDHh53JBAInmrsU
         l8+jGse2VJZgbvo3TKpl9Tm+VBwzDf/T6vZgFh8tp/J1nSwEsvU+BmESCJtvoObHa6Ne
         RLXel9FqWM4NdtD55ZPEzxNPnbzvuNZizhIV3oXGcKtrEpP/Twlas1K+63+HVF/4Gtpw
         hCq1nrkIso071vnzo6LU1BuVtwcBZpkUv7sFskQpq/HJeVTUETNYiqcsoxs9d29PVSyf
         9bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615777; x=1756220577;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7444yQJ0rbL29maRl29fRLR2UuJK6Q0bhtUk89IdD0=;
        b=gh0sogR7sSJwAqOZU0+aFpZuK3PRodPmdQWWLslHCDg+dxxyXIc0Y1pfbyZDlEz7yI
         em0Vg1w1uHzU8oycBFlpg5dETG8An26aLYKpXHO3O2cwuN9/Q+gSo3JQ2fM0Hb3LQ2Cr
         Cdx8uFmX6vKkpTZn/nRHuKGYKciWX7KpKW8Nnu7HWqvEh/avVDZji46y0xsiS4uWcrZM
         5c2EEvVfh/6ill9lmzd8ppnCKmxeP5t04ZPrRNGkoiHrHiQqu9XJna4GX80LWZ3DZh6Q
         44XwFbcKbi7h+/NXfDxOkqpFGuVctVW7XyPW/V6G3fQxpd9WW5q1VabKpQFusxj44c0A
         H9/w==
X-Forwarded-Encrypted: i=1; AJvYcCVn7ZD+cyyzjLBzfXJHBp889dAmPqGcxAPq+G5BY2i4EzyNfq4rRUw+XSP+ETHti4m9+fmfZyDuaJqPPkWRZCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbamTPZcmaZAj1YU6kc36XualG9brAodwMuNHpZyhY+NtrCCmL
	7LsxV/AO2BQkH8QMHWdL3Db7vepL4zjLeJPZpFhOtqU5oZuZPIbFJP7ZtSkv4cikZPU=
X-Gm-Gg: ASbGncv1RZsoR48W3MizvJf2K2rgfSTtTUXgu6F87MirEAXqp3x4z22KX6MMsopSRtv
	2jZA8oi72BXxD9+zA6CUKKyCJzDKk3RpKdRsmlB+qI5gyC69os4rO5FL6ClWgsKHtJar/BQAw65
	9Ylbe2QxUxXR10ZumhIjsQz+g6zupAo61+5GGEov507rbUNtDx2ZaWqKHnRIcjIXLOazkk8yoe0
	qURDBKBvZMzUA6IcguUVVb0yRcz0jww4RHtD9VtoT358Q07xXOUYlkqBmCA5JB3kHbGJnC0/7e8
	jemYR+Ago+jg66pHdRZzhuZ9WvfjDZ5tvHUuLf7/K2aol5ViYEyWi7pdqNQVDnNHA1LhwbXwD8Q
	tQdGU+GywrcRg+taJU6TrO7jnc6j4OFJS3faOCQ==
X-Google-Smtp-Source: AGHT+IFWnJ6Oo82ofz39gNSEwN0Z3yDLui3rTcpuA0COSeut86mLsEFA0jwdaleJOlWjIR41+mglKw==
X-Received: by 2002:a05:6000:2404:b0:3b7:9d99:c0cc with SMTP id ffacd0b85a97d-3c0ed6c38ecmr2311284f8f.51.1755615776853;
        Tue, 19 Aug 2025 08:02:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074879864sm4134355f8f.13.2025.08.19.08.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:02:56 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:02:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Song Qiang <songqiang1304521@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] iio: proximity: vl53l0x-i2c: Fix error code in
 probe()
Message-ID: <aKSSHTdJf5QoYiRx@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 65e8202f0322 ("iio: Remove error prints for
devm_add_action_or_reset()") accidentally introduced a bug where we
returned "ret" but the error code was stored in "error" if
devm_add_action_or_reset() failed.  Using two variables to store error
codes is unnecessary and confusing.  Delete the "error" variable and use
"ret" everywhere instead.

Fixes: 65e8202f0322 ("iio: Remove error prints for devm_add_action_or_reset()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v2: Fix typos.  Add Andy's r-b tag.

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

