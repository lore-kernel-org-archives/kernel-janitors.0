Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83B27457
	for <kernel-janitors@vger.kernel.org>; Sat,  8 Jun 2024 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717856477; cv=none; b=OsT/d4Ff8y85DzjjsFMdpX894IHMmVPgCEnRPqQysgZrfw6OjVYO5IHDugOBXj0KwiT2TrG0NdwGgA9ta+efGIFVKi4kohtJ1jqOGkbi63N1O0aCVfGvURbblbSE9Z0DmFxo3Cn1CZ4EAGTU7TvuJ/Nmw6bySElJ2C0JUInF22M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717856477; c=relaxed/simple;
	bh=xLFhrGBiH0pcuHVcunVgk1rk5xm4/9iOzHVu/jiIkck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kk4mmP3GSThj/ZABP56k8G094Ip6HZIl3f7fJvpkVevKjY3akLdw015kbXv0WppQiMOWPjuZpCPW2TNbpWbVDCuvXmGvCS5XAwjEfDAWHCwxIieM7f+WZbpDv7v+Sn8GJQJaAl9DBnwVRHXTWorYPzowXaTJ2ERL6j5cY9wA2t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0P8Lecy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0P8Lecy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4217136a74dso11376745e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 08 Jun 2024 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717856473; x=1718461273; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjYuT33PAKShV15vOZT2MY4Py8HrSQc+sDa6zAJXDS0=;
        b=q0P8LecyZkzYuWNg2fMGyBAo+DYQI8t5wBKq4Ac8r1yXQKpEjvZnorCOHlWlm32qZ3
         Rj26hZ6EX8PyipdzUH0DXOzg3MGMNLl8/MZTCCaVLg1a9Dy0UC2eOkGqcffjJoBe1M2k
         s32jF4QWS0Pchx01AV3AwSC+qcNI/ytLakzZr5CVYXTAACT0KBFY10TRK6f1uKgCakBL
         JiP8ZPxteSjXAajTLBTdhDYRg9RBeJVRqvDBC8JCUOsCbLyzKEKdNmmrH0C5NtKu8rcC
         arYJqoNKGu5WKeiGhKzGRoV/4sDZ1Ug9XVbMDcRgW+cMs3ZApDizQ2x92fY3Qo3EYvEs
         5Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717856473; x=1718461273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjYuT33PAKShV15vOZT2MY4Py8HrSQc+sDa6zAJXDS0=;
        b=Ba3V9ZbIgc2r6ehfSTgMhAeZoep2V5YsvLI1R/OkdxjCZUDo+8wdWOp3zFXIWoGqd0
         ZJWc9QAL7Mm2PXRneT2Xo/DTfH1eVJc3GgF1ZrXriW6WHqpcUL1UOEmkL4cUJhE8vxWS
         AlPnhZ0ZoXq2yr6qKwL5yAYMTFbR5LEfmW8wGPo6O915wgs1enSYfX+eEmGIClrKz+al
         zhHhcYmyBgEgc2nMMwxdc5cJAq6KHucEsb4MCkNvp77rGrsCyYhYVsM2hnhnSJHX5ede
         5IXXhozFuDX1zFUxa+VNF7oEVyQIuayY/jSJcUVkZqqtWnZr8/CYrVaBv10UM0Xzvyo3
         RjqA==
X-Forwarded-Encrypted: i=1; AJvYcCXuLwB+MlAHELMBJGCpnnpymC4LlEQNW50/1PxffW0VKa0Ud9chKt98h3x3/4hL6WA3iXmWeYbrCh1iSJTDKmMtaOFZBj/muEaQaeHaY0cb
X-Gm-Message-State: AOJu0YxC7PTU2dLYXULQ18wqqsnEMb9PaRWDb+H8i6NG5UvoEK/4AhiO
	OMHmuafGDfPjngBqk9S2Zfx7VsUyhS2hObCCbLqD5AI/ZCSiJxLrPoXcc6UOiok=
X-Google-Smtp-Source: AGHT+IHMSDClGwHp6ZpeLqtN0xANquwVMTE0SCEKdNN8oNRycIpwR41xcOpeGGQ6Ptb5UJz1fLwcoA==
X-Received: by 2002:a05:600c:1552:b0:421:6a73:5fd7 with SMTP id 5b1f17b1804b1-4216a736254mr33767185e9.15.1717856472749;
        Sat, 08 Jun 2024 07:21:12 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm87193245e9.34.2024.06.08.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jun 2024 07:21:12 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:21:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Allen Chen <allen.chen@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: Fix potential NULL dereference
Message-ID: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains correctly that the NULL checking isn't consistent:

    drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
    error: we previously assumed 'pdata->pwr18' could be null
    (see line 2569)

Add a NULL check to prevent a NULL dereference on the error path.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 3f68c82888c2..4f01fadaec0f 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2580,7 +2580,8 @@ static int it6505_poweron(struct it6505 *it6505)
 		usleep_range(1000, 2000);
 		err = regulator_enable(pdata->ovdd);
 		if (err) {
-			regulator_disable(pdata->pwr18);
+			if (pdata->pwr18)
+				regulator_disable(pdata->pwr18);
 			return err;
 		}
 	}
-- 
2.43.0

