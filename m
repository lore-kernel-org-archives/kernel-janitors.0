Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C939260569
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235141; cv=none; b=j2lz2Ym9evQTC0iMahEkYHwmrUrJSx2gmk8HkGfdCR/zWgkHktw4lO1shLAL1akLWEydx2nxDr24bJzP47S0uxbdJweoGA7mnh21DIsHowLBn9W6shQ33ZuXABCkuXJy24lE7LpcXm41Ad0Sl9JW/XXvAVl6qAEhY06Ru8oYfhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235141; c=relaxed/simple;
	bh=heMBj5Se7D674ot+jB86uM824vbkgYvDDTYr2KtcYCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSo08Is5GjVIb1tu4kr6q7AAssXNeQDs9kOKa2OIGpJYDsDt8B1sHjhleE5dDI1K20CHpvpseiT7ab+5tDhRvaSw2UhFW0yMJJIdIe+laPvFgmPx6pj54Z9XOgkLzJI7wb3t8TD5XmJYzIAOjaj5k7cno2zmfyqRsyusZM/nzR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hd0gzNx1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hd0gzNx1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so12295305e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Sep 2025 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235138; x=1759839938; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1AXE3E4du7FCwUTXFpKPQhJu66seghaqwcG1g0MMZMA=;
        b=Hd0gzNx1SK5r5C939TAWQwIJt/DaYSupEPAymjMLw305ZOwoHMkalatSRydfV56KnD
         kKFtPEgR7HXNLhLHDW74pzu6OHDn9ne1nuRAQmPDowthoKF/FRcljrWBMB6xcIBXxgFW
         PDWsUH6iC9mB1BlT4X4HlUqspE5vSmY+B4Ygw71Qg16MFpJ7l9yYW4Fi02bz3pKb97iH
         en+t8ZvOx60Xt8S8wdFF5UTAlXTfTov91SjrVljDQ6JaYc+vneqxEDKvgqtN9QElaVn5
         +A47MGK5t6Kl9jo5FqbIWEbmIpfpbom2Hzif3h3peHWr1SZ1X2EnzXFqg2Z4gPzp/X13
         4Mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235138; x=1759839938;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1AXE3E4du7FCwUTXFpKPQhJu66seghaqwcG1g0MMZMA=;
        b=MU650zkxF7PF5g0oAQYzbudymOQV77a5ov7lHehI0FHFF8pktcWSGON+cUiATOIy3D
         mJ2l2iYQvMh9ozN4QucZvCT+QNE2QzLQJhisAz/E/rRrEjycDeR/hc+rUULyYjoChEg5
         fVxwzT1ZnMhfk3wSXy59J+IoSpz/ZNUW7PDzg0/MH+VE4iQtH1NvAKteRR9C0P3iolKJ
         ZDuUvUhSNI69aRnoT1x5X7hhtwXAFWYlzTVIaFw5QFqNLisCL11zA0FNP/Wegn9pB5s6
         f/To8mWjqoIjJOew76r2npRsAhB6UZGxbyNYWA4WMCBKUS4Tj+FvU1+vVfZFn0jcBEv0
         KuhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2H8jt8hdZLnzZmVbKyFTic+/t2AMWGeO1BuIdO2VtXEVntRKcRHhanN1R0V0joNFfzk9a9atAKN0D3eWQvto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdvHF+zhNVAeQZ2yML1nbio4A36xx14NBda6raCXtXiQESYOwV
	K5iP+oo0HBukvkO1U1nD4ZcjmuBcoSptMi+I/3AhV5UX+lSVzdmzlr5rNQYWM1PBE2I=
X-Gm-Gg: ASbGnctD79dU3DoCPoThp6GILQhcn8FfhSnIr+e53Rm361qbuTCElv+gdAxPDhl4ilc
	4fZQM4CtjSmH+VJjHYiacxAKmjiXZBrDhirJy8MxEE50nlEz9BV64THUkBjrssfZilG31LoXlNi
	AJuLLjHUiHTsJBcBm0CS8INX2xU3613s5zIXQW0HA91Z5rEh8nue2T31ssBATmF7lpgYK/35kx6
	40+z9bpz2DtzRtYFmJk8ml3fL+iFzzkuUAjn70gaG0ejiDH0+Hs3Rbk/B4bzcC2HAY6ea9B1DHV
	fbk+FBp8JZm/2b99Vclu+OteA+OjSUhKIkAuf+MUg/Q7cIu7WYl72GE/w85uYrtp2Kwutu8en/A
	uVAX5a15wTv+7RqIU1bCG54QU0sl7N5WsVVLHkr9dvlT81lXdHI+R
X-Google-Smtp-Source: AGHT+IGDWKfvS7xIHf+6vDs/q0NKQ2FRZkP9GQRKEpMrTz9/x83MNNzlklURhvJCRHqO6tBrQqt6Dw==
X-Received: by 2002:a05:600c:3105:b0:46e:1fb9:5497 with SMTP id 5b1f17b1804b1-46e329e4d87mr203921765e9.18.1759235137830;
        Tue, 30 Sep 2025 05:25:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e5b622f37sm13662115e9.1.2025.09.30.05.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:25:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 15:25:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] Input: aw86927 - Fix error code in probe()
Message-ID: <aNvMPTnOovdBitdP@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Fix this copy and paste bug.  Return "err" instead of
PTR_ERR(haptics->regmap).

Fixes: 52e06d564ce6 ("Input: aw86927 - add driver for Awinic AW86927")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/misc/aw86927.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/misc/aw86927.c b/drivers/input/misc/aw86927.c
index a0c88a7e1e1c..8ad361239cfe 100644
--- a/drivers/input/misc/aw86927.c
+++ b/drivers/input/misc/aw86927.c
@@ -759,8 +759,7 @@ static int aw86927_probe(struct i2c_client *client)
 	/* Software reset */
 	err = regmap_write(haptics->regmap, AW86927_RSTCFG_REG, AW86927_RSTCFG_SOFTRST);
 	if (err)
-		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
-					"Failed Software reset\n");
+		return dev_err_probe(haptics->dev, err,	"Failed Software reset\n");
 
 	/* Wait ~3ms until I2C is accessible */
 	usleep_range(3000, 3500);
-- 
2.51.0

