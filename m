Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA7A193088
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206804; cv=none; b=OoZTToltg6Ca010E5M1LKQ9WlMwqnpoZ3ouDoFxfndardtDqBWGUyW0TVsfyg01W6IxGUZCRoVh7gnHiH9qd47vFzOhzbSlf/6vPmYxOM3gHMPE0OVKO0RLJGiYpU/ZwYKBh7lhuAcdgjFfMQuNRfSj4ueWJSdtj+Jdce/k4mVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206804; c=relaxed/simple;
	bh=0ZavsDR4N4XecV4AJY2WN3XKvj3Rm4Qc6yItCGbtQrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HSwHjeHxoZ6MzSN8pJqhiiR51aJMVGV297YSv7JSRjuv+L4xRRQ6FenNfU0QAFx0DbyV9ktcDx3IikzIR0p8CNZTABmtYImp+VwRYpHScrfLJhmHNMeXRaPffvDmlDg9ccUX/2K6H7S848pzYDA5IqOxYnGWEsztKrUEprg0C8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hf12Oi0z; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hf12Oi0z"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so277080266b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723206801; x=1723811601; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1T9HTo7YuUX/e0pBQrzS8G/CpwBUyTZ2HB8zoVX3uIY=;
        b=hf12Oi0zOuUyuRk0N40fLv40Eozds9bMiab2EpQKKHYcs5AI8QljT9aWEgit0kv9v/
         EtFm7W3c1ylGHycXCOZ0PFOHXu8HewVl4Kpm+ezClhqdKmvhfN5rbFqNqjyTw2co0jn4
         XoabJtHzCTW22naSOjqXFWZkJtd2i6di0bD/7xn2XuEMcsxl6X2XRGg6C4VHkY6hPsV2
         iE8QZmi9OIDFz+ZPSctjuMLoaK++/MfUFIUGt4+BPYqJprICUswkMbJqGwykGTiQTSJ8
         vY2F+LWICMLj2DOWmuqIKzY9YWIAEorABagnos/dz3rf+Kch3hGWs4wAR+dG86UnLBpS
         AYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206801; x=1723811601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1T9HTo7YuUX/e0pBQrzS8G/CpwBUyTZ2HB8zoVX3uIY=;
        b=tAEhbUuesIroY4jsnQyNirE59OMUr3JVUtCUdrSJnTwql7Wk01awatRCY8s7LlnlwH
         RTY4fXmouU1lECRgGdzTCagSF1gspz+s9GN3U5XxMdwXr2oox7ZDiHS7qVQqbVMz7V5d
         hV4t1tLV8oDdBef/4EsUYvo2wYcoOrhKVPDtvGxkre+CArTG3sjgmmtZJggzn9U0BgUp
         kCb45zG0ALn/KFmTS5Y/ERBSFU9FNQsABVVXaX8vrrsFnhmK9Zi6jM3S+WBegJ5dUDXR
         znSGHw8u3ViQ2klIpI9b8UoPwyQEB6EYoE6L5kJ3HhXsNpjc5ZtJX0EPlmjeeFRcedtZ
         tuWA==
X-Forwarded-Encrypted: i=1; AJvYcCUA/2iGQdEp0595yTEFxnhkMc8AHxIlF9aejZTvZuRAReRYJUT16zHrdr25wbFYQPR99L279+r00II/rC5fW2G0j8GHaCs+4T5W7IVmJcE8
X-Gm-Message-State: AOJu0YwmPRYOY4FuOBMo5hnkopfqfaCa4LZl/adqf/4rkpYixsVopQl3
	K9yZAhLik+Lgsofhw9SpLFR9FXzG21uvwhq6u862grsu3ZlGb5kD+QwjHx+CkX4=
X-Google-Smtp-Source: AGHT+IGfuyRpbD5V4xldOFw4WjAJic6XGUVn3OQ2mq4qUmdJmCTvIzhHm4FAOhWT0pdhLWFXDAB0Ig==
X-Received: by 2002:a17:907:d599:b0:a72:6849:cb0f with SMTP id a640c23a62f3a-a80aa67b98amr113030566b.62.1723206800818;
        Fri, 09 Aug 2024 05:33:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec8cc7sm838307066b.215.2024.08.09.05.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:33:19 -0700 (PDT)
Date: Fri, 9 Aug 2024 15:33:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/ast: astdp: fix pre-op vs post-op bug
Message-ID: <f7790a38-6b72-44dd-aaeb-550d2de14cf2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The test for "Link training failed" expect the loop to exit with "i"
set to zero but it exits when "i" is set to -1.  Change this from a
post-op to a pre-op so that it exits with "i" set to zero.  This
changes the number of iterations from 10 to 9 but probably that's
okay.

Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/ast/ast_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 5d07678b502c..4329ab680f62 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -148,7 +148,7 @@ void ast_dp_link_training(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	unsigned int i = 10;
 
-	while (i--) {
+	while (--i) {
 		u8 vgacrdc = ast_get_index_reg(ast, AST_IO_VGACRI, 0xdc);
 
 		if (vgacrdc & AST_IO_VGACRDC_LINK_SUCCESS)
-- 
2.43.0

