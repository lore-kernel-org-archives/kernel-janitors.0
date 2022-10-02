Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB20C433FE
	for <kernel-janitors@archiver.kernel.org>; Sun,  2 Oct 2022 21:11:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiJBVLP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 2 Oct 2022 17:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiJBVLN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 2 Oct 2022 17:11:13 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D380D2ED61
        for <kernel-janitors@vger.kernel.org>; Sun,  2 Oct 2022 14:11:11 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id f6Evo1J2RsfCIf6EvozjHg; Sun, 02 Oct 2022 23:11:09 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Oct 2022 23:11:09 +0200
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] lib: Drop some empty comment blocks
Date:   Sun,  2 Oct 2022 20:40:23 +0200
Message-Id: <5bcc0f7840594afa540be450bca3159a2c616bd3.1664736011.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Commit 588cb88cedd5 ("treewide: Replace GPLv2 boilerplate/reference with
SPDX - rule 120") has left some empty comment blocks.

Remove them to save a few lines of code.

Also remove some useless empty lines between some #include.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 lib/ashldi3.c | 3 ---
 lib/cmpdi2.c  | 3 ---
 lib/muldi3.c  | 2 --
 lib/ucmpdi2.c | 2 --
 4 files changed, 10 deletions(-)

diff --git a/lib/ashldi3.c b/lib/ashldi3.c
index 8e6a69d59180..5dcaf1c89a9d 100644
--- a/lib/ashldi3.c
+++ b/lib/ashldi3.c
@@ -1,9 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
 
 #include <linux/export.h>
-
 #include <linux/libgcc.h>
 
 long long notrace __ashldi3(long long u, word_type b)
diff --git a/lib/cmpdi2.c b/lib/cmpdi2.c
index f7cebd52bd68..37e435f0d0ef 100644
--- a/lib/cmpdi2.c
+++ b/lib/cmpdi2.c
@@ -1,9 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
 
 #include <linux/export.h>
-
 #include <linux/libgcc.h>
 
 word_type notrace __cmpdi2(long long a, long long b)
diff --git a/lib/muldi3.c b/lib/muldi3.c
index 9150ac13050e..34cf53e45ca9 100644
--- a/lib/muldi3.c
+++ b/lib/muldi3.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
 
 #include <linux/export.h>
 #include <linux/libgcc.h>
diff --git a/lib/ucmpdi2.c b/lib/ucmpdi2.c
index 726e394c9fcc..fc001a8f76cd 100644
--- a/lib/ucmpdi2.c
+++ b/lib/ucmpdi2.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/*
- */
 
 #include <linux/module.h>
 #include <linux/libgcc.h>
-- 
2.34.1

