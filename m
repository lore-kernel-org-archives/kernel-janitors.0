Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554C6E810DE
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbjI0MzS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjI0MzR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:55:17 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CAEE6
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:55:16 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-323344eae8eso3632362f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695819314; x=1696424114; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+1t1P5I5WKboLrqwp2yf5WoUoPKv1FgbHipL+4z2I8=;
        b=YsK6MiVTivqK4Je8frhGBVlnTQTB/wbXvGz7mWFg6xAl8FdNzNyOBu0/M2Y0WppkOB
         iH+piKYx947Aetzky3KQzQHPPY2UhXb5reD5iG0pyW8fUvG6QuGXnR62otNc7b7HbOpk
         rUIcK01i7fM6wGJ/FKDcVF7PP4zzrrX8xp5mniZhkO+5oy1N1IozYvycbq4GcArH79sK
         lIeiiwJq4ZFlsqGQtbkWjYrGaTYDHY8uExm/oydW80toF0dm7skRgd31vGagu82aNAbj
         e0Qnt10ckl1jEcrofJxmhWJAH48u2UaCvdrBbk+9Qm9aJsO4mv58qdd1vLHnN+MF813o
         wtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695819314; x=1696424114;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+1t1P5I5WKboLrqwp2yf5WoUoPKv1FgbHipL+4z2I8=;
        b=Flhz5TwEaHLOZkXdScjEj+/wEsYSEMWWAiazhYwl9SHekJC6BmH2Kl+EXkIwx2+vSA
         eIETahhmdL29L5/gASAaAR13XDk0czESo23oA66DyPOYSK/tNeC3k5ET0kqi9JlFlHBH
         ObWISUWV0MSDbPwPNFNgVcWAXEJCUPIgPGHDjsHQXPs2Sy4DE44ymPXO6iTH/KBxCiz5
         8dTJkWOXmCAe202rL/4XnCNUv/xbxYD16K+g00b0zzBYA1BwaB/HKvB5m1+1pMtqQkW4
         KKr83AEgkNFmdncV1RYzmtRWm4cVND86uGyeHbWi9tNP8ciwfEfz5MZ8UtZpVpRNOqKz
         ySVw==
X-Gm-Message-State: AOJu0YwYlL78qOEvXabUMbb0PGGjDUpWC7jCaHBKzCx1ZrXTEPmnJaXu
        NEGms3V3kp6mWQMGwIstOaTrWQ==
X-Google-Smtp-Source: AGHT+IEWh365sjezz7UFOsIzAffZmD/KojQX6xd0VdrtKc3n8/qBapI+G3fEBTQNXR5CBME+Ozhx8A==
X-Received: by 2002:a5d:4cc7:0:b0:314:a3f:9c08 with SMTP id c7-20020a5d4cc7000000b003140a3f9c08mr1526754wrt.39.1695819314384;
        Wed, 27 Sep 2023 05:55:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d4d81000000b003140f47224csm16937060wru.15.2023.09.27.05.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:55:14 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:55:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Richard Cochran <richardcochran@gmail.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Vadim Fedorenko <vadfed@fb.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] ptp: ocp: fix error code in probe()
Message-ID: <5c581336-0641-48bd-88f7-51984c3b1f79@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a copy and paste error so this uses a valid pointer instead of
an error pointer.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 88d60a9b5731..d39afe091a7b 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -4453,7 +4453,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	for (i = 0; i < OCP_SMA_NUM; i++) {
 		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE, &bp->sma[i].dpll_prop);
 		if (IS_ERR(bp->sma[i].dpll_pin)) {
-			err = PTR_ERR(bp->dpll);
+			err = PTR_ERR(bp->sma[i].dpll_pin);
 			goto out_dpll;
 		}
 
-- 
2.39.2

