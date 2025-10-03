Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD182820A3
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Oct 2025 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759483818; cv=none; b=VpT0gJaM2aT/XQ2EcOGasIFY+4wbw+NgkA2+WvWnijok2HFy4MwPj0M3/s+6ZsRUaWIeK1gT8Pr/T2Kl52Z/WIZOcbhTEgTF+10XPCTCCLq+TkbbxloXZGeGzsagSg8IYqIrvry6nj5QKSulhypLfoa6rkf2mEs177JoHJfD8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759483818; c=relaxed/simple;
	bh=XI/qi6Okuo9kJdiQntzZ1a9/oDWTMJdYxZI4E72cdcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOXD+BCghLfClwhOkb49AhZROE6n0jnCIYZlm1mgc5qjHbtNNz+Q2bVHXsdkJ+SqcvOlgXI7rrDPXDQ3e9Rt9OtBsF8ai64h0vee6BeOIKGmAAg4fuoSqFeITCcUqrkKlehZlwokFZ1ztxI6mD2X0sJ9jp9UIs0FdREaaB8cPZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htj7KhcW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htj7KhcW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee130237a8so1361466f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Oct 2025 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759483815; x=1760088615; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GhgLDi6NThV7CDsUpk/weXQLRMerlf2Ax6eN1eI2x/g=;
        b=htj7KhcWtAJ6kzxA8KHsMV5wCKGtv4xfMrGsiKmaf0TAW4pHDlrrTcG5JSacJYA2FE
         +Xjrxg5A/SxwnbyzJxddxaEQC3q8/0A1ZpN758o74QqzH3vR0vLv0hJLjbVujp2jrIAN
         eaou4vHCMY3fApdX3L556bg0W3CUubGc3tVFBCSO05ongOg/gMidRMflrMkIBGenTgU+
         +d2StVoMoiwdP3b1jWuE6naY7SH8HA1U6zdedbcxp7xFUWHcnCtmbXYXalIX1wCg5JGF
         D1tTtC+n6cCWnk0lDAPaPoe/HZhbd+K47dVLW0peIdtAYt/9S2YUHWFjaLGqWCgTRpJS
         wboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759483815; x=1760088615;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GhgLDi6NThV7CDsUpk/weXQLRMerlf2Ax6eN1eI2x/g=;
        b=jEsNEp5mypi5jZOog+IAHWFcSH3DZX6o947VfOVVFrKLyLFsu2srGdNGBaKiNTn7tu
         WpLJFBkrlpzViwcjG7cCp9V79XaavBE+MLQSU/iHxl4o4dWcyErCbUh1ufp7j/wDpJVj
         7J1ZFQvdzgACWJSnuU1VG9yEH9HLfp7fpZoKtlOr9KdotUpdfw5JK8wjkngxX2bQv1Fa
         K+ogdT47+5GOSaq2agl69mNPEeZTxHhIf0I60zBSFhklYdDw0sD5XfSEvMwmCeNDs4w+
         4+3rbzKCUDkggJBr2LRIl8yW1wpBJfQi7qvunOChK2djnLo89dqFLkmMQABIPVJHh1qj
         lX/g==
X-Forwarded-Encrypted: i=1; AJvYcCXx93efhktd+vuKjEvoFIDgjo0XHPUURGVBuy4d6MWJHWB+5k1d6dxwgC/AxDGLejIZeS/4U92MbQUgmkPuJm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4UOkN0YBeJozV9NX1nNnH1Mc2aCAv7P0l3i1VWsXO2LeI4AD3
	RrYIz98GAlpGHpPwbpYFWKhUHaeRYt/GHmIsEdTMT0uwAePRd1dGzcn2X8rTC+jhSTM=
X-Gm-Gg: ASbGncvnquUnWPWq45ZFcOFGGTq6MiI96OodI7UqpzfwMS2FE+gScSHeClFkCA1arMU
	0SBP4LrQBHiy/ZEzQAtlJV9kpAZzDLs5A1Lpc694cv0n5pbnZA2iLtWmyhXq2CuTYPIlH7BCSe1
	+81RuhOBkoRNiptdbaYUonAhSMN9BENswdaWpI9o/OVawQy6sa/aT+EhOw0fscqsHEvBCvPxeod
	oUQuuQm1/IkNVOORjsM2wFta1HUN4ivjjT6VweO5N/qplAyPZJt8+UytohQQMMST2UJgn8PP3oG
	gHxAssCev7fpmzdOP1PDh42JOMt9RZ9XCwM2H1VbuTLhyL9coyX94E7ntj1y4ne1jSOuv4fL1Av
	U4IfPg/rdyQc0EcjZaHg30HW3UFq6KQFe4btX94c5bx+PEs8j/KRJyoro
X-Google-Smtp-Source: AGHT+IHx8gWCZHt+AQN+RQlxboRGMUkamgU3aSxPItSzubRdggN8p2qx6XItQb7Bkrq5pYJJkn1S/w==
X-Received: by 2002:a05:6000:2283:b0:40f:288e:996f with SMTP id ffacd0b85a97d-425671c2f8fmr1476726f8f.63.1759483814628;
        Fri, 03 Oct 2025 02:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8f01absm7082890f8f.44.2025.10.03.02.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:30:14 -0700 (PDT)
Date: Fri, 3 Oct 2025 12:30:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mtd: nand: realtek-ecc: Fix a IS_ERR() vs NULL bug in
 probe
Message-ID: <aN-XoqpP2Jz75pjj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dma_alloc_noncoherent() function doesn't return error pointers, it
returns NULL on error.  Fix the error checking to match.

Fixes: 3148d0e5b1c5 ("mtd: nand: realtek-ecc: Add Realtek external ECC engine support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mtd/nand/ecc-realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
index 7d718934c909..7c275f1eb4a7 100644
--- a/drivers/mtd/nand/ecc-realtek.c
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -418,8 +418,8 @@ static int rtl_ecc_probe(struct platform_device *pdev)
 
 	rtlc->buf = dma_alloc_noncoherent(dev, RTL_ECC_DMA_SIZE, &rtlc->buf_dma,
 					  DMA_BIDIRECTIONAL, GFP_KERNEL);
-	if (IS_ERR(rtlc->buf))
-		return PTR_ERR(rtlc->buf);
+	if (!rtlc->buf)
+		return -ENOMEM;
 
 	rtlc->dev = dev;
 	rtlc->engine.dev = dev;
-- 
2.51.0

