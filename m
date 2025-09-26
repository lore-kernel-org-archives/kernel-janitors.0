Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC48F1534EC
	for <kernel-janitors@vger.kernel.org>; Fri, 26 Sep 2025 04:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758859399; cv=none; b=IyIaHG80AP/L5C9cZFdpr2h7NEaHDeNT0eC+HjOmMyOoVBc5LB5KL+zOzzdjLQYOYkqODx7MRTjS2tj33q0bTJCkmijFKTkB0EnM3Sfc2otCc/AC27A0VSZOCg5w2NwOiETitizOoqIYBlDN8ahjAYJoTF0of78us53HrLNuP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758859399; c=relaxed/simple;
	bh=wvhzxABFdiOg+ADsIFkLjfPZXMEFheR4Ig6WrpOZQwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RArA+73YE+BWlRFtCszhDILlnpMSSMrtfxT0iMNFjnAF3Y+lZtOHkAYjAC+C7FxSJJC7pU6Zq38CE0yWAtAW1yz0XaUMLT9mCwFmMIjG4h05DhevS3uDldSGLbPxtNja4R8oL0U8uhlyukNFtPIvr1xq8x/bjCugbrt+00NPYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Em2hV96b; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Em2hV96b"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-468973c184bso9514085e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Sep 2025 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758859395; x=1759464195; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SytoPnG5QJz686o335sBi4HCtgv9sYZ8aX3hOtRMKuU=;
        b=Em2hV96bno6K4j3EiQ4i+vWldVz172Jhassul+IUdwIrwuSktCax0xo/EEMeA7glUz
         N7rjfp3f1Xm6dwKznrnCoz31TTXrJs7xjXAX//HulS53XAizOxcDv4qL8TwZGgRcWXD2
         DYmRqH+VbbyP9qx8/29UsGgz6UF4zTr/JzruhLh+qeR7OH5uxB8J8UrNIPc7r+jYinq1
         Vrtz+W9/A6V/OEo0QDx8C0e5QM1wnda3PpQTt9snHBkozlteFwk1kWVrFYOvBhRTFL6n
         j+BCcvbGGjbin8Bw7a2OlOrWGMy8Ug3MFbIwV7ywrKjWi6wYE/uiMRDS4OWSotjA5yEB
         PE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758859395; x=1759464195;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SytoPnG5QJz686o335sBi4HCtgv9sYZ8aX3hOtRMKuU=;
        b=S8iNdDNVlm2pMdtzp+cclAkw61QptAmjs1JSAYmPWq+LoiBjTufCo+QCNUQfDxvjfG
         YJEpqeZs9AmBEex02Ip1liUIXGp4aXjvGPh97dMe7WCVk5N1HDPBcpcVqPbcALKZmP08
         U4v6i7g12S957Y4NwGrKTXE7a6fnxbuXR7erhH30wUfp24C0QR4CEyFwG8r/IhQ6P/V3
         jsNhk99TZl3IXK/JKQgGSN/hW+9+QsoRPUYhTqYK0xm5mSeTbwyhz/I8JP/bSg/DgBsm
         xVqu3hhZt5nmG/y6tx+sYhtgQhyKhah4xSyzKjHGpe6QQBM8bs7enSp8DEihbWqGrPPp
         8g8A==
X-Forwarded-Encrypted: i=1; AJvYcCUxRW2WlGJ9ig/v0kHYk6DzY6ZKAM0YfzIFp2MddqE+RGiTE/P3YvYZvSXKaSn3SpdoQ5bJkeay/W999eZvRwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZNDYbhJNhuxakGmgKCNIqc8F4tXkZeYTfMJ/SQMHrdZBt2OR4
	ld9v+t1Ti1spJX5KCmFBv/5gZAOZxUsjBYBokwQXBJmjU48wUD1Gmb5lSXAz0Ln3peU=
X-Gm-Gg: ASbGncvs6XVP4whviNU38nDb2POC6DkQPRwBT6zcldjEj/+YgE/U53YGiDao1ZHutfB
	G4K9QLP4qZnioHVQdykKn3TUz+HqybOsXVZUMBzsgZtSiVCT17xdaYhctOf2sE74JomtLFTxAM8
	R/iNjR5D0b0aHfw9EzapXfAQe/k9YJs/j+KH1smphKApNspo05vW5zJ3sUTUdxiAIdxkDI17mj9
	jULaCggQDx968VBwpTDI9gx637CqeQBDKyZPQkOBvMSYqLLym3VO7oyRoJ7v5Jwn15IH/Ly1Wit
	lAJ1gmZb3cYAM60hO142Mk/7MS9oJbeoSYctxE1nB5Or6egu0fLJ/Gb2UHj5nVj1vMk6HKngsQ5
	opVSm8oWAKohnO8wnRuJda+NCyH1i/e/5W2PyThQ=
X-Google-Smtp-Source: AGHT+IHNqzt+aianVVfPntORZwd/WnwppYwAnuoO1k+luridVLwZ4XnvDsMlhkTtJ7/8EeWUMuSP4A==
X-Received: by 2002:a05:6000:2484:b0:3f0:9bf0:a369 with SMTP id ffacd0b85a97d-40e43b08823mr5542343f8f.14.1758859394949;
        Thu, 25 Sep 2025 21:03:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb89fb2fcsm5697497f8f.22.2025.09.25.21.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:03:14 -0700 (PDT)
Date: Fri, 26 Sep 2025 07:03:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoc: tas2783A: Fix an error code in probe()
Message-ID: <aNYQf4cyavnku5Nt@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code returns the wrong variable "tas_dev->regmap" instead of
"regmap" so it returns success instead of a negative error code.
Return the correct variable.

Fixes: 4cc9bd8d7b32 ("ASoc: tas2783A: Add soundwire based codec driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/tas2783-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 3e03e68932f6..21cdcf93bbef 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1285,7 +1285,7 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 					      &tas_regmap,
 					      &tas2783_mbq_cfg);
 	if (IS_ERR(regmap))
-		return dev_err_probe(dev, PTR_ERR(tas_dev->regmap),
+		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "Failed devm_regmap_init_sdw.");
 
 	/* keep in cache until the device is fully initialized */
-- 
2.51.0

