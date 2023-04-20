Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B635AC77B72
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 12:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjDTMgZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 08:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbjDTMgU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 08:36:20 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6425F659C
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 05:36:12 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f18ece69dbso733215e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681994171; x=1684586171;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hSX2fmCFCihe+R33pGv8iDJF/tV2h7Nkftwg8NDNMs=;
        b=f28imxuzg9/10x8el0IW/Mf7sow5Tnv6+zvXTlk2lgApAZr8oh3RSHi1p91Itxv5Bg
         BvGvsWp2mhX4WtE9HoVrenYQG7rvAPxGRk97BdgNhI6OG3iBgfdRm2BKd9vTheVK7TSZ
         Ceca1j8A/QlXMKECk4jSDrto/5JuRUPl/6OP6b9egqdQ9i0+bY3SDkbkPyTY1WngBAoz
         95B/J8yrwtO/AiXFtficyI3rBztnpMQ9rNm6hC19ypUj+mXDTr5/vP3YgjrAUISpfv0L
         po4i7wtaEUydA1MeP7l2M4TBZwCGEHGIdlyfgi56nwA2MfVyL852ERChJSZwzyZpsVhG
         T05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681994171; x=1684586171;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hSX2fmCFCihe+R33pGv8iDJF/tV2h7Nkftwg8NDNMs=;
        b=a0BBfKF7ZxgMydI2mREqERgoUvUm3WtbDcCeBO3VTmOBNTM8jvbGS2mf+0KcKAmQaA
         EcjRPXCD5k2LCAW2urlRBmdUUqh5dB+AgkulOOeRDADqBkhdnfkNHKd4h/CbndLUGK7y
         HIAeAv13Gp+44e64j+Y80lW5lAl8aJHhTBJcwlEmo5p10SloZIVmcU8FGg+99P5Cs8q/
         UrE7A3gf+tb6lLveXnWRwhsQ/slkQuZVZcDaLZZhFeE04gRcK4VojD7Zn0slgdc5FSyG
         82QCD9psioQGRSanghs7rwsBcsP7VdaLsIvGIiGC9DScLkJSyqtNoq4iO0bjFZO0euWu
         ncnw==
X-Gm-Message-State: AAQBX9cncL8pv/AFEsTgWjeiIvPHv/erz5jmrvsvjjfSzDYZfIOrX+c3
        jku8KcQUWcktsInTQ6qqzWI5UQ==
X-Google-Smtp-Source: AKy350YgyKfS3WPDEkeAYMJ3E+mv6XAE8rMtoNO5vpyWD4fGe868gzOgZa6lWSyhh83AAq6ea0+9SA==
X-Received: by 2002:adf:e3c1:0:b0:2cf:ebaa:31a0 with SMTP id k1-20020adfe3c1000000b002cfebaa31a0mr1262406wrm.54.1681994170827;
        Thu, 20 Apr 2023 05:36:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id iv18-20020a05600c549200b003f17b91c3adsm5427166wmb.28.2023.04.20.05.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 05:36:10 -0700 (PDT)
Date:   Thu, 20 Apr 2023 15:36:07 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Madalin Bucur <madalin.bucur@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Camelia Groza <camelia.groza@nxp.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: dpaa: Fix uninitialized variable in dpaa_stop()
Message-ID: <8c9dc377-8495-495f-a4e5-4d2d0ee12f0c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The return value is not initialized on the success path.

Fixes: 901bdff2f529 ("net: fman: Change return type of disable to void")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Applies to net.

 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index 9318a2554056..f96196617121 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -299,7 +299,8 @@ static int dpaa_stop(struct net_device *net_dev)
 {
 	struct mac_device *mac_dev;
 	struct dpaa_priv *priv;
-	int i, err, error;
+	int i, error;
+	int err = 0;
 
 	priv = netdev_priv(net_dev);
 	mac_dev = priv->mac_dev;
-- 
2.39.2

