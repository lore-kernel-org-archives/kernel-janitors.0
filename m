Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E919E83C
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779461; cv=none; b=tbOtHM7coxJ1vgzIMA3zrBVuEbZhfPkAJGxCMaWSBC4qxX8D8hh/OCYXFz79uofosY2ufkKzw3lAJZp7lhqwdP6KVPc2wSbXYuMF0fwVEu+OP0YAYetAk2GkC9OiSOrsopP1gdp1DPi/7FB1o+ddU7T+HafLOtIY/6O4geIwFL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779461; c=relaxed/simple;
	bh=5pkgB/5rQDps/saQ/w0q6u4l+URqfRYReC020bzEeak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IunV8Fo9wDvvJmFGEfIswfisbMy1oIL8OsdSXd8Agrwz0cDXY3dwbr5CYnAkwQDZC+9Uv2LaT3i67pPE8bgL44CTyjUO1LWqjnI0qbMzYkOQTdYcTaOs1iICoTZV0q+sjwVirC3yzl6HjT37ggfTfV5y+U+26jSyZfS5KO8MFWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i5YIxm7Y; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i5YIxm7Y"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so756522f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779458; x=1756384258; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mxR/dg8k3HLUiS1lV7+VyCFpJVOb/C+SddN5AU6mmSY=;
        b=i5YIxm7Yhbf0pJ/pSHLsoiV+YR+/Gfqhpy8DlahLMJo9ErD9FlcmAm0ixb8bMF/4ku
         V2FCfOeYNPFf/LIohHLihnua2Ar5PNi2eHohJu6thDeY4yd327tV+L5IByDzQHm2/G8Y
         VWSPHEptihfxqElZf+0HFuMrzeOAJD1HwA3pRJR5n8XTiiAaH6wJzrBvxFn3CWObfKuF
         vqP9qHS+yREIH8U8pSRfCPKkSNPzyW+9W+Bwgxriti/wHiE3N5vM9QsCI3JrCxm4kGJP
         WCFl0r7Yap9fRP2ebBKqvCUhUM3L/g+jQPB/vRoIb+9MNht96sHkS/wOteb/aZQY2WJ1
         4q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779458; x=1756384258;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mxR/dg8k3HLUiS1lV7+VyCFpJVOb/C+SddN5AU6mmSY=;
        b=LuEpnCzWHQKoOp8oKK2EjAHJXMUdEKpiRxtAiTlupdqsLQC2284X+3SE8WP8bcL/3Q
         Sp6Ay2wiTvPIJnFOpzj0rGKqeaYtDJo+5/V8XE4HTs+K+27Ri72v/nZpxhfGedKb0/ph
         ld/iOQiJBTgHfYJhuwhtknEkcD4DEOeM0eFFI83hxFhAlreT31evBh1THROUr51m8RFW
         MEyIFMZMtr/6zChCB76XLi5JoXMGWKe5yNB9+qHSfWBkiIFd3OZEZvgLmppn8RVWAfej
         HMxKujPHQtCUtGu1Nn6d9C3jzdzLgPzKBLjQVNy7RyKnEJ5nsbVK97IagR93QylJB3y1
         3yjA==
X-Forwarded-Encrypted: i=1; AJvYcCVK0Om58tBxldRckCWY9+jL5k/PI8Z37ok7Q/j1v14iOuHhSRdft7Mj4dqosqTJOlAFnZVAV33f6sexjC2CLsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+JxNUEkzqaI1Exn19CFpgzeQ+4aDiZYFZNRK3tgCixiHUiZHA
	s1uwbK4uzH5hTP2Q1GRqfVXvhcZwwoMF3s+IV8Q/9bNSULlxHnD0FmyWpGz2mQWMXIk=
X-Gm-Gg: ASbGncuVv5WB4AUz5lH2Sjwd7yAU32he0eL8uBR9pcE1JhRqiS1XB+Srr4VZbiGW4AN
	VZfojumI0X8imlKqOY54Ng81bb2ca/8neTdeHmgWD4Ouq7rGjo4Iv3jbfbbgRFCYob8QNfvCIe3
	rN73J2SWYKrb8aS/wsJ6GOTT7/ZHa/2lM530YCnYjxRae1C02vnFhOoEc+XGVT5IdkhYaihzpwY
	6hpPvmGsgcgAQVmv4XCgv+pt/fzAgw+xJ1XX0ySc4Ps3i6u9ZrxMx0GBm5VEbbvFv6ojcok1Yah
	MhGX282NsnDNDrXsWzONlRu5jquTf8c4bEJF3Xn1Kp5LLBtO74ItERPUfkTmUOuFWUPV/hYZtYC
	dcNU7NBTnyRm0gX99gES6wNcIWmAtDabuSm8PZA==
X-Google-Smtp-Source: AGHT+IFuPjndS1sGpXpxAnUf6FSnfiNYp7Zpbio33Qd34o3QKqntyeIWA/EHXuRLsADAhCMT72Ozng==
X-Received: by 2002:a05:6000:40df:b0:3b7:6828:5f71 with SMTP id ffacd0b85a97d-3c494ed18eemr1595254f8f.9.1755779458355;
        Thu, 21 Aug 2025 05:30:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c3e673aaacsm4966796f8f.23.2025.08.21.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:30:57 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:30:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brigham Campbell <me@brighamcampbell.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Douglas Anderson <dianders@chromium.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
Message-ID: <aKcRfq8xBrFmhqmO@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the mipi_dsi_dual() macro fails, the error code is stored in
dsi_ctx.accum_err.  Propagate that error back to the caller instead
of returning success as the current code does.

Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 83656bb4b0b2..23462065d726 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -233,8 +233,10 @@ static int jdi_panel_prepare(struct drm_panel *panel)
 	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi,
 		      &dsi_ctx, jdi->link1, jdi->link2);
 
-	if (dsi_ctx.accum_err < 0)
+	if (dsi_ctx.accum_err < 0) {
+		err = dsi_ctx.accum_err;
 		goto poweroff;
+	}
 
 	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
 	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
-- 
2.47.2

