Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEA986338
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Dec 2024 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733909562; cv=none; b=IU8W96CSJJM7jRNjEVJ3L4z6aCLJ5oT3l+w4wp9ymrPL30oZDoFFzDnzLtqGbzyuNCqYP3OTDNaXGCx6Mx412KB1lwjQSFwQr40ctBQxQXzrcR0zmcfSAAvPj2u4ypWGl2LAFU+RPm0rcMjnXGV6xoNi2gKPxDL2IAle+ndgplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733909562; c=relaxed/simple;
	bh=qyKnhrPjdXHEQmybHqZqQhGYiZQe1mwwZIQNT0SPuAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0fAXHpxsWEKdTyT7769BtxRghV5okrK/MTPVQfRbOC1F5aVXwsChOOfSH1GlNQTOVPeqsl5QfyPGFwmwSaG2Q+R2HYS09/x8l9sNYsAY2biXBUfHmpqJiB+MfPQyAW1LtFRF2dtXvlz4iB3ipIqv12l9jcxsHz8iJ524Dc8v64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgtD9YJR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgtD9YJR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3053123f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Dec 2024 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733909558; x=1734514358; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5VxB938IKtR3Mu0Y5RbPKBoQecG76afLhC+F35TrmE=;
        b=NgtD9YJRPcCBEOJS3AhGUJ72E2qoigxx4gxMxysKyeAZ35LiaAhzMfvTWMmrrlkUcX
         cvsDoRuvQ0Z3uGt2BIRwJbfbL2CFpE476uiP9pTodM/ubyWwdb4Kx8LcH5AWFmjhED88
         RExV2ohDR2BAriaTX5lUmYYTgbXWb93bo+SWsRMHbt6DM0YMK0z2lx5vG0SWOq8EsTFa
         RR76OE+3LRrBJRjqMz7xwFnwrhgO1QLJbbOo74UD62bg8aiVHaLyKAb9qPifLe8G6dk3
         /yVKLN+X+KrSStPF4mjIUdYpwdNCWz2934xa/dbwRFfWim2k8CeGLuY27/rNf9VLEO1+
         3dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733909558; x=1734514358;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5VxB938IKtR3Mu0Y5RbPKBoQecG76afLhC+F35TrmE=;
        b=Wr+gmkir7ZpNWEcPmfbZyt3gDVT+MbMMiPNPxveE8jyhJFzJSokr5hXtz/yfksWNs0
         /sUbKvAerrdoFYSYO3TVKwLOQ6Wet63P1cSxYnRAcAiuSzFdr8WkIpB2opGl0fa13t+b
         4udjNtJ18fBVqSedbMsg0jSTy/Yod/JtHEW90bK/cYjObVho5j5N3hefjtlfkQZQPsvA
         VbIRxQsLEo1IMcEI4ODqQBPuoBe2Kh9gKyEgV8sVmrBC6rXU5drBHS+xq2ndDAnEXh02
         Bx23Fl62t2/DMl+J7Y5gIbVpujD8oko489+MCkIM/5AIjj1VQZlO8KRluB6kzTXkg+4d
         K4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVP/Kaiy+Aff4urKlKRR0tl0z5EUXj96U//aYcpEOuABL6vTWhLJcagfuEItqZyyehRLBgDTET8mmFVnMESz5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc5ABP/9BK5nEEkcV/h79ab3CNP+YZUyd3wZTEkWGuKFs76gzj
	V9F/UQ9bHQWYQBzGtOJ/FyuZbhY1DV1Cof6GXtSSM15xiXJk+gmfvcq2+ib8a+k=
X-Gm-Gg: ASbGncvbDcbUK3Q25w8qZMN5z4ZhnWmusMjpVNEHTZ2IsTzmSazTfAR+yLoUSLpV4rr
	4E0E2LF/ZHNuCEvrI9wLUnnpsbYdEuoOrtEZ9zLNcv+vH0HfAl/G+ltqHdUwkYDm66y5W+IMFva
	tzgqzf7vkenA5sTsdHj/sDYB3r7FUMqDzAvUf83yZ5q7cMC8YLLgkLSHq78Y0AscRDlM99Mc6Pp
	aIVG8kufXYTLWoNaQpuVjMTvoeiT1yMelFbg5zXE3CCQOAfCjp0dfoCM6w=
X-Google-Smtp-Source: AGHT+IESPCTVzoAwL8Mu4aP6Ib03zs7NgOeXGz7+aMlKX/SKIPhdsqBIYQQBw02we1gLiAilrzuPjA==
X-Received: by 2002:a5d:598c:0:b0:385:f349:ffe7 with SMTP id ffacd0b85a97d-3864ce8959dmr1766176f8f.2.1733909558245;
        Wed, 11 Dec 2024 01:32:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c8a6esm849864f8f.59.2024.12.11.01.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:32:37 -0800 (PST)
Date: Wed, 11 Dec 2024 12:32:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Esteban Blanc <eblanc@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: tps6594: Fix integer overflow on 32bit systems
Message-ID: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The problem is this multiply in tps6594_rtc_set_offset()

	tmp = offset * TICKS_PER_HOUR;

The "tmp" variable is an s64 but "offset" is a long in the
(-277774)-277774 range.  On 32bit systems a long can hold numbers up to
approximately two billion.  The number of TICKS_PER_HOUR is really large,
(32768 * 3600) or roughly a hundred million.  When you start multiplying
by a hundred million it doesn't take long to overflow the two billion
mark.

Probably the safest way to fix this is to change the type of
TICKS_PER_HOUR to long long because it's such a large number.

Fixes: 9f67c1e63976 ("rtc: tps6594: Add driver for TPS6594 RTC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/rtc/rtc-tps6594.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
index e69667634137..7c6246e3f029 100644
--- a/drivers/rtc/rtc-tps6594.c
+++ b/drivers/rtc/rtc-tps6594.c
@@ -37,7 +37,7 @@
 #define MAX_OFFSET (277774)
 
 // Number of ticks per hour
-#define TICKS_PER_HOUR (32768 * 3600)
+#define TICKS_PER_HOUR (32768 * 3600LL)
 
 // Multiplier for ppb conversions
 #define PPB_MULT NANO
-- 
2.45.2
