Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34155EB64DA
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Jul 2023 10:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbjGSKQ2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Jul 2023 06:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjGSKQZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Jul 2023 06:16:25 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD571FD7
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 03:16:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fc0aecf15bso67092275e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Jul 2023 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689761779; x=1690366579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oTUN50/17AR9wbpM9Qq3N318u2qSEtlvZXw2qFUaUY0=;
        b=SZwtn00ajOrI5/UUiA0X4OJc07NJAT2mAmuEUcnSa7J6fajC9YQciamJHdZaB4z5Mg
         VUKacOYsjiBr3IECM9/qhJT3IdzM1hGveZZuplA24QniFFxGen71+QeKETMNIDJ0yzak
         wExVu/MUzcyXiIE4dNlMKUvipPMlFgsyHwxP4gTK4WAwPieVVoNmQTFBazHPER08fJIL
         vlyXmgWIsQUaXFDXT7Wx6vApwSBnDSYRQyI4JwB3BAZxOQOecIaQ3rhYiN8mN1Q8mv/t
         UUY9kJoSb55RhA/OON8IV3yT6W/jYsS4qK0He3+9Nlo9A28ZvjN1HsUXQFE3KuqElgVb
         9xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689761779; x=1690366579;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTUN50/17AR9wbpM9Qq3N318u2qSEtlvZXw2qFUaUY0=;
        b=PuKwKh9waHfrIsVTyoBfj1iAzlwFX+liJDOmekHT+WZRUpCRh4xnEyiLdhMcPbt6xO
         eEHLr/qsjcitLV7v9vLfyFU5PGJcN6qojvuxza1sVFcnn84UVfx89joxMDYLggjyzzD/
         P8zIiLYTUWXaBdUkY4kYoHflhmnNTT/vnCIrZc6eNp+Hln6wzph9wyHAoYqYnMUa8caq
         LvZ9RvMs2PawFlSSShsgIzcptFdIm6UEKqg0K7PSY5V2L6YnWvqtHA+LvHFYbkR/5+VH
         1oppwlVoIkUUuW8S4jNxG9uZCThKnQ32kBksHpLvAirAm9+Vuu9oB2ebKQZT6grVKJ00
         6NgA==
X-Gm-Message-State: ABy/qLbd/KXoeak5M7c8dclerOM7hdnziMCswwGIJWWNVxlbdl6viPs2
        byLs0rnMJZHDC/vW/T24sOLMZQ==
X-Google-Smtp-Source: APBJJlHAnLgTuIDQBKuxxNCX3qrgDSx988MYKL5jiLsTUFs2svQEUhO3U+rph1zIbWRvMaxwoMfADQ==
X-Received: by 2002:a05:600c:3787:b0:3fb:1b78:38d2 with SMTP id o7-20020a05600c378700b003fb1b7838d2mr1749085wmr.4.1689761779299;
        Wed, 19 Jul 2023 03:16:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c16-20020a7bc010000000b003fbe36a4ce6sm1354773wmb.10.2023.07.19.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:16:17 -0700 (PDT)
Date:   Wed, 19 Jul 2023 13:16:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     Arec Kao <arec.kao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ov13b10: Fix some error checking in probe
Message-ID: <b7ed2497-35d6-490e-b2a6-089f8099290a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ret = " assignment was missing, so ov13b10_power_on() is not
checked for errors.  Add the assignment.

Fixes: 6e28afd15228 ("media: ov13b10: add PM control support based on power resources")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Adding error handling always risky breaking the driver and I have not
tested this patch.

 drivers/media/i2c/ov13b10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index dbc642c5995b..8ebdb32dd3db 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1501,7 +1501,7 @@ static int ov13b10_probe(struct i2c_client *client)
 
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
-		ov13b10_power_on(&client->dev);
+		ret = ov13b10_power_on(&client->dev);
 		if (ret) {
 			dev_err(&client->dev, "failed to power on\n");
 			return ret;
-- 
2.39.2

