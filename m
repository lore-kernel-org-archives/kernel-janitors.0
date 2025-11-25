Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A76E25D540
	for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078936; cv=none; b=Xi6dMTw+9J+glSSRwx7XrDgj/olDJ9iUqMfehyRpC4ZmiFYebgshSnXFtNd7v9GQwB19pyHfTlP5cMLx6B7ZZBHXTB1MBhVwbX2RXXKP4f64xeGAt2t94SmOeUsF4tspQwmjMKTJ6zraDVTSb6EUGIvDuazVGhkP7RXyhqkaM4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078936; c=relaxed/simple;
	bh=ZpJV2g4pswmR5fsLqMMJdtUaMVZFpU0lNRhxLnBhCuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXvoV3PxaHvIVfLF59xmKBRMC6uxz/mOPKdGusvg+Vug2Y6ham9O4uxHPKItkrciqlVuEUL+dqqCHKGvhH5Drj7PTZQ1VvMchDZ9zr5T+PoSzWDiAFa6tnZIjMhjhQ+l45Ow8bkG27B9AofhAUmRhChc/o1q6AjNa1lNmAnOQyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueksEoO1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueksEoO1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b31507ed8so4693342f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Nov 2025 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764078932; x=1764683732; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qj5l2CM22fDA1fw+7YXGuZnpUGxoc2eRov5FmLwIscE=;
        b=ueksEoO19hUTXGB4rL8xhRm6EbWa4xy0G7duVxt2CWVHeTc6Cu2ZFdQ1umK3fAcnCY
         v0CaKBjLoH2wTJXlSzieVmKG3XGXPVEqEQWj8R5mTlL24hikbcPhkxrl+Ozd7pICvP9B
         439wv0g3vfM5xMnm/xVhMTNyamayipgrRQnH/cTgpndUHBsHRfY1NDpwxH9gdQnDpcen
         r9NODBDkqDMsZbAoU/eib0ymbgJRSaoOvOaowoW+mNQ+h9ap1NOQ5AbqF/VIJQqthxw3
         mynMdmRHLRXYii+pFn6ifQmce+5nt48Q8fFt/jsmivMKv1N1t7ixzdZ09muVpQbsQIxn
         cfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078932; x=1764683732;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj5l2CM22fDA1fw+7YXGuZnpUGxoc2eRov5FmLwIscE=;
        b=O7IeLPhtEUXnzWorD5AwQFEt5cC+LpA9LdHqr5ML+XVG2V4N5xawhw8KmvzpRopm3A
         CVBZXBdqOY4yBkp0SwHA6icWKdbcgT+ByyJ6cirD7p0s/DbAvzCXQQ1wgDWvm/a+EAgF
         6rafcUUe0ezJ15Bgq79cLr46K2v4l2HyFYHRR+PWqNwLaF0I4jjMUHRb5WO7HLnic6sE
         hyrJIgHsEGr7z9TGhWAZ0gh3p/7ud/VoO9uN29RkCt4bN8SbU6UB/2hRKFKvEW8n5nfU
         yi3tGMRZSwQI7D8JBaJVVIEiqUBHHMM2qom2XURWTYHhsPv3LFuYRTr89UQLK+5M46QT
         2/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWpF5hObA/rPSVhZ6HGm4TOr4n9hMfcZoQht0clD6QyCvaf9ymgjBWIOCaC7iGn91jGB/HVygQ/jaXapx6Dz64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGf7iBNL6NVbSnZ8nIliWTazJpBTz6+QaASDq4e+Wb102mdqi
	2/ZoRm+u01N/GiWtj9MTZGm4pdqxdyb68O0cSk0CT92w5ohFn6yvpE4nqLbMYTmbg4I=
X-Gm-Gg: ASbGncuvkW1j5AjcdXNs0hsz9F5TLtNk6zWQ1oLd+vM3D5znQO3mijxaVQ9e6LzMJSQ
	oRRN8qryGlmvm2fiSN5xnbELzycC6rhan9JJZG6TzEoJmvk7/Tyxt989TWgICPkBSjOKTxQYdWc
	1yXgpfZR3IQCCPdwrRr+lbVUMaRgys+xVCop+gaz2PaWaSe1VngR4nViTejf/3Ba/ohc3F8dDgp
	bGv0Ai2rvaqE7YsQCpxMCyKJd4dEqf8gF0Y+eS0uwcotOMN5ZFagrl7IhVh6CU5b/76/olvBb52
	kuNRTj2gHSAoRK9WdruVfJFpd3B1sOTMR/CzBso+afupKoo3wqelgKOKCRStG3wQnDTnTYATbbK
	R0xMsDrwIrQC6HVzQu0mahtmsDZhp4DT9tw5NuKNzq0NHyqT/UAO6UB2aPHObfIUxuPi9moOV5D
	n+56bvNGcEE/4INGBI
X-Google-Smtp-Source: AGHT+IEoviEwOKyAo/e7XcJ+LgAsfut7GBUDSalEwMV+33vddcxo7V7q+O0kWwVd3H/WFPuLBKzd1Q==
X-Received: by 2002:a05:6000:1789:b0:428:52c7:feae with SMTP id ffacd0b85a97d-42e0f3492bdmr2780337f8f.32.1764078932198;
        Tue, 25 Nov 2025 05:55:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fd9b45sm34841588f8f.43.2025.11.25.05.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:55:31 -0800 (PST)
Date: Tue, 25 Nov 2025 16:55:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: SDCA: Fix NULL vs IS_ERR() bug in
 sdca_dev_register_functions()
Message-ID: <aSW1UOgMCiQIaZG8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The sdca_dev_register() function never returns NULL, it returns error
pointers on error.  Fix the error checking to match.

Fixes: 4496d1c65bad ("ASoC: SDCA: add function devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sdca/sdca_function_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
index 91c49d7389db..c6cc880a150e 100644
--- a/sound/soc/sdca/sdca_function_device.c
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -96,8 +96,8 @@ int sdca_dev_register_functions(struct sdw_slave *slave)
 
 		func_dev = sdca_dev_register(&slave->dev,
 					     &sdca_data->function[i]);
-		if (!func_dev)
-			return -ENODEV;
+		if (IS_ERR(func_dev))
+			return PTR_ERR(func_dev);
 
 		sdca_data->function[i].func_dev = func_dev;
 	}
-- 
2.51.0

