Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAB3307481
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168756; cv=none; b=WfG/voHXuk2eOI7gD0yHErb+dG8Qa9EB2k1F6eJa6DO8Ax76fsvNlplOG4p3Kmb+UNy6YiFStUdk5e6sTouAk7boYZ3rej5CcTXjYykYqr1/UZmVL3ElRlBdt3r7JvX3KQaTB96btx2aAKYhFiYhFkAay0Wa0oAxRKpBrHSoJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168756; c=relaxed/simple;
	bh=3M73N2AariqTlY8yn8Twg3H8JvBd0HiNvIu4NGbZDbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhikfTVWq74QNKIt1CY4Q1jsXg1k9N5x6WNQOZp5HX/NTkyJSaWV717U9wbs+tJRdQjIVFa6cKRngLZjqgOjDttFvJE9ZJZVa2l8xyXBAFBE5f2g8N3pP+w2kCoR3i/RK8eCoXGvSWa2LTo/avW6emkxKlq21pvH4frXXu5UqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXeB33O7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXeB33O7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47755de027eso37149745e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764168751; x=1764773551; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=rXeB33O7p8a1snjBMv/8ycfYNykMWnUIaTrZfcG6uSoz7uELyoIRjaZkRrmfjna65L
         L5ZoqVCO2ZWhAfprji5Dwr7k1E1igZR1rT8eTIH2yQ+61jwu5XSx0hVSE7LM3WLjX6wd
         ODTGQDS3rJYRCZchoQSZb4NQFyHJ1T6l0+T3DkJIKOO0D+p/7P2kmaSIDJCNmbM7ejXO
         iG5QiP+jGmWXBNY9g+Xmqe9tzkmAY3df50HRMdHFiu6mZ7QvSHz99USFL4zZUvcmEt+5
         +SHcvUwDYY6EzSutb/2WCciXcTf3wk6Xd3FOimopKyw9pTSmoJRCGkXViR8QHIR0UpwI
         br5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168751; x=1764773551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=RZXeViIFcfDm/EMchQu+9L7PlKqHJkPQeXx7Zs72HUM14ZJuyR2s0MNjjgC6lQlFKJ
         RE38kXEK1s1lxM+obPHCGcQjg3JO8uobgzI72sVJ1SBoSk7jbkv0l+tmHcmuxFdo8fiw
         Dt5ZNJlvpaoemKF52LYfyxDLhGR1ejfO+y1KoMjIBYOUuqsrP4bFA066C+XIT1p8gW0q
         fFq1GQV+4Qq86blrxxdHjcQyxfDHvXO1fbhTo4qmcc7vsB5KoNrcNK2dN94tvEbKFOSZ
         ULtTkeIDxoBKiNo//IdTMNGMRhJc7Eofda3e3VxG1lK2ktr5EbDkZ9JdDcZrRSfL6ZX+
         XrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE/tT89TlZMeJmkbMirJOp8kyJ9jvw1lRZlR8fh5QO1JvIiQepM0EY2aTSB3pDfRT3RvSRk7ejwHJDLRPyF9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZNV6qBYn1PjXhDxF9I46FuSH6CnMgIbeUE7T9210k4A33JyIx
	w+iVN41MfBKRJu5EwBA7l5RiU2lP37mRrROqMYygJbC4J9N972w4WF7IbHCu6Le8M3k=
X-Gm-Gg: ASbGncvNHZUDC+g/iI67xSQrujaDHeidM/XQPRdhPq/zjtuEsUyv8HoPVPHY2EvhYgz
	0ICwKvhOUB9XgB2PYh0W03JPLtjIjSOIrIQPjujUrrM1Ifsx9WisVHfNibYUgEGbvOv/qNu4wHm
	gh8AyWPMTrJWBbqSsVmZUGXXshjC9vwqpLtFFxHoG7EFLtKvFkIrzeX+vSez53t6LWVvA327If9
	8X5GzRLFp6cRoiNsLgfauoz0rOItkGxCM7vx6uC/5yF+rFRoWl1KDLuBWQxLqch9tacUSIiiKSz
	wKwRA5fczGTd42ByK+EgbzUOVBVk+JPRYHKkdfzCH2XM9HZ4jwFssUMN34K/CttRjKatGe4JBVK
	Ru0FHF3aGYWVaY1/17xWJRPGuUeoxQ+pv8xeEf2WlxtMTdeQm2ZpHIxOU8Hhq7CroD9hyIO5u/J
	4RAFh8XPtBmAR8Erw=
X-Google-Smtp-Source: AGHT+IGCLmd8tRJyaKxnoPAOY3teB1a8/mQwQE4e51HEL7L4ZyHqrgXF4lwoEPkRwuQbHk3YrwrBYw==
X-Received: by 2002:a05:600c:8b37:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-47904b1ac02mr55156645e9.20.1764168751196;
        Wed, 26 Nov 2025 06:52:31 -0800 (PST)
Received: from localhost ([41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f2e454sm40974088f8f.2.2025.11.26.06.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:52:30 -0800 (PST)
Date: Wed, 26 Nov 2025 17:52:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8189: remove unnecessary NULL check
Message-ID: <aScUKqCEhSIZoOmg@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that the call to snd_soc_component_get_drvdata(component)
will dereference "component" so this NULL check is too late.  The probe()
function will never be called with a NULL component pointer so just
delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index dcee8e11eca8..166ece74270e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2352,12 +2352,10 @@ static int mt8189_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
-	if (component) {
-		/* enable clock for regcache get default value from hw */
-		pm_runtime_get_sync(afe->dev);
-		mtk_afe_add_sub_dai_control(component);
-		pm_runtime_put_sync(afe->dev);
-	}
+	/* enable clock for regcache get default value from hw */
+	pm_runtime_get_sync(afe->dev);
+	mtk_afe_add_sub_dai_control(component);
+	pm_runtime_put_sync(afe->dev);
 
 	return 0;
 }
-- 
2.51.0

