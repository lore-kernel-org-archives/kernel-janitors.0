Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23841367B77
	for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2026 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256776; cv=none; b=sYBxDIEk1JdZ++4yItzQQMA/2gvc1a4ELfS1akk8Y7ydgA1bi6Svk+ocnJ1Oggj0ryjTL6lEdrFrw5H6dvAWXsPWxukNTgpehyrJ9Z88UzfrKEvTvXtJHBkwNICzrA1qACKNFmWFrNjMlqnEwTElFJRzew/WMQzpTbHMqXku6go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256776; c=relaxed/simple;
	bh=2f5OUImFmuhrF3x72G+LTN7IOvpnkhPV9gMr4mx2qz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IeuhsjieR3YVu5h8z7X9wzVC64RF+3cSMO5EzhDwTCzWhdcDUhhQmgYKAsQZB0rNMMuOpjBf8wPMnRPYgTbX+6iBghV+2JVuozXOr9yX1jdgbq2yTX8XMTPI4VbXrkq9PD9Ldb8CGtMzQ/VwdyjFym9K6mYb+C4RPwkT9FzfCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkyu4WRZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkyu4WRZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4585a116a4aso3614446f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 22:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779256773; x=1779861573; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gnm8zcvKAshSvXmnApGnkudHEo/9J/+vPZuXibcqvww=;
        b=kkyu4WRZQ2nLjW3vWF5k9Kk6/hKNxy1pPtUBwEjAbSNWTxkhdnzPExnESg0z648AhO
         rGjFlqWgTfmygyQSJ2z9+ehGFyrBm3B9lk66q/tzL3irvaufJ6zBynqLrxKBzBUc0Je/
         fUbLw/JsCDkTioM7bqZ7dxtcNBl04o+4uZZGYDR2F1nb+NMpHKAz26egctEpsrXHsZfA
         LM5/JNGbvJW3dPvHyari0c1waaWKJAFBiBBUOLBcB4Cz6y72Hv+BiCNzx7t0Hpomnazk
         CQjJIKKPxSsbOZzzxo+t+NyCnvsn+hsZ90KkpTUSem0sQB/HTqTzHGoNdKzg58mE12GG
         VTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256773; x=1779861573;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnm8zcvKAshSvXmnApGnkudHEo/9J/+vPZuXibcqvww=;
        b=quabg1pvLAQam+Kt+SxZfsSZ60pz/OAdEaVPr5YKPZtPBZdn9xp2S2OEy5oGhErNwB
         mPbq/B2N0mrnU/nBZQ2xTzVIewKxKu0YkAXLrcel3oz9NKoAqwnoZNzvSqC/g3PCtSZv
         rMHFZjBnIzZIsfWBwCcjRJdvmMrxGZ7DUhEuhPSnK/hxFm0oOw9WkXI8hSm3vZTxnBsz
         DitE9hVLuB6t7B2x+G/0stgXhNLZeG8xddB14tF2Tkr+0u8fcGH3avvK0rFbW7ennqQz
         IS+cmOnSUBpIST/L8xa2N6UqogORKvRlVknoK8eAk5mDYcnCucm3ziBgGMb5iCOwgYjN
         /lgg==
X-Forwarded-Encrypted: i=1; AFNElJ/BpU2MOfkgT3zO3zjBiLUPWSdoE1M3b0M3FuUztM+sQSK8KG3VVbdsxaFWUygPxmZ0GkLlaABjoxYG6CPhH/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNilLzBJu05QdJqXiQEhja3hvneunlM4mof0w5RFUpCBMEM8qI
	DyChlk8fyUdtwOS8niRnRbmdNHA92CNpWd7KSc5JjnKc6dtFqeW3mNvwRmiCrw==
X-Gm-Gg: Acq92OFqEodamkfv/0KmxRGFVfO/ndJe1/0/1wxuhcPLPQVs5bingX2ccgSryLws9Kn
	bshJ0Hlyn6DRlHaXRopo/+Nk3IY/06CJx7Bph7XBz2O+jqGAbgF+vEFGaTJ3xrg8CpIKKguZg7Q
	aPkk1FxR4J/8AdaH3smrjmTjfZGgYQaGvxuCAd06FNylEZvk2teIjPCmrtm/hlwj+7jeZWQkiSI
	olEAiwLdz1h7Lzm3J5yKBkTF5SAfTWyLLdMKFxjLZi21vX9I8+qVkCaARdZexKh7C43nviZw8p0
	8HZ411A3O0qSZ8tkKXhIrEUjID7MwofV25rHVvZLwqdI4weSlofgh7ZtDwMzWWxby3z9mIkn8Jy
	PUt1BePmnav23IOgCMDwOPF64Xvr+6lEXI6HMIzacyCB+vp5Y83//L+ocdK+V3aFfQlhu0squbU
	hD4eHY28dlem5b4o4mhPZ593s=
X-Received: by 2002:adf:fa85:0:b0:45e:739c:f186 with SMTP id ffacd0b85a97d-45e739cf80dmr17301878f8f.20.1779256773468;
        Tue, 19 May 2026 22:59:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a17a22sm51207565f8f.22.2026.05.19.22.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 22:59:32 -0700 (PDT)
Date: Wed, 20 May 2026 08:59:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: dwc2: Fix use after free in debug code
Message-ID: <ag1NwBpqT4IEQcdJ@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We're not allowed to dereference "urb" after calling
usb_hcd_giveback_urb() so save the urb->status ahead of time.

Fixes: 7359d482eb4d ("staging: HCD files for the DWC2 driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/usb/dwc2/hcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 1a763ad4f721..2414291aa908 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4804,6 +4804,7 @@ static int _dwc2_hcd_urb_dequeue(struct usb_hcd *hcd, struct urb *urb,
 	struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
 	int rc;
 	unsigned long flags;
+	int urb_status;
 
 	dev_dbg(hsotg->dev, "DWC OTG HCD URB Dequeue\n");
 	dwc2_dump_urb_info(hcd, urb, "urb_dequeue");
@@ -4828,11 +4829,12 @@ static int _dwc2_hcd_urb_dequeue(struct usb_hcd *hcd, struct urb *urb,
 
 	/* Higher layer software sets URB status */
 	spin_unlock(&hsotg->lock);
+	urb_status = urb->status;
 	usb_hcd_giveback_urb(hcd, urb, status);
 	spin_lock(&hsotg->lock);
 
 	dev_dbg(hsotg->dev, "Called usb_hcd_giveback_urb()\n");
-	dev_dbg(hsotg->dev, "  urb->status = %d\n", urb->status);
+	dev_dbg(hsotg->dev, "  urb->status = %d\n", urb_status);
 out:
 	spin_unlock_irqrestore(&hsotg->lock, flags);
 
-- 
2.53.0

