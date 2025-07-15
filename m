Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F41CAA79
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620436; cv=none; b=VJCZb6BYUStl3xzZYmCMUeCRcWXbiqAtmMsQR4G2Tit0Hsy6kAtLEscTVesDK0r7FhNqy94imxl5T5w3hb9qkn/gP2pwkG5chDP0Zzgg6JDbmwb6eHio8MKpHlDx/s/Lm9Tad/jGya/zFiP9Kbb8fThGYcCgL2s+a7hMGNceZyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620436; c=relaxed/simple;
	bh=Rd4EWRAxme2/2cezG0hoAVJmvXZzbOjy+A5VWaeSXKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMJ2CmViJRwNOpOJp4K+/RwxIj5b2VnzrUb6PAiOp7B7pnCPe0dSnVW64RZUoC54LzkEUj0JxFO+vFNw2AehhHIg0mRyCz2bYtU9+XzHCnu4shIKnvGNzrZpMUPI9HHs5r6tF7lhh1JjJQOM+e7SYI4SJhMaLOsfsG8aMr5iWAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o/5Ienai; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o/5Ienai"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73e5f3b5067so475753a34.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620434; x=1753225234; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEHhLS9AKp6YfP0nzrVbW2+c1LEO3R60cxZmePqCOIU=;
        b=o/5IenaiA5OeF+X5gz/fXfbclYGCQGk6ZFrD2nW1ZzbKqUhBpSEqIn346duWuGbbDN
         WuOjqlimo9mKudMks234yt8xEcC6kg2P5NLzuLLBM6TBJ2uAPGJ9zh2mdwuVQxKXYzVE
         BBYpXBIs/495qdLElGPn/AY7CDLsOzWz0WCujZjSYuvnAkLYuiv4GhqOv/cVC2XmxVy3
         BdtCd1xR+N7LhUCsT0kOTwoU1DSj4JSFhgU97LYkskV2Pg4/BJbZwuzUiqPUfizFjv4d
         yro3bOPBb07jFF0Jrv4qN3KxKEf4MfycQfj34L97Li8IVGG5dG+XRBdfPx2g4cFqn/tJ
         WU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620434; x=1753225234;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEHhLS9AKp6YfP0nzrVbW2+c1LEO3R60cxZmePqCOIU=;
        b=w7KLxD/DbhC9wqgcwVoMwmW5EJVPIatjNWIkiZ+Yzg6BEyvQxfNN86+NHlpql6alBv
         bSzG4KLFIcVSKXDjbl4ikafRJOQ/q1Qpy3EsOBnbi1Cyta3p0opwkBeDMCSlLrLO2ty5
         Lfq69Bz20BX3ZAPhpOl4MUWg+0+BUKfL4A3Q7YwV2p1UXPqsa9R/ERxTXFJ43CwOQTRy
         xeDOICxdOjXNyKJzf8XJDmnV+s6JEsZSSvLpiaacPoLlezbvjgEuAxU9GefV6MZW+n7D
         WJ77OUCcN4IpiHhB7kYSFZXO/Ek60Q7j+X8/fQh2VQXwBcfYJT+truNVbJsb29xBshEN
         j0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmxOj3TIrZwkIWD6vRJEbBp4QDK9k2E/ct5tBt+Tlu3XUAVA8QDjbG7m9mKj+Rnqic8cq7tImYPXBqdeydkBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJYyOzcC//EQaQ8HAonthOOeR37DIkkZuF2ojEGE/yRnZIdh/
	TU9W5aQ7qgTj+bRbAV25Ni1COn2VP8fT0zz0azFUODRxLfH+hImO3RKCQTps0UplsS8=
X-Gm-Gg: ASbGncvMPEBfwG2KoVtuBI1zwSNDHjIBwIkih9jG+woiIkCFBK8K2pkC9e4RCiVS10f
	QwHvVimBykRNUOOCL7gS9+6AAYfHJwZsEWySmq5davciaugPV91nMaUuFYZ80McR2YSDFa40omd
	GWN4Tn1VOl93BIW5rlk3Z4ooF1ZnwWcQdNZVCU86vcQQAcUL2Gdzp2D2WXnoUsphbpHz8PeGetT
	Dh9tUPMpx3uZ3EjPWrAmRgJAXtAuq5HL7wxaavh8umvk0yBOmCslQd5pv91yO6uZ7aw7i2rln76
	CyFpLAEji+wHBMl8N6AU02Sh0S4ZIUWiJ5+fGtbJqmI9m9jSTuStnGvNy5Y83gHQ22BkkyuTj8t
	FluCyna7znRZSCb1Dy/pqW4sdZsIC
X-Google-Smtp-Source: AGHT+IHnn0iv6gW7AenbYfNa71UIVVvLtMsOtgKfhXxzBG8x/zCO8jdFx2PwxnbWY+hgyLCzOiwGHA==
X-Received: by 2002:a05:6830:7204:b0:739:f13a:6f41 with SMTP id 46e09a7af769-73e662c791dmr301764a34.25.1752620434508;
        Tue, 15 Jul 2025 16:00:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e44f2fb4dsm1348594a34.49.2025.07.15.16.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:00:33 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:00:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: stk1160: Restore deleted comment in stk1160_fill_urb()
Message-ID: <fdab5e2d-47b6-4551-8aa8-3e90b2207a75@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This comment explains why we return success when usb_alloc_noncoherent()
fails and I think it's helpful.  It was deleted during a recent refactor,
but let's add it back.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 416cb74377eb..3e6bffd49346 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -408,8 +408,13 @@ static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
 	stk_urb->transfer_buffer = usb_alloc_noncoherent(dev->udev, sb_size,
 							 GFP_KERNEL, &stk_urb->dma,
 							 DMA_FROM_DEVICE, &stk_urb->sgt);
-	if (!stk_urb->transfer_buffer)
+	if (!stk_urb->transfer_buffer) {
+		/*
+		 * If the buffer allocation failed, we exit but return 0 since
+		 * we allow the driver working with less buffers.
+		 */
 		goto free_urb;
+	}
 
 	stk_urb->dev = dev;
 	return 0;
-- 
2.47.2

