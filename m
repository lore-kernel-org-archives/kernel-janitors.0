Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB36AB0
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t/+8VKJK"
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675951AE
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Nov 2023 00:50:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-53f9af41444so1018207a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Nov 2023 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698911422; x=1699516222; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOgWp9zQ8adWZfxPVj8ivR5Dd8RUJXykZgeUD4r8Tv4=;
        b=t/+8VKJKHQHgxDu6/Vc/d3kW/rpCvqdrWM2CtfjeigzmKDQMhTBxikZeBvVO1lZN5Q
         +0Vxe7joARSoebf/u/D7vKRByAatd5wgYSe90nxevpJRxa/t1S7nuvmk+BHuo7L2EBok
         C4mJ6zgpVoiextsdbHsjiu5GQfVFpCV64f1RZYcMH0JhyTbP5oxseTK/3kiMPZ24R0ca
         NHW4JZBBf1H9UQ/veRnQTVFpFhAnDIl92pYY+yVbOWyDgWnOwaa84yrfxpDEy1dLQovk
         r4W3zAB+2kEav13eSa591ABvMei2lEtnAHyk2xKO4egdCnzG2LMJQP7AwJu/g+KuUKRP
         ztwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698911422; x=1699516222;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOgWp9zQ8adWZfxPVj8ivR5Dd8RUJXykZgeUD4r8Tv4=;
        b=u7P+pGvgFJRBKo9iTTuynzO7oW6uXRgKvI5XX/xw2zBrXtiaqp8S6CTykoqhKpkiL1
         xgb80vxn0S33za1hwsXhQb6vYUqUB3RGVrs31L9BKehBSJDWmMce9V9mUcV6/GRH1xVs
         F1JvDQfCWW1FZhqD5JpcP0BuiG9ycwM7XNYgBZV11HwNeiVv15b42OmpEAEooyhjC1G5
         rlc36xeDCDTalZxpUq/b1fJsQvfYkMn0jg0JnGI+k2yz/V/NawbYqf2QimZt6LaU+1Sx
         CjDVrA5cdp6IHsqNBJT0G5gDvV/FZiBru+iV+F97ocCD4NqYltNiMJRKumAe8MrHTGIw
         ZHrA==
X-Gm-Message-State: AOJu0Yy/URwhcKaYjADbkZPJJ8YoAQDVjV4b5xoYPejnrTPS/VG8aSoM
	42QexdBsRK0hoIXohj98a84bmw==
X-Google-Smtp-Source: AGHT+IHPKGuXe8tUEB069T/of2LV/2a4x0JbrQfIfOB1y1WR5ngO5/gEeHd06ctlFdgCWrzjNKAI7Q==
X-Received: by 2002:a50:aad0:0:b0:542:fb42:3631 with SMTP id r16-20020a50aad0000000b00542fb423631mr10018635edc.0.1698911421484;
        Thu, 02 Nov 2023 00:50:21 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q22-20020a50c356000000b0053dec545c8fsm2037918edb.3.2023.11.02.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 00:50:20 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:50:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	kv-team <kv-team@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/rect: only print the stack trace in drm_calc_scale() once
Message-ID: <fcf5eab3-240c-4a38-8515-d8cf5c6a3751@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kunit test triggers this stack trace deliberately.  The
drm_rect_scale_cases[] test cases include a negative src and a negative
dst.  This ends up spamming the logs and can obscure real warnings.

Just print the warning once.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYuA643RHHpPnz9Ww7rr3zV5a0y=7_uFcybBSL=QP_sQvQ@mail.gmail.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_rect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
index 85c79a38c13a..a992d70b928b 100644
--- a/drivers/gpu/drm/drm_rect.c
+++ b/drivers/gpu/drm/drm_rect.c
@@ -135,7 +135,7 @@ static int drm_calc_scale(int src, int dst)
 {
 	int scale = 0;
 
-	if (WARN_ON(src < 0 || dst < 0))
+	if (WARN_ON_ONCE(src < 0 || dst < 0))
 		return -EINVAL;
 
 	if (dst == 0)
-- 
2.42.0

