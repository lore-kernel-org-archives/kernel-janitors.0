Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD672BFC85
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743644; cv=none; b=mgsXsi6GV+9jqE+h5A3vwDOHQ9HrZJs7c20g+jA/eX7/Xd+/hL1eiZYAviddf6m00scHQJmzlEW3Qz5p7kA2rqH/YlMP+/fTzsrat0hRAmR+0WsXijbflSku6MwRXF+ad1PRFj35hT2////9+H1tYQkye2vsG8QzqRnxKB6zcio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743644; c=relaxed/simple;
	bh=gmgqgw24MLfjErvr+kfghlRml+3oa3rLFqQ5uT+bh+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qx+i8FPUQyONxCxmFbe+5ukwMKh7tenfNj0whRafCgyQWYg1+ul+vs8KZeBME/g2PwhuEwFe084JfOxCVJI90U26ww4Bg3z4UjrJPMWK0tUbVbFtkJgYXGMzTxQ+ohoDhfECZuY2nFp6kHwBhIbMxBVkKm1z8KHjFGAsSFIewpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VL9vNvTn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VL9vNvTn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so72552185e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Oct 2025 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743640; x=1762348440; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obvVO6ijh7zJI9QaOo5VQtAg4MY4RGT7X+Wj9ef9Fx4=;
        b=VL9vNvTnuv/Qu+l5zbH+8M+p+iIBkP1b5yYzfjsQro2Iq2PgCoX4i13iB7RLeE/mls
         ipsC3CZehO98DyClgJkdhBZ+NmRei6GqTEbj6B+dAoygOEK7lAUy30OnDLjrF/E+uagp
         yLF2+ljJzhrZVXO0rgQEaWvJ96dDSwYnvB9olnDcz69ueUDi47mXXiMQw9xvVNU8IRNN
         r1q+OZT6qXehUNpO0nDnCkHUnheKw6108NKqbRP1f+SyHryxUH8logHAuOrZC5fKTEKJ
         SA9DWMPgH31Yx5Di02M0ogS1OWCp2pCzghv0woa9qa6AnIsadSBHxHDywrnS+IFAD64U
         L3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743640; x=1762348440;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obvVO6ijh7zJI9QaOo5VQtAg4MY4RGT7X+Wj9ef9Fx4=;
        b=rPAwhGIhoFYHtRpryvqhHIhaGsxTmzpLdQGwKX10AE1641Zjv3aOcHqGXQizKYDr6J
         y5KB4ar7fQOLsiLud321ZGQKmgXHy8wQLc63S1IELbaYQfOBO+EshzDni6nBkqNosnfv
         jTcPU2ODyy9lJDKy1tMqijFmmqIq9Sp6Uw0CuA+3ASqddEtH5mnV7cik3g0CrOQ318LG
         ZSj6a7OiU6beUgQ6+hdiRc/skpGGVk8fujLIaZrg42gR4c8fU00aGVPYcMrPoqLXhGjC
         Oef+DZ1kKRKzlwzlI6p+FC1m8CFAeyhewhJ8LFxWAoq4NvDnTzIvbzXHkG4JhuztZmQf
         gABg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQKEhSOTEStBuYbrZgx7z+NZM6tt+lImYxOZPPumTUmc+dTNG3v9qvxzwmKmj8Js/HczCDmDmAgut4OvHCVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjloLajDfgUg0uaiDQ8m/5AaPx7A7BVjO3y2qAsRcvVp8BR8p
	aB02frMu+JCX0N1FK42e30Mc6t5Yh1o+DKeZyM/CdPOEUwkiNIkL8+v7z3Vp+e5z+CU=
X-Gm-Gg: ASbGnct9bXohJiUt/inzG08SO76M6T5NEDito2AajYL8n/IURDhUReTEw6KcqxqGPc2
	SIx1qQvYpV8FPfrGAnYBhe5MZhgUfWGm0TGuGfaSRjREbiUjDMS76zBVBpTgILcLo4/xWgysdfo
	Zu//tu2Uca1lAdtSt//kkibab7YLA8oyg0cc0zTTxQbI6TBTaiNUGNmm1OIziK2qpDp82xxbhry
	Bohn4YPg52C0AvESiLOrFOqNWspoD0pPM/4Z24wZuRZ/bnvoOlDN/rxdt/CQfIqUXrZRuffy1+H
	KjU69An5yKs7XhnUbj89fzcC11nCP/Q3aFlh9YMDqlvu8710B6D7QF5XAnaqc+Ca3dW7QlFcLoE
	XFEE47FHTnN7hIyUpk5nT2vq4a6ojlLJN2sqmuMvGveCZHU8X5gsoOaXSXI/+okJYGvXmpV5eT6
	WrbQ8j5fDviO5i+glu
X-Google-Smtp-Source: AGHT+IGOlwhirvKhC2gYeFfPJKrIR9GBb37d6lWPNsa4U9lLC5IBxuYdwplG7hkMlAutxG2URF4BGg==
X-Received: by 2002:a05:600c:8b8b:b0:471:1717:40f with SMTP id 5b1f17b1804b1-4771e1ca084mr25439795e9.22.1761743640364;
        Wed, 29 Oct 2025 06:14:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952e2e06sm26433385f8f.46.2025.10.29.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:14:00 -0700 (PDT)
Date: Wed, 29 Oct 2025 16:13:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] misc: cb710: Fix a NULL vs IS_ERR() check in probe()
Message-ID: <aQITFDPyuzjNN4GN@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The pcim_iomap_region() function never returns NULL, it returns error
pointers.  Update the checking to match.

Fixes: b91c13534a63 ("misc: cb710: Replace deprecated PCI functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/misc/cb710/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cb710/core.c b/drivers/misc/cb710/core.c
index a1e6ba62c298..2dd212f04fed 100644
--- a/drivers/misc/cb710/core.c
+++ b/drivers/misc/cb710/core.c
@@ -226,8 +226,8 @@ static int cb710_probe(struct pci_dev *pdev,
 	spin_lock_init(&chip->irq_lock);
 	chip->pdev = pdev;
 	chip->iobase = pcim_iomap_region(pdev, 0, KBUILD_MODNAME);
-	if (!chip->iobase)
-		return -ENOMEM;
+	if (IS_ERR(chip->iobase))
+		return PTR_ERR(chip->iobase);
 
 	pci_set_drvdata(pdev, chip);
 
-- 
2.51.0

