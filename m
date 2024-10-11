Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8971CC174
	for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728624267; cv=none; b=VdG58SQ3yVS5zGZVMDK4yUxqjTU6cZ64ori9JFrj8GpH+UWZf9bQdm2vBOVpUeCiRr/8c6Vrt9o/vgYgQHcN9yqLjItfLVUS83tDGw/ZJJZ/hkIethKHS2GTsx/i2ZS3So+nDX1kKD02Y2RpfdXDI47W3A/OzkTWtspY083dvLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728624267; c=relaxed/simple;
	bh=Eu5/Sx/8t4BbSYZ/Y0H81EOkKHldJwz4fE4MOrm/MkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T73iG0uj7TQnZ8cs5W8aSBgV7botVanld60ktHiMQlXE4fPVnjvlg8bM9GqNeD8GF0vwd4l7qxXFgQ0oqUmzoJdeRkFQhnrTW1PSzUEWTbHu/mbB63JzlmRl7aCbekm2gwidEiCZIQVz0dHJH55VeeGk5m/EWqwDmZay6nxGhxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=HAGQ+XYF; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="HAGQ+XYF"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso1398508a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 22:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728624265; x=1729229065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BGOKIsMg4QP3m6tKk3FDK1aa5VlkpqPKb0X90CWsAo=;
        b=HAGQ+XYFbq7tdQ3f25KCFGUKTML1YKfvlNBrxAbzIzN0eSPhMj6bPHzuOgRlkLTl0s
         smTxTYskW6Bc+jaOq3xjXhrm+g7ZftDTYV44sbA48NYU5Xwd2PTw+7QLIm1ch8yrqt0W
         OQE6FWSTxj+HDgx+QQ0oi/z03yzy2WGDZvJU+TrwdmfPt3CJQ7V1WncYYGHfojc8YvPF
         KzISOqvQ6601/hhLS1rO9DfvDBJyWOUiOI798vKGPMu5xJo6ljPyW705qZo+KomK5eIq
         5ATbBdVHc0mNUtDqZ7dc4PSL1hCGaZpgGenUovu12+h/ZYdI18PfNFT7ipjqwD+u+XIU
         0y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728624265; x=1729229065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BGOKIsMg4QP3m6tKk3FDK1aa5VlkpqPKb0X90CWsAo=;
        b=Ngnflpc5uDGNhHt3bsjFU9zoBv6ceZBV03C5vNba5/nZMpBLrPUKzkAaCpIJGjHWtN
         cSV20W/JNfHswgCOOOx02EzosGiBbhDfdu+fbmct5/T9UpOdFWiBmMDKzae31IyPfdEg
         vgBKGGPBSnGX9OdGO/1P9Jxvpa7nBS0pLgHRGi/RY4U/qef+dYsO7fkPYmkl6vJz1yFc
         1nbvivWZUagr6lThlhLkoZMGgPER/BStJ0bU35MVKm7LYaY3dtI4muWtl39Msk4pKXLl
         BCJ1Pe8zKt3Tr/ObXOokm7axPJYTA2nYG3/YjpsVJXS3VjwjqVBFgITrbxVpZa7tmOCa
         ECXg==
X-Forwarded-Encrypted: i=1; AJvYcCUUVyMn+HIgjbEWnWXfbr10Zy7Vzws4ruQ2GizovCsmvllz2P5UzdZGf5UjXGsHT1+Hd/szT7boFv5Kjkj997s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnf9+bnphclj2JeDsMCBT4vqhkkHO39hvx19WLXR1fqdVptnaq
	5Jgf4SDw7tCYr8AKxtNOUTEwtorpk0WU+ltBovi+JxnjAR0ofZP+xv3cbFDbgTY=
X-Google-Smtp-Source: AGHT+IH//kLRhYfrjYGsfIlcKbHS3xoQNKhRAMnMq31mnsU+jdE6aFHUT5rih9UTGv4Vs6virTNbVA==
X-Received: by 2002:a17:90b:3844:b0:2e2:8472:c350 with SMTP id 98e67ed59e1d1-2e2f0ad156dmr2213900a91.17.1728624265466;
        Thu, 10 Oct 2024 22:24:25 -0700 (PDT)
Received: from localhost.localdomain ([91.196.220.222])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e2d5df1133sm2380070a91.15.2024.10.10.22.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 22:24:24 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: robdclark@gmail.com,
	sean@poorly.run,
	konradybcio@kernel.org,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm/a6xx: Remove logically deadcode in a6xx_preempt.c
Date: Thu, 10 Oct 2024 23:23:14 -0600
Message-ID: <20241011052315.4713-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ternary operator never returns -1 as `ring` will never be NULL.
Thus, the ternary operator is not needed.
Fix this by removing the ternary operation and only including the
value it will return when the `ring` is not NULL.

This was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600286

Fixes: 35d36dc1692f ("drm/msm/a6xx: Add traces for preemption")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 6803d5af60cc..2fd4e39f618f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -297,8 +297,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->restore_wptr = false;
 
-	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
-		ring ? ring->id : -1);
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
-- 
2.43.0

