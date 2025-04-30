Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB01EB19B
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000401; cv=none; b=DKBKC5mWP3DAnc/HTABcMucchc746SsSoZ/rWKHs/+29EpMb8U/jB9tEGqbdOYxIwSK3CKOmgCMkbtWSNKEAwFSVPCJDRxIVeAZ5K8UL/GUqFqLBIh9ci4YDjo0RgFoHVhFeI4SmbJN54ZiU4Xv+ke665cW7pbSS/2gqkRx9pFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000401; c=relaxed/simple;
	bh=99+kCDIITBMCpmDZvnmLUTjaZZ6LPqCubOvj04JEBtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnIFsMC9E/zxW2tsBlgWntd+QkHCYOBRw1nN3j2Sl6D2OuU5RrNEaQBvpZzGN7HYtVbpPyiQyW5Hh7JZBds4U4yiEYMx0xKenKRuljkSp6K5Cla7KSX1ToSPzsB1dSEqB6P3Ky0FmpFx15lRTcyDgMh9TLgbfB7mgXpRsA6lB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkipsDXr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkipsDXr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d0782d787so42734855e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000398; x=1746605198; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
        b=QkipsDXrVNvE6qclzrfPGxtpF7ikYP30XwL1H89kwa4VsZnDEKgc/x+2+35NS7uiUg
         G6k+s8yg41e6PA6gcmdztdAUPo7S//ULJybdRx1b/GZpFyFOE3RaQhiSZ18+7p1vNB6H
         O/SNCRHsP2fxfvnM3XF+FQjJRRlEpk0Le9I2ETcf5u4qAcdksRpM1yLSAkqe8B30s4cM
         WKOH8/+7xJsExW8uHaqQlMwc2qV/KXFp0nSnrloRCb8araKgfb8d7ueHsk454HN7t06r
         u7EKoPvILkDNxxcYM3QHsw+klEdejpKZradDhmy0E0AHGMaHqP831SfDnmiKATZeK9Me
         UE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000398; x=1746605198;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
        b=CNgYoPlBqNyf/07853KHBumTGyFDfnnKHE8qW5cIOFa5P+MtxMQo7YSLM8JOj3Cwib
         45VkqgnshbwyTqR85rukKzVhG4E5Ot19fINYyVaMhVeMq15ZZ3xpTf3XDGIljeeqc5W3
         EnLIcvdJtAYdGsjXvXRAmoE3lAba3vz8oEQ5eI0IFpaaq2028z1R+NTajfEpNthIzIhF
         8jHHwv+aaD6/X2DJjNBV27BVnEcZGrmJViGkMJrc729lt2OagbHdxNJGtRKjJH0ppxz5
         ZjrJ4j9B5vJcoydMQtyGRwr1nHbJHcbVc2hqfC0SRlmCwlVLb67EGMyTUW3RtUCwQLv/
         9OVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXah948J3C76aEXZFNyFIQnYdBz25/Cuoss1QzjKF+SvjHrYEhhxohoLrPSQGnq7901bMa2WLymS+nzQkt71Zs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3qfkGe0LFr84qUcaCgY7QFy75QcD53ffZNvYv8pvxUoMH9p3
	pXQT/lDu2Z7c3TcwtHeiZUD13zUCwdNbR22VC7djlyvsUXl04IdCpJyAXgr5v2Y=
X-Gm-Gg: ASbGncvbdbjKcl+V9U+A+3QyYzNAYbh/THZGCuNy5UeSsT0tzRIDn9Jw2l3hASUV6gh
	pXxNFWOfOtlDEnCEIgo4z6GKMzPTh9g++Tvh289qL0DNF0M+bVDD0pr5zAI91O77F+UdUPsokB6
	6oxaBleaOsj3b2tw1EBiLENDuv0Y8PtRrZ7irJqg+iMyHL4l1SsqFuekKcZo8LwIXytANn+gmhu
	RTyBt7xewS98qm/vQQaWDpBmZWGQAYlReFEo0Yh+V86WTrmrf1pAr3dW/UTwv2JRo52lvVP8BwD
	AILTXD+tP7vED4sSwsgwl26a0OpLzQmQLvf7/z5h4YQuDQ==
X-Google-Smtp-Source: AGHT+IHP+atkeWPXnPct3xYEf+jUQ0S7DQqC5h4qJD0wJmpfwo3S07LKuBCrJm3Z9SrRTQ8TUMm+ag==
X-Received: by 2002:a05:600c:502b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-441b1f30736mr19057575e9.4.1746000398163;
        Wed, 30 Apr 2025 01:06:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bbbedfsm15173965e9.26.2025.04.30.01.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:06:37 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:06:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
Message-ID: <aBHaCM66pXaP84ei@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

"&chan->cgrp->mutex" and "&cgrp->mutex" are the same thing.  Use
"&cgrp->mutex" consistently.  It looks nicer and it silences a
Smatch static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..f5cd7f7c48b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -104,7 +104,7 @@ nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_c
 	if (cctx) {
 		refcount_inc(&cctx->refs);
 		*pcctx = cctx;
-		mutex_unlock(&chan->cgrp->mutex);
+		mutex_unlock(&cgrp->mutex);
 		return 0;
 	}
 
-- 
2.47.2

