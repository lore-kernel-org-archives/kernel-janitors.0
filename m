Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468759154
	for <kernel-janitors@vger.kernel.org>; Tue,  2 Apr 2024 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051788; cv=none; b=s/Tfh/VT8yiDJk1IM1qEzCVpEpphsK776LOKR42siO24fpzHnBsdLOIdmAkOoCMN5C2dlFen9kYZjG8vITSKftAnYG8q++S4aaQFTfZXhETxm6hFFjYLv/4UmjKIwYv8vx3vNurHODbAILBLp0tkt92fqoWlKDVk6unSSFKfrKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051788; c=relaxed/simple;
	bh=Nh+2aAI3uXCuRfrMoJJ0v+wDHsdg/m8Udqg61zTF9R4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amfuKu6yWSLU+980t6LEYtptn8ULCByauitznb/hxrAm0KX/v7A3aT6psxCANV//xCGcfMwxPTVlrFT5ulAEMB5H6emFefVYklLwNaOBxGwYrYpa1w8yaqXclCAwMfYo87F+2jVoDk/g9AOizUn9R7IL7FmpyeF1G/k7E82Ay+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bApx8/cM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bApx8/cM"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c147205b9so8668478a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Apr 2024 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712051785; x=1712656585; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eiv2Gv97BeG+qqS2CUDwFb7TsuwaJxi4oFr7eU4Jkw4=;
        b=bApx8/cMFsi4/EtIWG2FTx+ZkcGLXG1qgEqNmrq9i8NXfN83Q09NDICvLJHH30MjZ3
         FcHIpOmdnYSNWZObJTEQO+IGz7b9X3GJX0B3CbO6hyFTsMGDk7oNJGgCwYEgbgIgLDvf
         klk9/oYwhYmyOmVMk5Z0u5hXHeY/1jXaU0YesDCVp6q7B0mwUnTEC61vb5inqc1s67yS
         bIx7ECdn4cdvYftPc+F/bVpYkOxehGluck4/svyPpVVpK9X5oiMsVg/RgBj9Hh/tZqsu
         Zdr19A24kgf13UYP9oHkQSuBIIvTTEyh6zuJ+wVLOOB2bZx4BJH2L/2VY95WHYU3+ZQr
         WVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051785; x=1712656585;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eiv2Gv97BeG+qqS2CUDwFb7TsuwaJxi4oFr7eU4Jkw4=;
        b=Gw1R2Ax1YUz0/9wGPbeDnlCgzkGLy4T1B5enWcbhyxsCibUso8Re5y+ub2ORuREocp
         /pfK0Xclt5d2oXYFryB7hM/Yv6weZibDmScVSYDjt/q29sMjvNo7ja6UMuw1CW0DCojh
         waNEiY9AaE5cRhBlN7NiVo2JceMSB62xwojz4W+coKO/7hWMlV1dpjNfJU0Cgck2WI+T
         fpP534W5IRvhAj0dIaLo5vKItU4RtdvETjshrZhDQLCEFe6GvvUVPQ4tWtYg77CjnyEB
         6bjQzWTpDGXr/k/dJfOtbTfxVPijTrkV7BFcnYakQgO/5Hio8aRgxcMOzGGweTTU6cT+
         0jkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxPQ0mcL275d23uSt/cBqR6+fS8mWBWiGD43BTKU57rL4E7Jer7jvmKoAKi6Jp4kgNEkBvRj710akD+rId0uWrLXJ8V9j2Vd0JcWyN/oe8
X-Gm-Message-State: AOJu0YydU03AmStmIBxPt28j3LeSvlMxW2NNmYosbNTl/W7uqq9DL9M5
	yw0C8ifHORc5pAFfee5ETDAhnZy9RfJDpBpcdctDsTw+XufgmzalWASl8XFc3eg=
X-Google-Smtp-Source: AGHT+IGco8HwCbD45dxh0cXo5f4RbSDoT35IhySsKpVpDkYvfjDKul3aeagzg+egPF4UF9e8RGBTWw==
X-Received: by 2002:a05:6402:35d6:b0:56d:c3f9:b8eb with SMTP id z22-20020a05640235d600b0056dc3f9b8ebmr8364382edc.12.1712051784449;
        Tue, 02 Apr 2024 02:56:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b0056bf7f92346sm6683950edx.50.2024.04.02.02.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 02:56:23 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:56:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Grant Likely <grant.likely@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix error code in panthor_gpu_init()
Message-ID: <d753e684-43ee-45c2-a1fd-86222da204e1@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code accidentally returns zero/success on error because of a typo.
It should be "irq" instead of "ret".  The other thing is that if
platform_get_irq_byname() were to return zero then the error code would
be cmplicated.  Fortunately, it does not so we can just change <= to
< 0.

Fixes: 5cd894e258c4 ("drm/panthor: Add the GPU logical block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0f7c962440d3..5251d8764e7d 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -211,8 +211,8 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 		return ret;
 
 	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
-	if (irq <= 0)
-		return ret;
+	if (irq < 0)
+		return irq;
 
 	ret = panthor_request_gpu_irq(ptdev, &ptdev->gpu->irq, irq, GPU_INTERRUPTS_MASK);
 	if (ret)
-- 
2.43.0

