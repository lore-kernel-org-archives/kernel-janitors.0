Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3A7C77B78
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 15:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjEDPA2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 11:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbjEDPAI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 11:00:08 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896639008
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 07:59:34 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-2fe3fb8e25fso441482f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 May 2023 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683212370; x=1685804370;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DVPTtRLE7vhONkGU6O8/IrbGHqrgyGLWCXCIuAQz8U=;
        b=Nfk0qxpn/0iP4LfqMOqHbjYvzHbHPJgvPd4+KANA20In8OGV3ZPwFY02Pz3V15eA++
         kz+55K9u62P2k+NJ2gzOpiQULuMo8pjwWd5e27SkkvcURwTwME392f4j4lz8R8gneTZc
         fvLx7aiccyRW5p6iiFK0+WsHqTvAa9OuOldpLVtb2Vatg+DjNGsUvqyOUy3SmK2YjlGh
         91WLrewhKydHTznO2RmuZVtpKgIo5PzmNVRGtPXVu7PsIxj7PGFnFRrv2JMqZqzYTCNd
         dq6XUfpv8JZ7hamZHr1947z76q2q/ZzPNJEtLlmZdmAf0+bnFyQgPBjC4DSjkbSO10X6
         cuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683212370; x=1685804370;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DVPTtRLE7vhONkGU6O8/IrbGHqrgyGLWCXCIuAQz8U=;
        b=O48cm2gb+0C4iFPELsEvl+8KJrJv7kZ0blRQcsbMj9AGqKqAHp7Uwjg4O3W+XW6WDh
         VTcQlqUQn6+/c40RLg+ndTlq/Mr1QxJosNZEKMIh5CkDSkUTK6v/eyvFspa//SUv9Jeq
         86yfJlyrlWFd9/ZgM056eLYqsM4tu8umBZ0YsYmB7fCXxSGyksfzH8PrH9fUyudwKV8m
         tqOEr2ANWdHP2Z/VBh9tIK9JqUg1cpOgYkA69wjL3+4zRnAKQnwUXyW+AJ4BRYASnuSk
         USRz2Olvv8bgXZ6a4TkSchVmsts2YbkT0SZpOLpVbV2Hk35GpFsYy6OBb5vO6A0CGlvV
         NCbw==
X-Gm-Message-State: AC+VfDx+HqSZ1+DF9T7bWKZNxLjkRye2HHY5TYVixhxdoI4qb6exjJKD
        p3u2nh05hCV8mul4/8XTtui73A==
X-Google-Smtp-Source: ACHHUZ42nVccQHdJ7yViR0Mn2loZHBdE+qHdvwMLrqt/JbVuQSPlCto/pVCZJ+12DWsKcs+iMA3jmg==
X-Received: by 2002:a05:6000:1185:b0:306:27bc:f906 with SMTP id g5-20020a056000118500b0030627bcf906mr2508689wrx.67.1683212370382;
        Thu, 04 May 2023 07:59:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d6a83000000b002fe13ec49fasm36891858wru.98.2023.05.04.07.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:59:29 -0700 (PDT)
Date:   Thu, 4 May 2023 17:59:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: dwc3: fix a test for error in dwc3_core_init()
Message-ID: <d0c5a04f-deee-4ebe-9b0b-dc5492564519@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This was refactored recently and the "ret = " was accidentally deleted
so the errors aren't checked.

Fixes: 1d72fab47656 ("USB: dwc3: refactor phy handling")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 0beaab932e7d..7b2ce013cc5b 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1137,7 +1137,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	dwc3_set_incr_burst_type(dwc);
 
-	dwc3_phy_power_on(dwc);
+	ret = dwc3_phy_power_on(dwc);
 	if (ret)
 		goto err_exit_phy;
 
-- 
2.39.2

