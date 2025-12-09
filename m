Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A2627EC7C
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765263396; cv=none; b=bvljfBYt96uI9pgwpnXGzAxD+ebQDf2UwM6U0UNY5JmcFhuB+zb3wzgUcQcQZpiLAOkju6lwDM2/ToraG/39q7VBWmymBrXqLWv7C7+C9YPIlOccNOCBY3pmcD6It9SYI6/OHiV6z+fI2Ij/l8XTPh8bxA2gCRlXhUvacicxNzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765263396; c=relaxed/simple;
	bh=6iFRA45dPKiXNveZ1wXay7FvVPKi5iIumQ5qYPzeCM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qiiInK1TtyIwi9w9zcsShPBeY+pJz9x9P6shkZfPX5ZIzDZI35sd806m8oVT+OYZ4V+xZ1EfZXuy9AHX3Kq+QpvCb+/W6YCbBZCPuiNiWPTYGLupY5sk/OMQ4WeFNIf2RirEyUqkP3qKeeWrZyrAvQTuPMM1Rfb/Lo2f/k7b8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iRAeg8LH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRAeg8LH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so68318525e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Dec 2025 22:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765263393; x=1765868193; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHIRJtJwasNsdM3LPTiBUAFA6xA3CvX5kgG0LlrG2hg=;
        b=iRAeg8LHh5av5qRUAgYIXTyWApRzZvcL4/lwtwHK0NpPt0jqD6HiL06BYAmF874A8b
         ugqHAqTg7syPnWxNM1YaMNBLh+LpR9eWTzW7Z8Bs99et5Q+6HpGEGHOiBhl41NFFRXjq
         5TycuDZhRqFh1SGixCK+aBiZ8NHw7smimGWRfUuExNNA68vlLfYx4rRg2rp67A8+DZ20
         kf4miUEEWbQgTN50GvRbkwWJMwVq83Do5FmIXH4nwmwYerljcrtuBZZIh+iPly1Ttd4f
         QEqlM35pL0CA/HhpziNUAR7BH+jwjW+c/aJlLaE1TOVlZAbfDta+NPfzwUFFszdmPLmg
         b2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263393; x=1765868193;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHIRJtJwasNsdM3LPTiBUAFA6xA3CvX5kgG0LlrG2hg=;
        b=aSGvkMJZRVISUfcozCn5C2w7SIket0q8i566Zv71Vh6MPliKf45Yl0AA1G/uCZzCLX
         QrDWYto7Tc0T4P2KYqJiCLLQBpT7n1XrBvFZ5GRXjvN6Cr6ifT3hKhGZonO0kpxR7+Lo
         /cZnmkAnkEe8PSAmq1R+wu8hMaA6Pf7+T6LB1Q4FOzy6xwVIBreaYwtKswZW454NxpFZ
         kM6/K7th8bO9YdJIs3vw64Qr7bazNyze7rx0DWxQs+Jqd7u9PGyAmnl+zfLSfudT+mbZ
         adK9dKL7yxL2VF8i1R2y8QOq/Uu5Lvht3+7ezDhSK1xF/IEQBBX74D3abaoiuPMHyHws
         9jnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuffyrW49LdBVaWsiShUtmOXHTPAo3kJVhvn/Px8DtsSFhaWvPMKu6WvOZM78navsQBuXZJ7u+bmirWEX39dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycmI5MvrH2ghNIRm59aDZ/FhOWrTbJfQb7XAZ/VFkW8tRr5WEe
	mxuLdmt87MjAshyYxInAB74loa1tLm539KB5ZJZifFP8ABWg/yaN1FoQgokFQwCpoeU=
X-Gm-Gg: ASbGncujzMaV46/i5M5ah0n+Jyhav3mJAfApIFjbPytg3wEA0e1e2RMqtY2oB7DgCiS
	L4bd7ZQ0kYl81y0pjxMqDN/2Bps6DiRNGymkDH/awT/XM480hhHKziXe3ZkVtuS6TsXRqd43MOv
	Op8LcDVjSW2/M5Quq1k5W0Sa4wTdjPKLx2NBy1iocPdl8ZOKLRjZ4aM5Xk9RcxZEw61w9WeRK64
	UzDkWZHa8TaSY3w0os7a4BqQMZL81MLIR65PRQrwzJLGgR0OBzNuKTBkRZTBXN7W6GZThJSIyrk
	gVC+v19Wjf840gk83cBqm0eEfDy8gBWMFcXU9CPyo2uXr6oNOahb8DUFq4RgGdYpf9kLz1KluJk
	GKO1zNIcV7VD3QhKJSLcSmjteW/4/5J/9wekELwLaO6Qk3ejbyQogaVHKSqPaLRyeO5RL9AEnOP
	3m02sBY/lQ03SAuaCm
X-Google-Smtp-Source: AGHT+IEUTCsh2YjbuWgwjA9kSB0ES+TnIdyt4FuUa3p/09Hcq5GxbqSJOTL2WUyG6So5dXKx25k28A==
X-Received: by 2002:a05:600c:1384:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-47939df1478mr118585015e9.7.1765263392577;
        Mon, 08 Dec 2025 22:56:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7da2e4c2sm9447925e9.18.2025.12.08.22.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:56:32 -0800 (PST)
Date: Tue, 9 Dec 2025 09:56:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kate Hsuan <hpa@redhat.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: rgb: leds-ktd202x: Fix error code in
 ktd202x_setup_led_rgb()
Message-ID: <aTfIHE_2-iKIrwqv@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL if the "reg" value is invalid.  This is unlikely to
happen in real life because it comes from the firmware, whether from
device tree or ACPI.

Fixes: f14aa5ea415b ("leds: rgb: leds-ktd202x: Get device properties through fwnode to support ACPI")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/leds/rgb/leds-ktd202x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index e4f0f25a5e45..3b7f2272036c 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -410,7 +410,7 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwn
 		if (ret != 0 || reg >= chip->num_leds) {
 			dev_err(chip->dev, "invalid 'reg' of %pfw\n", child);
 			fwnode_handle_put(child);
-			return ret;
+			return ret ?: -EINVAL;
 		}
 
 		ret = fwnode_property_read_u32(child, "color", &mono_color);
-- 
2.51.0

