Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F288C77B72
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Apr 2023 20:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbjDQUwA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Apr 2023 16:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjDQUv6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Apr 2023 16:51:58 -0400
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359B655B5
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 13:51:50 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id oVpEphQ3ExZmMoVpEpeIvB; Mon, 17 Apr 2023 22:51:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
        s=t20230301; t=1681764708;
        bh=+WMJEZfT4Ys0KbwwujZL+IDwoeH9cl1f3Tq+Kx4YCfw=;
        h=From:To:Cc:Subject:Date;
        b=WBPHdQE97FnrU3THe4rGoRLKR4JHK/Y5ILwItWtgz+4CItd5B2ajxtyUpjmuMsadm
         OIBLe18VtBypBBIJTwCfVI17B3bWEoRX/EabCkIP1PIAmGXJzddsL2ygaJX7NxCg5P
         kbuFyvrAwmcaUgC8RBPQ3SHfOcJ+3AHhCoGRn6wqVwf2ePJEq+WwlX4TT0eCjns9WW
         J1xcHPyx0j4Jh3NLHA7K900dtaGr4yga7NXKh5bIzuGM4qhhqy8vM7pgBEtxhUtpfB
         PKtXc1kLhtlbyB1AnUOykeKQuBDkB/moakVNYmxGc8vV+NrkRpUbPxspxJ8RSdYLKO
         exQjeJs1mre4w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Apr 2023 22:51:48 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-f2fs-devel@lists.sourceforge.net
Subject: [PATCH] f2fs: remove some dead code
Date:   Mon, 17 Apr 2023 22:51:46 +0200
Message-Id: <523ec4b037d064e92e19203e3ab9a161e3d9aa71.1681764681.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'ret' is known to be 0 at the point.
So these lines of code should just be removed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The dead code became after commit 	8358014d6be8 ("f2fs: avoid to check
PG_error flag")
---
 fs/f2fs/node.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bd1dad523796..e7bc87177e18 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2063,7 +2063,7 @@ int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 	struct list_head *head = &sbi->fsync_node_list;
 	unsigned long flags;
 	unsigned int cur_seq_id = 0;
-	int ret2, ret = 0;
+	int ret;
 
 	while (seq_id && cur_seq_id < seq_id) {
 		spin_lock_irqsave(&sbi->fsync_node_lock, flags);
@@ -2084,14 +2084,9 @@ int f2fs_wait_on_node_pages_writeback(struct f2fs_sb_info *sbi,
 		f2fs_wait_on_page_writeback(page, NODE, true, false);
 
 		put_page(page);
-
-		if (ret)
-			break;
 	}
 
-	ret2 = filemap_check_errors(NODE_MAPPING(sbi));
-	if (!ret)
-		ret = ret2;
+	ret = filemap_check_errors(NODE_MAPPING(sbi));
 
 	return ret;
 }
-- 
2.34.1

