Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001D6C77B7F
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 May 2023 15:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbjECPLq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 May 2023 11:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjECPLp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 11:11:45 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833374ED2
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 08:11:43 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f19a80a330so33835685e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 03 May 2023 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683126702; x=1685718702;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=omxGsHaKkcGC+xqSddM+y0Rv4lJTnT54/CknYbjXVhY=;
        b=YfDzGylBhlR3CVxpMMI4acCmCfqTfHfM5iBfgOCW6OyIloOXcvH8dEmNrR80OObTjK
         IwiUIcA3EAalQUC1fcg6MNtj8x4BJYd3sJPyd1U6v+NcbtOe5wHOosZpqzvgGp8d60s/
         GEuDIhroTKLKU3RLl3Q1FYflOwqkteq5501Hv7jKKV+O+4lgokZlz6LlAf+t4oJvNHp0
         ZWyt5MEIYS7GLmms+q9eXjK+KzyG/JMYwSlML9xXTrZnmx3fQyKd5U046ZCENMYczcQL
         jcsxZ8mDjvZC0tP1ENbJbTfiTKJKjO/AZbTZ0Prl4nDNDNwD+/yjN0s7b2KBvKuTLtdC
         JPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683126702; x=1685718702;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=omxGsHaKkcGC+xqSddM+y0Rv4lJTnT54/CknYbjXVhY=;
        b=TYVbQYCHJGD6WiY9jGf/ZNSzIDIfYy9P8X45PLBbF11Rk3nYsY1JNsgIN67nMMMyQ4
         Vx4nZatHeYFoh9BEynADscXEMkTHH6+KApmjXOp4rUEC00jbtIrEHlMcYDIfJ1y6Hzcz
         xoEkMGvW5WvL1RCpEXx5bGL3pX1KKJdg0nXH0LaA1jI8BgmmPAKflLLIujeLSX9rj0b3
         3qrh5iNvDQDZK/W2rsqpiAOwAXcBZ7G1WbHYM2+VZjB3nxBInHatMmMrQcfYT6CWkaBm
         fTXfxq04DCUOalxO+gw6iHV8QgYEnIzs3zr078PaG/GmwjiCubkNSLLnJ43mZxnQfbyc
         EVHw==
X-Gm-Message-State: AC+VfDx5IcZ/5A/fW8fIE0bC0/QJ1s9CVTjWGxvnoki/Pz4p0VNmiy36
        KD9DO1EwnpUpEO9IyDnnt1QP6dMI31tLy3xgDs4=
X-Google-Smtp-Source: ACHHUZ5OZVQBtqAWZgaLWLuVjAfGEiqAlM8i3902hJEurNrW2MxWTzUvvq1ZwT17Z0WElKBzUOcmHw==
X-Received: by 2002:adf:dd4c:0:b0:2f6:8834:5952 with SMTP id u12-20020adfdd4c000000b002f688345952mr361499wrm.8.1683126701992;
        Wed, 03 May 2023 08:11:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b002fb60c7995esm34427038wrn.8.2023.05.03.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:11:40 -0700 (PDT)
Date:   Wed, 3 May 2023 18:11:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Stefano Stabellini <sstabellini@kernel.org>
Cc:     Juergen Gross <jgross@suse.com>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xen/pvcalls-back: fix double frees with
 pvcalls_new_active_socket()
Message-ID: <e5f98dc2-0305-491f-a860-71bbd1398a2f@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In the pvcalls_new_active_socket() function, most error paths call
pvcalls_back_release_active(fedata->dev, fedata, map) which calls
sock_release() on "sock".  The bug is that the caller also frees sock.

Fix this by making every error path in pvcalls_new_active_socket()
release the sock, and don't free it in the caller.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/xen/pvcalls-back.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index 1f5219e12cc3..7beaf2c41fbb 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -325,8 +325,10 @@ static struct sock_mapping *pvcalls_new_active_socket(
 	void *page;
 
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
-	if (map == NULL)
+	if (map == NULL) {
+		sock_release(sock);
 		return NULL;
+	}
 
 	map->fedata = fedata;
 	map->sock = sock;
@@ -418,10 +420,8 @@ static int pvcalls_back_connect(struct xenbus_device *dev,
 					req->u.connect.ref,
 					req->u.connect.evtchn,
 					sock);
-	if (!map) {
+	if (!map)
 		ret = -EFAULT;
-		sock_release(sock);
-	}
 
 out:
 	rsp = RING_GET_RESPONSE(&fedata->ring, fedata->ring.rsp_prod_pvt++);
@@ -561,7 +561,6 @@ static void __pvcalls_back_accept(struct work_struct *work)
 					sock);
 	if (!map) {
 		ret = -EFAULT;
-		sock_release(sock);
 		goto out_error;
 	}
 
-- 
2.39.2

