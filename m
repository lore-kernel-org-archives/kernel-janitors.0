Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF685C6FD18
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 14:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjDSO1l (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 10:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbjDSO1i (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 10:27:38 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30A36E85
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:27:08 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f09b4a156eso23502655e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914427; x=1684506427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pMc7fQBWe3Bi35jcVdXtRtvRDvXrcOa0szVfpwPrY64=;
        b=BcWZUFJCqODc0M0FT5cCKCyz2EiZMOm0KE0JFo7V1mXSKSXmBpLF70JtQmsutdDLCD
         WvDnVzkzICHEhVq+O4+XmnKQbybPAs+A89umGecQ8Dy1Qc1bF/skddnE3qR189uDM1JA
         7WaAshMHtFUv13tmKlFDN35bcRXO4cGbyht4e0WJ+BIalvWUyZwYkdynviGD25781O+C
         AxhW2dTfMcwhMfpcnEFc7qs4KdaStHRdFmRxyExj/0jM1y4QMKDNWTVS2yrERaTPucdl
         RJ8udrHkxvWBqGzZzw9Q12isHHIDPbdz9DAd+Wt4mZfJnpwftKRCAZ2TR8B8M66WH71z
         BTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914427; x=1684506427;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMc7fQBWe3Bi35jcVdXtRtvRDvXrcOa0szVfpwPrY64=;
        b=E1aoxll7CNuDUgQiTJWsRSs3KYnvXnAaNXbU7zVSlEVnoxzueiJAGPehKqCWIxbg2l
         bKha8lv5vomdZOMUBdi6UE+TeC6KxhyqLdZTuZ3bmShQeHuRgS3vhCx8jVyYpA+rDWa9
         z4aREnga8wcrns+1ygulJtIbRzy2odgrXkwkXfbX6irmCZI+RavAxlTkh7sBsx+QCRjU
         tmOICFTEDymU70ZqmkORcn1q3rm8mmTvI/vOhpiQWDS9nGSXwK2bOon/XASiXQ8uQ3GX
         aTCDfp/743/UxD2vXUCRx57iKfSUBL+g8c0cdzbMRLE+DlhfD1x3KTa/nh4wiVMiE36O
         GvXA==
X-Gm-Message-State: AAQBX9dIktO+rN5IKC0FyT7WoxS7V/FU1NOAfxrGchrSP7ouBcMU3Kry
        wuCAsE5/UF3OAl/S3CjVr6eSsw==
X-Google-Smtp-Source: AKy350btsIWsdW3cryVOdG6OR9UGS2MvnHBvrrbxUcJhqkZzqkyawjYBfWu10M6GgYZN7A6x7c0yUA==
X-Received: by 2002:a5d:66ca:0:b0:2fa:6e37:3d97 with SMTP id k10-20020a5d66ca000000b002fa6e373d97mr4382802wrw.54.1681914426881;
        Wed, 19 Apr 2023 07:27:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c351000b003eddc6aa5fasm2392223wmq.39.2023.04.19.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:27:06 -0700 (PDT)
Date:   Wed, 19 Apr 2023 17:27:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Richard Gong <richard.gong@intel.com>
Cc:     Dinh Nguyen <dinguyen@kernel.org>, Alan Tull <atull@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Gong <richard.gong@intel.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
Message-ID: <5f9a8cb4-5a4f-460b-9cdc-2fae6c5b7922@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The svc_create_memory_pool() function returns error pointers.  It never
returns NULL.  Fix the check.

Fixes: 7ca5ce896524 ("firmware: add Intel Stratix10 service layer driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/stratix10-svc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index bde1f543f529..80f4e2d14e04 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -1133,8 +1133,8 @@ static int stratix10_svc_drv_probe(struct platform_device *pdev)
 		return ret;
 
 	genpool = svc_create_memory_pool(pdev, sh_memory);
-	if (!genpool)
-		return -ENOMEM;
+	if (IS_ERR(genpool))
+		return PTR_ERR(genpool);
 
 	/* allocate service controller and supporting channel */
 	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
-- 
2.39.2

