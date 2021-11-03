Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C781C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Nov 2021 21:35:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AC8B60F9D
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Nov 2021 21:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhKCViO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Nov 2021 17:38:14 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:56141 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhKCViN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Nov 2021 17:38:13 -0400
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id iNuxmLey8BazoiNuxmx1Ci; Wed, 03 Nov 2021 22:35:36 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 03 Nov 2021 22:35:36 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mm/mremap_pages: Save a few cycles in 'get_dev_pagemap()'
Date:   Wed,  3 Nov 2021 22:35:34 +0100
Message-Id: <b4a47154877853cc64be3a35dcfd594d40cc2bce.1635975283.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use 'percpu_ref_tryget_live_rcu()' instead of 'percpu_ref_tryget_live()' to
save a few cycles when it is known that the rcu lock is already
taken/released.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 mm/memremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 84de22c14567..012e8d23d365 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -506,7 +506,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 	/* fall back to slow path lookup */
 	rcu_read_lock();
 	pgmap = xa_load(&pgmap_array, PHYS_PFN(phys));
-	if (pgmap && !percpu_ref_tryget_live(pgmap->ref))
+	if (pgmap && !percpu_ref_tryget_live_rcu(pgmap->ref))
 		pgmap = NULL;
 	rcu_read_unlock();
 
-- 
2.30.2

