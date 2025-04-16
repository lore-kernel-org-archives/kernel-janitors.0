Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84184234970
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Apr 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801769; cv=none; b=qEt4H3Kb0jZZ0ZM4DAxcp7IIkMTGciCc8Ase2KSPj6U89M0cEv4ilRcOzk/vQunszCesmtU+2dvYElXaHHVvos1PPr76MhmrNPul+kNslv0Nm/eTkO+X9rR0stbztf1g8z9x19UIoT7naovFYliai4jSLf05Ki/D00HVrs9d/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801769; c=relaxed/simple;
	bh=6vbNHqCq64KR5XtBXl5v9gH4kSLDvAvERDHu6pcREeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B95lk5M8o13eclqDM0LYwcZIqXic5D/r/fCmggqgvF5UYP4wGOHpXfYcqNnl0ktBnGpsmZgKgyNKGqQX+7O1L7FzUIW3u7Icl094tFKuFUt5ExQjRY9Os0giOBTzaINNL/YVto1v8nfbfALW+vI/N9xz4Azbu6NsPPRC7CVw4Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ol5lCuWX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ol5lCuWX"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso65271155e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Apr 2025 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801765; x=1745406565; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF0Z7gGf1sTr4yNTYDi/uIElOA7c6FMutBpGSopg3TE=;
        b=ol5lCuWXzrr6A/vxpiUTtlMwQMBYSYj3r9jzvGhZkFD+dHU7sZmNtWwT2jmGdrBNo4
         4bUq3ryQrko/dH/CqLdaxGnlGFrKTwQvUM0R9nQQ1xNOnVniJ7Km9Mt1eKvV7UeZUXpr
         NTSIMsgN1P1HpKs461rVvyJV/Xe2PzLm9hyYZ6yaU8lAOnokH5V4fAgR5ikxmG3UUfau
         bgZaC4raQgJP58qfw/zH8Hf5M7GNSKNics1uab0j3Tk2F5Wm8zE2zwl+R5UIhEwFQ9Vz
         hY8YviEYAcyt7T+ujD6CT2XJ89AMotyjdKo5Wt/SZB5sKfnOkjoA2L4Pyl573OJWKIQH
         ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801765; x=1745406565;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF0Z7gGf1sTr4yNTYDi/uIElOA7c6FMutBpGSopg3TE=;
        b=REQU24cxX8PqC4yPqqU+tsLmgQTTJLvqVElvQCE8wqeQwo39FcCd61uilRPvz2tIO0
         mhvy7pJyoUIYieygMTVOW6d/1SQbxAhG7r/rf12c7QE+eHrjiFF/r/qAcCHFCzYIL20x
         jsc3odaaFmyfC3aEx6fpSDtXikMa2+Uu7Sl61FKNvRtrgCc9sygGwMuxzyh6YS21XyLC
         LtQPEbrf52RgElvCnJpzOHhXqMwIzu6JwFwfC4LhnOGIN0IkgNtqM0ntYuMVx1SIfLoD
         YHdoY966EoRj9YIR7iGXy6emyjX1cGQdOUzQtRU5SRqF3gTlqYhLWUohGI2HwAOMbD6C
         NYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtoSkqpVTvFZQJ0zPXH1CTT2kO5U0M8PfbhF9lF9BJFT4+AYAsfWHCm6Vc8irDCXv0YivUYSrUnzDmRHmybcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbTajcxmN38ANWM4n4sY6e8nT1HXGdQ8mqHjbw6dvg7V5ob8M
	bPM+TQxtxA4BIwnlnFmIQW7HAIJilDbIrhRiwfdaSrY+GMvaIOKPt9x8U9XMsbE=
X-Gm-Gg: ASbGncvZsZIMmv5ergPQrjv5bJCS/NcieKG+CyeNbztjkqe7qxxUrTJqge3GjrcNTR0
	89EVgvl6SnIuSOVwhzfoyX3o8IHIkw1zLzH77M40ZPz27nBb91L1cx5m95j/5WScIaZj9XFS0Nj
	C4CfqgK1qSoniT5r+gsoJPKjzmNHlwXWn2uY3yA3EYwZXoP0SYd8F2yLxXNn1oqnZ7qK/J4Z8Qs
	x/Fg8DByrFwN8jV3TYGtA41ELsMoeaVHPNMoE3Mra/kgANlJax4sEgKwUj8yU7bDP4v7uk0aK/4
	q/33F8wcaCpeelhyvV32iRhqPS1SRF5NqmSaTvugyrq3tA==
X-Google-Smtp-Source: AGHT+IE0M2ogmZ3Kz2Re9Yfivx+X34a5bjUap/WvGE5uPRjHdo77GDmKa2/LSpuLxrJNZcmScbAtOg==
X-Received: by 2002:a05:600c:3d14:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-4405d6255efmr15632385e9.13.1744801764696;
        Wed, 16 Apr 2025 04:09:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b5a9846sm17583005e9.35.2025.04.16.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:09:24 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:09:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/udl: Set error code in udl_init()
Message-ID: <Z_-P4N4_U-xTC9-O@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if udl_alloc_urb_list() fails.  Don't return success.

Fixes: fb10144ba426 ("drm/udl: Support adapters without firmware descriptor")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/udl/udl_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3dfeb88cf918..bc58991a6f14 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -361,6 +361,7 @@ int udl_init(struct udl_device *udl)
 
 	if (!udl_alloc_urb_list(udl, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
 		DRM_ERROR("udl_alloc_urb_list failed\n");
+		ret = -ENOMEM;
 		goto err;
 	}
 
-- 
2.47.2

