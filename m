Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21626AAB8
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864918; cv=none; b=TjRAcjcWn/gLmOx2FjqvqSg7BoMM14XIuwVgMGYAORXQaU0Dvcze+JH7dwduEW6sTZtKN3xHOXeN4Bv103Q0ybrBD/tuxF/DK+ZCAEEfOq/5ikmtSk6q+fe9wG2GMUO95ERCYGc8/usRuPywLulEiMvymCTZOblbLlu3KLPk/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864918; c=relaxed/simple;
	bh=zuIu2JkP+VByMmwOo0tadAV1iHKJrDP3Abn1qg3Qzl0=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=TJpme/WZZSjs+nja7q9hUKeLzpE5OwRED92Mc99U3TyeLIiq0v7NHOcZfWAHIZnV5F0E5gr4cj0fJXJbjBgDHxXzUqlzhqo4uWhQuDSQubq2lNNpcVu3kfqsBuMw19qiHGEOJ6bo7sVdDCayIn3EyxTrQCysrXs3inn1C2U+UtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nwol3brN; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nwol3brN"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4067106dd56so18163b6e.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864915; x=1751469715; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yzp42f5lewsnvG/FHvqlSbFmAKtKH3G1kymBQyanvJA=;
        b=nwol3brNJkPydHOfJL1YVRo8TfqXQcm4eWAJEth22fouzj3WlhAiWdn4jp5UG2++p6
         GJw9fisPEldRd9oGGVfHhoWXWbecKe5MJMSWHeeW9qQSbges5O6Ikoh0VpnaC8NyNF7Y
         2Ts3umvqBE7mCqZqf581uWSYhktyI6/+MMC8FEV7b+qT1c/GYKYQa295RsynxSIdEWQL
         j0DBYe+MWDJn6keLNnpiTK8JqGRd8lv67CGnXPY5yKPaMCX2q9LTJbByNodaF5KM3fCl
         +sxlO72+LcCWgVIpBpO94CJqusF+3uAh1dP8FvQMqEZl3jYuE7Lz0NEkEZVgRXEjqX0P
         liLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864915; x=1751469715;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzp42f5lewsnvG/FHvqlSbFmAKtKH3G1kymBQyanvJA=;
        b=KTgv3LKYHWpMOtmE3Q+RJ9nMYAhouOH4wANVXhjUI1sDpPzeldLNyeudT1Us0wiDwX
         DMTGXMXyZ/d6WKjHrzC2wHKe+cRaeWgHbh0XAgzePeok0MLpTnPPD/NY576Zojaj6MYK
         FrQJ7ObUDrA/Xa5NWmoPdYlkG8q/7agUlg2FEHElXy+N9+8yc7x2KNtPpjI3CbqXU1GN
         qibl8M98toL49mr03EApeG+eM0tdVkvHCJSuAoOUuYi/LgjsIsT/TI4tQxTeDZoeyCb/
         iVKZ852CSAhewWFusHf6dMRFi5pDfbJrMFTBiau8LSwgEJUVtJg1/xG1dEQKkHwkql3e
         fpsg==
X-Forwarded-Encrypted: i=1; AJvYcCUsw0Ins6SmUBVMZyeNfr6K29N0bjw7Ljo9nGvKXGntfG8cWjZb6oEqDp/mK2AAoLA/Dpadvqe09ugWTYtvNpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqocJwI4XLuDkAVkBmSbd1N8UhBVwpe6KibBMXk2VXFOkMOWnp
	finZLSK0JP6HY9ZegnbZqWxaSjBfEiVqscG9h+mjIPMKIZxqVIhbFfUQyc1Xk3DT1M8=
X-Gm-Gg: ASbGncu5gcapQ8EKISbFFV5fVP8WB7P708JCPsefelQWJDCh6DNYMYB8srqDEpOKhpN
	bP9VUp4/8Iy/JbS6UispnRO78wA4IQ5s499sHN7yaKmkhmIP/bgeiG9yOEHXstfhfGM/9Id+Tae
	y7DPf26EkjxNC6/dkWtXJ0s0WNGfXTyvHczpMmt3nu2h+R2W7qcELdEg7hqywdIwwVl6qlSI8DB
	m+5WBJ1BQjeWJdrXtIApipCsM2iDpeEHTrpUxDMvVWCzF9Kr5gUKwv4MqHfdIYziX9zxkGwm0Q3
	oq6OlCcBRhFuZz8ezf6dj1R2cNbSnEmJQxJdOh5NmM1xSwN9KS2MB4Oo4cfyHbXhph0xHg==
X-Google-Smtp-Source: AGHT+IE0sp7UIYpHTtNI56eLO5T0nWk3x41wIaH4yAbmtO92FlclbiE0NYj4ZNNE5zKNcwsYhAbJ1g==
X-Received: by 2002:a05:6808:1781:b0:404:e102:f684 with SMTP id 5614622812f47-40b05751023mr3392045b6e.13.1750864915540;
        Wed, 25 Jun 2025 08:21:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d11b42sm2202921b6e.38.2025.06.25.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:21:55 -0700 (PDT)
Message-ID: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:21:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lianqin Hu <hulianqin@vivo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: u_serial: remove some dead code
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is no need to check if "port" is NULL.  We already verified that it
is non-NULL.  It's a stack variable and can't be modified by a different
thread.  Delete this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/function/u_serial.c | 7 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index ab544f6824be..96756a489d6a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1501,13 +1501,7 @@ void gserial_suspend(struct gserial *gser)
 		spin_unlock_irqrestore(&serial_port_lock, flags);
 		if (!gserial_wakeup_host(gser))
 			return;
-
-		/* Check if port is valid after acquiring lock back */
 		spin_lock_irqsave(&serial_port_lock, flags);
-		if (!port) {
-			spin_unlock_irqrestore(&serial_port_lock, flags);
-			return;
-		}
 	}
 
 	spin_lock(&port->port_lock);
-- 
2.47.2

