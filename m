Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BB5EB64DD
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Jul 2023 14:58:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjGUO6O (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Jul 2023 10:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjGUO6N (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Jul 2023 10:58:13 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEFB114
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:58:12 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so16976245e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Jul 2023 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689951491; x=1690556291;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNImucjaNLeCmsiuYLvYcRiNL6dxUcfBU2q2yYk+Sqk=;
        b=e0J75bMOF5TBrsKhmcdIjD5RHjDqWJ+etcFweO+mNetFuMTGRFmXpHU2FfBxTNljba
         UV4FJ+FPlT1OlJsum3IhHpioVjPlHbC6jCBLl6Te2I6Bqvcg8ph9DyEV5uqUZIDZhfdH
         ht9B4fn6qbXeoTIezjJexs1W+3DAci9qGobmvCBteaOHpoMPspZ3LOHfLduUiofuvdI5
         IXdfXiIo/ScTlkDcD04pIYPDceXDMNxWgomZHHziDDU6WzRzpTc/xOXDN11TLT/Yw6HX
         x9XgkJ1LuG2T86QVmAVmAXKRHV/OIbV2ah4m8crEGAWBSIXUPyyZDYXmV5Wfi3FbU8GO
         HIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951491; x=1690556291;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNImucjaNLeCmsiuYLvYcRiNL6dxUcfBU2q2yYk+Sqk=;
        b=hFRi0CqFxYGsPLl6xwhlQQ9s1/6Glu62Mr7I1druKW8pBzxn/1hgWJiC4JRnTWsQRd
         YTVRwaJNxW6XXWA6nZ0uKbVZiXyANkykhkrMSJAUbzhSlI1w1xRFnGcWCAzShkojCs1z
         +2IcVglWoSjGjdWmEB3TMc7jjfNo1aVbD3g4yHSE9UegZd0/nr+sxHG/hlE0FdV2UJ+x
         ACyHQ1uCFLgO59wjsLGzRbP4+DI1c9Cf2NoWef3QRcIgnQbMAyY6jCteA17vvnRIsBMw
         oNBNCLioaJgB5afX3VLJyOMoBcIv1qwN4MDt6akGmai3P4CKzuhBZRyj0xP4P0aZ/tBH
         bLHA==
X-Gm-Message-State: ABy/qLbKGF22chSRHuP0k6gZYnR4PUw5H1Atduo7H7snDHHboZk4fgqi
        pfBl2OhU2mcs2BnRbwtYD1XUwA==
X-Google-Smtp-Source: APBJJlGEkuj1I7We6C0/2twPAnua9yYsxAC+t+5a6WpR9gTNnNV22u9C2u5YnVXfaF6OB7t7l59Fjw==
X-Received: by 2002:adf:d851:0:b0:315:8f4f:81b1 with SMTP id k17-20020adfd851000000b003158f4f81b1mr1568386wrl.50.1689951490773;
        Fri, 21 Jul 2023 07:58:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o15-20020adfeacf000000b00313de682eb3sm4435634wrn.65.2023.07.21.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:58:09 -0700 (PDT)
Date:   Fri, 21 Jul 2023 17:58:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Jack Wang <jinpu.wang@ionos.com>,
        Dave Chinner <dchinner@redhat.com>,
        Hannes Reinecke <hare@suse.de>,
        Christian Brauner <brauner@kernel.org>,
        linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nfs/blocklayout: Use the passed in gfp flags
Message-ID: <e655db6f-471b-4184-8907-0551e909acbb@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This allocation should use the passed in GFP_ flags instead of
GFP_KERNEL.  All the callers that I reviewed passed GFP_KERNEL as the
allocation flags so this might not affect runtime, but it's still worth
cleaning up.

Fixes: 5c83746a0cf2 ("pnfs/blocklayout: in-kernel GETDEVICEINFO XDR parsing")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/nfs/blocklayout/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/blocklayout/dev.c b/fs/nfs/blocklayout/dev.c
index 70f5563a8e81..65cbb5607a5f 100644
--- a/fs/nfs/blocklayout/dev.c
+++ b/fs/nfs/blocklayout/dev.c
@@ -404,7 +404,7 @@ bl_parse_concat(struct nfs_server *server, struct pnfs_block_dev *d,
 	int ret, i;
 
 	d->children = kcalloc(v->concat.volumes_count,
-			sizeof(struct pnfs_block_dev), GFP_KERNEL);
+			sizeof(struct pnfs_block_dev), gfp_mask);
 	if (!d->children)
 		return -ENOMEM;
 
@@ -433,7 +433,7 @@ bl_parse_stripe(struct nfs_server *server, struct pnfs_block_dev *d,
 	int ret, i;
 
 	d->children = kcalloc(v->stripe.volumes_count,
-			sizeof(struct pnfs_block_dev), GFP_KERNEL);
+			sizeof(struct pnfs_block_dev), gfp_mask);
 	if (!d->children)
 		return -ENOMEM;
 
-- 
2.39.2

