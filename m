Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9089342982C
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104959; cv=none; b=sk753re6h+A3KxKAwFu4nCPVGtOfArJj/N74ws5RFA7pp1DS98KyAPWcicglXxYoOiGqggZXoDOm3cR4JKBrUokqM/uNqyDrS/+pLdgUwq58pmBWQDXZJo3de0Sg9trCz5hItFlxfi+dpoDIdfvXI43fZ32Ti2ogX+idh5anF00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104959; c=relaxed/simple;
	bh=TMkRIjsVvgVjorZf5zlOnBmya7zcbOedJN+u8pQergc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UNZ0aVsdhxvR6IIxeiZpQujYzEvb+uHl7R2wj0AalBaeWO5v2Ern0ZQj41pGCE8URZerAMGr6zSUoZwHKMl/Pszbeb2+4rLROEK1RD57nZrES7hvLEhBGsNRGJpsvf15j+v+7HqiJwHlwT9Dm73jY/gh4hmxWqLTwehyqi3Qr24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0rJFNSk; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0rJFNSk"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6cfcad4f979so5747649137.1
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Jun 2026 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781104957; x=1781709757; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnoKGqOpcZWatdjAe7DrhKmxmFRx0h9ZTTRZbMMBycg=;
        b=f0rJFNSkJQXLRmAVXQU0578OuIbgtjG4LDtJYwAl8/Uoeo/xb+jb1TeQWZG1jRLl6W
         /Q7JRKpPJ3hMWcyQy1/jeJbQIyzrbxlocgiKR1n0xFpLNN5AomV5a5pKGtFl5H57WZPe
         ODYo/rJqGrHlGUxXYYddiryGIgPpm2zxSQ8jiOviKW84MGXZdr1vwGdUYjn1uxEhM0fq
         xnjTzUHqmP8DsEaVuv2yJtZq9H8uXtQOB3S114/x7xuQPyo5O8qEZl4mVBwo7nS9Ga0D
         CqHMdc6h7QeapURMPS3F7UhEjh14fqzC/QW7MkflF4BDx9XB6m+NrGxaOdoyqP+ASOME
         ddmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104957; x=1781709757;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KnoKGqOpcZWatdjAe7DrhKmxmFRx0h9ZTTRZbMMBycg=;
        b=CKN62/X5X6FISu16U4FEJBA/oF+hNiaoRxZ5qtAwrlYFNFylzUix7pQ3TJl6vEGiEm
         i7Yw6hav2K7yZJF3M6swM0nPY46PNdQd6yuwHUznzwqJPgVBOkvGiKSF5sHkZ+SswAHf
         X4q21NGa0NZ9F3NlTB3nF2CMlVLupZVuD0kltbRXRzhFytp1C7GNCLOlBJGmDIyunyvX
         myEZ2ayNpiPmIfgOuI/iPDRZSX8TDjnmCPXe3KfRd47Ak/6nbuARQwP0qdlGA/cLlBhZ
         F0q8zpdvzpnn+0i8vivoMUDFoO7TmEQ9cTZ/hbB0pVXGM4suYZqs1N6i6VfLvP7Sb9xH
         y68w==
X-Gm-Message-State: AOJu0YyZnUtZlEv9oObeUUhb0GnlsSMJG3XVlCvsLpEHElQNWuBUtHxs
	3UUhdb/L4c5j9Y8uKrB+gIMsPd0OJmFMnxDoN29sTkcuyC6NwQD/zacHnji25Va4
X-Gm-Gg: Acq92OGfv+RnXEnKlNaxjFR8G3ZAP3wuG9OFj7pBIOWRtRMTvuRBFsIZ8J3A9hAInru
	CKJTFJYtbPuHQ4bdAuq+aFYvCKsITn6OfSannaxFOapxW9Q7ZYbovx8qqaeGcREz9EPcm5YaLwj
	4i3JWCcKQ2LZyk/a53RD533meulfgM2EEqBnCxVy5EOdIIZdQwtNT1ddToCMYgYs840ns222oAa
	CN4Xkq1QlnBE3nFDKEZSAE7dW4D4RXMx1QfMbsJ89URpdKiPtHvqbcIkelMVGFJpwq9Hx/7m7Bh
	qV3nX93VYsD4xXoqbVLbR4HW3CjAost2nKp+Pgii9DsE/QZ0HaDe1WLZ+1TEaRUJvJ8eTnFbMES
	x9mZZuvfUiDch/WH+xjauHNvzvrt5k20L2i0U8id8lfcUJF1IvbAzZELJPvlVnIk/7l7B+uZ9Ar
	Cpv2Ft80I7aitpwi4NyPa+zi8nFrJC
X-Received: by 2002:a05:6102:3e1f:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-6ff0d95de5emr15239959137.29.1781104957440;
        Wed, 10 Jun 2026 08:22:37 -0700 (PDT)
Received: from localhost ([43.225.189.119])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb5764dda8sm20133615137.5.2026.06.10.08.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:22:36 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:22:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] mei: fix error flow in probe
Message-ID: <aimBNn8rdCamCkrk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexander Usyskin,

Commit 1ebc180d2b90 ("mei: fix error flow in probe") from Nov 2, 2025
(linux-next), leads to the following Smatch static checker warning:

	drivers/misc/mei/platform-vsc.c:384 mei_vsc_probe()
	error: potential zalloc NULL dereference: 'mei_dev->cdev'

drivers/misc/mei/platform-vsc.c
    334 static int mei_vsc_probe(struct platform_device *pdev)
    335 {
    336         struct device *dev = &pdev->dev;
    337         struct mei_device *mei_dev;
    338         struct mei_vsc_hw *hw;
    339         struct vsc_tp *tp;
    340         int ret;
    341 
    342         tp = *(struct vsc_tp **)dev_get_platdata(dev);
    343         if (!tp)
    344                 return dev_err_probe(dev, -ENODEV, "no platform data\n");
    345 
    346         mei_dev = kzalloc(size_add(sizeof(*mei_dev), sizeof(*hw)), GFP_KERNEL);
    347         if (!mei_dev)
    348                 return -ENOMEM;
    349 
    350         mei_device_init(mei_dev, dev, false, &mei_vsc_hw_ops);
    351 
    352         mei_dev->fw_f_fw_ver_supported = 0;
    353         mei_dev->kind = MEI_DEV_KIND_IVSC;
    354 
    355         hw = mei_dev_to_vsc_hw(mei_dev);
    356         atomic_set(&hw->write_lock_cnt, 0);
    357         hw->tp = tp;
    358 
    359         platform_set_drvdata(pdev, mei_dev);
    360 
    361         vsc_tp_register_event_cb(tp, mei_vsc_event_cb, mei_dev);
    362 
    363         ret = mei_register(mei_dev, dev);

If mei_register() fails to allocate mei_dev->cdev

    364         if (ret)
    365                 goto err;
    366 
    367         ret = mei_start(mei_dev);
    368         if (ret) {
    369                 dev_err_probe(dev, ret, "init hw failed\n");
    370                 goto err;
    371         }
    372 
    373         pm_runtime_enable(mei_dev->parent);
    374 
    375         return 0;
    376 
    377 err:
    378         mei_cancel_work(mei_dev);
    379 
    380         vsc_tp_register_event_cb(tp, NULL, NULL);
    381 
    382         mei_disable_interrupts(mei_dev);
    383 
--> 384         mei_deregister(mei_dev);

Then it leads to a crash here.

    385 
    386         return ret;
    387 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
