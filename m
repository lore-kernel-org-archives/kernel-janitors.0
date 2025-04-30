Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C1E20D516
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000233; cv=none; b=oEdQk+7X0YScfrCywzCkJWgxaf8yytt9YIxqB5rUCbBi0MGX6914QuqC2RfqA9eJgKgg3FIKSAQawbDsnHo9uHMDsfvMOvxElZ0T4IPskg5JKcyNmLBEAxRhzT+KfdsZJHdIX9yFrC13liVTdIwBzrPetocMsIC8LKgcwXJwMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000233; c=relaxed/simple;
	bh=yDswBP+Kr+vPdFZzARL0WBNze344sfihA/wkyU8QgCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yi7zuFUDyKHJM60n1tqVBXUtqqq4ti54dEr8lGDgRhmEg1U9NqKPbmP424ptCOC8ZpDA32mH0pfDZHYA2FPBQvTmd/LmG9SNERkA8b/Ysg2eOAQJ4Jn/E7uk3e5kByVkTgStougeYraXhzUUtCNK71/5EGZjMRnUENQG3DubSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIbr+7CD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIbr+7CD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf257158fso39084405e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000230; x=1746605030; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAFg7e7QoI/NIhOM4U0ox4at7LqC43f8tqWtCVElvxY=;
        b=lIbr+7CD3u5jFcrGbeQKmRxB1i+YkwIr34DFjuy5NoQtInCiMf1X8xjGyPZlhJdijG
         cmCQ2cF/y6yRo/efKL/DVSQWCfE4Infp1YW0tE7oHF6pWY+1IkabQck9SLtm0igyxfga
         vl0HVXidin0ydFsITHQLSdLTstVlbhoaXBFdIoRtgBC8QXmrP38iFNFTXa5uYWEsCN36
         Y9Bx1xiCFeQSNMT7KbvhiJIp7X8d/Ap/SlfR6R/mm/8OvKfi90ZKM0qC1/iI7AkSZl3d
         DZK/NZFIIRUk8NGOe7ekHbdzokaFXNx1moDShEd3Ffi4QlyVtHijhQToqrvTiaOxCDxh
         g39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000230; x=1746605030;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAFg7e7QoI/NIhOM4U0ox4at7LqC43f8tqWtCVElvxY=;
        b=Fm7KYOtXnTtK/4s3I7kqBI6i57ixq0hjLR1v/d8/7rRvJG7WeRY0PsI1BqtbOVmtiT
         mO05XgqrT9gJpKX2vHWDdHAI2J7eF7p/PeX4M/ZNBhibr/ycSA3dAJjAq6kUd0aUdyv3
         wjLiwgtd8UsN8MV5+2EovW8QRhWTEhTbC3tV0QSnQg0aC2WRmZmtuFqQ+5TyEv/YMRSv
         3SikJEdF40uRcuZR8mLQ9AfC7OkF0GDmV0spWan1oLE13ReMVtpJmyORRe7E2QzaOSR5
         0yVgtQHptCkRsj7/JNDWU80Cwnsc+mEEMuFqJ493qi+Nms4Gw6utzvhzxYN2aEJv1G3t
         Bafw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2w3TIejYi1Oc/kYsa15d9duMUj/LR9TcWHHrqzrycAVfA1yr05iE0HCCBXcBnSDoGgH5k+0LeKqWyWjZMco=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC0FAoIFUMVE49Mx1x2cfXj8miRyaprEiyGlf25D11AIubVj+x
	FT/E2akMVOGVka2C26Q6qfNoxfYVMG+0Esa56fS4MApytrq2BTU5WadoLXkVJdg=
X-Gm-Gg: ASbGncvcH6cOu65+8OHrpxlMofNNRWWKQX7WtnkYNA4t5eAocUwTqdTKeiZ0ZwGFWLW
	FO6YLkuUHQFISqveo5E4Gvr2ngsj6gOWJnS9Ny9SHWgsmrIylFXruAhsipvjbkDAj3n6Rsluxed
	3xCRKyEERW5bXoe3c7xr1NvN2NIH5o0BHdFbiRQh/JBgW/qG1VhrhUeQRNdMkzWK5tqSbGgfm0/
	5R2ivUCikRd+cf0LmUOnL9iEcmug8lgF93OpX9sRImOgVlDtbLsT71EYXoM4eeKm4uVig3JTb6s
	s1cGbgggUgU10X7oLF1lyGlAnxnwl3pdY6V/+e1ahdL2Sg==
X-Google-Smtp-Source: AGHT+IFi58B/opSrTiSCQEZcXK3JMBecxGa6PyaQe84wc8+j1ywljyVjJeAqD6J4qh7EoSFT1wKxSA==
X-Received: by 2002:a05:600c:4ec6:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-441b2635482mr12037525e9.6.1746000229687;
        Wed, 30 Apr 2025 01:03:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2af2922sm15458155e9.17.2025.04.30.01.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:03:49 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:03:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/st7571-i2c: Fix IS_ERR() vs NULL checks in probe()
Message-ID: <aBHZYgPPPYY-J8Vd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kzalloc() function returns NULL on failure, not error pointers.
Also printing an error message for kmalloc() failures is against kernel
style so just return -ENOMEM without printing a message.  (Kmalloc
already prints a message).

Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tiny/st7571-i2c.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/tiny/st7571-i2c.c
index dc410ec41baf..eec846892962 100644
--- a/drivers/gpu/drm/tiny/st7571-i2c.c
+++ b/drivers/gpu/drm/tiny/st7571-i2c.c
@@ -908,16 +908,14 @@ static int st7571_probe(struct i2c_client *client)
 	st7571->hwbuf = devm_kzalloc(&client->dev,
 				     (st7571->nlines * st7571->ncols * st7571->bpp) / 8,
 				     GFP_KERNEL);
-	if (IS_ERR(st7571->hwbuf))
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->hwbuf),
-				     "Failed to allocate intermediate buffer\n");
+	if (!st7571->hwbuf)
+		return -ENOMEM;
 
 	st7571->row = devm_kzalloc(&client->dev,
 				   (st7571->ncols * st7571->bpp),
 				   GFP_KERNEL);
-	if (IS_ERR(st7571->row))
-		return dev_err_probe(&client->dev, PTR_ERR(st7571->row),
-				     "Failed to allocate row buffer\n");
+	if (!st7571->row)
+		return -ENOMEM;
 
 	ret = st7571_mode_config_init(st7571);
 	if (ret)
-- 
2.47.2

