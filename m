Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961F615EFC4
	for <kernel-janitors@vger.kernel.org>; Wed, 10 Apr 2024 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712758962; cv=none; b=Kj74JGCzBgC88OfHqnkAhgNQxgnYLDnEjdfFCIuH8hPvn8IsOz5zOgfVm5L/0jhUHGxfufcnsIo61DT770/cT6G6CoOUfNuYsX7qcJVjmeC+9AOXiG3oCAOliJ2YCbKy25K3RUnGBBA3jkHcMH/Gh/FVUULMOz0nETGNChWM4/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712758962; c=relaxed/simple;
	bh=yaSKqEJum2ck2PZxdBaoUcQHyswu/eekvDph0rJnJ3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lafrbnhAJuC/A8953atYO1j6jivi0GOu3WXxVwatnbiiDqbZ4sdZxsu9Te31BauLITmpLY4Pr0NnFv/LQCxPDb+/qubevq5ne6O3FGCFKz0iQgtP0qacF7buPA4Xs+axknb9zfb/So90eZtX+dnEyCJ1I7NaxaIyHKNKC0RhCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdlAwCf0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdlAwCf0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e2ac1c16aso6943539a12.0
        for <kernel-janitors@vger.kernel.org>; Wed, 10 Apr 2024 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712758959; x=1713363759; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9TniiRgXZpUH84DKODlQtqenNtFYZDXqebQBO7ZDCw=;
        b=mdlAwCf0+1A/tEOJM6L2xyodHkh8NxF9qUtSHN70/QFE5M9NEHDgqC+n3US1kmtX81
         cM1I38sY9dWemYpwyqf2477rBfjRfppDLmRCPmVKu7baFTvSqO54m74UragWpqEMDrYO
         Om2AJgdm1bTCHlDLP/0qrYmYwuGpUU+WwRaCm6DjdxGg3yOLw6mvDC13LGtCc13vbpqr
         h6StmdufMFMtyzRDThxXkl0F44XK3OnqAggg26gOTPBEhWMWL4yqB2ScSMEuX/nELwnr
         770UQGoqqq/ugQttE4jMfXBgU/wN+NVHqD6MULuGFYU1jObXgXKJWl7FnJpGrfliF1Nj
         gYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712758959; x=1713363759;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9TniiRgXZpUH84DKODlQtqenNtFYZDXqebQBO7ZDCw=;
        b=H2W/xYi1gT5rRz9d+/gnnesUqtXCyFEwOoefjEf2pVAHrTwJ/S+DNoq3gJ2fzoeOTU
         2X6xaJlbN+UokP5NXsps9D5w0BWiCbVbZfaX4D3SRpab3xpGPrrgVaATpgUD78+PlELW
         yP1wylPlBu7wrps7dgTbQC7w13q0hPc/fqsW5q5B/ssEdm0IEtOKHijKNkL6e9FkColX
         r1nVMJBvTbQxtxSdawDEeduLusihvIxENECtKLZmWN6NDZ/rUAngBc88wTfgjW275WRc
         MlI9x2YLd9Qo+HjX96MRxUno1zzFxxMGOKNjd0SXB9C+M0P0cbcAo1hRFnXJy7Ridhis
         vUoA==
X-Forwarded-Encrypted: i=1; AJvYcCVcAxG3m7khx2PZv7NBIxroAWDGclNERGpbzKsJkI75zsg57dBVrquSR2boyhA03L8ERY3m3ZOyB0fQv5g3tIxQrzAbJemzfj0iH+T0ERk5
X-Gm-Message-State: AOJu0YyLzgGe0fweDtv1bjdu3QKZctaiXLs2r3tv6hIrKmWUESgpTA3F
	Rp4At//hxNmS78OjemLK2a9/gAl14MBxAl2hwMVVocsYodA9LM64QpLkiZE1INw=
X-Google-Smtp-Source: AGHT+IEyFlSMTciTLKgZ0LwqpaVCq5r0Cqpl/6AriXAmz2R/iaZjTELdZrW5xapwul9CBN0LkBtUvA==
X-Received: by 2002:a17:906:a410:b0:a46:f69b:49b1 with SMTP id l16-20020a170906a41000b00a46f69b49b1mr1637529ejz.46.1712758958594;
        Wed, 10 Apr 2024 07:22:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e9-20020a17090618e900b00a4655513f0bsm7000506ejf.88.2024.04.10.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 07:22:36 -0700 (PDT)
Date: Wed, 10 Apr 2024 17:22:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] ASoC: soc-card: soc-card-test: Fix some error handling in
 probe()
Message-ID: <2db68591-64e2-4f43-a5e1-cb8849f0a296@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Fix this reversed if statement and call put_device() before returning
the error code.

Fixes: ef7784e41db7 ("ASoC: soc-card: Add KUnit test case for snd_soc_card_get_kcontrol")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: call put_device()

 sound/soc/soc-card-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-card-test.c b/sound/soc/soc-card-test.c
index 075c52fe82e5..faf9a3d46884 100644
--- a/sound/soc/soc-card-test.c
+++ b/sound/soc/soc-card-test.c
@@ -148,8 +148,10 @@ static int soc_card_test_case_init(struct kunit *test)
 	priv->card->owner = THIS_MODULE;
 
 	ret = snd_soc_register_card(priv->card);
-	if (!ret)
+	if (ret) {
+		put_device(priv->card_dev);
 		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0

