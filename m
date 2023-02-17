Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81B9C636D4
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Feb 2023 08:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjBQICw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 17 Feb 2023 03:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBQICv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Feb 2023 03:02:51 -0500
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3AB5E580
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Feb 2023 00:01:57 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id SvggpHzY6ReC5Svghp1MLD; Fri, 17 Feb 2023 09:01:47 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 17 Feb 2023 09:01:47 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kvm@vger.kernel.org
Subject: [PATCH] KVM: Reorder fields in 'struct kvm_mmu_memory_cache'
Date:   Fri, 17 Feb 2023 09:01:38 +0100
Message-Id: <f9423a6ee10d91bd6bad32beefd1b96cad4d28f1.1676620879.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Group some variables based on their sizes to reduce hole and avoid padding.
On x86_64, this shrinks the size from 40 to 32 bytes.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Using pahole

Before:
======
struct kvm_mmu_memory_cache {
	int                        nobjs;                /*     0     4 */
	gfp_t                      gfp_zero;             /*     4     4 */
	gfp_t                      gfp_custom;           /*     8     4 */

	/* XXX 4 bytes hole, try to pack */

	struct kmem_cache *        kmem_cache;           /*    16     8 */
	int                        capacity;             /*    24     4 */

	/* XXX 4 bytes hole, try to pack */

	void * *                   objects;              /*    32     8 */

	/* size: 40, cachelines: 1, members: 6 */
	/* sum members: 32, holes: 2, sum holes: 8 */
	/* last cacheline: 40 bytes */
};
---
 include/linux/kvm_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 2728d49bbdf6..76af8425dbc6 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -94,8 +94,8 @@ struct kvm_mmu_memory_cache {
 	int nobjs;
 	gfp_t gfp_zero;
 	gfp_t gfp_custom;
-	struct kmem_cache *kmem_cache;
 	int capacity;
+	struct kmem_cache *kmem_cache;
 	void **objects;
 };
 #endif
-- 
2.34.1

