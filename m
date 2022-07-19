Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A78BC43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 19 Jul 2022 10:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237366AbiGSKFq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 19 Jul 2022 06:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237506AbiGSKFm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jul 2022 06:05:42 -0400
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9765DB1F0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 03:05:41 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id Dk6gojXzsnnjODk6goncEr; Tue, 19 Jul 2022 12:05:39 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 19 Jul 2022 12:05:39 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        ocfs2-devel@oss.oracle.com
Subject: [PATCH 3/3] ocfs2: use the bitmap API to simplify code
Date:   Tue, 19 Jul 2022 12:05:33 +0200
Message-Id: <0a0d6e9bf9d10f67b7a0c1cdd6176cdd0ad2e1f6.1658224839.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bd6796635e58f9c47cf857573c3b9474a00ce26a.1658224839.git.christophe.jaillet@wanadoo.fr>
References: <bd6796635e58f9c47cf857573c3b9474a00ce26a.1658224839.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use bitmap_zero() instead of hand-writing it.
It is less verbose.

While at it, add an explicit #include <linux/bitmap.h>.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ocfs2/heartbeat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/heartbeat.c b/fs/ocfs2/heartbeat.c
index 4863ad35c242..e243cd99e63f 100644
--- a/fs/ocfs2/heartbeat.c
+++ b/fs/ocfs2/heartbeat.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2002, 2004 Oracle.  All rights reserved.
  */
 
+#include <linux/bitmap.h>
 #include <linux/fs.h>
 #include <linux/types.h>
 #include <linux/highmem.h>
@@ -29,8 +30,7 @@
 static void ocfs2_node_map_init(struct ocfs2_node_map *map)
 {
 	map->num_nodes = OCFS2_NODE_MAP_MAX_NODES;
-	memset(map->map, 0, BITS_TO_LONGS(OCFS2_NODE_MAP_MAX_NODES) *
-	       sizeof(unsigned long));
+	bitmap_zero(map->map, OCFS2_NODE_MAP_MAX_NODES);
 }
 
 void ocfs2_init_node_maps(struct ocfs2_super *osb)
-- 
2.34.1

