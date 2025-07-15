Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C22C324F
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 22:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620320; cv=none; b=H21y3Xc10TQqxJX4GCwwPhB74z7+d8BnRxGlSFWfO10PkPpK7XQ6RGnfLC05/aRHpzf6jVHr24JtLiIaDtl6sm2xeadAuD/oA8ViH2EOgFm7pVbgKGgFCriwzmUzReFfGoi9wUPMjp4cYslGO7rCEVSJnIQGkUJPQt+NOojKTLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620320; c=relaxed/simple;
	bh=YfJndeDNNKb+DJXXBEqntPkbEm1wX2h/q+7NcWAA8fY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dkov5fVyXRzxrTHNdguF+HfQ3/FwwShTXG+BzER6XWmYezpPXOKXg2/EltcDCCFrh0DUohnbMl5Sr17im8HSqNjr1OEamlnZJUFWNJbJBsOZrlL6oJUhFARpM27wpI9VeMPqlF6/O2w0t9bcdbStclekF75gOW0MAcE8Lns2jes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZl6S30+; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZl6S30+"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73e650f3c31so90703a34.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 15:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620316; x=1753225116; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xd3z62QSYDNQGGQDCwZHy5uaazsJb4z6l10vr2/CFsY=;
        b=HZl6S30+ktLwy15UZ9EzV2Zvc0ixJsGWZLmBbQQYDn96YEuFBmJ4wbNQhWmSdyEjuT
         42ueNpfQ1LPvRmq8d6A/vd4XRr2vqEv7hNLC+0sJECUZ8R4GqG8GGsOkW0uD0TXtG74p
         dH1RGc52zY3iy7awz8Y4IrFBM69f4dzc+5r+xfxcT1kLllY8FVUnlq4FxZTm5RCbZljX
         My+UEo9FcwgBI/Cbp2Yxg9dwAvg/Nb9vI040lcwUKj8SDp4BpcpS+Bwa3jU/QVVALhCF
         mbZiiYgh4iQW2a8WM8sZzvdem/vxYhlPTRh+NkrFjSdtfYpy9Ua+Cmefo9fTg/dA9TDQ
         /tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620316; x=1753225116;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xd3z62QSYDNQGGQDCwZHy5uaazsJb4z6l10vr2/CFsY=;
        b=wGs8f5XRrv+cD1GtN6c97fdj0+r2UsVI4Esn4XfR2dOvU6HNJfz81wjQz23B62BP9r
         a//Z1BaBzsMw9wSt/G9LVqVWFbi+8Y/Rv7VlRz850egCNSqUl0kd0x88OSYdRW0vVFkr
         NUyQxMLtBy5vwbPWl0h51NL1Jyk/F2k/6sgUxvLLxRuC3troIVlyr7LCmHBESnSDKSZb
         4dbGOUgOYM1q+UObiOSJlvLbhBf2E79V3X0ABctL2VnQmChab9fvXL03tWJJPYZONaE4
         74hFWzogKk83Sel63ZwOe3EY+fuvgcWgnVtJqChIrE01HmEndXL/251GtFLxCyVDuxU0
         4D6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWi+hBnrAFURfjGVmAZb1+6L8XHK3iLD7xBbccEsumfY8GrdZ5w94bacPj2wgBGjRnFoxE+ERycsZ6nYgld0Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0g1UxSGirKXPV20QRaBYJ7dh6d2e1pg1PG4BG4sNrmunqBwVA
	gDCIRyfu2ePzCcF/k9FMRaVyUvOLnzVvha3mZQRbHC1ResRYzQS24ZmHHCf6UG7NTF6J6SNaRqx
	bhD+u
X-Gm-Gg: ASbGncuhMtBpWdM6zAVaHuqwENcUvqLJM9DTvd3zJ/cUU1CIsuDLGuTUCFcD3iDFNaU
	L+L8GiAZ8QW6HHX9d1+cnIMqopgz15v9W2+bQfqahUW1oIpvUybXL1oPgv21bmMLGYo8rEKInWt
	/dTrivmFcaje0FHDYTcFniwP2BfgEQMbruLol/oMW9uUjbNbjcs1hfINtrUmK8Bktyqe4O98yJj
	2csC1rG2GR+hr3fDnrzrwR82+9wBx1cQNwk+BC6WTF+vikgGPxxevgiVyjUpLUq8Fu4TCXoThrw
	y4k75KnxYeFyLOADUYGpWFIEklqQGEqfl+QkfaG7IMNE+aX/G0EjXV2E6nFcXqx2oBsclVfgoBM
	Lvw0w6WbNpyEDQjMhAjd/Fb9+0JOOjh197ljErT8=
X-Google-Smtp-Source: AGHT+IEcnMLBH8gdjj/v/BIDdQjlwnkJ7S/ATCiix0YyiZQNd6IC6FrB4fBrsEE6GWebz8GXYY4Ntg==
X-Received: by 2002:a05:6830:6c88:b0:739:fcb4:db1e with SMTP id 46e09a7af769-73e64acf237mr791454a34.20.1752620316602;
        Tue, 15 Jul 2025 15:58:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e63b94769sm368296a34.21.2025.07.15.15.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:58:36 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:58:34 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] gpio: viperboard: Unlock on error in
 vprbrd_gpiob_direction_output()
Message-ID: <9e72018c-e46e-4e55-83e4-503da4d022fc@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Unlock before returning if vprbrd_gpiob_setdir() fails.

Fixes: 55e2d1eec110 ("gpio: viperboard: use new GPIO line value setter callbacks")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpio/gpio-viperboard.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 3eba77f981d3..e8e906b54d51 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -378,15 +378,13 @@ static int vprbrd_gpiob_direction_output(struct gpio_chip *chip,
 	gpio->gpiob_out |= (1 << offset);
 
 	mutex_lock(&vb->lock);
-
 	ret = vprbrd_gpiob_setdir(vb, offset, 1);
+	mutex_unlock(&vb->lock);
 	if (ret) {
 		dev_err(chip->parent, "usb error setting pin to output\n");
 		return ret;
 	}
 
-	mutex_unlock(&vb->lock);
-
 	return vprbrd_gpiob_set(chip, offset, value);
 }
 
-- 
2.47.2

