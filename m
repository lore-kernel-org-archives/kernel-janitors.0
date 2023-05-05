Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7926DC77B7C
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 May 2023 09:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbjEEJWS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 05:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjEEJWR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 05:22:17 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A89267EF9
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 02:22:15 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f4000ec6ecso15388545e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 05 May 2023 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683278534; x=1685870534;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KhnBOIfg/E5fSoBayOzGobKvTaGcdmJ+k1kVchc46o=;
        b=XjuJnZSaaR6TFbNwMQRlx8s2bUsaDFmD+36JmpeaJR5LRPb+FyyO/qbsTafZwQRhrR
         V6oLWPI9tFQf1BlLlUs+73l6jzK7UHW+3HRgFrCghOBeRAIYBrbBtsCcwLnuzYgmxtLg
         c869OSpF7XDDKMLW8zF1ZdfoW/GFObQtWn8MAipduXnP0YqKf1hTChA1FaLxFLMknDJh
         JRT7vD4zdjj3uO1ZzE6kNjQXsdAvU7519wFRVEAMl+S8iiAga39rAM4xWY3PNQ0yaZW3
         TlTfWB4y53bm8B0uCY/1w64jYBJkBgtMCmqmWFv7/8T4qTQCRSHU2T8sZVMUq7/tzk+D
         vZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683278534; x=1685870534;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KhnBOIfg/E5fSoBayOzGobKvTaGcdmJ+k1kVchc46o=;
        b=NXh0kFiehAlC3vjCHp5Y439s+R9I9fIIcLK8DmKzOWgt312wEDlhMBReOaSb8slIvF
         +aVdeDmbiJIMgtVw0Dqb7A3ADEBlZlqB7AM6zd89v/RDXl01P3q6/TjUszolS8M6PBcl
         AVCOEFMWS//QuLty2FIkIGu5/612TaQU3ft1Vub4FVFCt/5WPSnPnaFIvxlm63iWK3U1
         ca0toTd9NdCtflEZO5+mwddBkGo1d7Myn6zsWzdy1N8qJickKLv0F8z3UBSn4AZ36B7U
         yVIf+tqFmwUI2WRpj4nJvV529saEJQpEJ/+HYySGxLrHjKrw3tJW6zII3gmszi6y3H92
         LCAA==
X-Gm-Message-State: AC+VfDxmeB1oLZumfY/ttk3ZiU0yFWBwoG64imh00VNxWn8oBiShnOYa
        tOc+8Gt6K/WoCRogb1tcxvI2Dg==
X-Google-Smtp-Source: ACHHUZ4MCWLfMbvPV4W/V6cJlR344obTV+pCnVT7Be/h1shCxDk35Exq2trWwTZ81aSQR/ySox04/Q==
X-Received: by 2002:a05:600c:218f:b0:3f0:a0bb:58ef with SMTP id e15-20020a05600c218f00b003f0a0bb58efmr695538wme.25.1683278534208;
        Fri, 05 May 2023 02:22:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b003f1978bbcd6sm53668073wmo.3.2023.05.05.02.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 02:22:12 -0700 (PDT)
Date:   Fri, 5 May 2023 12:22:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: mailbox-test: fix a locking issue in
 mbox_test_message_write()
Message-ID: <c3b517eb-3805-48bf-be89-0082bff65913@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There was a bug where this code forgot to unlock the tdev->mutex if the
kzalloc() failed.  Fix this issue, by moving the allocation outside the
lock.

Fixes: 2d1e952a2b8e ("mailbox: mailbox-test: Fix potential double-free in mbox_test_message_write()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mailbox/mailbox-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox-test.c
index c4a705c30331..fc6a12a51b40 100644
--- a/drivers/mailbox/mailbox-test.c
+++ b/drivers/mailbox/mailbox-test.c
@@ -98,6 +98,7 @@ static ssize_t mbox_test_message_write(struct file *filp,
 				       size_t count, loff_t *ppos)
 {
 	struct mbox_test_device *tdev = filp->private_data;
+	char *message;
 	void *data;
 	int ret;
 
@@ -113,12 +114,13 @@ static ssize_t mbox_test_message_write(struct file *filp,
 		return -EINVAL;
 	}
 
-	mutex_lock(&tdev->mutex);
-
-	tdev->message = kzalloc(MBOX_MAX_MSG_LEN, GFP_KERNEL);
-	if (!tdev->message)
+	message = kzalloc(MBOX_MAX_MSG_LEN, GFP_KERNEL);
+	if (!message)
 		return -ENOMEM;
 
+	mutex_lock(&tdev->mutex);
+
+	tdev->message = message;
 	ret = copy_from_user(tdev->message, userbuf, count);
 	if (ret) {
 		ret = -EFAULT;
-- 
2.39.2

