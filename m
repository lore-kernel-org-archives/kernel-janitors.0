Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3325B695
	for <kernel-janitors@vger.kernel.org>; Sat, 13 Sep 2025 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757794628; cv=none; b=O8Nl0rKWLRP+A+Zpxt1BSrFwt3FGKVeJfWcg2IQR1q3TLXP/GQWpsUgBdMXr1gFnzDKJq4NnM6WP1HzRIotc6PvmOnGPfmCMB2on5DCQsJ91Kv5kGGmfmbUU9odN7nt92psjb6A6dapggIOj+1Yy3n+9vQz1tnor4ryEOCl9F98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757794628; c=relaxed/simple;
	bh=FWdFpDZXgweIgfaXmSGMrKPTFYGwmCSWLoLB9qphSGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aN/19juLirRY5JajGkMbnX3DNjeSR06H6vpvMR1HSajbRtmHjry4/aAxXiQw6kSpSrAHJ8luDJg0EjMpaA/uQQfSOxH8tSXeB2ahc7S194pwY/brJNId0O32gZDcsJ4RR7WXgk5illxpVKXLvS+AVzS2cIxeS2QHfXUi/bdKHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxCTGDvv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxCTGDvv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso22449895e9.3
        for <kernel-janitors@vger.kernel.org>; Sat, 13 Sep 2025 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757794625; x=1758399425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=JxCTGDvvJh5+cf1FVW3oQWiN2LsJOEtPGYJ5EsBoFS2r7kDzqe5Xfzjyj+fsnHrEJ1
         QUp7lXoDzayhmApFMRgU4za9/k4UNTY81NG84jcqDiGtFw7yZkON3NL2D6NQqMW1OBxM
         0UeKACHIzhFSTpLY6u3wKcr28sCVOQp2RTbgsCKRqddVLs+z7MAoisBq8ZtECxNkHDpp
         vL0+oJsyqQsza0UOjGF7bDc6brdvJBhyV4PZWMGtgyLklyJ2rcN0TMBh2UVZ11BE3ZOQ
         tAncBCWZsLuJvfXj+ZwSI2DttHnGX13ZT49jvTE5BvX/3fE1vcD1U1feu+qoZp73gwa8
         dibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757794625; x=1758399425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Koaj6pqpf5k3Jy2jPYnNq/imDVBkH5e1i3AFBAwM1v8=;
        b=R4bTbbv9RBgnvIia0EEaQD0IRbx9e/H2WX+/dzwmXsuizxG4sgYGQlv0nvBuVKbF9E
         uERQBGqaGuumEcra4GVCKgCuGFC6jamCEMMyq3nYpFgfsMq/KNGaU1DPjp8bCINREt0W
         D8VLzuxPCWugT5MXpDR66KqzDocb9ss+14poptj0BHLyj16bUzsQjv0qtH8Xl0H1p8Mo
         dGVIpRrMmeLkY/nrVVtQd49eE01j1dHz0vIbPbVnbyYoeTtiFOwHfV9u9sb2YY/7zP5q
         CE8oFPEhIDrlEuPTzLx3KGl9fIHFTg3J2zT+Rkvni/nILoweCquqYYwJ5JciEElmMyYO
         cFEw==
X-Gm-Message-State: AOJu0YwdVkZSNjk+zGef5pLwvF7/lhFXtySo5UlBcWfyR+DG1ihWypL/
	JamL6dvvZoR5gpjxpuKyfWfW/o1IQNZ7MeKt96/HzVqkG66dmVERm5c5
X-Gm-Gg: ASbGncueThQccXJZMID6v6t3Zd7uVxBAY+ufvW35853VopSL2H6uf3ACiT2IANoPch1
	z3a0NLQnitP9kroA+W2uQkiR6iuPZEJcZX/tkKBTDXKfc6fYB2vxEtSJ587Ucx1hEObP1Lghlin
	jOGZnX0QGXv49z9BBr/YJhiEq3BoA4Oh+yqJ/LaMaKneeFGDs+SzinMVYbWKe6xNyTdsJCbJfbd
	g7GfMxIa0kvhH/cEDzgT2Z3ISPseZppLuVR85uQw4rh8e+CJJq45pSdJXgb382UTt2MyB6+eaTh
	i2G1tQdJkiBMsLD7zhqK2MeYmHvWyaEVejyAFEqhA6G31EsmhWZg1RyiL3RDGPp/ys+8KKMbF1O
	9ZljBVrJlgAgVoH8u2W206w==
X-Google-Smtp-Source: AGHT+IEXKa6xffHEzbijIqHJqGxOlxCQ+oBv/ZWdVFhhrgUOoImOvsVfpGK+TXJ+kkkvEkQl8EtTxA==
X-Received: by 2002:a05:6000:2408:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3e7658c1c6emr6975696f8f.28.1757794625150;
        Sat, 13 Sep 2025 13:17:05 -0700 (PDT)
Received: from localhost ([185.63.82.103])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e760786ceasm11628425f8f.16.2025.09.13.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 13:17:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] spi: amlogic: Fix error checking on regmap_write call
Date: Sat, 13 Sep 2025 21:16:11 +0100
Message-ID: <20250913201612.1338217-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently a call to regmap_write is not being error checked because the
return checke is being performed on the variable ret and this variable
is not assigned the return value from the regmap_write call. Fix this
by adding in the missing assignment.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/spi/spi-amlogic-spifc-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spifc-a4.c b/drivers/spi/spi-amlogic-spifc-a4.c
index 4ca8e82fdc67..4338d00e56a6 100644
--- a/drivers/spi/spi-amlogic-spifc-a4.c
+++ b/drivers/spi/spi-amlogic-spifc-a4.c
@@ -420,7 +420,7 @@ static int aml_sfc_dma_buffer_setup(struct aml_sfc *sfc, void *databuf,
 		goto out_map_data;
 
 	cmd = CMD_DATA_ADDRH(sfc->daddr);
-	regmap_write(sfc->regmap_base, SFC_CMD, cmd);
+	ret = regmap_write(sfc->regmap_base, SFC_CMD, cmd);
 	if (ret)
 		goto out_map_data;
 
-- 
2.51.0

