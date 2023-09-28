Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E3FCE7B04
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Sep 2023 07:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbjI1HGW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Sep 2023 03:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjI1HGV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Sep 2023 03:06:21 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56318BF
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Sep 2023 00:06:16 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4064014bca5so42802365e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Sep 2023 00:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695884775; x=1696489575; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAG8D+7zuIve2pCqK3iu3OyENEASiaU2T/4K8Fq5/EU=;
        b=J73xg+7gVDi282sCPQLHbpLJn/N0Yty5Oay6KaFKgiameHgFyGg2PTDsdkN83UnJi7
         /sOlfi9DflcBczE6+r89PPmD+T83ec49893aVb0LfLsTsDrGjzS46p7duunqI9D6Xmod
         di7e5hFyyTooLLNDNMvYobokVkD277d5PpGBRyzMVU3bn1/HLW77xbEzjFhXjmtnRxmU
         N9/CHk25Wk98nN3E2lRD4MbBWwQUwpNpj406fpa+/zOyqAJzfPQqS/yR6Tj2af53EBFM
         UxluqduTpg0qjUaBKceMHbNjvFck2EEQx95n7baE1nc5YMSu2jlQhByH6xcErlliSPv3
         VzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695884775; x=1696489575;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAG8D+7zuIve2pCqK3iu3OyENEASiaU2T/4K8Fq5/EU=;
        b=Nm5Lg6rIhBMln8ij77qYs365mlsAfOewXqbhDmvQjyZmAXEwL68bW6R5lMmgj4YtzW
         uRZkhgsAGZ65nFJq7L1XKH3BahQzDWpVadt0ZBKjHsDwVRAoh83OkwdCSRRHvT7FWaRg
         LhWRnkf4m6J3yv+eOOGCiiDTMXAZ9zspRbpMqg4TC9Ps8zaTZQ1fVNNRwiWJwvikjTu3
         BgrVt/Lyxjw2FMbPaqVhRnb9bd/phnTV+axy+HpjlEBhyW6+RpCqDyQ4fP/yM34ge5c+
         XbCApbuY3X+/7dJoeOTNDUXQH80YhBSaCjFzJTqBn3N7B8XyZzneEFX3d4Vz/b6lgCvY
         KMjQ==
X-Gm-Message-State: AOJu0YwTcSsAWhBD9wLcOtsvWq0HUTHiwp7BoaN1cf5yzlifIhYNeT9C
        q7kHQbdMYa3HTIxpqhz+K3736A==
X-Google-Smtp-Source: AGHT+IHlAP5EqB0zVUlx46YcvgYnVP7smY2dmmz7uWLiuhrOA/+Ay0Wd0+FcEnrx+Rhe2owYUHA24g==
X-Received: by 2002:a7b:cc8d:0:b0:401:38dc:8916 with SMTP id p13-20020a7bcc8d000000b0040138dc8916mr420957wma.10.1695884774706;
        Thu, 28 Sep 2023 00:06:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a24-20020a05600c225800b004063c9f68f2sm5656463wmm.26.2023.09.28.00.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 00:06:14 -0700 (PDT)
Date:   Thu, 28 Sep 2023 10:06:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Davidlohr Bueso <dave@stgolabs.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] locktorture: Check the correct variable for allocation
 failure
Message-ID: <ec2c9ecf-9360-41fa-934d-6854d2615799@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a typo so this checks the wrong variable.  "chains" plural vs
"chain" singular.  We already know that "chains" is non-zero.

Fixes: 7f993623e9eb ("locktorture: Add call_rcu_chains module parameter")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/locking/locktorture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/locktorture.c b/kernel/locking/locktorture.c
index a3abcd136f56..69d3cd2cfc3b 100644
--- a/kernel/locking/locktorture.c
+++ b/kernel/locking/locktorture.c
@@ -1075,7 +1075,7 @@ static int call_rcu_chain_init(void)
 	if (call_rcu_chains <= 0)
 		return 0;
 	call_rcu_chain = kcalloc(call_rcu_chains, sizeof(*call_rcu_chain), GFP_KERNEL);
-	if (!call_rcu_chains)
+	if (!call_rcu_chain)
 		return -ENOMEM;
 	for (i = 0; i < call_rcu_chains; i++) {
 		call_rcu_chain[i].crc_stop = false;
-- 
2.39.2

