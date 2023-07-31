Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CC9C001E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jul 2023 14:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbjGaOJr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jul 2023 10:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjGaOJi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jul 2023 10:09:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEA31B2
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 07:09:36 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fe2de785e7so2452417e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690812574; x=1691417374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRxEvq0yXDjCPyfneUhDjMZkYmuZy/K1An4O5oZc+4s=;
        b=M3dz4O6rHI3T0WtrrlpWUamBGzTOTTmfS8RepaL1ojtWqNbBUCvyy/dAuHRq6Oak5Q
         5Vx5oqXZjOIolWee0M5TFOw3FMpTMaHHyv5DK1gtrMTrP3/3UZxMwmtfBuDHOwF7+ua7
         FxxFjLy7t6Q69WSpJB7YiwO9K6LD3f9gfjkOxfQsY+FAYcd6l5WnQ6jdGKx9cBpz+4b+
         Pag47PvBoGXp/2TnL1vlbzcyqR8/JmFU9rTkiJIffzUr7VD+heVjieUCHRb2dWzBeQYU
         ziB32TOtFka1FMpuu+byqnLmycxcAYU1rL6kcXyTs1HbBQssz0J7JZZ5cUMr27H3JFeR
         GOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690812574; x=1691417374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRxEvq0yXDjCPyfneUhDjMZkYmuZy/K1An4O5oZc+4s=;
        b=c0/zCDyt/UWz2eH2ZNa8TMOoN2eoNyinG1L7kcrcYbc/MAzOaIyIPr7eJptju7UA9V
         RV/NWq2H7RpAeTL1KLYixvIeMf0FkiQ2cWO2qTYjRKHUIs0s+mFsjIYiGLunolh7rUOh
         I963womKZy84TlpyK1+D/9FqU+ANQa5MH5SCtVDZhWvx6ByUB0wJM+jLZ6B3713S9nuk
         KbvNneL4SvcFnBz/VSIRYOqVEtuRIwOnx6t3qn4+/roMYt0qmLZG5sWGTdubIznFgIhT
         ZyJzWcqExg/vMGxmoZPudqc5g0Nw7uAft15g68kr5EvZ0uQqlTWqNwgD2lfIgREmj60R
         qdLA==
X-Gm-Message-State: ABy/qLbY4en8jbbEy0kuXX5z4I29uT/+0tAoscs0gDfwWxIG5RaaoU78
        GG/U1315eHAa3cXvpJUqegeJYA==
X-Google-Smtp-Source: APBJJlENrI8Jg/l/w/NoYkge7kSY52qwYcGKp76+yALKtjfqTAt4ZrIMAV5yt0e3m9I5r0jSLvA1lg==
X-Received: by 2002:a05:6512:3d06:b0:4f8:4177:e087 with SMTP id d6-20020a0565123d0600b004f84177e087mr6461340lfv.47.1690812574441;
        Mon, 31 Jul 2023 07:09:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b23-20020aa7df97000000b00522d742bc4bsm386445edy.62.2023.07.31.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:09:34 -0700 (PDT)
Date:   Mon, 31 Jul 2023 17:09:30 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: fix error code in pcf2127_enable_ts()
Message-ID: <55b9c84b-9d21-444f-b91a-cf9316b65833@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error path accidentally returns success.  Return -EINVAL instead.

Fixes: 420cc9e850db ("rtc: pcf2127: add support for multiple TS functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/rtc/rtc-pcf2127.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 78141bb06ab0..988cad171174 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1060,7 +1060,7 @@ static int pcf2127_enable_ts(struct device *dev, int ts_id)
 	if (pcf2127->cfg->ts[ts_id].gnd_detect_bit == 0) {
 		dev_err(dev, "%s: tamper detection to GND configuration invalid\n",
 			__func__);
-		return ret;
+		return -EINVAL;
 	}
 
 	/*
-- 
2.39.2

