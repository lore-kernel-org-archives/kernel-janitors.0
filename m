Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A65E7E635
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Sep 2023 14:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbjIZOE4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Sep 2023 10:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjIZOEz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Sep 2023 10:04:55 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30B9FC
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Sep 2023 07:04:48 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40594697600so37663775e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Sep 2023 07:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695737087; x=1696341887; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uczmpeiKwXB8axUDwYOEbCY8/ztReOFNjQ1oGbsb9Io=;
        b=CAXusjLdWzcnYCoDlcwZdd1uhgXMosQIhM6x1y8F5sepBIQ7klaORJNNw48zlio9Ej
         ar6s3bZ6ziqZ1513kD9h1Tn1Zr/ocz9/GraKNBlPFn+mjXUsS845g4Ts7EX9cDjHlwuj
         D/nId7LS+eHoCePbXrl1lI315yq45YKhZW+NN3gS0ssaybtfKDg5jHx8K2l0gKNnFimq
         Wm8TxkbHYAGY8LmVs/KvfC4NrzlLBaaJId28y69v3T4LYhBJWPDvz5tuw3g9BhxbCp1I
         SfkLbG+QGQqPjYzUHROsyC1ZVVNhmWkDceGPHPEPYFDG1AH/yjby/fhfoKMTbVT9hkg9
         WJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737087; x=1696341887;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uczmpeiKwXB8axUDwYOEbCY8/ztReOFNjQ1oGbsb9Io=;
        b=r1y/AU12XQRH5UEnL6YhVXXTAiY1Y19gy3mVHE8A/MMwfnYlyzkbKGrj+udDQCAttP
         1KWLk00D1/zME6+p00bB94kHWXDmYtFUyU0l9G3x1Ft/X8tZIMULEd+0sdknsiMmPrrI
         u4GGyOy99QfkA/+kUxM86T8VYwXdKoPgLAeh272ryzxQfI6K9ZPkeZIz5iy2tsFMPaZu
         dU8jOQN8g4xFKIfHfcuvuojk5i7n2XIzHO36+UI6yZHPYqndl8miTOfTwcqObt8qRevk
         Y1mOUqBBX/v2IRM163fhCKgC2xgD0fKSiTa3oVALAM7HRZznmJhyQt/ZtxsGpyoAeiNe
         v/JQ==
X-Gm-Message-State: AOJu0YzEUBU5xDEOQRQQP0Ct/9CvNVVfUByDo/4d5q4vauRJX3yNVJMG
        uMnLuf++2acFiUycRpXkvNPefQ==
X-Google-Smtp-Source: AGHT+IEDz/ZpXWz+o29U1CgHU4VdFdAdoSMqj7ISGG528MHjGDWQoubPXna40xSUkw1fnIeUkF5Zkw==
X-Received: by 2002:a05:600c:220f:b0:405:3466:6b8 with SMTP id z15-20020a05600c220f00b00405346606b8mr8787593wml.12.1695737086989;
        Tue, 26 Sep 2023 07:04:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i19-20020a05600c2d9300b004054dcbf92asm10363169wmg.20.2023.09.26.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:04:46 -0700 (PDT)
Date:   Tue, 26 Sep 2023 17:04:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Roger Quadros <rogerq@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/3 net] net: ethernet: ti: am65-cpsw: Fix error code in
 am65_cpsw_nuss_init_tx_chns()
Message-ID: <4c2073cc-e7ef-4f16-9655-1a46cfed9fe9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This accidentally returns success, but it should return a negative error
code.

Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Sorry for the delay on this.  I wrote this before traveling and meant
to send it earlier but forgot.

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index bea6fc0f324c..31e84c503e22 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1750,6 +1750,7 @@ static int am65_cpsw_nuss_init_tx_chns(struct am65_cpsw_common *common)
 		if (tx_chn->irq <= 0) {
 			dev_err(dev, "Failed to get tx dma irq %d\n",
 				tx_chn->irq);
+			ret = tx_chn->irq ?: -ENXIO;
 			goto err;
 		}
 
-- 
2.39.2

