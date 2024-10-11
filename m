Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD41D096B
	for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 19:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675758; cv=none; b=kpbegtjDO4bvm7QA12djGzmO4I5cgBGyWxKlElgMaJBwciUQe1Pmx3i7IyHM3N+wW03k6LT538vxmQj667TO8EKkpEEITrSUGDxNcMYfQfVLMtKllkIqXOyxQ1EOu5noRew+ohHXGzoCGCgyiYM7J7v79EFOGuy/s9B2g4JIUDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675758; c=relaxed/simple;
	bh=B7kyYckFT/0DJHm3tDLiNH9WM3QNDHo1rocCSnEz2WI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOGekwPFMrgSWeLxgQRP4+Ban9Tf4iXXL5EWVmM3rc7AKsZHOHRf19ESUO9xwwaTS8PH9c/jbhY6UPn/qSXfirKwXQXGvDpsOrlMcEbTkUoIwft3e5mJ9WiRvgRc2p1YX2ENxI2sRh07T2tqpvugNUV8YqD8Irifq4Ps0k1o+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxXQKG8H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxXQKG8H"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4311ae6426aso13092915e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 12:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728675754; x=1729280554; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9H6rXUaUQHjyd2VSgKGDs+alotbQnC2p5Cn69HNYv04=;
        b=dxXQKG8HU1bwH2NhuFz0fSNyTBshOiaztF4OgaX2/Q00YcMPR1PzeWdw/JS8p9FXhH
         d0YgEDWluhg6g5YzuKRbyEW+eD4aAyy66GAllToPKCU1CKgJ8eiYjeavghxRXjZGYsM3
         xPJVsAzUQAW3RT+HRZh3tUCTor9VZ++Y5w77Jw07DMJNjimB1TkZ+DzvXNQNOwJMkbAC
         3npLKYuQgPU41l9HO2s3/Fe+Q+EzKTOAjtl/NRLRgzBHCDjsLABCnEq/WOIFEDGWkFqp
         A9FL+A4Vm18YYaSHazL6/su5MovelE7fWctiFGdAk1K7G+rQYmGX4vJW1I1E2k/EkcrP
         /MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675754; x=1729280554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9H6rXUaUQHjyd2VSgKGDs+alotbQnC2p5Cn69HNYv04=;
        b=N5s9zmv0cpScuhMlTJe89bburcLBn+6l5pi4Qgx1CT+LDCqmjSz+T4ZIZDHiaVCCh0
         gt1b3che/6s7HCVZb5lvC4ko29/+K5ZnKkWQi/9EbDg5AP8f5U4pZIqWj3+NMb+WUewu
         WtR8d9FcS0h9Kloe9Q2ofQkrn72Qiw2L924rWyrlY+IrrSpzFMG/UVTToZJJxVGrIWGC
         HvDb/zNY9Wnmlk2o1mSa665a+Ju7HFKouL1jjmG1g/neX1fea7oTJTJSW0dPeZJ6kxsZ
         L4xxOOUhXta+wg8OSb0i4nsx6okraveCLnLuokG0HN6m+plMe6AFPiY56gwD8ecgDPRn
         W2iA==
X-Forwarded-Encrypted: i=1; AJvYcCVcgRT39Rn/f0Y2dreCcntkMZ7eagdroN3HcA8oSry0lUKaVil1r05yLx2Uo8EbOEWGhxowLJPWe2k2ndBqhCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6XtHDA3eydsVYvTrYZohkBI5ul6RCvbuXaXcTBs1fGYIvFaXP
	33jMfMIvqTDStIVJjQFkJvhh9dsMyiYLCUezNovEN+I1UwcU4owQnLNSIZMFEhg=
X-Google-Smtp-Source: AGHT+IFPVVvRgJhwZiV6j4xkCfdUzrR6DGnGMYo8fZws+use+5kUvfYFQjYHJ8OsNnHP8FEbLNe+OA==
X-Received: by 2002:a5d:4d4a:0:b0:37d:4527:ba1c with SMTP id ffacd0b85a97d-37d5531a0a2mr2327244f8f.49.1728675753903;
        Fri, 11 Oct 2024 12:42:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa79sm4686059f8f.72.2024.10.11.12.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:42:33 -0700 (PDT)
Date: Fri, 11 Oct 2024 22:42:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Helge Deller <deller@gmx.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sekhar Nori <nsekhar@ti.com>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev/da8xx-fb: unlock on error paths in suspend/resume
Message-ID: <37842441-e372-40e9-b0f5-cf69defc2db5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Add a missing console_unlock() in the suspend and resume functions on
the error paths.

Fixes: 611097d5daea ("fbdev: da8xx: add support for a regulator")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/da8xx-fb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index fad1e13c6332..66ff8456b231 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1610,8 +1610,10 @@ static int fb_suspend(struct device *dev)
 	console_lock();
 	if (par->lcd_supply) {
 		ret = regulator_disable(par->lcd_supply);
-		if (ret)
+		if (ret) {
+			console_unlock();
 			return ret;
+		}
 	}
 
 	fb_set_suspend(info, 1);
@@ -1636,8 +1638,10 @@ static int fb_resume(struct device *dev)
 
 		if (par->lcd_supply) {
 			ret = regulator_enable(par->lcd_supply);
-			if (ret)
+			if (ret) {
+				console_unlock();
 				return ret;
+			}
 		}
 	}
 
-- 
2.45.2

