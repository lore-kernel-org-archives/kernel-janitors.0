Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB3EC77B75
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 May 2023 15:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjECPKG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 May 2023 11:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjECPKE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 11:10:04 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19D95FE1
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 08:10:02 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f1958d3a53so52748365e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 03 May 2023 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683126601; x=1685718601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHrNZtXhnkvkLwSC7JrWBPXdMDcce03qbIYQQuiMdxc=;
        b=Gu8ejPsqndZGyE5ua6xrQITikRnRTRGNZSYX44/83yLhtiOsRBuyowvXb/QMyvr50w
         U5PK/tDttV3WMWWTqZPkLn0IK/9AGXj2B9pFBb3ZmJN7lOs87ILJENyP9v5cg3BHJgVg
         YolxM9GbAGavRd05OtjaXE8MSX+xzUsS40j/YI/oFypPyAvFQgPxHUeDDmQI5kYYmJFy
         nFoIE7oU0NTYXliTIFnSPqbxc/4g2u/bTQE/3nbQdEDaMGFPTaYW9a5YE8axWYdZO4lF
         EBlKux+umRfXfmLEdGR4//nWgeNW8d0oP6pnEOxmHbaiCDT12vH4BOp+39jkeoZj8sqQ
         2zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683126601; x=1685718601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHrNZtXhnkvkLwSC7JrWBPXdMDcce03qbIYQQuiMdxc=;
        b=bqfsdhzjOTMz1HXf86u55ttmWzPlfyOmqvpiDOIrmCDQKgOdIrZU5QPfjJIsNENhwd
         jcUtdYpb3g5pEADq1bsEeWd3z7aEaaM6S6MIzSpSyRez6HuUY5JGMQimq7RNaV0HNHwf
         s4Eb4mHHsc4fUqeYlqXhuRR6M/aY43x8qZgSUJ8khV0NuHPtCVHx94Vj9kUDnocLsLYg
         h4crwfdpxdnS9F9Gp33W4nHQ5fcdi1s6EVnvJrQ5nLOp5/lyhKzQW0YNWk4QBtG2rRBD
         X3wEYZ9750gjaXP3p1jQXiaAi79hD7RBwJY2uWRbtH5tpqX5SAj41lfT/8HGGHCQsfNj
         OK2w==
X-Gm-Message-State: AC+VfDxtMBpWp6yI3QEo5s6C1087wBOE2RUP4htTY72H2CRbvvpncMxt
        VCYOw1S5h1zMkZ8jhRrB/BUBbQ==
X-Google-Smtp-Source: ACHHUZ7XV4yU2fWv2Xdj0eB9CbHk9AHdArfTBgZTCElAXrhVFv7DpJ8VqSPML4gtTPVBvwg8WSimcQ==
X-Received: by 2002:a05:600c:2194:b0:3f3:195b:d18c with SMTP id e20-20020a05600c219400b003f3195bd18cmr15259647wme.30.1683126601415;
        Wed, 03 May 2023 08:10:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l20-20020a1ced14000000b003f182cc55c4sm2172659wmh.12.2023.05.03.08.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:10:00 -0700 (PDT)
Date:   Wed, 3 May 2023 18:09:55 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Po-Hao Huang <phhuang@realtek.com>
Cc:     Yan-Hsuan Chuang <tony0620emma@gmail.com>,
        Kalle Valo <kvalo@kernel.org>,
        Ping-Ke Shih <pkshih@realtek.com>,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: rtw88: unlock on error path in rtw_ops_add_interface()
Message-ID: <ddd10a74-5982-4f65-8c59-c1cca558d239@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Call mutex_unlock(&rtwdev->mutex); before returning on this error path.

Fixes: f0e741e4ddbc ("wifi: rtw88: add bitmap for dynamic port settings")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 7aa6edad0d01..02cd19ee6e4c 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -173,8 +173,10 @@ static int rtw_ops_add_interface(struct ieee80211_hw *hw,
 	mutex_lock(&rtwdev->mutex);
 
 	port = find_first_zero_bit(rtwdev->hw_port, RTW_PORT_NUM);
-	if (port >= RTW_PORT_NUM)
+	if (port >= RTW_PORT_NUM) {
+		mutex_unlock(&rtwdev->mutex);
 		return -EINVAL;
+	}
 	set_bit(port, rtwdev->hw_port);
 
 	rtwvif->port = port;
-- 
2.39.2

