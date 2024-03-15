Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44833D542
	for <kernel-janitors@vger.kernel.org>; Fri, 15 Mar 2024 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710516067; cv=none; b=HjohVmmzsnG9XyYAP09qhO9ZlabnbWwSuAu6jcwle21y7VUCG+jzq9JpWP5dATFzHkhIJKLCYmovWqBHvYOWQlLDIpMcF9qGeROReTeVMXzJpklSFckr0YWrAEjTRzHVKJ1zr0vpa5k3M7vI5fbxDff/Udw1MubmneXlplHukf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710516067; c=relaxed/simple;
	bh=oQSU8jjDxqSIS8TDvT+ZEvcNLa1hjhhovpfiAu/AtGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4scKcZC8xq1tkJsWu+fJmvE5d6mljPOHHIRctB0oFgiRFPj1t/DGssqiut9ofP2YFKUU07L/7E0x2dUazAK7+L/89oVKD5i76D8ZnJ1uXF8acOYPxQEi3/saEGOkbqyS+esvVOZ+3Iq+9Ee2J1bQMedGz0lpOdoeWn1aGg5Fbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nr67b5Y0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nr67b5Y0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-413f4cb646dso11009855e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Mar 2024 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710516064; x=1711120864; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYKXoXyTZp5ci3YSNMbewaGpFg016n+QUTmPiNKutP8=;
        b=nr67b5Y00FpstdzWyaItuqUA+vzNDjKC74oTSeoDviOHdgGgzmHLGvU9D844S3caz8
         kgvzMrmwmLkLgiR1x4MkqRAdxkTzdeD+7U5OhD1j0x1l/W+KjrMTZu3RrzB59bsLbQ6h
         r0M38PMSTxoq/Lmfv7psSYUb3mkJSYmixKEsUgbLrlUOVKI1y3vc/TIq+9I4a76lLKuP
         U+PkpEagJhWDWYDBj15zvN4cdADt7XtiZam7KS3TuBRBEmo76POOMtK4AnkzZ9FG3Dig
         9EBPo9xiQBRR+wEeEZm8C+PmBdPrvrgqXODDnBCbOmJXOyEOHudKOHBXbH8V0yjRsbry
         LiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710516064; x=1711120864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYKXoXyTZp5ci3YSNMbewaGpFg016n+QUTmPiNKutP8=;
        b=Yu2BdsqamhVOHI2c5+hIxycAlndIbwg/P/6Mp3f7HdT6PShPo/w0BWswt9lbX85TxZ
         TEJMU4/fndIo7RWdvXhqGHSVQvBbr3cZ+KhaATGrf01POb4HIziZe7V5j/skkyeQQiWv
         cfO8Lrl9Bk2AwNnXeyy/zJ8jkdSKEJkB1aW0oy4FiZb82rCTRYwQQyJWMSKI1nXPJ0dt
         YfOPdTZdmxmm67QLKxuU/feL4oLEJXOA0Fyo+ypYNqrRNCGAWuvKCC5+o9cQbIyxV4K4
         nOgX8Gw2hDhKxIWaCX9AhTiC5INZNN/Raef6BN3Kw5h/Jfmg0rVCc3zdfCCU2keJrbza
         gMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyahW0M0RL6Jswkz6zLonOLw2oXiUf0XRMMcY6uQ4BsuSk/I6lxG9h1LMyIAM5p5OF7TRqRu14IvsVuTBfR6Q6QcqdMdtY6O/Jo/D7FQVG
X-Gm-Message-State: AOJu0Yw6kQhHdKd130Wy7J2wuzC1Os3JHIe/+HtYuStide/FxPicKd/c
	aoCOHDe7JgyEjJFhxMBlJQrLILmQlI9CN/qNtEYwMGP0UUfsmVFg7uafeHg0yXI=
X-Google-Smtp-Source: AGHT+IEcaJ72Qyr1XY7S8v6ZEeNlHEDW0NpxpQP3hzbLmJpU6iEGgDon3kkU7qm+Qmk7GrjsL7dbSg==
X-Received: by 2002:a5d:6b0d:0:b0:33e:c2ea:5e1f with SMTP id v13-20020a5d6b0d000000b0033ec2ea5e1fmr3133725wrw.0.1710516064137;
        Fri, 15 Mar 2024 08:21:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dd12-20020a0560001e8c00b0033eab3520a9sm3402524wrb.43.2024.03.15.08.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 08:21:03 -0700 (PDT)
Date: Fri, 15 Mar 2024 18:21:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: usb-acpi: fix uninitialized variable in
 usb_acpi_get_connect_type()
Message-ID: <fdd4f94d-fb8c-44a0-9472-3485a567caca@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "pld" pointer is uninitialized if acpi_get_physical_device_location()
fails.  Initialize it to NULL.

Fixes: f3ac348e6e04 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/core/usb-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index f250dfc3b14d..2aeeaa389380 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -153,8 +153,8 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
 	enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_pld_info *pld = NULL;
 	union acpi_object *upc = NULL;
-	struct acpi_pld_info *pld;
 	acpi_status status;
 
 	/*
-- 
2.43.0

