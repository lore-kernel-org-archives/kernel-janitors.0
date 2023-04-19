Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C21C77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 07:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjDSH4l (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 03:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbjDSH4j (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 03:56:39 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A516132
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 00:56:37 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id ay3-20020a05600c1e0300b003f17289710aso954898wmb.5
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681890995; x=1684482995;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLNUqURzSNuxK5r7aUqO1X3nTxWDAeTAk9v7Y+f1yzs=;
        b=xDNLcfzIbY5UCUaOS0oKhrZ4IOHMElpb9rDgZ7xG3cz8KkWhIyW02rIMxwczbhE7xD
         eTYeZNE8VLZatIuzcDANEbHlK2kknrxf2lX5cLC4BMb7Zo/6lFLIlz15YF3LsN1H3KWI
         db7Y2tl4q/mCc3iIdD0RlXn3k3MFKRydd394b+RtH/0gtjM0ZkLretf8EnKMYqMQPvJf
         HKPWZszYPBuen0G2wl9OVoAdXgDfSIeFLZT7kxRbrmiG4Hf5UevrOUeJKe7RPoqnvXgA
         5CXegPs0fnltWr6I+TZL6eBt+TQOmTX9NFtubDeM1Y6wu5m+aWLc0vNzZx14m6lNjK4N
         PI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681890995; x=1684482995;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLNUqURzSNuxK5r7aUqO1X3nTxWDAeTAk9v7Y+f1yzs=;
        b=OHJPwLE4ewtb0+VIDlt0jpgry+9Df9UNvOfT4waJIcPd7sSXe2E87RQCpw0XbGsYZ1
         iiTt3+j20JmQYWMRu5crYno3mu6f4OFzfx+y408lDoV9dhVGMtOxHFYVb3nN3NNHvDDH
         MOUYNaKP6CjUxQCvFVU63+pr/m64GcnbekYRNvwO+FrrH/1csjMTScCEXWOZIOoCZ6Uo
         rw6ZHjYsU1+z+y85NckSlaVr+NjNxfcaRrwQgCmg+aKeVP4TmBrxa3qXmK6pAaJ8xX09
         RuJx15ZUjgMUtp/lqB96IRYRzF/TWmV9GhDLFZKAGcN+yhAtUaVt4t3rXaLff+dKjED+
         HYOg==
X-Gm-Message-State: AAQBX9dXoTRaA+uJ4q3Ze9e/ssg8Y1TImfJOt/5Es9eRlfl1TEsGBMoA
        /fWh6VSAnDd/6mXAojX+p9Pw6w==
X-Google-Smtp-Source: AKy350ZD/kLw8Lana9DHcdq0YhXTAz/tzImfE+EgBvEVpLg26ZRxBYgcucU/Q5WuXNzIFnAxnGE8AA==
X-Received: by 2002:a7b:cd88:0:b0:3f0:44d1:3ba5 with SMTP id y8-20020a7bcd88000000b003f044d13ba5mr15030254wmj.5.1681890995501;
        Wed, 19 Apr 2023 00:56:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c000900b003f0aa490336sm1310878wmc.26.2023.04.19.00.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 00:56:35 -0700 (PDT)
Date:   Wed, 19 Apr 2023 10:56:30 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        "Ivan T. Ivanov" <iivanov@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Dom Cobley <popcornmix@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: bcm: rpi: Fix off by one in
 raspberrypi_discover_clocks()
Message-ID: <9d4496c2-e102-4fc6-afe2-5a917930d15a@kili.mountain>
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
The clks[] array, on the other hand, is correct.  It allocates
RPI_FIRMWARE_NUM_CLK_ID + 1 elements because the last element is a
sentinal.

 drivers/clk/bcm/clk-raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index eb399a4d141b..d4b43e33035c 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -356,7 +356,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
 	while (clks->id) {
 		struct raspberrypi_clk_variant *variant;
 
-		if (clks->id > RPI_FIRMWARE_NUM_CLK_ID) {
+		if (clks->id >= RPI_FIRMWARE_NUM_CLK_ID) {
 			dev_err(rpi->dev, "Unknown clock id: %u (max: %u)\n",
 					   clks->id, RPI_FIRMWARE_NUM_CLK_ID);
 			return -EINVAL;
-- 
2.39.2

