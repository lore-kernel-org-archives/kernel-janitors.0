Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F831577B
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Jan 2026 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902617; cv=none; b=EcZGeXDB/gVrVxyuW3Z8sEfsTeZlkQplRmlZWf4MWqFFPnWBgBmSsy6R/bzBk2T2OrK5ZEbeqA8m/yE+5BcqVj9lpSi/D9GCxQGK2eUJJN1GNGKDIQ1gW29tTpZSAOPYsBOGevpoPZjXtxWrMtce2fx2g3vwmq77HzQlVBFtzGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902617; c=relaxed/simple;
	bh=xW14wuO3rpDunHqMU7wmi3C0CV34THPunsb7vXrsYYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7JXP2rY3x1K3hjQSrgYirWqPEwdHZxO6K7egWPVwRhvyuFBaGBtoONytvA/PYEjDNvPJ1CsAyS5vz9w+HuRMrzfzpCvKuiCwRlMMGtamdesSoHEPvmb/E3uvQYryVvqzVSWrnmwjXXAAMF32eE2dwflhYpvQg77Z3XaxQpXfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5qyu6IH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5qyu6IH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47796a837c7so26617855e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 12:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902614; x=1768507414; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+0IrpcN+V0oqtValorBiZ1wiITEvHQIGq+jybV+6PM=;
        b=A5qyu6IHAjh3j5QjY1VhAY3yO1sfc1KUyNuIKKeBkeOsWVx7zoO9GKB+fDcQvNGIXE
         BWs/OtZJ6mdXNGkU1vzDawn74EgHQpn1APPyexKB/EMT2vFqHhF3KHj6ZtZ0l9PXn0LP
         j/CKjD0QFvnljZZopQiPmIkCDjQLxCyNHdO0LTejCS02g5DE9d9+xVSSR84kabENFK9n
         sADsdummxNvO+JEhIQVgHTOrHGWI0TAlmIcNzsyrIytCHGRlhTxMAeq1+ftyW5l6Ei06
         vClD1nDo0Yh0UK7kpQ1c6YqXZxGpilcvCr64Dp4Osk8dlbgJM9dO7vGJ3lB9euan+Jym
         sgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902614; x=1768507414;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+0IrpcN+V0oqtValorBiZ1wiITEvHQIGq+jybV+6PM=;
        b=AzC3YYz44XHoxNi3UauCJPZ8QwWPTQFL38FLZYq0W9+sjbOglIyJUSye7YbYFQd+6W
         MD5llFoc9MCd+etgfp7tkFcYlxDhjxeUU5xt9r3/+/pxVtmAeIwAhb1qZU3TUb5Oj1AC
         MYigXLvZwXZW4NIdKuLpyKxDrWo7se046QIBw+h/VlMbDmxCDMh9ijoIbpuPa6tEjQVS
         6ZtGV6xIO6VRb7UH1LE3lq55pC4l4RiSbszbzw2FnUvcc2eF+/8tziv2wUu2sdqofsi+
         fbqVIHEMSgpsvYvBEDhkdcpw70ON0Jk+VGCkvZ4CFpKr6yrXpM3B4GfbectN5ULN1t4U
         +INg==
X-Forwarded-Encrypted: i=1; AJvYcCWiGEGYr94JHuOZXAUJkknZGGSYGfIunrbXtMXgQHbw5XLS/qA+kgGQHmz9XDoX+r1r7WcTvo1cnqyyOpPH8Rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQS4OtFWtdDRY07g627pm8T+TkkrSod2GqX94UIVRmfNBt8hlh
	NjVwny7BGM7+ttWOIe0xeIq6+brTSB+V8A8lMPL2ZgEZp9b4cqpEkixQxxW3MAoBbaY=
X-Gm-Gg: AY/fxX5N9svcmt6i8WJ1xu5AKwlxcXVaYGwE8FxPj0ptb0G6xjGQKqu8I1Se9pmeEaH
	CQInMl6bRiBaecB5K3+MvqzfKSo2b9U31EwBBW3G4ZSGeLRJlV+ZqtyyU+anrM0B2YI/Dc9KnKs
	Jpr5GfLRRPJp5bV6dHWDbTpxMMG0OlPFnAWHde/HuIwo96OyKsQZa0KqskwyI8attMt4oLOm5aT
	UqY9yvdhkDTMqmb8kMv6tiA3k0quyZwrNQmrYlsoRMWh1FcbInEbkJEx3mlc88jw+aw8XYQfLy5
	YU4TheQxdypPAfJ/CvYPQE0hVxrTisZasru4qZ39APnLUOzj9KvwLihWzydRPALHWhGJkrBiPQe
	yJfg148i/O2etGDZ+1uwJM8seXolnjIFGPi1f+UTWrQputD82MVDYMqU4o5mS2fKQQoyeNHOacc
	5MP0wafs5OrIftGQNT
X-Google-Smtp-Source: AGHT+IF09Jx1RsKf/ckE/pQqCWP+iFQloONpAQuOq6DavbULp1WEe4q21ANMIGV5Sd+vyzTCa2FeOg==
X-Received: by 2002:a05:600c:450f:b0:479:3a89:121e with SMTP id 5b1f17b1804b1-47d84b614c6mr85847175e9.37.1767902614177;
        Thu, 08 Jan 2026 12:03:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f65d9f0sm177083095e9.12.2026.01.08.12.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:03:33 -0800 (PST)
Date: Thu, 8 Jan 2026 23:03:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shreeya Patel <shreeya.patel@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dingxian Wen <shawn.wen@rock-chips.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: synopsys: hdmirx: fix integer overflow in
 hdmirx_get_edid()
Message-ID: <aWANkxRApxDeReRW@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "edid->blocks" variable comes from the user via the ioctl.  It's
a u32 and "edid->start_block" is a u32 too.  The addition operation
could have an integer wrapping bug, so use the size_add() function to
prevent that.

Cc: stable@vger.kernel.org
Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index c3007e09bc9f..f054e30cbfb0 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -717,7 +717,7 @@ static int hdmirx_get_edid(struct file *file, void *fh, struct v4l2_edid *edid)
 	if (edid->start_block >= hdmirx_dev->edid_blocks_written || !edid->blocks)
 		return -EINVAL;
 
-	if (edid->start_block + edid->blocks > hdmirx_dev->edid_blocks_written)
+	if (size_add(edid->start_block, edid->blocks) > hdmirx_dev->edid_blocks_written)
 		edid->blocks = hdmirx_dev->edid_blocks_written - edid->start_block;
 
 	memcpy(edid->edid, hdmirx_dev->edid, edid->blocks * EDID_BLOCK_SIZE);
-- 
2.51.0

