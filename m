Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653D1714D7
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007666; cv=none; b=GD2myRiTXL1YKE9Fu/pMXJp9tTGPq22vfd7xnKpzDKgjgzFpnwKMNKjbhTvXhiCzqGjORLLu5vE24Jz+2/uMzKpJKaTywuFJwWkZY66dOdSaAGvT+HazL89iuv4KUP9XcUl8jBzSRvWbp5zSdgGLeo61N67+6s5R3ivt/7LMjTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007666; c=relaxed/simple;
	bh=1Ts9EKssjbPUaajtIUeXtbeIZ5MvymgYej7/+BBHFJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cD4FhaIzeEXHeItImHVXmUcnD63Wyn4uiEjUudL0dt0HJxvO40aZO2o94uR5Ui2kbUyChPr3/aUU0nBCWdH1aqOLiYhfirFxI6/ALClqYz1+ANyObWnB5Zy7/2IqtqnmzYPzAqa3CsXRKpVQGZyAZ3YjQUx6aBWz7rYZlJRBYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C1n7cW1z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C1n7cW1z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436202dd730so3919035e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Dec 2024 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734007661; x=1734612461; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1Aa7kk3KKfy9aAdx9Y9ApzJ11F7xml9XtZy8ZKLnk0=;
        b=C1n7cW1z429N8uy32cjEurBOqlnHcBCUH3zEyHviNwukhyXZgm75PbGL4xwY2STQFP
         N3dVjVLLzbohvPUZ0crQyFo2KksIANcHg/GyLJtXlizPcH1rHKzrPuPE9Ui3VaE7AB1r
         mQvQ13yTHxQs5I6StSNoFHxEonEsBRGqcwdHVE4bRJTRpb5O/jK5X8j9SHIk5L4eyPv6
         hV+BJnOX48NRFXD0itA2s2KKMPQSxyaHIUTsFGCXM+kyV9/GwtfBGLJj/I0znfTrQ9Gp
         BuA4FzWRNwbP58Z0QDDt2/3phoUsikNfiuMVWi7WFOWWs/TN1xlErvkFOOUdSZ7gcZCm
         SxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007661; x=1734612461;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1Aa7kk3KKfy9aAdx9Y9ApzJ11F7xml9XtZy8ZKLnk0=;
        b=naQYSgHObO/f97av33PGpvapNzjzuDVzXp4CYSOK6M7wPEgQ7bX2xuyrS+HAPethgJ
         mjX/I05VfWCqSRkDj8ELlXDnLJ9OJB1zawJOT+rGpnH8FhKr3djRqeqaWoNMILj3XHR2
         pwt4fM4QRC7v4MfAWhFPZkt8fK+puz+NK2B5RZ7+hlXQ4IbDSW2Nscsz4MBzIgzy4O3B
         1TmInm7tcb5KM0hDZP1nqu7VAxsj5xoXke5V5GBA7dHi97dx6JUweatVON0Ty53SivMA
         pkg2J1Coy6X18W40g3joYUOa5Ha/lV0/VBX44S0XfoaE9qlmh8Y1TxqDK2CEHd9Ch72q
         P/og==
X-Forwarded-Encrypted: i=1; AJvYcCUCg+09YrHjJsd2I5JUVWuc+n2F/JaJIaXNunCHZw4tyoyEiLSx1TO1zyfTuMZggDyJ8VqMjaI3vgiNq13Tkgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7/9PvojHPJPtkS3MY/5AcE1lTfX1Tl0cGTWNFAX9BB0oyuF7
	kTfsQozjeDtZx3ZUnyroUftmqCbEgTSaPXO8U12DhOCzeNbeFrpmHfhTJF0qGe4=
X-Gm-Gg: ASbGncvOzRJml7MuQrm8mrFZL49H7bqTYlbKV5RIj/ch7r68qgCb/xAjGRh/v2eFe6y
	DYN8xBTDGvDkR5bA26joo+xBypq3SYNRwo/dmE0Ip8dWEcndUml/wvM8R+vDfe3o6wlLekgIUuE
	QIEay4ZzILHT1/JV2RJ6kXN4sR+PMUUh0l0i5zgtwMYgYh7aqPJIMuJEXwcrwNj0D+hDGEVmm5D
	AS7h3DdL2Utd1w+zHf6eOEbplZkhLmTZuLUUO4Pb+wHwQhApk6FmJlvwivFhQ==
X-Google-Smtp-Source: AGHT+IHG070ZSCDM3VoQ8IcxxgcIA8LmAYT5Wy1Ts2flXAmROuoKHKuI+kgLYIo8ua64rhinlAKIfA==
X-Received: by 2002:a05:600c:1e0b:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-4362256dc73mr30023385e9.0.1734007661208;
        Thu, 12 Dec 2024 04:47:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625553234sm16279045e9.3.2024.12.12.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:47:40 -0800 (PST)
Date: Thu, 12 Dec 2024 15:47:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
Message-ID: <b61a81b2-0101-43bd-a4f6-09cf3a016484@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The default statement is never used in real life.  However, if it were
used for some reason then call drm_dev_exit() before returning.

Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: style fixes

 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index b42027636c71..4811d794001f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 		break;
 	default:
 		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
-		return 0;
+		break;
 	}
 
 	drm_dev_exit(idx);
-- 
2.45.2

