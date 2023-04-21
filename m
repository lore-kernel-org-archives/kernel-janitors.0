Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C77C77B78
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Apr 2023 10:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjDUKlL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 06:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjDUKlK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 06:41:10 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57C69EF4
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:41:06 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-2fde2879eabso1444007f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682073665; x=1684665665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+YqQNAmmogknbIn9Y0b0u4L5Ow5Ad5Dnkjv56VIfJok=;
        b=uQiklW2CvMkmNZHGr1EPHrLYXjD3GZMu0OEm7OaBY8cu3Quf2/yPz5X2Y5kM+vULXO
         kWf8C1DbbzUMM+HqN6SZB+z8V2p0NsLuH5I85Fe/RoznmFQe7ducs1RiMV5R/JQk+i08
         +Y1HXMg8DCQcsCMLTtO1G3zSWrHjWa5OY1S2XzIYcoEKRa99sV5zk+JH71LUjmE4DdFS
         i6IhbY+ieFp3X2aqVch4Py8YH9b9vLkKSl2n9n+mr7zmXbVF1CURPGunnNJXYzW12g8z
         hCLhbbseSAR8pCUtq9eovKWfAh4UR7+5WOe/rbGi6kMQwacFfbJbeDYgEb06JvzDHQ91
         hmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682073665; x=1684665665;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YqQNAmmogknbIn9Y0b0u4L5Ow5Ad5Dnkjv56VIfJok=;
        b=kFUYCogOM7ceEZMTwmG2hFhJxYLBk1icIzm5zUP3k2cDDIQsxcCTMjUOmwxzenuTnj
         I29D+BvhgmA97OdQqPQMW+Sp57t31gmv3K/ZvmiaB4PsUuHyzK06y/c7DbO2/uZcZLJx
         RXGnVggZsHKHU6SIXd2/w8vX+MFX75Y6ype2aTX5d8TX30j5b2o6nNX9Zt6Sf/N3zPqS
         X1bF42+7fHYDXyUl0rHhe/u1VjRAnjtlsH+7hAIMYaM/h3co93J03XjRIQR8sr30EIhR
         TSWXc5pzwHg3hkhBFDkq7Lt6+fChFzA2zaCNrossgc56hzHpcWkKaoGSZ7VLNCTuUCWw
         SXbQ==
X-Gm-Message-State: AAQBX9cvg3jyZJ2PIf9ij6Jr8kJLwSFRgQh+oh1YWMgUV0IEBajqHmXD
        SqsBZRtc1Lj5+gI7Y6ee5nfBQg==
X-Google-Smtp-Source: AKy350Yqao75dQ23thMATmN1NhRFEeG5fvjt9ZYxkUJEmAhn02fefzSbUCbVTTv1MvkDJW/rRjgzWg==
X-Received: by 2002:a5d:6b46:0:b0:2db:11f3:f7ee with SMTP id x6-20020a5d6b46000000b002db11f3f7eemr3550778wrw.63.1682073665405;
        Fri, 21 Apr 2023 03:41:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4d0e000000b002efb4f2d240sm4097576wrt.87.2023.04.21.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 03:41:04 -0700 (PDT)
Date:   Fri, 21 Apr 2023 13:41:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] clk: bcm: rpi: Fix off by one in
 raspberrypi_discover_clocks()
Message-ID: <5a850b08-d2f5-4794-aceb-a6b468965139@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch detected an off by one in this code:
    drivers/clk/bcm/clk-raspberrypi.c:374 raspberrypi_discover_clocks()
    error: buffer overflow 'data->hws' 16 <= 16

The data->hws[] array has RPI_FIRMWARE_NUM_CLK_ID elements so the >
comparison needs to changed to >=.

Fixes: 12c90f3f27bb ("clk: bcm: rpi: Add variant structure")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Update the error message as well

 drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index eb399a4d141b..829406dc44a2 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -356,9 +356,9 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 	while (clks->id) {
 		struct raspberrypi_clk_variant *variant;
 
-		if (clks->id > RPI_FIRMWARE_NUM_CLK_ID) {
+		if (clks->id >= RPI_FIRMWARE_NUM_CLK_ID) {
 			dev_err(rpi->dev, "Unknown clock id: %u (max: %u)\n",
-					   clks->id, RPI_FIRMWARE_NUM_CLK_ID);
+					   clks->id, RPI_FIRMWARE_NUM_CLK_ID - 1);
 			return -EINVAL;
 		}
 
-- 
2.39.2

