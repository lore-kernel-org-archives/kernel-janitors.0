Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E30D2E9
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Nov 2023 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OSyDw00Q"
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5FA170D
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 23:40:27 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so993963066b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Nov 2023 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699429225; x=1700034025; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqb/Bv6eFY0SfyqqO+nQ1BCDEH1GYhSIKxO8FXfbD68=;
        b=OSyDw00QkmRqjlHOjfQD9sYRJC+WHNWpOj6A8Bh5s1M8+UVPzCnKkRqSpXepXucXL5
         V4PbIdfHH/2O6vD6FZ6Cs7rvM1S6t2mF5AZFv4lk9RFrZUcNWJz3hs50OSBxKTxWxxD6
         QLSMOc8BlATyV+aKivNXVqwgzgOZ6bUmsG/+crXfRnL1USHmdee7V9pcx6JLSqnibWkO
         Ke1V3WAMMAldfm/LFVLlUEv+7PgBK7bH/W0sTKxH1WsQ/k/C8WYnGi+5BZq07QHDc7uV
         H9L88GTZsO3NZtkr9SPc98Pu6zEM8+edOHGFl/ySIsmLSan23rhZ5LHzln8Qxj/JkkdS
         ARpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699429225; x=1700034025;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqb/Bv6eFY0SfyqqO+nQ1BCDEH1GYhSIKxO8FXfbD68=;
        b=llOHWQPtdREn4CV/FpZYqYL1j7VO1olPS/uqgeXk0yAQ3KBhM3b/xaTzSIRRoJnUit
         6iWRg15FTf7Sr3PXS6Zd17369B5oc/0DKlMvbjkiKb1AwnSLmTZV4HujTOAnEPKkKL71
         EcdsowTR7jL6qGJldTa5RVoSLmSr84qNkQgWj/68SCjc+UIjHrpOVW2/pFprZOUyHhcl
         3UOyy9wX6ZQX7kwwJItQaawaw4MMr8hMcyqcLbai92f/r6MEcpG/lX/7eaSYbrPkcPTk
         foe+qZTQvNvJnZDZdy3nVtpccnXa84aom4Z+4BYQ4ZeW9AgDuAPWNErUOiny2MX9RsZc
         0cyg==
X-Gm-Message-State: AOJu0YycWYNOfX9L98QrsKGn04322GTbTB/HoLbnOzTCPV6tMJsVgeUI
	Jk9fhhP1TNMHPu6Q8+gpr0X2WA==
X-Google-Smtp-Source: AGHT+IGgCTJibXogk7f/4/pdPf+5XlJkJU4UH+dwwDJR8NpmONM63voWpi/OW1oA26bDGwpm+aZ6MQ==
X-Received: by 2002:a17:907:720c:b0:9e2:92b5:f234 with SMTP id dr12-20020a170907720c00b009e292b5f234mr729929ejc.39.1699429225572;
        Tue, 07 Nov 2023 23:40:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a27-20020a1709063a5b00b009c6a4a5ac80sm586737ejf.169.2023.11.07.23.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 23:40:24 -0800 (PST)
Date: Wed, 8 Nov 2023 10:40:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nouveau/gsp/r535: Fix a NULL vs error pointer bug
Message-ID: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The r535_gsp_cmdq_get() function returns error pointers but this code
checks for NULL.  Also we need to propagate the error pointer back to
the callers in r535_gsp_rpc_get().  Returning NULL will lead to a NULL
pointer dereference.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index e31f9641114b..f8409e2f9fef 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -689,8 +689,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 	struct nvfw_gsp_rpc *rpc;
 
 	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
-	if (!rpc)
-		return NULL;
+	if (IS_ERR(rpc))
+		return ERR_CAST(rpc);
 
 	rpc->header_version = 0x03000000;
 	rpc->signature = ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';
-- 
2.39.2

