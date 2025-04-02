Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FCB1EB9F3
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Apr 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591631; cv=none; b=edFSm52vy+xa6tvTjnJcTgvzeArl6W81ohzVmE0LvQa7gcQMl7mnVPcO0DYYmJKSNQUpRyNLgXJvVQ6jSQc4EhhRqk7swkDiF3HcnSHN0R7cyxR4mIpe0B65MJXhfhxSoAxgLR5JBfkLbDCyge+PC+M3icasfcrFKsDv5aJ3q7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591631; c=relaxed/simple;
	bh=S3ZKwf7JSNa7j75/HJ88Ydtg5YT4MI9/wq/yIT9hH8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SWDd5RB6E4Dafd1Q80Gd8YVAI8H7OiQvAyna3OAATjw8wTJaz1WUUe4kX1Vt+Vn8L6VerNCKjH14JDiNOh1mNKfM046w4UtvQ7DwINVJqOLoxJS5wxJ2L4qtl/s/5McrZv6Gnh4K0eaK/o8mTPP8zH+9vTAgjf7SgZL4ev6LQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8Wda7tI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8Wda7tI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f2f391864so3939324f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Apr 2025 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591627; x=1744196427; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YueQKe2lSUKqMx1zyYBOOeeoHDIXSSV+ljXdbDAQySQ=;
        b=D8Wda7tIemBqg2KSebuoRUNQJudUOvOSRsCMOONhIVtzjIQqWG7S9ddf3Z8r1RIfaZ
         lb4E9xzO1jSpo30637KfsDBmw2Flf9rMLKfhwZi1G/K8KqJBkIczpuT304qqzDIUYZwp
         Q/PFDWa+ip1ryTHjZvJ9jijx5158SiQTym5d0Xb+eB/+ykMtk+/zw7nTJZBSNIUiqvpQ
         RvQ44YKYicyxU9AfnUdDu5nnGJUp2YEkmAwepko9eEle2fqCyK02p0TuHfe74BUByoc2
         UFSaUKB2/b8UlahrE6QeAmdmzifccnZULLVx1IODWE8Ehp6JEQj61OXtri81BFhgxPhM
         QoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591627; x=1744196427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YueQKe2lSUKqMx1zyYBOOeeoHDIXSSV+ljXdbDAQySQ=;
        b=FvLpYZICi9mgVVb/LeGb4RO0AUSoeviotalGLuKZs8iGzeNImlHhAo3ubGwz06krcA
         7WMAp6G9XplMBN9IEV/9ok3uTNkB8JuRXsBsuFbr5Bc94dLcXX/w4tLykk5TN2Y8z91e
         VT/wVgcsb5ZVmQhmJXRtBLSF5HMiG4KzqnqCFJl3nd5kPlZa/J2MH6OOaplMS6e9I2yy
         Ogm+wyRUaNBj/aAF2oz7r/KBKgHZWeIf3rvdGgxND9flcvWGhaPzF8q7UFq7+fvzbr/i
         vEkeD+6Y+QZ5KKUlECYSFY4fIiiPsh2xBORclMznHvg36Vnk6ypKUe/gHuvjvKPWdU81
         EnMg==
X-Forwarded-Encrypted: i=1; AJvYcCV9l9cAEHqvdBpAVdZVXvzLUKp0361J6A2k/nsRP0WR4knqTpPOpoUAusgxySw07XeZ912K/1rb8YqRG8Vrc3s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh/dvPGI6LyyZrU8XPITigacW6qaEeIRKGwJUUljAzXhuIZSLL
	QRuC6ElpEBZj7YMqGuXEw2Le9p2WNCWmQV0BS6Dr4CwBk+pDt8rLmps4wdmUQwA=
X-Gm-Gg: ASbGnctVMwN7I3iJWPyhdA10GzlBFJj51Z5Ol6BmS5RIBjnJ2Ie/dASW8788ZFb3jPq
	32lGmmBBx2HaBC1hoapjjSPZjks7Jj5wfpsLUutm9RL1WbRTyUMHdPyjuGMgJteDGn1LzZ0IIlF
	23tCb4/GHKXcPIm7Yhe9jYDj5eO04R72zp2J2Vu2zUKxR12soDBBefufVP6PcQNtfZUUopqbhT6
	iCMdoo1CTbB1yaXMYqEPSRvKeEWNv/55n3xUrbQv8nn48vHLVJws4KNaoJwCr3ubK00ziy8dZW5
	ciuHvxIyEr4Q4uVPhyfEGgInCa/3x57RPVzj2klpp0wgVhRjgcspm4BrrZf7
X-Google-Smtp-Source: AGHT+IHvGT9STHY8C/CRWfPYi1GAudkPumuwpzo+YO6OzhKYGIHwkNQif12PUb6Nnfzjdo+udYpI/g==
X-Received: by 2002:a05:6000:1789:b0:391:4999:778b with SMTP id ffacd0b85a97d-39c120e1bedmr13908429f8f.28.1743591627519;
        Wed, 02 Apr 2025 04:00:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a41b4sm16391473f8f.85.2025.04.02.04.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:00:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:00:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vc4: release firmware on error paths in vc4_hvs_bind()
Message-ID: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call rpi_firmware_put() on these two error paths before returning.

Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4811d794001f..41e9d0aff757 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->core_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
 		if (IS_ERR(hvs->core_clk)) {
+			rpi_firmware_put(firmware);
 			dev_err(&pdev->dev, "Couldn't get core clock\n");
 			return PTR_ERR(hvs->core_clk);
 		}
@@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 		hvs->disp_clk = devm_clk_get(&pdev->dev,
 					     (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
 		if (IS_ERR(hvs->disp_clk)) {
+			rpi_firmware_put(firmware);
 			dev_err(&pdev->dev, "Couldn't get disp clock\n");
 			return PTR_ERR(hvs->disp_clk);
 		}
-- 
2.47.2

