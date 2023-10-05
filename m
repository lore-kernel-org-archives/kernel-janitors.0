Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B169E92705
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237080AbjJEOiy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236607AbjJEOgo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 10:36:44 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDE04484D
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 07:00:29 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-323168869daso1027819f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514428; x=1697119228; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bq6Al0uhdqE8dyQRZT83/DywvErgo4yew/KdSq0MhvE=;
        b=KAlIt+hB8EUmFm67YkqsHFFnq+fy2xAGJXG5dRKfIO8mBKvSKUjK/+MfL8SNKOTqRW
         RDAHOgvinLoN1W7HM9xwimZRUfx+9ZDPRSxEgN+P25whAFj24sONk3NTIeIFr7w1TULC
         IuhOagybghF/j+Xy4jdxsWkHrH+xNCt/FsEUY8bpOhnHSueIxiGpyqZMoXg3Eo4Rn70R
         M1UqtNUZIPP2gJfa4dUmsGEA1YN7si+nRpUqg+o1qeuegyFs3GVze/1pQrcCuwNXCkmA
         1tWq1QAZFR/zB9mTvWwnFiRgEyfA8bhOafeuq4IQK23TpwCCrmrrM3OABZAOkmxtt2F5
         r8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514428; x=1697119228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bq6Al0uhdqE8dyQRZT83/DywvErgo4yew/KdSq0MhvE=;
        b=ZBTaX719kvIegMNFe7Artv55i8feHQ84wU68pG86LbZ2ZP0Wv3QSSDe5ZGPJ4Txkz5
         miHGcLH9ZxTwgT0nedgz5gIHR/ircEaP8bJIXN5BmPVgJQLoD4wXxzMrlZJ+8hCH7r41
         gFiLmePUoprhzN4VxfI0d295eiZm/W/dT5DtsgpOnk1+g9EZYudEHYKkaavD5+HrVYpe
         LSVHXweaJPfxkWraMzehSQUtBXbNA2KQOI7/MptrUF73n0GGJLpvcKUE7vYaeGO50m+O
         6mwW7Xhl5qrVa4tjnkD/06od3AqEprToY/51sWF9BiZD1WkSxuh5b6L3nq+qeePQ6poi
         vrhQ==
X-Gm-Message-State: AOJu0YwFHD8UYOV+4hYgz0YZE5SBvINoe8fPotyAF6QRKLvujqasQO0D
        wnX06T/W4/m6Z1MUZyaU1bFoIA==
X-Google-Smtp-Source: AGHT+IHwNsl3R2+inwJL9KG2n8GmwjwPTWGIpRhvHpykm2Ag3TFC5h678lIY/dcNTTM8eNFy6XA3Eg==
X-Received: by 2002:a5d:4149:0:b0:31f:eb8d:481f with SMTP id c9-20020a5d4149000000b0031feb8d481fmr4870624wrq.29.1696514428084;
        Thu, 05 Oct 2023 07:00:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id da4-20020a056000196400b003176c6e87b1sm1856481wrb.81.2023.10.05.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:00:27 -0700 (PDT)
Date:   Thu, 5 Oct 2023 17:00:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: pxa: fix a memory leak in probe()
Message-ID: <84ac2313-1420-471a-b2cb-3269a2e12a7c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Free the "priv" pointer before returning the error code.

Fixes: 90eb6b59d311 ("ASoC: pxa-ssp: add support for an external clock in devicetree")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/pxa/pxa-ssp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index b70034c07eee..b8a3cb8b7597 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -773,7 +773,7 @@ static int pxa_ssp_probe(struct snd_soc_dai *dai)
 		if (IS_ERR(priv->extclk)) {
 			ret = PTR_ERR(priv->extclk);
 			if (ret == -EPROBE_DEFER)
-				return ret;
+				goto err_priv;
 
 			priv->extclk = NULL;
 		}
-- 
2.39.2

