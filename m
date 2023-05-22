Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81739C77B73
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 11:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbjEVLMe (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 07:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbjEVLMM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 07:12:12 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F921723
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 04:07:48 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6077660c6so3536625e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684753667; x=1687345667;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aK6Kf0asRV464IBaYiptxo3f4bLbCIHnLoUffj6qAuc=;
        b=lSDHfK3dISOhvvh1/paEMv8h5AylGLL8BfeaeZqoX3NLO/a1SEC9I6YkwVA+DJPzfq
         ASo0tR7IwTsonPeakI+1nwokLtIyFqHMCb6d9jQq+ySDoq+g1d0x/gBGNuNorkT30jAO
         ELxAKqGtlbmOPoEPBL3IqIwNTUkBSb2GpprVbqti9jECNxFa8BFYHaMDgAltkDSyAC+2
         Igw7PdXEEzRNZfY0JjZn7iDVHh8pggHBiO1/kOQh58OuMlUZAxdrGQRlj+QDZjIkUhar
         ftmgYRqmWP9A+j5fSlqSfVvupufsDEioxnEXlbe0qPL8SIU5OP/307k3kkC1Gn8StQZ4
         Z8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684753667; x=1687345667;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aK6Kf0asRV464IBaYiptxo3f4bLbCIHnLoUffj6qAuc=;
        b=lRPO28ULZt/hHz20uHGNa8PUPSJuJ/VpT++2Ldptr/Qeaq8Mlo8lL8R/DAE50qn7FA
         9aSFdjrWdhgu3SAMUpbjUxXGIhTBl33kJ3+7Kk7E4/33xLdE1BYD/JI3ds7Yk3EmMyUq
         IFsGjerxWYxj5ViYVpbJ82XyWerokgJ5S28sppwRV3Vr8SOK7GNB66M1oGLdjxpC9Scs
         gwzjO2vdzYmXl+hNUXbVPbt4Yd+tAMf+Z3HRs9pg0LAkWs/c9r0BjWJQOXGvZQDRYhII
         u6GI2V8oEkOrgyK7Mqza94cKMSmzVPxQ+wqggcF7ZmQO3PBlgG5tz2pBJWSbXL6KNO07
         x7qQ==
X-Gm-Message-State: AC+VfDxs3LH0x7kDZTtB1jQ5GbbIY0VQvMh5Qt3kKGCGGpa5XtTwLhQQ
        ezo2xbQAmD2LXpeFALLIvSnBKA==
X-Google-Smtp-Source: ACHHUZ5hL20G23vQVzQIDwJ2x9rWWfu4TzDI5xAEjRyuSUCFKgghRcCSDnguIQAgDfGwoOSQ3rPe6g==
X-Received: by 2002:a05:600c:24d3:b0:3f4:298b:d925 with SMTP id 19-20020a05600c24d300b003f4298bd925mr6548094wmu.41.1684753667109;
        Mon, 22 May 2023 04:07:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c220a00b003f50e29bce3sm7901485wml.48.2023.05.22.04.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 04:07:45 -0700 (PDT)
Date:   Mon, 22 May 2023 14:07:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pwm: ab8500: Fix error code in probe()
Message-ID: <ffc1e98d-0db4-4b8a-9e49-eb87ef844cbd@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code accidentally return positive EINVAL instead of negative
-EINVAL.

Fixes: eb41f334589d ("pwm: ab8500: Fix register offset calculation to not depend on probe order")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pwm/pwm-ab8500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-ab8500.c b/drivers/pwm/pwm-ab8500.c
index 507ff0d5f7bd..583a7d69c741 100644
--- a/drivers/pwm/pwm-ab8500.c
+++ b/drivers/pwm/pwm-ab8500.c
@@ -190,7 +190,7 @@ static int ab8500_pwm_probe(struct platform_device *pdev)
 	int err;
 
 	if (pdev->id < 1 || pdev->id > 31)
-		return dev_err_probe(&pdev->dev, EINVAL, "Invalid device id %d\n", pdev->id);
+		return dev_err_probe(&pdev->dev, -EINVAL, "Invalid device id %d\n", pdev->id);
 
 	/*
 	 * Nothing to be done in probe, this is required to get the
-- 
2.39.2

