Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FA9C433DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 17:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6120C6196E
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 17:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhC2RIB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 Mar 2021 13:08:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43417 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhC2RHj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Mar 2021 13:07:39 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lQvMQ-0005B7-AN; Mon, 29 Mar 2021 17:07:30 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] mm/vmalloc: Fix read of pointer area after it has been free'd
Date:   Mon, 29 Mar 2021 18:07:30 +0100
Message-Id: <20210329170730.121943-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the memory pointed to by area is being freed by the
free_vm_area call and then area->nr_pages is referencing the
free'd object. Fix this swapping the order of the warn_alloc
message and the free.

Addresses-Coverity: ("Read from pointer after free")
Fixes: 014ccf9b888d ("mm/vmalloc: improve allocation failure error messages")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index b73e4e715e0d..7936405749e4 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2790,11 +2790,11 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	}
 
 	if (!pages) {
-		free_vm_area(area);
 		warn_alloc(gfp_mask, NULL,
 			   "vmalloc size %lu allocation failure: "
 			   "page array size %lu allocation failed",
 			   area->nr_pages * PAGE_SIZE, array_size);
+		free_vm_area(area);
 		return NULL;
 	}
 
-- 
2.30.2

