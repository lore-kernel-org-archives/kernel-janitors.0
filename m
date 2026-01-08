Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06DC29B204
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Jan 2026 20:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902463; cv=none; b=k0CCcSPPst+68GyWkMFiHdTGvSF5qkZig3jy29yanXyPhRgKqVcbejjrEHvswwVCuTGHaFdGm1XRhbIR09CW2vjuetcHfabv0J8c68lkQ/8V77dqZkq/oxO3MmGUxgt8kaPtLtCYzZEp1rwVP/hIjbFjYZmgjGPSNy8l7q5e/P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902463; c=relaxed/simple;
	bh=DE6Sp1xOrVBNsH6sK2fuRAlXsqjZwLxh07gWzBcBmtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKaFTmswdfEBFwhM0psviB+PX5CaIjHPbRnKdSsPN6TDIE9TMmK/MnuTJua0YyqRNYBI5kc6968oYgy2pw8S+Dtj9/QtW8SOBhIrIFdOEl+6Dj77hq1LoRZgX8QzmFspUahbwZ4d2aecPD7gdlmOnGqpiX+ZL4bDADi8Ytcsnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1rGkU88; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1rGkU88"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc544b09so2531256f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 12:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902460; x=1768507260; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0R59JhP2h+GNKoVP+C9/jngayGQfqzbzM8akEAfrgYo=;
        b=Y1rGkU88DBRDx2fqYoyOlsxxs3rrpmhY1BfRnda5oPhYQRfxp4ctXH3jIXEVX43lN+
         MHpT7EsALTnyHg+IDnR1CITsEpi1FeXp2nxJ+tePwcWa3a8xtmli3JqFv/I7KCAMuO+w
         tSYKxXhTdYhtLRYOZSvHWpdGMQ8I8vYqGSI5deKdediM+/3BneYNf3Uv5UZZqZMTOH8j
         /hZXl3HHS91FZ/JhMSgKKqsYVCG+CLgpDYhoI0zqlmMPyjmZ+RwVqjCxKWV6/h9cSA3s
         f854u6tN7dBLjX2z6hCXdGF7hGijrxENL5XNa5WJa1mq0RQmFIuQqsKUGOO3zobvi/3y
         ZloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902460; x=1768507260;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R59JhP2h+GNKoVP+C9/jngayGQfqzbzM8akEAfrgYo=;
        b=De15ywCx2ImoMQDi7wkN/6ypjJ9+GbF1qTOTqZ/+Cb5UYTK3HONvqr0SgFqF4w0RB/
         d6aqFHMG7X9lvsrRVou74kbkveEnrMuhh96qEjc+Hy7LPvi92gZ2tYZvyvhVXG5zDLgX
         OUql6w19WquS8/rrCmal2xzo6JmGQeImsC0DbZZWojCrb1x0ZTa/bjLl3txQ0lsfHC9Y
         pwvVox/ciInIBfuLNHJquciUBvKn0TH6P4qiz/RbHjAqqvVHIx71Vw18wOnnFhBZMGtQ
         gCa9ewteqd/6+bmBcaH48GvRqj+FOui7KRURhiSK/tcvHhoBnKOv5pcW5hCeX6JEaJ12
         ltzA==
X-Forwarded-Encrypted: i=1; AJvYcCUAIi9ATtdddEjPwNPiyyrdA2LEoiQ4BB37/YJbWkoT5LkXi2W2OcusTY48xE9bscKoX8+aoQrjRozt8lElc5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNT2t0jzhEvJWGTuCzBKlKv/GRN79d1OqimMKbOX9AXLFQFnXm
	/ePU/9Zqc09lquE6oqZjjPLr//YShsq4V09MB3tiHW0JQccrlk/Qgr9FBHCWoSjz5cU=
X-Gm-Gg: AY/fxX7qSEg0BUSUEwpFlY6Mm/jGFJL01G9i999P3NAVsSi/jNumMu7vq843GoKMQ/p
	HXNnaYGOZilrb/4YWzjTJjIattjw6nvdCNkBqGQkjE0W1eLCkfXzOTyKaCvIdu1ELwS8sRTJn9E
	rgC4fA0cSiKT0eG9tFxEyJTgJZfE9+4oHNroEnOemjBjlPaw9y0A80H1oTvsc1Td8neVsjm58RS
	nj/OIpOazr4Xmq5tnTXaxNWjklxH9p8p/NJ6mVk62PA/INX4VM23Ut0xPyYnASeOO3bjb2eS28I
	42U78rZkHRaQi4dihsFXloDeIjtUMqwZCHtOFSne9FEhvy/HRMnOO9UUYCFNiZhR2oHK284cZlL
	f0lA1bM0WBrtEe1DHojxJlvW1H5A460fPS8L0k1PIvm7rJVZfJJ6yw9uAafu1YdjY+ZvaUG3iOK
	QhYwow5nMHKiCmvd3f
X-Google-Smtp-Source: AGHT+IE0npwunWACAYL+5K87C4JawJUGa/VvYRBjPWPZGKZYwiEeVeAPHCRJ0OWPGNFKQWH85CyAbg==
X-Received: by 2002:a05:6000:4287:b0:430:f494:6aad with SMTP id ffacd0b85a97d-432c378a7dfmr8823298f8f.2.1767902460211;
        Thu, 08 Jan 2026 12:01:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm17838263f8f.30.2026.01.08.12.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:00:59 -0800 (PST)
Date: Thu, 8 Jan 2026 23:00:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev: omapfb: remove duplicate check in omapfb_setup_mem()
Message-ID: <aWAM-SZArPSRNaNK@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We know "size" is non-zero because it is checked on the line before.
Delete the duplicate check and pull the code in a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/omap/omapfb_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 106d21e74738..a8740213e891 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -846,12 +846,10 @@ static int omapfb_setup_mem(struct fb_info *fbi, struct omapfb_mem_info *mi)
 		 * be reenabled unless its size is > 0.
 		 */
 		if (old_size != size && size) {
-			if (size) {
-				memcpy(new_var, &fbi->var, sizeof(*new_var));
-				r = set_fb_var(fbi, new_var);
-				if (r < 0)
-					goto out;
-			}
+			memcpy(new_var, &fbi->var, sizeof(*new_var));
+			r = set_fb_var(fbi, new_var);
+			if (r < 0)
+				goto out;
 		}
 
 		if (fbdev->ctrl->sync)
-- 
2.51.0

