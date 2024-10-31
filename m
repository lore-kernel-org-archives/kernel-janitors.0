Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47541482E3
	for <kernel-janitors@vger.kernel.org>; Thu, 31 Oct 2024 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730357958; cv=none; b=LBZFuNb+FNiEaDpcsNiBZXXK2BYC4kLI01ITLN2Sg3j/S+cEdzn/sV+TDqhfH/2YIshuo6moNJVMEnY3n67VvAd3tgkeabPb42of9u3yDJ+O/ZxE/qzn6EKhnjYAwKeb1hHP7eaGbY8rV8xORUeXvyBIEDTysF/504wMQWPNb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730357958; c=relaxed/simple;
	bh=PyyjjuExWf96KMWOS6hJ3XmzDi/kwD2m5Mi5FCrS1pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVNbu1AhZRymG2jDUdxlQ3xsQaOA9DfpzN8cfm/SzyqYrZMNCnUYoHBQbcWmia4SbiWxzEg33iGCOrfUkM61DF6HCmhMfdcMuKYdhIxy6Pqg6Y3g9IhpVIijT2pVHnoq9vqKEw0UBPMtw/iW07tTjYUP5XRvg/EAQAZTwHV1TFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sgC4VISz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sgC4VISz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d47eff9acso386872f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Oct 2024 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730357954; x=1730962754; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYp7pAy5IN7AxvqS2KXRE6LCucy8VMk2vKZ6AdwjDR8=;
        b=sgC4VISz6xwRIA+Gp5jLB/LcplaRidztubdeezdtSL3/esHFC3w2T3cIgjOuPSVv1t
         9Tvq5f/uFcd2FjkIsjlH8V4b9swwiwCsJjOcd+npg+1SPb979MluqeAuembEqB9bSV0c
         s56GAgS/XTa1eIccPd/wfnbmx8uHQ5/fRvJBnafZGosDhusSQrFWmOnyZT3JcDMIv3R3
         Cn4JwUEGKE29VUjbweWt57J0sMnVGvKQ8xdq05PCWA9JkFDmlz0fZPYTzNJQ8Pism3rO
         ZVHV8IuExjQu7StvzcrzkNmlJOVVUczbZ26BH2MeeXoEJt8NMauKU0IrUUhzHEKGGbck
         kYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730357954; x=1730962754;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYp7pAy5IN7AxvqS2KXRE6LCucy8VMk2vKZ6AdwjDR8=;
        b=c+DyDYYDzKnuCyb++NcuncThPMRmm8njM+VY85DkW5SpujYCeeuqS8y6Vc+uUJKNwi
         9NlgiXkvVGKTqksXBIEkVQhD/MCNwmOHcbYEMmJbst3bjt9q7FKbmLVWyGi/MYZmcrNg
         r9wB/6HsPdm8xyqSU/o7mD1uPjIZW7qKZcVaWlwQazjX6ekv/lcPspAjXEitNWXj19ir
         aLgp81KXrnOHZClsKV5HpCDnz4dvYR1FQ6q8mn7poOYEVpe4/zJbSizMANQMf7Pj1XVp
         YgYONE2yu1wcxOSQaW0mu9WXkLT5BQM3ukAEskWpdPBmQ3rg0SWzEbDrDrXQBVFxilfz
         WoqA==
X-Forwarded-Encrypted: i=1; AJvYcCVihSgjWIWEMvhGbSqOO0Ck9OpxELnEuVWUDBgXxzeyWmkbjhZqkGXmxLRPL+7nVveABaM4kmotUEJVK3NbHiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9n/BR4xrBaZ5mduN2XPx89ol6Q8mHdqrgSAqFy68x7sIpxfy9
	oXWBYlaqDb0hZaZpDiInH7nOBUXV/aUOFE6QcB6LqIRpWHV8XTC1fedfeR1Hn2E=
X-Google-Smtp-Source: AGHT+IFKaEwGg+0PuPgAA9ujK3FLjHCzdGExL+Pb47x2feN1KVIOIBbkvnxqClFIGSOpI1sC1rLkPw==
X-Received: by 2002:a5d:60d1:0:b0:37d:501f:483f with SMTP id ffacd0b85a97d-380611e76bcmr13051516f8f.44.1730357954152;
        Wed, 30 Oct 2024 23:59:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm1114069f8f.100.2024.10.30.23.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:59:13 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:59:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: serial: Fix use after free in debug printk
Message-ID: <7d0481da-5852-4566-9adb-3a8bb74cb159@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dev_dbg() call dereferences "urb" but it was already freed on the
previous line.  Move the debug output earlier in the function.

Fixes: 984f68683298 ("USB: serial: io_edgeport.c: remove dbg() usage")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/serial/io_edgeport.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index c7d6b5e3f898..b8f1bd41fb24 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -775,7 +775,10 @@ static void edge_bulk_out_cmd_callback(struct urb *urb)
 	atomic_dec(&CmdUrbs);
 	dev_dbg(&urb->dev->dev, "%s - FREE URB %p (outstanding %d)\n",
 		__func__, urb, atomic_read(&CmdUrbs));
-
+	if (status)
+		dev_dbg(&urb->dev->dev,
+			"%s - nonzero write bulk status received: %d\n",
+			__func__, status);
 
 	/* clean up the transfer buffer */
 	kfree(urb->transfer_buffer);
@@ -783,12 +786,8 @@ static void edge_bulk_out_cmd_callback(struct urb *urb)
 	/* Free the command urb */
 	usb_free_urb(urb);
 
-	if (status) {
-		dev_dbg(&urb->dev->dev,
-			"%s - nonzero write bulk status received: %d\n",
-			__func__, status);
+	if (status)
 		return;
-	}
 
 	/* tell the tty driver that something has changed */
 	if (edge_port->open)
-- 
2.45.2

