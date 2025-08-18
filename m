Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FC0185B67
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520222; cv=none; b=O5ZksjQzzpgf/aH1sSDHhtsp7z/drQs1zJklL7+WMNcP5D1S+bCmjAhabL/XRGX2QDCEHdqqMM3FaNAoffsfjk3rk2oFx3yS1a6E1VdQ6Rtvsqq+b5PMXekylLnosN6FcCW+9VspSKmy3etQUY2fMnR+f6+MSrwkoSdwzsBgy9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520222; c=relaxed/simple;
	bh=JlaSzZxFUUDEKFzH+GanUwNC9293wOpUa3UXPCil240=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GbfOOZpk3OMrYb2/dyVZrSLSf7oDYkXkttCD4DjXO4uFiXdRqTOJA8FFCH8MjJm1MYF7RZcM8msdNdsnD7JnjW6omofUfZzlWl9p4zR9q00DqdbG5psmf3zjeM+kXG+lDGja0cIk1FpP1p/nVCymRilg0w/fb+D/cefkcBl5ZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wEXzxqwv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wEXzxqwv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0b6ac4so19461995e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Aug 2025 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755520219; x=1756125019; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JnfrGseb6nwzv9RscumfuSdQYxOK2zLF1Z1VoJgRh0=;
        b=wEXzxqwvJEl6kSqhaNKimR1iGEZmAXacel+z9x/BZYjG0+5ocOUOod9TIzV7zVOtXG
         ImOuLHXK+vYwhmmLO9fEQbBzlD65CMfpVnRkLykOQRPsDOWsaWq+BwPdj/S49M2k70JM
         UktvMaT1Q2CHm7lLBjsDJ6MI/mgO5+p3o31SLwTdSpK2cf8KC5/Zg5peRGbNnG05QXg7
         jjOaXpA1Dn5UAYkgs+lOWE1mkUIVR5tTVtuHs3buf3LVCtvC9NFSO3u8YakC7SSPdre6
         esi80xaq3ZJzFXn6viJGIKAlea4YwtlSZa9pApcwQWapr+xjrqMXJU/kBtkvgGJGcBSV
         QwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520219; x=1756125019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JnfrGseb6nwzv9RscumfuSdQYxOK2zLF1Z1VoJgRh0=;
        b=MqHhWBbbv3b9lhkhR/+rKNtSD4s+tyy/J+RnPE00z0FhHJ+Bp/4krmYs+HBW7kORWb
         MqReDWrl4BgFuzMcZxr/fQLbN3eJw/WO/8AB3EhGeWNgGrZjd5/lszZ3ycT+EDVwVAEa
         PT+izfGIzVNTXzEdoMcOgPCljzdDlCSPk8qmN766JV1n8S6qFbOMILFY43vncjTYDinq
         fPlYAJRtDN9pn5Pt3H1qjdYQ+INPFX7uhVz8WC9YJKBm5mJy0a1AZx+HjdJXt9LYWJQL
         ee+RQvE3ooPpJR4u/6oijcZEeOebsS0UlrFng1VOuTZxrTNRatyTVJPsI5UFRehd2Ldg
         dzwA==
X-Forwarded-Encrypted: i=1; AJvYcCW5sv71RCs4aPKpgVHb6kQsNatrN9X8EzeV4inJgc9j4ar6v5VEb8cdwcEoStmYmXFmfaX5sAro9JlIPYpDpB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYHQc+nlh3xm3lJZt4PZLhQw8vNKt4bME28gE6tI+esIQDGRIc
	u4FvroQ4OIHMKdfoWP/UWbissN1LCGq+7qqhGDif2i/HVbkPztj7R/qoDOVadzg3DFI=
X-Gm-Gg: ASbGnct9SA7ZklFOOyv34wuLOfPJqZYT2MNMGJw8DW2kxFbzOruUpeL39AtaHruXPZI
	KhpUQJjESUFdHHjVJiNECTok7zOJicPsYpQzNCDYMcj6hBmxwX2y1rd3z7CQ7XB1ftJSNmYGHVw
	p6lYuke4GcOTnHsyPRUdyPji21AFaBq8ZOzOhoOXk4r03TimJMVXMIMkPOSrSyHsih5lmaHcMdh
	Xo39gJ5rpbuDthvXs5zCD89PJV0+7NRKA2Ms6agySb3K0391gX2Fb4xyQegJC3Y18V+4ajTWxL5
	MzCA4/5D0O+QpjEatNbwXSwD6svCxM7mMXzIE7KaxuimXIE3hdP1a/mhfdF9cgk9Ald/F9EEES0
	IiJdwT9lstX84azU4570y/NnkpP++Qwyv/DKnIio409A=
X-Google-Smtp-Source: AGHT+IHbHsTWwwaFVik9BbWGPWwZYPFU0j7xb33QVY4O0gkyyCAWkV0Jsoyi3ARB4eQMlZj+lbRkSg==
X-Received: by 2002:a05:600c:630e:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-45b3e827f65mr32714475e9.9.1755520219188;
        Mon, 18 Aug 2025 05:30:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb64e27843sm12680828f8f.19.2025.08.18.05.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:30:18 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:30:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Chang <jeff_chang@richtek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] regulator: rt5133: Fix IS_ERR() vs NULL bug in
 rt5133_validate_vendor_info()
Message-ID: <aKMc1oK-7yY4cD3K@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "priv->cdata" pointer isn't an error pointer; this should be a NULL
check instead.  Otherwise it leads to a NULL pointer dereference in the
caller, rt5133_probe().

Fixes: 714165e1c4b0 ("regulator: rt5133: Add RT5133 PMIC regulator Support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: rebase

 drivers/regulator/rt5133-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/rt5133-regulator.c b/drivers/regulator/rt5133-regulator.c
index 39532618e73d..129b1f13c880 100644
--- a/drivers/regulator/rt5133-regulator.c
+++ b/drivers/regulator/rt5133-regulator.c
@@ -510,7 +510,7 @@ static int rt5133_validate_vendor_info(struct rt5133_priv *priv)
 			break;
 		}
 	}
-	if (IS_ERR(priv->cdata)) {
+	if (!priv->cdata) {
 		dev_err(priv->dev, "Failed to find regulator match version\n");
 		return -ENODEV;
 	}
-- 
2.47.2

