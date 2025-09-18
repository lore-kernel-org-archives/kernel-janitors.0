Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638901917ED
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758178674; cv=none; b=eMpf17dlU5GFCKSTvbuiVJ7Y7dCFO/LMTFYxj5a2MQPbsjFLLdBQ/vRKMIME/HCkD2J6EFoccSRWn0YXoLykD5cWkyH4GgnWNtWkf58RQtLZL6IiXq/5LoO+FvpkV8W0oyKkSslXJY74Q194X3lFNTgkEOjA4HvGv9lsnvASIDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758178674; c=relaxed/simple;
	bh=Pj7C6lSwNgTZXom9kMKSotto7rqPi805M8krrGWhdZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIu/2kGN912F8uzwjvTERVZKzrtmSpGx9ohjP+xPzSQa+Q06ZFqbZBI2elh2ZkpYZQPg51ghSn+NY4uR+s7LX/ucWNHc60SIl6dZgTC+gkucNj2raJykQMSHXzsafbYm37YXk8USBZnIW1vBO0x9qhfecFxMuUgz+VZspvsOYfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IMBaM5eC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMBaM5eC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45f29dd8490so4887965e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Sep 2025 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758178671; x=1758783471; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/nMa0PtV43rgQWcYDMB+PP5kWaFcHHQhI+qUmHdeuI=;
        b=IMBaM5eCXXkkaM5X/iTM2RP4xSLJSNls5MHlyrEHIEBlRPTxmT1XNvFy5W4Fb1ZeSO
         n9LLFzZb5EJ3uZSxQReC1uf/hf59lpY49SWHfr1dYy7HPP/0FEgvL0BF1tfg7YxHiyHD
         encfkTYbZlU/EMfUcVqI/4fRheExYqHp4HTQmTrTiB+432BWCSc7AC+Kmn5nsQKYv+uL
         DHS7iEMr20ik25cyaw1qZhMxBQRKMtUwYgW33uQOR+VvJi+wM6c6Vo8yo0v+IVEjcmTQ
         13ofajq84GUhImII2ZgrMGaEGz9Y61JsLeIxulXE6xnvP8Jrrb6QzZ3CNHzJD+rLiFL8
         ayzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758178671; x=1758783471;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/nMa0PtV43rgQWcYDMB+PP5kWaFcHHQhI+qUmHdeuI=;
        b=EbWfeTI+gkvtB8NpphNS/7DKoTeg5XnMS0p6bCdaf0fkfRqjnFH99BNbJrZ7uJajVZ
         NUhAO/1m2w2eA5bGx0pC/7U7Klev7KRFFywQMb933FcEA3+Rpd0XO1XDFObW5t0TgDkm
         Eu9pC5ylVt6xk/k0bNSqCbfYQQQSlXL1kBGYM5Qgu3pZno+iuHFKhZxw4pfHRRBdX3oz
         1NztwrZS6r2TjpkKw8MKbJdC8RJZB2wlfFopTDssxhjo1X0Sbol76ibg25Bs0Tr/3p2W
         3OGi9ftLhjPuScwWHfr3KeB1zXofR3Sptf5zSVbV4xzHc0x6NXLiTchWXYwzWUJbAOok
         zTOA==
X-Forwarded-Encrypted: i=1; AJvYcCVyIgc0s8pje84EsdR5M0CFctuclCWhdmfpNLPpCMr4BiiYxC6BVowwrzDZVgSqwpVxsEEpVEpb36qJjgMNlZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YznSmJDnkr5ohzamMY60Q5NhW7WGECTdNy5UwGU5DHLbAuno4CU
	xT86ZokU0jlt+zCruMOQs7Bzbecq/JVtSvfMzVZaXNgEfhtfPB+EoX2J9EZh08BwTwQ=
X-Gm-Gg: ASbGncvi4hCMgE+aXul9AWJIe2ftX13YNxSSU8TpY/rASJ+4DMrmzzTmtyP1rLYka7B
	podMWE8CyqYEOvPfjDfvr/g7p3ZM6CaPBO7BVYvQZKdfJPJPSSaB1DeLN7YeegFlLAZMDvj7VxL
	paeewu8U5EfhLP6l9mmFZmwg6bbND8MHILL6h1Zn/GrlH73DyZj5fGLSOuFq14lc8oZB8hR0zST
	3AWeBapO/gNSBuE/UPbavI3TxszMieilsJaPZgANdGiLLlANtFuH1gMLDQVuzehF211lMUbQmOS
	LeJNBnSwWF15oRrolS5laGmo+2IQ4Ga/02xSohlEXTv5EMy/v8dYEA5YZLtZJCNoS6vk1HnmsWu
	ZF6HaFXWc1OhzlpOn444uoidKx1jD7yeIqt9RoK7EhV87/A==
X-Google-Smtp-Source: AGHT+IGwR8k7r0TQYAu3JvMmJhIKVXCkY8cUsMc5qCPfSU/SkaC0D9hFbJ3u/9HM/gyc79LjqswdEw==
X-Received: by 2002:a05:600c:190e:b0:45b:47e1:ef68 with SMTP id 5b1f17b1804b1-462076af168mr36954925e9.35.1758178670715;
        Wed, 17 Sep 2025 23:57:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f325c3c29sm56657115e9.3.2025.09.17.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 23:57:50 -0700 (PDT)
Date: Thu, 18 Sep 2025 09:57:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] EDAC/versalnet: Fix error code in probe()
Message-ID: <aMuta8vbLUaP_C-R@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code returns success if devm_kzalloc() fails.  Return -ENOMEM
instead.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/edac/versalnet_edac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 66714fffa591..7c5db8bf0595 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -888,8 +888,10 @@ static int mc_probe(struct platform_device *pdev)
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
+	if (!priv) {
+		rc = -ENOMEM;
 		goto err_alloc;
+	}
 
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
 
-- 
2.51.0

