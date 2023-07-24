Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CF5C001E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 08:09:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjGXIJC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 04:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbjGXII6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 04:08:58 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A4E119
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 01:08:51 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso31183635e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jul 2023 01:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690186129; x=1690790929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LpBqm+jOoJG0wfkhuGS0lLXKJysvSQDazVNFzfkOiJY=;
        b=Ufz0zY6WkOuDS6QEqwHLOxV1T9LPiofO2WZsu/T5u57nyQeCg9eSnn3a6B8vagQDUq
         c86AX0g07urNlx3AB+9QO8CcUQNLYomLJp8KZwC5ZEz456SImCFmNjw4u3Z1KIuM4DPK
         fmr+uCKP1UoZg0pKyrooOAyDmszbWnXRnvHDdNtktKsQn+ncYUi364Fg7mL7ELG+aL0y
         0EwOwqLrFQGLiQ2qzfYV+djadJbXe+aUHN3jIJ82yh8pahmW33mAGJDffNg20fcVfCzM
         ZjBk++Z+cHJR+Svxm8kTcVXrVkEtZeLH6dTNZNNVmgIUjSNI8InJq0yj0Va3GZk6Y661
         uKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690186129; x=1690790929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpBqm+jOoJG0wfkhuGS0lLXKJysvSQDazVNFzfkOiJY=;
        b=JAvAaEzvU3TugmhfzRzKOmRQ3Vjeo3K/z5to2HhGiLJvH3g4PLTN5IoZQ8uykJ4GYh
         Cv+/xO+iaNA5WMwfuaegLIzM7qLZXm20ZaRdlnh4C4pkd5ofyMq3LDmk7a7gc01xHsl6
         OKwr2F/peRMxq5t0Fie21YxwL2FXAyKA2JLGAWYFYChyAEIkHM+5b800Pj7rtJ/sb/2q
         OaedBrSfruKDg7iSQQq7HhQcOEXeA9wwfvCJiXGXLffJP07qYQDRPD5MM7NFUobFNHpI
         GLL7mw/0jjHQivcD6vMcqPgqXAyXgQU/osn90OF5sUDz5BK024hKvFp8dADQ677F25bE
         P+ug==
X-Gm-Message-State: ABy/qLZx0z44qY3ByA7BXMQudlnJOwa/uotWOBgrVuJ8UMHEBABrsGml
        x6FZDYoxEP2Z8V9twJFnN+rDFg==
X-Google-Smtp-Source: APBJJlGny1xjzIq1T4tv/TtTFc/KImmPGcvaRYEJwG6Pejg8EHR/9Ino5n3agxUq4I+07tcGg8Saog==
X-Received: by 2002:a5d:680c:0:b0:317:2574:c2b1 with SMTP id w12-20020a5d680c000000b003172574c2b1mr6594879wru.30.1690186129526;
        Mon, 24 Jul 2023 01:08:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b003145559a691sm12079882wro.41.2023.07.24.01.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:08:49 -0700 (PDT)
Date:   Mon, 24 Jul 2023 11:08:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Jack Wang <jinpu.wang@ionos.com>,
        Dave Chinner <dchinner@redhat.com>,
        Hannes Reinecke <hare@suse.de>,
        Christian Brauner <brauner@kernel.org>,
        linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] nfs/blocklayout: Use the passed in gfp flags
Message-ID: <ZL4xjgy15cnLvG+U@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This allocation should use the passed in GFP_ flags instead of
GFP_KERNEL.  One places where this matters is in filelayout_pg_init_write()
which uses GFP_NOFS as the allocation flags.

Fixes: 5c83746a0cf2 ("pnfs/blocklayout: in-kernel GETDEVICEINFO XDR parsing")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Update the commit message as pointed out by Christophe JAILLET.

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
