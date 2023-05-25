Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335F6C77B7A
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 08:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbjEYIFB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 04:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjEYIFA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 04:05:00 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02F1E6
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 01:04:58 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6d38a140bso1843215e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685001897; x=1687593897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X9umes8XISbIusyvA0kgjtSvDb/BpqYd/IdRr2QRP+U=;
        b=LBoXwcKwwosXKjASUGjXThGnq4/uabFkaVvjc2ybnlwL7IfetKEolw8aOAzAJXnOJC
         vyyurtXYn+3HtvsGReWUQ2NuxcbR6V0MsgX2x2Fise5PadAlWSFzV8Vb0lmtAtVoT478
         8xu/JEmD1K5apoDkFQLQ3K9wZk0ti5YW9XqBw+UusB4JaYm0byM/626xs+qC0jfodzUu
         HehNFznp9qP51fvHVnsAtUHwZOQ7mZugzGomcpUZFM9DpcwWy9lRe0OKTyXCTelGSCgV
         s6K+LFzRgkgkfy+JpKPnb4VIiYhBLScbKIpBUAZaP48rik050xyLZJ5c68Yl5OVo9txY
         DIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685001897; x=1687593897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9umes8XISbIusyvA0kgjtSvDb/BpqYd/IdRr2QRP+U=;
        b=ahM0fF6huxmH5S1NmIapi/YVfNilR+SywNdO6mxXaKKfac1BGHkiBaUwQRm5WYBev3
         5QaL+615HqstyKkp/zzYyUHRWWO5HRTPpuapkZ8fwU9TRPQAEWP+VBxPowtRiXh1b5Fp
         C9EjMg+bqPySZW+jGSuk49oECRj/XtArHjV0ehxO2tfMUbfcnL+jjzxuVNu4KZZklH2O
         eBCQkWOz0VA+X5D2jJAhoPYkJh1uEJryDvZcb6/rDYiVDiqzXer3FUeiGwm1FCUHVksj
         Bs/fWIoSkNvXSYXDqA5GG9k6HLsNDWgGy4ZdL0tM8SSlDv7FywlbozJT9nBXx2NgCI56
         wsEg==
X-Gm-Message-State: AC+VfDzORfV8/Qo/4oynmrhq+Q4yrf86H9I1L/m3vaO5rnrLoN/6z3ak
        iLDrvEBvkdnSWr7sSl3jfPU2TA==
X-Google-Smtp-Source: ACHHUZ4jvFv2dvB/8oIkBX3T35h24vm5rz4vxKJzmZmi2frn0oX3g2PZrOcndOeytuhkyXa+v1fyqQ==
X-Received: by 2002:a05:600c:35c7:b0:3f6:557:6893 with SMTP id r7-20020a05600c35c700b003f605576893mr1290274wmq.19.1685001897163;
        Thu, 25 May 2023 01:04:57 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c22d800b003f4e47c6504sm4875434wmg.21.2023.05.25.01.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 01:04:55 -0700 (PDT)
Date:   Thu, 25 May 2023 11:04:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tom St Denis <tom.stdenis@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
        Victor Zhao <Victor.Zhao@amd.com>,
        Lijo Lazar <lijo.lazar@amd.com>,
        Sebin Sebastian <mailmesebin00@gmail.com>,
        Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
        Le Ma <le.ma@amd.com>,
        Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/amdgpu: Fix up locking etc in
 amdgpu_debugfs_gprwave_ioctl()
Message-ID: <bd6a37e2-438d-4292-81e8-5a8f0b10d647@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are two bugs here.
1) Drop the lock if copy_from_user() fails.
2) If the copy fails then the correct error code is -EFAULT instead of
   -EINVAL.

I also broke up the long line and changed "sizeof rd->id" to
"sizeof(rd->id)".

Fixes: 164fb2940933 ("drm/amd/amdgpu: Update debugfs for XCC support (v3)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index c657bed350ac..56e89e76ff17 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -478,15 +478,16 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct file *f, char __user *buf, siz
 static long amdgpu_debugfs_gprwave_ioctl(struct file *f, unsigned int cmd, unsigned long data)
 {
 	struct amdgpu_debugfs_gprwave_data *rd = f->private_data;
-	int r;
+	int r = 0;
 
 	mutex_lock(&rd->lock);
 
 	switch (cmd) {
 	case AMDGPU_DEBUGFS_GPRWAVE_IOC_SET_STATE:
-		r = copy_from_user(&rd->id, (struct amdgpu_debugfs_gprwave_iocdata *)data, sizeof rd->id);
-		if (r)
-			return r ? -EINVAL : 0;
+		if (copy_from_user(&rd->id,
+				   (struct amdgpu_debugfs_gprwave_iocdata *)data,
+				   sizeof(rd->id)))
+			r = -EFAULT;
 		goto done;
 	default:
 		r = -EINVAL;
-- 
2.39.2

