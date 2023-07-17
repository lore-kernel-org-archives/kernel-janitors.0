Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9440FEB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Jul 2023 09:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjGQJuq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Jul 2023 05:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjGQJul (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Jul 2023 05:50:41 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097B4A4
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 02:50:28 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-317009c0f9aso967547f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689587426; x=1692179426;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6AskIt6pGpEXyl/+af7zv317MVh1sWSoDRUXWvbhVc=;
        b=Fw+1GwRvicM3Vt+T5hPWTv1I4io4vyJUrswB9HRPg+TMsLY4TzvDkTokRWKePd3UaX
         ll0O8dcluZQntO0jzW3kSRzrorSK1V2f8SBVhVItDYextFguvdp3aqZP5IUsbOXcnfYw
         C/bUs9iiz3HlppXECd6bK9yib6OQ8AbNx2QrdlK+TOb6h34snN+e/JyK2xB10AMHUKOr
         GW2Qye/vaeGeQ1QsLAqJBvjmE+/tytsd1Pp6iqZYFf1mdBoi/RkgaHqvebLEEL28N22+
         9pQDPNbG4hwEdFoiwyUGWzK9PHVSkEL8QhmeOV6G95SMcPGwTl1lFbAWFd2xx5vOmRde
         UupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689587426; x=1692179426;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6AskIt6pGpEXyl/+af7zv317MVh1sWSoDRUXWvbhVc=;
        b=Y8wLLS8JjWiWTRj/u0/GurqL9SEB8JX7RD7gT+tEC3+rUEG/eXMiYzWUIQDu9b2Sns
         /nc71HlHzfAX1At5TE6FU+5kPoeEIGXHF7rIOKdHFSwXs5zSvXW4khx7y1uWqeQnse59
         rskiq6C8mSWHyUz4lDny/u3zfcACrJP2yQx8qiHY3RkZI6I9eyGBygDVWBMV5cwfNIXf
         /PQ9j8xQeNab3mRpdUTJtzwsLRpS408JNalQaOIHTUjEAgIwc1IcxLT6HCgTblILfIY0
         erybkgs53xsOF3czTvyP0wivRvWj5P1zW/PsnRZXNJ98+j8CSq44lwKdX0xyUK7rH93l
         /Trg==
X-Gm-Message-State: ABy/qLZYACVfEsgSYylHBWp87cXZD7Fd3efveUVfm+wR1HyIUn7AJ7ab
        T9aTuQWvw2ZMpSZ4z8bNNF8Zhw==
X-Google-Smtp-Source: APBJJlFcO2hUeFTyIiGMBaQOOPJbTFdAWOHHOtL+x6pYTXFTzTLiIOmpOQir+k0qINWk2OhUsNUflQ==
X-Received: by 2002:adf:f7d0:0:b0:313:f1c8:a963 with SMTP id a16-20020adff7d0000000b00313f1c8a963mr10656889wrq.2.1689587426286;
        Mon, 17 Jul 2023 02:50:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s15-20020adff80f000000b00313f9a0c521sm18777975wrp.107.2023.07.17.02.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 02:50:25 -0700 (PDT)
Date:   Mon, 17 Jul 2023 12:50:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc:     linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] firewire: core: revert GFP_ATOMIC changes
Message-ID: <89fe5e6f-d6c3-42d6-bf86-3eb1f4193c1b@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This was recently changed from GFP_ATOMIC to GFP_KERNEL, but Smatch
complains that GFP_ATOMIC is still required:

drivers/firewire/core-topology.c:223 build_tree() warn: sleeping in atomic context

The problematic call trees are:

fw_core_handle_bus_reset() <- spin_lock_irqsave(&card->lock, flags);
-> build_tree()
   -> fw_node_create() <- sleeping allocation

fw_core_handle_bus_reset() <- spin_lock_irqsave(&card->lock, flags);
-> update_tree()
   -> fw_node_event()

This second call tree is a bit complicated because we event is not
FW_NODE_CREATED so we would have to hit a goto create; to hit the
bug.

Fixes: 06f45435d985 ("firewire: core: obsolete usage of GFP_ATOMIC at building node tree")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Smatch does not warn about fw_node_event()
because event can't be FW_NODE_CREATED.

 drivers/firewire/core-device.c   | 2 +-
 drivers/firewire/core-topology.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index a3104e35412c..aa597cda0d88 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -1211,7 +1211,7 @@ void fw_node_event(struct fw_card *card, struct fw_node *node, int event)
 		 * without actually having a link.
 		 */
  create:
-		device = kzalloc(sizeof(*device), GFP_KERNEL);
+		device = kzalloc(sizeof(*device), GFP_ATOMIC);
 		if (device == NULL)
 			break;
 
diff --git a/drivers/firewire/core-topology.c b/drivers/firewire/core-topology.c
index 88466b663482..f40c81534381 100644
--- a/drivers/firewire/core-topology.c
+++ b/drivers/firewire/core-topology.c
@@ -101,7 +101,7 @@ static struct fw_node *fw_node_create(u32 sid, int port_count, int color)
 {
 	struct fw_node *node;
 
-	node = kzalloc(struct_size(node, ports, port_count), GFP_KERNEL);
+	node = kzalloc(struct_size(node, ports, port_count), GFP_ATOMIC);
 	if (node == NULL)
 		return NULL;
 
-- 
2.39.2

