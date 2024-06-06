Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ADD195F31
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Jun 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679540; cv=none; b=ZlqFeH9bU0N4Jf7xHCnHcqfPMvHBeXYfc58B0ysFTvKZ1B/ewCgxIsGqcHKrT/LuptWmN+1/XzJpvnua954pJIe8tvmOc5OXoCIVu6mbJpn0/9RSgUPftzj6JGUaSkz0lAq6gd4IMws+AJ65rslWKC8f5BOmcfLTld6cOoq82Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679540; c=relaxed/simple;
	bh=me6Ty41cRCSnMOmdHM0XNnCYCzQRzAGcL0KUR6aAOg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZnG9bTzkzTzO3Y1ug76v5L5a3IAK1lzxwEP6Xf7BFN0de5ceyS2eyuL8l8zxxx34LdGgcf1jRzUQDJczVOx0EWYqVh5FNHs7aG5TzRmALUsilrukgGrSfSgOqAK2HmRTms3GMvlbMoK/+h0Pwr0IlwfPU+CoHxlMFXA7h6jUJzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgWk78SX; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgWk78SX"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a68ee841138so115732966b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Jun 2024 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679536; x=1718284336; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxE7l690bffTKUzQL4YoKYab1ziPbqqN+8E58otRGxA=;
        b=fgWk78SX8ddpC3EEREr42d64HI1y7nQ22Omr+c54YWBSAgm1ki4ftHxPuX/dFbrmax
         Vydb4RhUhLaI/5Qo1SU3NBCD40CpR2mab47hE4T6g/HAkZrTdg4pH5TO+SXWJygrmtGE
         1RTev4hbteS8gej3t/w6KljVdQRL/mslxzIGxYYdu9Zl3NKjlXPA7CZfrpDp7zse0pJp
         U2iuwZ7DG/+/aDsgKANoRzmVD0ds0xAXjqJFTrBcN1Hv6LaWP5kzlVLDsTMlawHrZtL1
         pn7LHVIjUj5gXUJN0mKs2A7hjbd/UnuUobLRcscDga1WQoJIrYYu/sOPCoh/vR9qJYuc
         zICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679536; x=1718284336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PxE7l690bffTKUzQL4YoKYab1ziPbqqN+8E58otRGxA=;
        b=hESNIIuKnlVWiz1fhy9CHH/PJfxYLBz0pYU3/O9HItxP6IDx6C6VFIfSNNkb5ZFIbh
         tNepT7OiUiBwGIOz98clKO0cKTv3h2z1SVX3UDUrvvZFyIcSNnIhZgvIJGt5cM8hL2/+
         oL63SPdzgWzI7OQbF2zw8+wwARKHXB+V9p5VFLA4WrOghW9ovAxSXfopCLTHUon+snsv
         Llsox7HUxF00dOiQoPZ56YMlBpR2PeI2+fyuEp4yyWLetlQD8wKIIOVva9s0OlctCBDW
         B+Qyd1dNSAgNDCn90gY5UNSMLny1R7J+6MMT0B4KatddtWtWPt/Ni1f6yhUAXubRiZlH
         wptA==
X-Forwarded-Encrypted: i=1; AJvYcCW5W+Z3SD50dEI0vVwVznGzRUe4tzzLdbextrdIeFS5cN62HEq/1q9DX8u8iwVVt0QP+CqpVqrQYpyVwQYDq3w7OMivP5Q24WyZ9MN63Ei0
X-Gm-Message-State: AOJu0YwNnAu3V9vgDhXHhp1oQrP8L/XwN1tIgtmfzbX7dd0JvB1cTPSD
	2Z/jRfyJZccW+Ch1bY/krYi0Xdm2DymF0LeUT98RBOYU7AvAxN+VftsudIM8sKw=
X-Google-Smtp-Source: AGHT+IEz8YfL+SCPuHJF+3F2Q+2LZ4go3JrKNs5304zCp0iKQZ2Bs1sP4ET868nj7mSwau9p+NP6xg==
X-Received: by 2002:a17:906:390f:b0:a62:5ff6:c728 with SMTP id a640c23a62f3a-a69a025318amr374676066b.76.1717679535821;
        Thu, 06 Jun 2024 06:12:15 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805ccb1csm96890166b.80.2024.06.06.06.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:12:15 -0700 (PDT)
Date: Thu, 6 Jun 2024 16:12:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (cros_ec) Prevent read overflow in probe()
Message-ID: <42331b70-bd3c-496c-8c79-3ec4faad40b8@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "resp.sensor_name" comes from cros_ec_cmd() and it hasn't necessarily
been NUL terminated.  We had not intended to read past "sensor_name_size"
bytes, however, there is a width vs precision bug in the format string.
The format needs to be precision '%.*s' instead of width '%*s'.
Precision prevents an out of bounds read, but width is a no-op.

Fixes: bc3e45258096 ("hwmon: add ChromeOS EC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 41f268fa8260..b3ba7247e06b 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -212,7 +212,7 @@ static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_
 			continue;
 
 		sensor_name_size = strnlen(resp.sensor_name, sizeof(resp.sensor_name));
-		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%*s",
+		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
 							    (int)sensor_name_size,
 							    resp.sensor_name);
 	}
-- 
2.43.0

