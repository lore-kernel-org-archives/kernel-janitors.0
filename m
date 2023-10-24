Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F287C07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 05:01:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjJXFBx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 01:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJXFBw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 01:01:52 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4437A111
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 22:01:50 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40838915cecso33576975e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 22:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698123709; x=1698728509; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImCVUO1ahKZsANhATFtH58NBKo6LvXQpu5phZSZNnHA=;
        b=P7yfevt670UDrrJy2sLgR32SWGzoJr+ZhkcM4YI9B2UEWLYqVwrGr80r5DhWfPajFi
         Gk9NdDfMv3yogB0JdKJvlTwhmMHtKJJq2V1EjTYqqnimGX+QIxse+NMg1NiMv9LsXSXI
         aOlkOPWiNqdtIGcKpAroKOSU7ox/5QjSr+URm4Uhg61W0onWDCxSRoN4kV5s8XWte91j
         2AliML5j0YC+qQ3hp9OAAcc8gFd0Hk6ErBFvHOag10aoc6DxW5Wp5BDfEMG23sP1ODSd
         Fh/oeTLk/S3Hkb8VaX4urRCML2IO4VX+rTaZACZOZvbEbSS2Z0mCjWsC+e6Cp5HDVYgj
         +8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698123709; x=1698728509;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImCVUO1ahKZsANhATFtH58NBKo6LvXQpu5phZSZNnHA=;
        b=k5FYDrHYRMC4B52GnBPrM6TqXnJtaEihwxmTRBUewxQEKl5XlKbbtzv4bdXa3uSheH
         egIbq/5poL6Cwz9SJG2yo0PzLhMPouO8qT1FfXHl3GHDi5JBjCpu3yRRatG7P5540aP9
         GI2NHjwlbzywUrvTQaPyZm1zR57fbbdzz6l/bls3wdltusiesk/hW6rgw1LM44EKtsNg
         kpuruBWolOYGgIzgj6TG+kj3GxUwY5nEU7ftH9kKn39P0ORJnU5Jyhezacu+GffL9KK1
         fgmYE0jPIUvlUSVjTDSOm3jBNnALPbNfoiv2VQc8F8O29A4uueyqDHnpAYED6GIj98Sb
         2k1A==
X-Gm-Message-State: AOJu0YyyIx1xJ5S5PVvt3Jo7P9UX+VAV+fjwUF3M1dFQIAI9zcUZoYcR
        6m0BQvkVI2Y6RCTjo450OtcjBMkfzuKSS4DLBbc=
X-Google-Smtp-Source: AGHT+IHgvVy2f1BV1BsDfwKNhz9rEUGmMdEhT1ISE8VviisrMqlIOWgrMNB36+9/H1gdNBXg8/aFTA==
X-Received: by 2002:a05:600c:3594:b0:408:59d4:f3d8 with SMTP id p20-20020a05600c359400b0040859d4f3d8mr6674127wmq.18.1698123708705;
        Mon, 23 Oct 2023 22:01:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d4001000000b0032dc1fc84f2sm9154045wrp.46.2023.10.23.22.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 22:01:48 -0700 (PDT)
Date:   Tue, 24 Oct 2023 08:01:44 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laurent Fert <laurent.fert@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] stm class: Fix a double free in stm_register_device()
Message-ID: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The put_device(&stm->dev) call will trigger stm_device_release() which
frees "stm" so the vfree(stm) on the next line is a double free.

Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/stm/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 534fbefc7f6a..7315f7d3910d 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 		return -ENOMEM;
 
 	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
-	if (stm->major < 0)
-		goto err_free;
+	if (stm->major < 0) {
+		vfree(stm);
+		return stm->major;
+	}
 
 	device_initialize(&stm->dev);
 	stm->dev.devt = MKDEV(stm->major, 0);
@@ -913,10 +915,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 err_device:
 	unregister_chrdev(stm->major, stm_data->name);
 
-	/* matches device_initialize() above */
+	/* calls stm_device_release() */
 	put_device(&stm->dev);
-err_free:
-	vfree(stm);
 
 	return err;
 }
-- 
2.42.0

