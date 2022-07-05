Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B94DC43334
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Jul 2022 20:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbiGEU0F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 5 Jul 2022 16:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiGEU0E (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Jul 2022 16:26:04 -0400
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr [80.12.242.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA76193C4
        for <kernel-janitors@vger.kernel.org>; Tue,  5 Jul 2022 13:26:03 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 8p7QoAYdDAym28p7QoRaxL; Tue, 05 Jul 2022 22:26:01 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 05 Jul 2022 22:26:01 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH] cnic: Use the bitmap API to allocate bitmaps
Date:   Tue,  5 Jul 2022 22:25:58 +0200
Message-Id: <521bd2a49be5d88e493bcfb63505d3df91a1c2d2.1657052743.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/broadcom/cnic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index f7f10cfb3476..e86503d97f32 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -660,7 +660,7 @@ static int cnic_init_id_tbl(struct cnic_id_tbl *id_tbl, u32 size, u32 start_id,
 	id_tbl->max = size;
 	id_tbl->next = next;
 	spin_lock_init(&id_tbl->lock);
-	id_tbl->table = kcalloc(BITS_TO_LONGS(size), sizeof(long), GFP_KERNEL);
+	id_tbl->table = bitmap_zalloc(size, GFP_KERNEL);
 	if (!id_tbl->table)
 		return -ENOMEM;
 
@@ -669,7 +669,7 @@ static int cnic_init_id_tbl(struct cnic_id_tbl *id_tbl, u32 size, u32 start_id,
 
 static void cnic_free_id_tbl(struct cnic_id_tbl *id_tbl)
 {
-	kfree(id_tbl->table);
+	bitmap_free(id_tbl->table);
 	id_tbl->table = NULL;
 }
 
-- 
2.34.1

