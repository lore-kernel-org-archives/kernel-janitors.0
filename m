Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6948EC43217
	for <kernel-janitors@archiver.kernel.org>; Sun, 27 Nov 2022 16:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiK0QHq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 27 Nov 2022 11:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiK0QHp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 27 Nov 2022 11:07:45 -0500
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C748563C3
        for <kernel-janitors@vger.kernel.org>; Sun, 27 Nov 2022 08:07:41 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id zKBuo3TEYgfI9zKBuokZLw; Sun, 27 Nov 2022 17:07:39 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 27 Nov 2022 17:07:39 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] io-mapping: Move some code within the include guarded section
Date:   Sun, 27 Nov 2022 17:07:32 +0100
Message-Id: <4dbaf427d4300edba6c6bbfaf4d57493b9bec6ee.1669565241.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

It is spurious to have some code out-side the include guard in a .h file.
Fix it.

Fixes: 1fbaf8fc12a0 ("mm: add a io_mapping_map_user helper")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 include/linux/io-mapping.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
index 66a774d2710e..09d4f17c8d3b 100644
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -213,7 +213,7 @@ io_mapping_free(struct io_mapping *iomap)
 	kfree(iomap);
 }
 
-#endif /* _LINUX_IO_MAPPING_H */
-
 int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
 		unsigned long addr, unsigned long pfn, unsigned long size);
+
+#endif /* _LINUX_IO_MAPPING_H */
-- 
2.34.1

