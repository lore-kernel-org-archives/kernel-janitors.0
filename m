Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3471DEFE1
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Feb 2025 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972988; cv=none; b=uQh1bJpo6VKcMc1BvhXvB6N4IyXYz4D8AwO/NppQzFCN4H+e7DjHz56Uxaisxu1hW/1PCT2zBU0/+MKMYiv+Sio1PQyclEFVV3yGLam1/S/0Kim+xoC89gWJ5sQEHqy8u1zkQVJ10TAE3Kk0GsqCpKRQqq0l7fxrV1Fk4F2feH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972988; c=relaxed/simple;
	bh=ozAI7jPkN+E+ln8TQn9XKg6f9kSqAye64Nz9Y0rCWKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bi1dXIBgaBnLrYQ9YEfctg7m+Iv5qLPsnvlAKFrgjhBzcppvs3E/pFJ9tpe6YNErP3kNpxMIf4AujcTOSFvTwxFYuppp4jkAmdUkDAOr63LOicIVORKKdnMyN1IWaP/OSr3nLglo9+F/kmBZ+/7UNCnBSIArd6VT2sZNoeYl9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZY6tDS7x; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZY6tDS7x"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab78e6edb99so1013643166b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Feb 2025 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739972983; x=1740577783; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kH0pAU2X6UA0aC7rynWRidtqvLm/P00AqNLgxfvX0o8=;
        b=ZY6tDS7xi0FEYdG86plch0lnsA4kaPxA1ei+LFFXqVJSYhA7iYK8iftEy+jvPEroD+
         T8FI54dHGxr6BIS00f8DUS/RcAFnLlwGWS93Y8aq0DHT1uFzt1Ivm78gSWrg23gJ9NGs
         lWBYTvetmdZN3b1h+t2y2bu5ul5RPXumb5Twg3A0qh4LLvFCuo3PLgbEzc9em8YgOeQ+
         DgZ0lhAAypYCUYjXx++yIqP0r9hKcKorXol+kCrMcTmptFCgAW1O5JXK9jkOjYASgb1k
         Z5WxN4j1IcZQN17kudb/d8lzd01PL3HGyMK6lfsH4wZsEHoZJMLMMeWYujG9v6mk0fzp
         ei4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972983; x=1740577783;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kH0pAU2X6UA0aC7rynWRidtqvLm/P00AqNLgxfvX0o8=;
        b=Y67Ae8R54BdUMtXGR14EFpEZxiBJDuXYDZHKoK631+3IzQwQTJrTyliLSaOIbqSAzS
         XJI15LoPyZeONCqI6OKul3gI0g72N7L4V2zssscsgAKAVQ4nNqAOAlLpeNcHXYBqQmli
         94qOal/Dc+80Jzmv3XNB3AA/iirv82DjrzbXd8iV/I3591aq1nkT3qLY3CjkbT4M/GD9
         9FNtY/B9fTnJpY+LYkVF6ZeudGLtbUslAiimorCYA9pFjb6CSCssuzO810LtkJeNVNh+
         CE0g2QhPIeSo7rKdX0wOGOgeN6ZUfXrdG1mu3xjNI37tQ42h8q53aYYIZU7+LNBmSvff
         +LPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqQ9Mqj8YQiVg2HXLpuqM/wdF92c2RkpF1StmzCAzhecAjXLpoOTFpJHQg7ZWKxl60ItZuxucc6S9ylByQ8XU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2236nez6OHr8LxX9vvW/MkN8sHZzVBYjDQ2ZsfULOxVXxJVGa
	MDakUFXS4APBtwIdgNwi+D/dh00KU+lAQfvEwFBRxKZh9mP9kSCFFFC1atESKFo=
X-Gm-Gg: ASbGncvs6kqeoXtuvNXmRG+JKz1Qvv0iADXZ5lB0bV0l0wY4VrHnZLsuA5+FRxqUPhC
	/RYFqqgWNDelWK1J+qWGqA/hCAguqrCq32bNGv0bmqgT9KEyOdDd253n6X/P84IrkFcQDDAn5TG
	GstBR/0zoRALxNZhOBcJ00w2i5sPv/CnfddW/VyDGEmjlth6pJsm+GG9gA8wAV0K2vrrhahmGk+
	DVYpbnnykDzOzvFORf/DIavIvwiGieNDpsbRxZ66KNdtBGlFODfo9T685YSI6Y2TmZbRL734rph
	H40yPbh2Z6ypIWxH+quc
X-Google-Smtp-Source: AGHT+IEh++Dcbz3VxYv3Ivg8FCqcPYBovAh++mRW2ZFn7DD63wkwuldCqvj/jtkuwogNSm04zdgAcQ==
X-Received: by 2002:a17:907:2d93:b0:abb:b36e:5350 with SMTP id a640c23a62f3a-abbcd059da6mr292239766b.44.1739972983435;
        Wed, 19 Feb 2025 05:49:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbdac1015dsm117494966b.127.2025.02.19.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:49:43 -0800 (PST)
Date: Wed, 19 Feb 2025 16:49:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Qu <Jim.Qu@amd.com>
Cc: Lukas Wunner <lukas@wunner.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
Message-ID: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "id" variable is an enum and in this context it's treated as an
unsigned int so the error handling can never trigger.  The
->get_client_id() functions do not currently return any errors but
I imagine that if they did, then the intention was to return
VGA_SWITCHEROO_UNKNOWN_ID on error.  Let's check for both negatives
and UNKNOWN_ID so we'll catch it either way.

Reported-by: Su Hui <suhui@nfschina.com>
Closes: https://lore.kernel.org/all/20231026021056.850680-1-suhui@nfschina.com/
Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/vga/vga_switcheroo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 18f2c92beff8..216fb208eb31 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
 	mutex_lock(&vgasr_mutex);
 	if (vgasr_priv.active) {
 		id = vgasr_priv.handler->get_client_id(vga_dev);
-		if (id < 0) {
+		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
 			mutex_unlock(&vgasr_mutex);
 			return -EINVAL;
 		}
-- 
2.47.2

