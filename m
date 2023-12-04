Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZGeiMgy"
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06679C0
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 04:29:11 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c09dfa03cso11879835e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 04:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701692949; x=1702297749; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkkECO5iEe8wffVmp+N+jpk0G+DJrLKzEev9h10F0Rg=;
        b=HZGeiMgySiUnWJmhgw+zXewpTQZsiLfX69MWrxIehWuO5AFYy+Vzi0fzJI2iS0Z74X
         w2OeWSyXyslK6/G2dBtuSiUYNmJK33wQo3+o6xBKYzMiWvFpe5a7ZrrhCB2zMdp2LLag
         M3HJZiGboTgpfqTUxKWMSbqLZwdiq8AIMM5oyb1qHT2pGcA0UUTNZzETY1cgV8w0HcJN
         vvSyiKvUQJmn2OxOZN5avuc9YrzViCcAS6Mt3oC6EmDC66Xcw5Gz/gvKmfiPs2b/qVVr
         RlZ2RcVzWBSx/UYZjosP+j/PC9mFjwZwzPsTl8EuBj8JLFR7877jic5Egv1+Yb6bmcQ5
         +Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701692949; x=1702297749;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkkECO5iEe8wffVmp+N+jpk0G+DJrLKzEev9h10F0Rg=;
        b=R1YNp3dzXf4480nnxNEwWVjGqUpFdlILY+GAImjvrhEnR6khC4werlTmAyMH8ctYSz
         3v5NggFbBgBTJOmW7nGA2NjTBpaUkVMtYpWIEtqUQInSB6eAV1CqLIpSIIMQBYITVO3Y
         +qT36H3lwmWUw4U3VWySiLopWhxCrM3CC7W57MkNmlgWiJhgS2lmJn/YNrFFHwTWsTwF
         NpR7gl7PTuyh153DzK0CsZ9hJScPbMGPVGpnUOS73R3DG4LkilOids7NIt3+2jlQJ7q7
         S9/2iAuzEHLpCD6wE+33RwAR6Fwx6J6m3zxwNfaZY4qad7bL0UEv9YY8mDlfb5S/f3hx
         akiA==
X-Gm-Message-State: AOJu0YwKPAkw77Sv18XTV4ZJ1JwAvcYequk+M5FOj8YfbKVm26BEDqM0
	JW1G34aJlrf1sFIyNzFgRlz9dg==
X-Google-Smtp-Source: AGHT+IEhBK8pDeFMWjsr+8bKrzXeC11m8+GcPR+3mHNKpiYY/iuhyUeTu2UUAAGueQ/HmM7P67v+lw==
X-Received: by 2002:a7b:c041:0:b0:40b:42d4:3319 with SMTP id u1-20020a7bc041000000b0040b42d43319mr2561709wmc.0.1701692949452;
        Mon, 04 Dec 2023 04:29:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b0040b47c69d08sm18464512wmq.18.2023.12.04.04.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:29:09 -0800 (PST)
Date: Mon, 4 Dec 2023 15:29:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Paul <seanpaul@chromium.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: nxp-ptn3460: fix i2c_master_send() error checking
Message-ID: <0cdc2dce-ca89-451a-9774-1482ab2f4762@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The i2c_master_send/recv() functions return negative error codes or the
number of bytes that were able to be sent/received.  This code has
two problems.  1)  Instead of checking if all the bytes were sent or
received, it checks that at least one byte was sent or received.
2) If there was a partial send/receive then we should return a negative
error code but this code returns success.

Fixes: a9fe713d7d45 ("drm/bridge: Add PTN3460 bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is from static analysis and code review.  It's always a concern
when you add stricter error handling that something will break.

 drivers/gpu/drm/bridge/nxp-ptn3460.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index d81920227a8a..9b7eb8c669c1 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -56,13 +56,13 @@ static int ptn3460_read_bytes(struct ptn3460_bridge *ptn_bridge, char addr,
 	ret = i2c_master_send(ptn_bridge->client, &addr, 1);
 	if (ret <= 0) {
 		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret;
+		return ret ?: -EIO;
 	}
 
 	ret = i2c_master_recv(ptn_bridge->client, buf, len);
-	if (ret <= 0) {
+	if (ret != len) {
 		DRM_ERROR("Failed to recv i2c data, ret=%d\n", ret);
-		return ret;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
@@ -78,9 +78,9 @@ static int ptn3460_write_byte(struct ptn3460_bridge *ptn_bridge, char addr,
 	buf[1] = val;
 
 	ret = i2c_master_send(ptn_bridge->client, buf, ARRAY_SIZE(buf));
-	if (ret <= 0) {
+	if (ret != ARRAY_SIZE(buf)) {
 		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
-		return ret;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
-- 
2.42.0

