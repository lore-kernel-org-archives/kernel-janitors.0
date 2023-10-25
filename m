Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B8BC0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 11:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343620AbjJYL5T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 07:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbjJYL5S (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 07:57:18 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96D313D
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 04:57:15 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4083cd39188so43438115e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698235034; x=1698839834; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Svgsq/AnbjJxNk7jNBD8VRF+Bt+Kn7+Y3XI8iU9eztQ=;
        b=vUlwHCgCCCdw2X0tNdXYkisy6XFt+e3S1dvHq+stYKsMTp9r6+mQShoiSgCdhkDipb
         sw8SiT5at93WvdeniWMrR+pB2ERs0383imTFtPpqKKLi5WLU6re2FehjP4y3CpsAntlJ
         QSlWlxzOGDfjIJOFFm17lDEhIDNMvClWdFhhFmrtSvEWAzSnpoUkSLcVNLi7S48YQFD/
         c9FwhCP/wl+289DoJDzUW0eNOeJRxpVPsnwqs0HBMNL7PgUBET3o7F+rmZt+p/eoyVho
         HGIwBM1u8IBcWOs2R2Nz0WWNl0ONRU/i50xSonWeUrSW3lwdajRxCqbe1abskSIqJXeP
         Z7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235034; x=1698839834;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Svgsq/AnbjJxNk7jNBD8VRF+Bt+Kn7+Y3XI8iU9eztQ=;
        b=v30RX9zcJz5bQymfv0H74RJiRFjNbluhfMLKwE+6VZzo6gpIRlwDOVxF4uHTxr7f40
         14YAQZBYbCbY7gL3fidNSFfbKWJj4g63JC+Yg3xa8T1+1D5wKs2cpS57K+PvraIyNEZa
         riQy1+N4cmEFREcVWq6pfBMMgZoNm9nCVtmJl/8OdhUxveQ6qhq+EtulQ3YPL1bnwUow
         NPWFjcBxma3ae0GEHuwrcngzvf/jZkvy7MEnnPFzpE6dfXYReoSPT8kbbUTh9Aul0l8O
         fBMETL4oTmWo50ptIm7LZrpkJxWmLpHR5lj8tkPUmvSG8PImmfBQhfmuJtSk5mYVZJBq
         6QBw==
X-Gm-Message-State: AOJu0Yyn60wxo+TogmtYUQv2dVpWBb0TBo4g/XoZ1nil6F9HMk/DyJYC
        QN1Lw5yHqc6POqISZat6BVYIJ/xKUURvw8ZhzXI=
X-Google-Smtp-Source: AGHT+IG7r3dLAwdLNcAlseIa0fKBtN898ETmhV+sCzsSFjW27iIRaLWoI4YCTr60PRsoelQHtsEmkA==
X-Received: by 2002:a5d:6310:0:b0:32d:84c7:2f56 with SMTP id i16-20020a5d6310000000b0032d84c72f56mr11957241wru.21.1698235034491;
        Wed, 25 Oct 2023 04:57:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d6b87000000b003140f47224csm11843971wrx.15.2023.10.25.04.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:57:14 -0700 (PDT)
Date:   Wed, 25 Oct 2023 14:57:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andreas Gruenbacher <agruenba@redhat.com>
Cc:     Bob Peterson <rpeterso@redhat.com>, gfs2@lists.linux.dev,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gfs2: uninitialized variable in __gfs2_iomap_get()
Message-ID: <0b9cb1ea-4656-4802-b7a7-811c1e9e118a@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ret" variable is uninitialized when we goto out because
gfs2_is_stuffed(ip).

Fixes: 2cd225820b91 ("gfs2: Initialize metapaths outside of __gfs2_iomap_get")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/gfs2/bmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index cef57d87c24d..12d7651e15e9 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -866,7 +866,7 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
 	__be64 *ptr;
 	sector_t lblock;
 	sector_t lblock_stop;
-	int ret;
+	int ret = 0;
 	int eob;
 	u64 len;
 	struct buffer_head *bh;
-- 
2.42.0

