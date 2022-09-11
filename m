Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9AEC6FA83
	for <kernel-janitors@archiver.kernel.org>; Sun, 11 Sep 2022 11:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiIKLjK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 11 Sep 2022 07:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbiIKLjI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Sep 2022 07:39:08 -0400
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr [80.12.242.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394C638441
        for <kernel-janitors@vger.kernel.org>; Sun, 11 Sep 2022 04:39:07 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id XLIlo9qwZGYmzXLIloWpvx; Sun, 11 Sep 2022 13:39:05 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Sep 2022 13:39:05 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        James Chapman <jchapman@katalix.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH] headers: Remove some left-over license text
Date:   Sun, 11 Sep 2022 13:39:01 +0200
Message-Id: <0e5ff727626b748238f4b78932f81572143d8f0b.1662896317.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove a left-over from commit 2874c5fd2842 ("treewide: Replace GPLv2
boilerplate/reference with SPDX - rule 152")

There is no need for an empty "License:".

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/if_pppol2tp.h | 2 --
 include/linux/if_pppox.h    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/include/linux/if_pppol2tp.h b/include/linux/if_pppol2tp.h
index 96d40942e5a3..c87efd333faa 100644
--- a/include/linux/if_pppol2tp.h
+++ b/include/linux/if_pppol2tp.h
@@ -4,8 +4,6 @@
  *
  * This file supplies definitions required by the PPP over L2TP driver
  * (l2tp_ppp.c).  All version information wrt this file is located in l2tp_ppp.c
- *
- * License:
  */
 #ifndef __LINUX_IF_PPPOL2TP_H
 #define __LINUX_IF_PPPOL2TP_H
diff --git a/include/linux/if_pppox.h b/include/linux/if_pppox.h
index 69e813bcb947..ff3beda1312c 100644
--- a/include/linux/if_pppox.h
+++ b/include/linux/if_pppox.h
@@ -5,8 +5,6 @@
  *
  * This file supplies definitions required by the PPP over Ethernet driver
  * (pppox.c).  All version information wrt this file is located in pppox.c
- *
- * License:
  */
 #ifndef __LINUX_IF_PPPOX_H
 #define __LINUX_IF_PPPOX_H
-- 
2.34.1

