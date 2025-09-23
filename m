Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B9D275B16
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758653459; cv=none; b=mKG1J4QM+boNF72tzj0wd7/FXeqOwDB8rmQ/zp8ugpIxdpkyMtt53iqJDFFI4lwqrvJ+qRsg6gXmaC+Vn++Zxmwg5o9/1I0EJkLtGziG8jRhPkzpEE1CFCjG5aHHdjbTcfg97CmJ+R7T3M/0ETcBf+1j9Vu5jGJ+uKSr2+G0N9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758653459; c=relaxed/simple;
	bh=qa2NQh9RJDy9WQ+d31yHCVmbVNa2k7cV21sEiSC75R0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ggqA68Q34Klqow/H/1trnETkEC5lKsbfPup/IJSNShNecKzQQ1b6l8XmGqmLxrjmupVbtWIaTbpqYoVAKDGCybhgYuxAb8D/QWcPf3ZbH9okR/fHMOfDG0mXxY7Osk7Nfw2LcNYvEBhr+jm2SR7+1pVYrsLBa1728z4IEZS9LjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1k67Flz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1k67Flz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so2531603f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758653456; x=1759258256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EizzNWoZUikDV1FxG67Kon1XSkcUmIn52o7zV6bqtSg=;
        b=h1k67Flz3qUI2TV5NVFwLPnp7skd6mANpk3RMlWkk4kqfMyuEi3MqqKr78hB9ctPap
         V6E6cJ64lvO+fZJXXcoXN1+xCG6ncst0XCNG4sVkbrC19TNlhUo3knLAu8wV9OhF48gJ
         aHgIOMtRMeoiMoEoSy7e5mkYgLvUbQAWy4OkDbT7bs3/L1Xn1tf893J0J68OIUudCL9S
         wLW6yQxB+RWisbHc/Inv75sApkoPPXiFyLnZ/WghICR62UmWIkhbFhhkuANt10KX2WkI
         9VFWFUGPFLvttj76MOotHFb5wn3giXVBbYC83herd+RppgVTOKJlJuWtbaulUkRO2kz7
         Kt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653456; x=1759258256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EizzNWoZUikDV1FxG67Kon1XSkcUmIn52o7zV6bqtSg=;
        b=d3R2euALG5uyfrg2eQCf7lrcjEnmiruu8DgCeIDwlKx9Lo0bE9d9kMUFVzeL8LVcsP
         YL6pxA3G5/zAzKpU/esZcfwW5bk6Y5dVc4GmshqscF/8MGzHvik1XTFwrjyvJOcVjyT7
         gmMorbllbn8oI7D7m38oFegErWaYlKlutoPZWEKvyoYE79T+fZWvWfgIn3jqe0GrPeHn
         PPFopM70/3tljDyXMhnhz6bnpIiCSimcmvjHD5MA3eMet1TkOUbv7/zr6tepLzWxkhBD
         B3K2vP//lYCT3MInaDaVwt+yNdmmjGf3OFpM3p84r5edYDmwoB5D5SvI8saf2/xSwDEe
         g+QA==
X-Gm-Message-State: AOJu0YxWgnyAAb8brPTYG1lQxxv+avMysjfQMjJQeDC9qnMqy8DYZPjW
	FhnI21uGTvlunrZIImzvrw4DuWnYiVAVoMgizkN847Qa3LY/9W8cJkAx
X-Gm-Gg: ASbGncsMo+D3PdnCAtrRn+GEQCWOSVFMhI2yYR3qCRjfJ8WTfmdhkmwfqTfuOfoE+ib
	ypmqLLGibZ983YUh2BFX0a8Q+hWiR8vgbNxLog5UFOB6CFG2TuE+gODcZi8AvktkjouuoPXPuD/
	gfs6zXScZ+sXrgseSneVNIH76u4kjM45EkuYnyscga10xp+YvYtIWfFI8Aygfj1qUk4TjcQheFE
	Obd7j56aCOWRh4MwQLKZ9gmqi3hxJ61SXjiZGKO7kH8J2i506XohNAyD9S3LRzM6XwickKGsdDA
	AFPvPD3je1q1+B78s970QLArgCuXU2B893Xm+0ljoFjzmui/jj4cuxEquNdzZndL/pIF/DLUS3m
	rJpLBsDcc6x3qcRLFDKJ2kg==
X-Google-Smtp-Source: AGHT+IE2Au0RbnAAqqWNX3SWN53Mr2OlHht3ylbNddwR+2vdZFFql/xTJVTdhHclfhtpTGY9FAw7Jg==
X-Received: by 2002:a05:6000:615:b0:3d8:3eca:a978 with SMTP id ffacd0b85a97d-405c59e17c0mr2834428f8f.21.1758653455458;
        Tue, 23 Sep 2025 11:50:55 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e24835b32sm22658075e9.13.2025.09.23.11.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:50:54 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoc: tas2783A: Fix spelling mistake "Perifpheral" -> "Peripheral"
Date: Tue, 23 Sep 2025 19:50:06 +0100
Message-ID: <20250923185006.213861-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_dbg debug message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/tas2783-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 3e03e68932f6..3a869a101844 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1229,7 +1229,7 @@ static s32 tas_update_status(struct sdw_slave *slave,
 	struct tas2783_prv *tas_dev = dev_get_drvdata(&slave->dev);
 	struct device *dev = &slave->dev;
 
-	dev_dbg(dev, "Perifpheral status = %s",
+	dev_dbg(dev, "Peripheral status = %s",
 		status == SDW_SLAVE_UNATTACHED ? "unattached" :
 		 status == SDW_SLAVE_ATTACHED ? "attached" : "alert");
 
-- 
2.51.0

