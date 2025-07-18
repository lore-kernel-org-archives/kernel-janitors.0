Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536802153D8
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752873740; cv=none; b=mAdDlh5luI1AxZjG34Q3p8OkhJew0HVTX6y6ug/fhplFgwAt9ec8LfrEmBwqQJ6VOx5HS/vlXXezgDmSMI2JB6FaJcUkbIn3tn0YlUTivZUWM7hDRi1RYmIbLjob7rtKhenfzFeq3nD1BLI6Pep7p5hDNj2kbYUM1d/YliCzQDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752873740; c=relaxed/simple;
	bh=N9uR98yXNs5KB5/f4ZmeEMdWhEPvJSr4tS8Zew8+sSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9Jiogq+cv44NXVKY1u3tVfYHj32RLB07dR98CrDAqpGjAzRTD77tlgYhwTpVcl0CAXGv/SqbkvBbYy/1fOn7uzR9HZt5hI64LJwAQbGdMx0Ik1HjfDZX+Tgy8NDU3CPCKWqY6FGv5Et11GFYfnpWL5GF8C0xNevjNsc24gYuJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueVioxyj; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueVioxyj"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-40a4de175a3so1433770b6e.0
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 14:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752873738; x=1753478538; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JXAPwF0LYL0fWlGzUDFZv1Tx2pY7hr+gzK8mcCbzuRg=;
        b=ueVioxyjGAOPCIwOwj5y9z/kd7eXUAw8rlqr0u+KSSFPkYKKLTsz8AR0UbeEYKX8Xu
         Y9MMiz0nn9cm2G3d/qEuudy1ocND0a57kgwmNOaC5zZtaDx1HkOGSgGHPZN4VS7f/LMo
         Q2ckyyZmPEC0yBSeky5o7wJtGOX+y47ARuwIyFkbmtxJlZ6NKbUbxJChLICHs2H4LZ6E
         XRdmmdgEau16gywm08Q6YbszcnBLViXt8VWmoUbeH27LEaVEfyncpl7WB7GYCZJ4DLjh
         42/9ox8fU2Oq/JNcDiiHTXS5dIz8QOInxpTPsd9Q1/6GFV1E0eEITB04HoBo1+c3nUa4
         HsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873738; x=1753478538;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXAPwF0LYL0fWlGzUDFZv1Tx2pY7hr+gzK8mcCbzuRg=;
        b=rZnzJR5sloXwCTGX9Ur/AUWt0HW9O+MK8J5Z75oTHQxDVI/fwcPj/VFs27ipsAb8+5
         1j/3fvKWz1AGdc7eC0hRf0hSycPi0EQ6ZtX65Kic5zzglQOhpPm+faFvwaR3zrTYOvyv
         PMRqKPvKSN+2kRYdFVP19E3zfyYOSshgTmiIj9oed7Sq4iat+tZyijJq8ZJTF75r9wkX
         sp1MOUTeK+4wPPJfmHCjz4qB8J8EvNFNfA2YkLngdThL4EPV9wtnLI5KPwfTL9jFSvE3
         ykDAWl7teSHq4JrBaeUYqU5af7fRsPa4kCTXRHBIGeAPPg/xH2T8zWW9rTNAP3e6OgjN
         EIbg==
X-Forwarded-Encrypted: i=1; AJvYcCXKi8OX0bzcqxWj2prKEMwEOoKacxjMM9NK8iQupShXpaB2x6F5OLH2PL34AKdlW3aHRObbxFUFl8TRqcyJTVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfSSBj4JLk5s76lfbOnHIsDwFccLllTQtKPNubCyY5WZ/YWxFF
	lzQGWT6GeuA/4wNU5Y3DaVmFax7GsdlntTj6mmm8Fqicg6q2a/uewwo9wFSUkwU4efU=
X-Gm-Gg: ASbGncvAwHerbMCvpDzmNymnd83pcWLgvIJ3ng3EcrDNGNteygEq5Q9raIX/L8NCzvb
	sWOoYA57DrZlj/mkdGqw/zyEzrr0yUSwVhcm9JMwMblwHFSrgbj6yIz/HssL8ikPRxDD+nCTsAs
	naQXuEagGlVHqHZCRV8+9qlAGBnXXyYOd/Tjtmz/WSsuLoiwvS4VdW8JulUxWHZbStnJem9p3CD
	aVsn92M7lJGA2BQBvbn9B7UvC4KeBtaNqa91ZXorp84q3/rqQVgdAPIZG7XQQmxRS04kel4bT/a
	ZTeZwQAGSs67U2nuQKvlKtT2ffbimjDkO/49xnFjUCfZBRMzv3sR1N8ZbmxPT+4OoZ3drV8PNga
	WeqTA9FkFE5M=
X-Google-Smtp-Source: AGHT+IEndzum4VB8B8UC3k1gRZhi4Ec/gRg44iqGZ2544M+GbzncYZLEIkBlxtCSHtft8KG6Ia8oYw==
X-Received: by 2002:a05:6808:6a82:b0:40d:f3d:cef7 with SMTP id 5614622812f47-41d032fb39cmr10072122b6e.4.1752873738224;
        Fri, 18 Jul 2025 14:22:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd5465431sm749285b6e.37.2025.07.18.14.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:22:17 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:22:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: sysfs: Fix an end of loop test in gpiod_unexport()
Message-ID: <747545bf-05f0-4f89-ba77-cb96bf9041f1@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The test for "if (!desc_data)" does not work correctly because the list
iterator in a list_for_each_entry() loop is always non-NULL. If we don't
exit via a break, then it points to invalid memory.  Instead, use a tmp
variable for the list iterator and only set the "desc_data" when we have
found a match.

Fixes: 1cd53df733c2 ("gpio: sysfs: don't look up exported lines as class devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index f31adc56bef1..b64106f1cb7b 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -927,7 +927,7 @@ EXPORT_SYMBOL_GPL(gpiod_export_link);
  */
 void gpiod_unexport(struct gpio_desc *desc)
 {
-	struct gpiod_data *desc_data = NULL;
+	struct gpiod_data *tmp, *desc_data = NULL;
 	struct gpiodev_data *gdev_data;
 	struct gpio_device *gdev;
 
@@ -945,9 +945,12 @@ void gpiod_unexport(struct gpio_desc *desc)
 		if (!gdev_data)
 			return;
 
-		list_for_each_entry(desc_data, &gdev_data->exported_lines, list)
-			if (gpiod_is_equal(desc, desc_data->desc))
+		list_for_each_entry(tmp, &gdev_data->exported_lines, list) {
+			if (gpiod_is_equal(desc, tmp->desc)) {
+				desc_data = tmp;
 				break;
+			}
+		}
 
 		if (!desc_data)
 			return;
-- 
2.47.2

