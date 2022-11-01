Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47417C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 21:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiKAVQZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbiKAVPo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:15:44 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556041F9C5
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:15:25 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pyanoKD2rsfCIpybToWfKU; Tue, 01 Nov 2022 22:15:24 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:24 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        damon@lists.linux.dev, linux-mm@kvack.org
Subject: [PATCH 20/30] mm/damon: Use kstrtobool() instead of strtobool()
Date:   Tue,  1 Nov 2022 22:14:08 +0100
Message-Id: <ed2b46489a513988688decb53850339cc228940c.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

strtobool() is the same as kstrtobool().
However, the latter is more used within the kernel.

In order to remove strtobool() and slightly simplify kstrtox.h, switch to
the other function name.

While at it, include the corresponding header file (<linux/kstrtox.h>)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is part of a serie that axes all usages of strtobool().
Each patch can be applied independently from the other ones.

The last patch of the serie removes the definition of strtobool().

You may not be in copy of the cover letter. So, if needed, it is available
at [1].

[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 mm/damon/lru_sort.c | 3 ++-
 mm/damon/reclaim.c  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/damon/lru_sort.c b/mm/damon/lru_sort.c
index 2a532e3983df..7b8fce2f67a8 100644
--- a/mm/damon/lru_sort.c
+++ b/mm/damon/lru_sort.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) "damon-lru-sort: " fmt
 
 #include <linux/damon.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 
 #include "modules-common.h"
@@ -241,7 +242,7 @@ static int damon_lru_sort_enabled_store(const char *val,
 	bool enable;
 	int err;
 
-	err = strtobool(val, &enable);
+	err = kstrtobool(val, &enable);
 	if (err)
 		return err;
 
diff --git a/mm/damon/reclaim.c b/mm/damon/reclaim.c
index e57604bec06d..e82631f39481 100644
--- a/mm/damon/reclaim.c
+++ b/mm/damon/reclaim.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) "damon-reclaim: " fmt
 
 #include <linux/damon.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 
 #include "modules-common.h"
@@ -187,7 +188,7 @@ static int damon_reclaim_enabled_store(const char *val,
 	bool enable;
 	int err;
 
-	err = strtobool(val, &enable);
+	err = kstrtobool(val, &enable);
 	if (err)
 		return err;
 
-- 
2.34.1

