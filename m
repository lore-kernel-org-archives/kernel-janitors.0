Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F17C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Oct 2022 15:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiJRPX2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Oct 2022 11:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbiJRPXR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Oct 2022 11:23:17 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09742D2CC5;
        Tue, 18 Oct 2022 08:23:12 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso12448887wmb.5;
        Tue, 18 Oct 2022 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OuktP/aQVcIixsd3H1BycnEwVjhNMLHzZI3vDKt2TCE=;
        b=hDAwsrhsKS+SPsEjAinvEM/ehe7PzpVeQGv9sXVKw7hsS+pNecMp18s8IOgXZFlf/R
         IbhA1U2y8ZnirNxe6g/L4SHb4FO7eWzoTHjn7t2Lies5NJMUeFtnyNssEe/KuZcYE3Tf
         CW20OL6yqvPSVegMUsjJQ5gIHoYsyQgJAj1eFoaq7QOZgOk3DxsDmnJv0BArBNFW2CRr
         DfmJ4BJIalnBnPBSIg/6pLEOR1grYCQMxDmKwto6Ik8mD+NW1nR5tQNOqQJtZRMCWFDL
         2HJk9MJrgBwbuGYk0I0/8PwU5P3g/PDblCTgwnU7IdUBepTl7ZYirEo5KFNJ0qV1iKxg
         LiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OuktP/aQVcIixsd3H1BycnEwVjhNMLHzZI3vDKt2TCE=;
        b=vJODvB7XO6l/d1Gjs7+XY2Y374dlQj1OrCfYhSAnCMKQHqv2LJvJGbIMPasfKopfIG
         +cIA/23z2OBTdc9f+8rGe75FSg2oqYf4Tmu8xGJCxKmCLYb45VC2NnvVHOvF4HwMehif
         D8Pq4Ecggcqv+ZeCpGjt0u/Nthpd6zR/0PKgDlI0RwmwkxqrwBXLHJuWVzrZcqbKBUbZ
         Su0Q//il35QnA7OzA5CArxwucjhjZu2UnaQaMTGZ0Z4e9eBm8lcslhOC50ZhgORM4EJn
         ErKq6SypHpZnhi/zijkCk6MdArB7YgI7XnZTrhHUbtsieLhqkxYoMlusu5tynUG/G5jq
         ItPg==
X-Gm-Message-State: ACrzQf2sMy87ru09ORHIZ2aHkNuJciJz4S7i95lbNhK30k+GPe1Lh5FI
        B/NIiJ90MzUDHonMF3H6pAtLhh2jawiidy7r
X-Google-Smtp-Source: AMsMyM5up2w2JHyQVaU1eRlRnWFBK3r2aapndJwprZs/HAzxbT7MKeZodL6eY1JPZVSdXRvYu7yU/Q==
X-Received: by 2002:a05:600c:2754:b0:3c6:aba7:5c93 with SMTP id 20-20020a05600c275400b003c6aba75c93mr2346816wmw.177.1666106591457;
        Tue, 18 Oct 2022 08:23:11 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id az12-20020a05600c600c00b003a62052053csm22308877wmb.18.2022.10.18.08.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:23:10 -0700 (PDT)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Dave Kleikamp <shaggy@kernel.org>,
        jfs-discussion@lists.sourceforge.net
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] jfs: remove redundant assignments to ipaimap and ipaimap2
Date:   Tue, 18 Oct 2022 16:23:10 +0100
Message-Id: <20221018152310.941770-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The pointers ipaimap and ipaimap2 are re-assigned with values a second
time with the same values when they were initialized. The re-assignments
are redundant and can be removed.

Cleans up two clang scan build warnings:
fs/jfs/jfs_umount.c:42:16: warning: Value stored to 'ipaimap' during
its initialization is never read [deadcode.DeadStores]

fs/jfs/jfs_umount.c:43:16: warning: Value stored to 'ipaimap2' during
its initialization is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
V2: remove re-assignments rather than initializations as per the
    recommendation from Dave Kleikamp
---
 fs/jfs/jfs_umount.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/jfs/jfs_umount.c b/fs/jfs/jfs_umount.c
index 3e8b13e6aa01..95ebcd17ce75 100644
--- a/fs/jfs/jfs_umount.c
+++ b/fs/jfs/jfs_umount.c
@@ -68,7 +68,6 @@ int jfs_umount(struct super_block *sb)
 	/*
 	 * close secondary aggregate inode allocation map
 	 */
-	ipaimap2 = sbi->ipaimap2;
 	if (ipaimap2) {
 		diUnmount(ipaimap2, 0);
 		diFreeSpecial(ipaimap2);
@@ -78,7 +77,6 @@ int jfs_umount(struct super_block *sb)
 	/*
 	 * close aggregate inode allocation map
 	 */
-	ipaimap = sbi->ipaimap;
 	diUnmount(ipaimap, 0);
 	diFreeSpecial(ipaimap);
 	sbi->ipaimap = NULL;
-- 
2.37.3

