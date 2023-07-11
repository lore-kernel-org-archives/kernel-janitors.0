Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09EEEB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 08:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjGKIVV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 04:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjGKIVU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 04:21:20 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3381CE5C
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:21:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so38646175e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689063677; x=1691655677;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=sNdncJFBQWQQHoBuyDo6nEnrz9dHPFyKME3hzDj1IFW+Oe+v7zgrzJTAL5xygdkm9E
         EDmIrvmOywHsTYUSlT5hMCo+dtaEIp+GAEeAcHtpcD60xyWBARQ8uXJ/hHbV5FIA8lIG
         FTi26w/cmcPxCDxGBzPZnzkX6n890G9ffwdxsFdI7MnSiectzhfLylsg7jW/81IllmrH
         pCg/Lni8M4xbPkNyRfWFmy6gY3ijd7CYyutJZCDL9+uv13+a2JT/If67dNSa9UPMXv30
         +EeMbu/1hp6juM26OoZl5ugUCMk7oxM55pVndPW0YSquNXNB1KF9FgOAUcKR06WI4qFV
         lWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063677; x=1691655677;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=RSB91otLdKbVvuzzIZ/oy1HfdZcDL08hixNwKPLUwz+0Uq5tXwx7dVlETeNFNwEvDN
         7RdE4tbmqYlcMdISwVlyTJxKDehSzzHReeRe95CfSD1SsQsaqruMu3hM1qOhARfoTXOY
         JzQJctyFhuddVVGy2MTlzeEFmbYyuRshDPuIAFZTwyJPU6znGG8kkUno9ZjVGROUmi70
         L9sETSDGzoso/1pmetzNmQS8OjMK6DNQYjD3l+nbJsFWQ8z2gkMIyWr/dm/gBU2IJbZa
         fACiaT4UdKHnmvS5xUMBtG2spa2QQUguzhf8R51Af+7/X5I7Orx/rWTRhaBK/vvn1nWe
         I6gg==
X-Gm-Message-State: ABy/qLZoE4O8I+MflZ3IKeNDK22exSfo5gX9hXFVyGMAH1EamRk6BZhW
        WVOJ2SXX8xIoL3xjEs4nyko4+A==
X-Google-Smtp-Source: APBJJlF0sfiUbbYqGKeYHW/O/nho5Vvwq2P2b8qilFz9LEbAguLpt78XKqS7uFSN5tRMm3Cd+LFlrg==
X-Received: by 2002:a1c:f706:0:b0:3fb:b637:22a7 with SMTP id v6-20020a1cf706000000b003fbb63722a7mr16076656wmh.4.1689063677747;
        Tue, 11 Jul 2023 01:21:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c18-20020a7bc012000000b003fbd2a9e94asm1825480wmb.31.2023.07.11.01.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:21:16 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:21:13 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 5/5 v4] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <ZK0Q+ZuONTsBG+1T@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If get_user_pages_fast() allocates some pages but not as many as we
wanted, then the current code leaks those pages.  Call put_page() on
the pages before returning.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
no change

 drivers/accel/qaic/qaic_control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d5ce36cb351f..9a6f80f31c65 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -425,9 +425,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 	}
 
 	ret = get_user_pages_fast(xfer_start_addr, nr_pages, 0, page_list);
-	if (ret < 0 || ret != nr_pages) {
-		ret = -EFAULT;
+	if (ret < 0)
 		goto free_page_list;
+	if (ret != nr_pages) {
+		nr_pages = ret;
+		ret = -EFAULT;
+		goto put_pages;
 	}
 
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
-- 
2.39.2

