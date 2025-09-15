Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BDB274FDC
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Sep 2025 05:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757915407; cv=none; b=OK7InPCxLS8PibnFvF7nG63FHzkUCOwrsXRDJLlaF+p2mZ82gxNIOe8wzW6+O4dVquh5UFcVM2BEQsXf7K02gWTYInuOS1R3N2qsrL5t+fgfXSByWYTG6u7PQoxN9g3yXo/kdljnlaU/aGhOxGq0rlts19TuYUS4LvmEMqw42Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757915407; c=relaxed/simple;
	bh=fiwgx8MAD2XVYzvxjkvb3XQ/m9LZS2p8t8MWQAfOLm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AymSdrdZIW1e5mh+JJs9T+xlPZSluixR0gZ7rpeDG2An4PmD4KpQ5MQm/fb0BDZzSHhWy4+qNSO1bOqr5acSAKjuQvyHtIyLiQKFTnaeL0jzEvP95qPZ9jpzfAtAe/VNV4opSBR4LhBuwF/ouZ3J6w9A5hILgTWMR5LfuK7oUqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjuPvkPx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjuPvkPx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45f2f10502fso1102535e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Sep 2025 22:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757915403; x=1758520203; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/wBl0xLLFWVBpKxMI9aJF68zcNMG/DejRgIpzGZk0I=;
        b=rjuPvkPxUiqWiJaP8vf/aMiepBOJEAd0AvORKY2TuO0BPT9Lkxd73FMpD6F6QYfJu0
         AdQTW7ozH9XSBhaPmcIyo1jnnVMSzk7ZV7+Wxw3AWy1OEeo5dxElTtDAosnGpZVde6Xv
         v2uCnraqcmGtZtB/heNWDONqlxK3+HvJuzKxVxNVm8q5lRkTk2jcsnqCpZSEQnV7VKmE
         WU+gYkPkim2pSV7vqL/OSZTLuU/Wpy1zQK0KD/GGSAVbWevEz1hC89ajfeT1YxD16/2Y
         M9IONNcBVeAH6bBKQpsVTmrDkJUZPUCOFAv/sL7abOJ8Hl9uTDrH1832TYyqM6u+NvRb
         63kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757915403; x=1758520203;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/wBl0xLLFWVBpKxMI9aJF68zcNMG/DejRgIpzGZk0I=;
        b=D7WTyY5VPrKZ8YNH5tPsqp86XzVpExpsxV/DVp65xLzXIhjkPCByf5PS9pw/XjFj3I
         atdzNFGDgv+0ISx6UtPBkTpROeNhYBg1H0gTxp3TVc85vMfV3z8DiGs287ffciVxAhz2
         jZrbQwqpBpf5ccmAUxH4jVl4QO3MT9mbw5Fo50i+NxPWO/dsqElIWvNpH3AoiWByObUH
         wQbjGe28cPP90RVBpthU/rr6fseVKjQ8OA2uCusm283UO3seTZRKNfuWb6etvHNAl3t/
         nbiChkd9aUz4EfveUbygJmUFPsl0V/HqqsC+VEAed+gKwq6Lw0qiIPs8zP99o5URb9YG
         q/zg==
X-Forwarded-Encrypted: i=1; AJvYcCVIv0Miur1tWmNPr2fC9+HtaLSTcEh6riqIT2HV+ZHQk4K8GXF/LNRAtw3xBzSG92QymsslxVxHLvkZtePz4vA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYOcpqhq03U+5I1/2aa/HLPavAJ94Grz+Z4a+koVCWOepssBkR
	gg1I2HWKmdCK+N8ZZjiTE9IE/W+u/OoNPj9DolJeRhPXJyyx9SfZV8EcPy7FqBqi5OI=
X-Gm-Gg: ASbGncsQg3mdKNI+FanLw/iQXCDUC1enQnenvzMP+AfTcy8IrEPFf7oBAD9qWy+WgJc
	zlHWAqmNmwAfjHsLmc70ZzOTAoD4Wyblv/deeg1/Cm18vKqkTSz6hw10vgZhoDyFlj8YsF1VolK
	uRc9w32BCYrN21P11CoUhTRnWfsq6Hm7rAdsGzcTmenfd9quz5sk4q5rPWR83N++i0WjWJoxkrf
	hlzhyDrvcwf3LimZDDl0k3EYrTc6XS9PdqowJXoTaLnVRhYsJtzU8GJnHjNFJVRVoMnYEu4UgaF
	k47OlZPhS8pobAV7YdVUr2Lw7ODjvj2zjpmuKbBYmu3pL9iz+hZEWBNEQQ2R4cvYtn2Fe+Gpr4q
	barUHoR6+n9HJ9EHPxJZeDdN6o5I4XjjlHcn8290Nm1MI4fpv
X-Google-Smtp-Source: AGHT+IFRoam51kLCQlognqaLnDSeb4W/WyS/huGGcdNg8zu0xDnWYvxEcLms+5oh6bPzNGICjmp+CQ==
X-Received: by 2002:a05:600c:58c8:b0:45d:d88b:cca with SMTP id 5b1f17b1804b1-45f211cb94dmr78596335e9.1.1757915403521;
        Sun, 14 Sep 2025 22:50:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9996f384bsm5624675f8f.56.2025.09.14.22.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 22:50:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 08:49:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Feng Chen <feng.chen@amlogic.com>
Cc: Liang Yang <liang.yang@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: amlogic: Fix some error checking in
 aml_sfc_dma_buffer_setup()
Message-ID: <aMepB7E95kwYvx0o@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There was supposed to be a "ret = " assignment here but it was
accidentally left off so the error checking doesn't work.

Fixes: 4670db6f32e9 ("spi: amlogic: add driver for Amlogic SPI Flash Controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
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

