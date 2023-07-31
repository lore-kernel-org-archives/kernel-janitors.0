Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA62C001DE
	for <kernel-janitors@archiver.kernel.org>; Mon, 31 Jul 2023 07:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbjGaHmk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 31 Jul 2023 03:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjGaHmj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 31 Jul 2023 03:42:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D86D83
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 00:42:37 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe1344b707so6585903e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 31 Jul 2023 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690789356; x=1691394156;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3g9PTR1d4q+jWB72BuFEuFidr0WoeWZpmTU/FdkTwA=;
        b=KNowhtElgaLjVT8TTEugRwPkJ0OI56CCkuXHLR7mt6uZSiuOo2NiUU1oYIwDYIpygd
         ZH1XQAOiVePnDgm43OUDVsnXjwl7sjbUvzMEQ3dKwJiq6AxJxWQ9OHGrbYCA3jJvnve2
         8At4qTMVeP3O5/3FcbOE+NU9Z9RGi3rtQmmk+o67YvMpdqJh3jJkPm4jlmAiEUuW+9Ws
         J2w+ScgGuqKqiu29qhT8d37FZNicZI8DAAi5fi7ioXvCdKW6He1jjfIZYPqdof5f2dNt
         9nBSE8OxfRm06q1Ejon9BaUiESILdyX0EJUa1UtcF4oI7S3XmlUbgCeiFTfE0W84bvht
         pWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690789356; x=1691394156;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3g9PTR1d4q+jWB72BuFEuFidr0WoeWZpmTU/FdkTwA=;
        b=byoBu8PWTJYF0viPmBn8uNKewcV1I0wnXC7ZFb1riokJGx91CrbGt2gRCiYjYqv+oI
         ctsMkPzZJSM6C4l5I69oqaUfznDNurJTNsE5d/uJ+P77dkaNwigVH3vMYmsPPHOvgBjm
         9r4YO1JrOZPzAiH51sgkiMwAxLP821fmJmj7aEKrnzY/05wkZSYeEGtsLS01+aypz0Lk
         oNVute+Z8O0pI4mPa6mLveyLxMGfGcglES0aKd83jfmN3rg4Cxl4NQg1oXZdx0EWLcIp
         AkrF7VfUSqT3nGe5Q7ryXFkbG7SX8cyE7okTcdtUm1LUwyPGh9VEgn0llb+mJJPmf5F0
         Laqw==
X-Gm-Message-State: ABy/qLYe6JCVto57i13F2zJho9Dn/+dTNTmzN74+evqannq1HaOboZ6A
        aeNvgb4vxMO5brOC+/JzNB2yTg==
X-Google-Smtp-Source: APBJJlEOznDYQySZio03F1hYTLcYmvIl22I1LNPpOKYqMFCdj/rqT30KnTt01opN3wkvhOuI5z2fqw==
X-Received: by 2002:ac2:4e8b:0:b0:4fb:fe00:49c2 with SMTP id o11-20020ac24e8b000000b004fbfe0049c2mr4377205lfr.32.1690789355848;
        Mon, 31 Jul 2023 00:42:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b00313f61889ecsm12211498wrs.66.2023.07.31.00.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 00:42:35 -0700 (PDT)
Date:   Mon, 31 Jul 2023 10:42:32 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Esben Haabendal <esben@geanix.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Michal Simek <michal.simek@amd.com>,
        Harini Katakam <harini.katakam@amd.com>,
        Haoyue Xu <xuhaoyue1@hisilicon.com>,
        huangjunxian <huangjunxian6@hisilicon.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Rob Herring <robh@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ll_temac: fix error checking of
 irq_of_parse_and_map()
Message-ID: <3d0aef75-06e0-45a5-a2a6-2cc4738d4143@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Most kernel functions return negative error codes but some irq functions
return zero on error.  In this code irq_of_parse_and_map(), returns zero
and platform_get_irq() returns negative error codes.  We need to handle
both cases appropriately.

Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/xilinx/ll_temac_main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index e0ac1bcd9925..49f303353ecb 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1567,12 +1567,16 @@ static int temac_probe(struct platform_device *pdev)
 	}
 
 	/* Error handle returned DMA RX and TX interrupts */
-	if (lp->rx_irq < 0)
-		return dev_err_probe(&pdev->dev, lp->rx_irq,
+	if (lp->rx_irq <= 0) {
+		rc = lp->rx_irq ?: -EINVAL;
+		return dev_err_probe(&pdev->dev, rc,
 				     "could not get DMA RX irq\n");
-	if (lp->tx_irq < 0)
-		return dev_err_probe(&pdev->dev, lp->tx_irq,
+	}
+	if (lp->tx_irq <= 0) {
+		rc = lp->tx_irq ?: -EINVAL;
+		return dev_err_probe(&pdev->dev, rc,
 				     "could not get DMA TX irq\n");
+	}
 
 	if (temac_np) {
 		/* Retrieve the MAC address */
-- 
2.39.2

