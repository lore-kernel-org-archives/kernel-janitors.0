Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96CF201278
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Mar 2025 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339786; cv=none; b=RLkl5ARvnnB0/Mx/yMJ/1ov9t7fJRlotTw0LyBxygCb87letH7OtHHRZG1BqXhQK7uIhLlYIgUU088vZ/hS704Q92o8k5IPPNNctIGGQqw5MXAOdhEBnmNLyia5Qo7LD4JQgK6VJGOBuBuMtZdxkXZzGB0igeuL1/ZlOJlFwAYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339786; c=relaxed/simple;
	bh=OA/7Qe5aEekqV7T4SN23N+UJLdSmv9Rkedt7UYvoflg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0w5qUbA22CkA7mK/wSPW26npi0h3AJN8PW9cCgtN8eQQDZ29+bL48J5uUhmlN+4XZI0aHyvfmdC6RXizUkUpmsouIE0glB4tT4bYGTIsKSGWR4iizV4y7aWtMcpM9xZ6VxVGYj8DIDoFACaAnWjV/99xs6kLpisv4A3HzvuAQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ed9Eyaul; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ed9Eyaul"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso9733145e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Mar 2025 01:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741339783; x=1741944583; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Im6pSo0BzRtrOvminHRm9b1Ao6lE3VOWmMljLzr+YZQ=;
        b=ed9Eyaulrc3fziPknhdHPMXo4Ya25d0DzW734oud1WnouOoJnoVyPQtU8PU0J6F2oo
         HsyvM08oKrNZ2st3hTUFpkwTJOCucLiW7MqEyLnxPi6Qjk2IrCwXSh0PG8dTy1oEywwx
         IHCyPf7RtRiOOqQ09brL3xCmOsPBIvLlqXglLDotRpVTvSu0qDJWDdZSEWzsRzREsM49
         mVx2+rMijRM+7155yGVyID4DPjflHx57yhbaqaIgrnkpsR7NQPnrZ4WC1WBLVR3/tCg7
         GoZii6LL4KOHCo3om/FmkqxnZZSZsjAZ8z1r9buVxB58PNTyzBaVRPvZrUEWOyO/C5Tm
         aFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339783; x=1741944583;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Im6pSo0BzRtrOvminHRm9b1Ao6lE3VOWmMljLzr+YZQ=;
        b=iqL9uwueIymEVDnxN0+cyPgPbMDNy/EcWA2Ki1CDfydOXx0FikFyhP6I9lqJ1QjHMP
         eNfvQLYqK9/pFj4vXeDLBpLiJuv7ft8d1JJLWN/wVufTCSRfmX/k44B8o4OF2T5OvGXj
         nSKR80joa4bQewv59UnPKOKJS3BkddfxeDFq+rzA1wlaqR7l1JHgaLIPkgDVCCEP5n/l
         WrS4DgCBc9e47okmwnO45ijK6e4QRkk9KggdgaOGy3hzLG0vNRRrOeRrHTHljgu8u9/P
         2N7m4e8bWbxilnFYpfpZO+tAw2Q0VqzY36lpmljXEpdJcpXdhsVXocGsFuJLXE2CC4wb
         WC/g==
X-Forwarded-Encrypted: i=1; AJvYcCVgQWnegElqj3x6tBx9sCLt/styQ7ks2AIT4p+G7mYXOje2WA8nofxPHOywaNqamK4Q6Vr0if5PSX+9m4+DV8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaF8bHuuEMG1pqoTOuS1scQG0pjuuixLzRIFBhv/slDyVfxAzj
	sowfiLCEg5mYYjNjG9Gfh6lt3NoVR6dcGQFxp/nfLxAatN/Fkx5kBEakqzKblcc=
X-Gm-Gg: ASbGncuVHPfl5Ixh3fRmjlGibQ028b02zgmqNCPnA1BJGPXhKzfEI+X4hsBy/7NO7ZU
	miXL24HmZNxy8yvqnZ84bir6NrLRyMH1nqXrhw4GXps4/MW2u5t2nEdArG0Dbplrsm+ejRd1u7u
	X70yjUbtGxB0eRN7fnlOiuAJz7pG6UmPhzRlCCW7LBXeGBXwLMM40UQUQhz/E4vvU23IBjb5mDY
	NYhBlZhxQHp7yyFbDgJv8sn1pnY1Lj+r51y8qqQGqNEcxrLFgf4UT515YSJTsKWR3KqgisQjsCR
	DBTziTNbpQF1QBWyRQWHTft+oCsSDQ37Tvqo0fK1CsyYC0xFIQ==
X-Google-Smtp-Source: AGHT+IG1aeOLiht/Zk+dJWxQiJtrE01AKe/jCJ9h6AR4ika6O/iJj47hJhtKgYXJCT1ozzCGM9Qjxg==
X-Received: by 2002:a05:6000:2c6:b0:391:31f2:b99e with SMTP id ffacd0b85a97d-39132d1fc45mr1723216f8f.2.1741339783348;
        Fri, 07 Mar 2025 01:29:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c0e3250sm4783347f8f.61.2025.03.07.01.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:29:42 -0800 (PST)
Date: Fri, 7 Mar 2025 12:29:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Message-ID: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

After the loop there is a check for whether "wb_encoder" has been set
to non-NULL, however it was never set to NULL.  Initialize it to NULL.

Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b0a062d6fa3b..ff6f5c5303d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -956,7 +956,7 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
 static int dpu_crtc_kickoff_clone_mode(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
-	struct drm_encoder *rt_encoder = NULL, *wb_encoder;
+	struct drm_encoder *rt_encoder = NULL, *wb_encoder = NULL;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 
 	/* Find encoder for real time display */
-- 
2.47.2

