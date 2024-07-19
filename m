Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB39482ED
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Jul 2024 23:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433233; cv=none; b=F8p8bLZAEr5WjaDWm86/4Gai0r4tvBsrAqG4efdnVW5Jf0Lm66TsmRNCUXEajBI6HAKBUTItXciWrJkEl78Ya5iY0Mb+4I5hdH+fZk12A6y0Zc+DpIDm7Rlw7STEhNMFfz7wmeQE9rCjQcYlXFX9L7z6nL4sUhOOTjYqp224/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433233; c=relaxed/simple;
	bh=RDZn9nceSKHWHAEJxopugD/XqHyZGSXq4lGQoM/TFAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qKEujAGFr1GFqvZYudfUSVDnD7oG+7jQxKcKgPvyVceV9Ck1sRisGK/aFMMFweL9LXwcAxJo9RxAoy5et5KDmPz63CCsDB38Gd+m3q7FhomySGGPz22GLXuspiQUTBFWP+nzp/4qjvXm4ckscFS2fNN6VFNpK8z7EDAou/Bbfxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo4TpDYt; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo4TpDYt"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d9dd7e5f6eso1261833b6e.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Jul 2024 16:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433231; x=1722038031; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldzFiam0mujMuq28ca76nisFGKp3WDY0EGEFzIWMbRk=;
        b=Qo4TpDYtQTyxkrWD/tUAJOOSD2PB9SsoODeWPGlDrPseEVxF3Y2EZV/kzdRSqtVVQL
         ByfZgAQG3bMfJjpmAmgCLM8NlLGOpIL3ndErJdWunWOkYjQZXi8sxEbprKxHmaOtMMdR
         lWimbmIb0/cGMPeFXxodRT6WlS8GnDtcfn713pchHIBg2AifrqvR39PIb0F6GOozy0Rc
         yxn7O1y5Po3h7T/+pg2zphJTUwyDsTqBaiJ53thcM2r3wE0JhQwXoxx9fRtIXDZ+JEr9
         xWEE8PC93F81SxruE9aCFy3PWOC79MuXh+qMV1IY2cIZCd31O4qTG2KwwOe1iDVQNwkQ
         F5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433231; x=1722038031;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldzFiam0mujMuq28ca76nisFGKp3WDY0EGEFzIWMbRk=;
        b=gVIbnRRN6LfhKuHHVoxMSq2+lwwMCYeXmVoBLDnH00i2MzzC5oa4rVXmLlHhXbICDt
         bXBqc+pv/7JpXN7WP+JUwNdtsNvnWzSwHZaZb6IFkdsQJ5UWuSGRHeVkRcugdRPXPrgc
         Bjil6LMPmKpURTwOIpIxyQjNibNi52FFICfx/Y9JylHkhhnyqqddtl2qWYpeObp6ntV7
         hSvIfMHFpUCei4K4jMk9Ldoj+Rj9lYo8rRFlCi28vEnWe7KowkgZuFZfqgiFDJWv6aCY
         XRyRPBugksUiex3t/5WvzzOs3eY9Dv/tQ3B06twdXAuQxQ9QjyvmltzUI2CWhIvHnhbr
         3JDA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8VB/7V/0hNQfk0UJBjW1I/EJ1+oktKrPNDqydUvlW7NgCJL3Pbz/lv1tzWPvlP1KpOK8+8r+3zHvYFD0vweg6JqKj9fZ7MI6DK/M7Dbw
X-Gm-Message-State: AOJu0YzCMgTIIw+aUAKGHnvCBKz7p+tJcpjtfN9PgAhMlWX8h9u9l3lS
	oIH9CurrnvtLaMShl//cw49CgbK+JS/pGNtOWvrthnyPrSNgYUuw4DM8GTT/eE4=
X-Google-Smtp-Source: AGHT+IHqte/qz54f4SL0d75xLOAyVvOPIAw+LbKlNbbM1Lp827319iwrSa6rBuKjQZrpHBI/U5i0og==
X-Received: by 2002:a05:6808:159b:b0:3d6:40fe:d537 with SMTP id 5614622812f47-3dae97c592emr95855b6e.13.1721433231314;
        Fri, 19 Jul 2024 16:53:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dae09ce8d7sm487021b6e.46.2024.07.19.16.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:53:50 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:53:48 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoc: TAS2781: Fix tasdev_load_calibrated_data()
Message-ID: <18a29b68-cc85-4139-b7c7-2514e8409a42@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function has a reversed if statement so it's either a no-op or it
leads to a NULL dereference.

Fixes: b195acf5266d ("ASoC: tas2781: Fix wrong loading calibrated data sequence")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 63626b982d04..8f9a3ae7153e 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2162,7 +2162,7 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
 		return;
 
 	cal = cal_fmw->calibrations;
-	if (cal)
+	if (!cal)
 		return;
 
 	load_calib_data(priv, &cal->dev_data);
-- 
2.43.0

