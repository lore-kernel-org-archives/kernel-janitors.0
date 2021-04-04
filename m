Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AD2C433ED
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Apr 2021 09:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABA2C61368
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Apr 2021 09:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhDDJpU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Apr 2021 05:45:20 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:22041 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229550AbhDDJpT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Apr 2021 05:45:19 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d76 with ME
        id oZlD2400B3g7mfN03ZlDM8; Sun, 04 Apr 2021 11:45:14 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Apr 2021 11:45:14 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     ecree.xilinx@gmail.com, habetsm.xilinx@gmail.com,
        davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] sfc: Use 'skb_add_rx_frag()' instead of hand coding it
Date:   Sun,  4 Apr 2021 11:45:11 +0200
Message-Id: <6fadc5ae05b05d9d8ab545e51ee3dcbdaa561393.1617529446.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Some lines of code can be merged into an equivalent 'skb_add_rx_frag()'
call which is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
UNTESTED. Compile tested only

The 'skb->truesize' computation is likely to be slightly slower (n
additions hidden in 'skb_add_rx_frag' instead of 1 multiplication), but I
don't think that it is an issue here.
---
 drivers/net/ethernet/sfc/rx.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/sfc/rx.c b/drivers/net/ethernet/sfc/rx.c
index 89c5c75f479f..17b8119c48e5 100644
--- a/drivers/net/ethernet/sfc/rx.c
+++ b/drivers/net/ethernet/sfc/rx.c
@@ -94,12 +94,11 @@ static struct sk_buff *efx_rx_mk_skb(struct efx_channel *channel,
 		rx_buf->len -= hdr_len;
 
 		for (;;) {
-			skb_fill_page_desc(skb, skb_shinfo(skb)->nr_frags,
-					   rx_buf->page, rx_buf->page_offset,
-					   rx_buf->len);
+			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
+					rx_buf->page, rx_buf->page_offset,
+					rx_buf->len, efx->rx_buffer_truesize);
 			rx_buf->page = NULL;
-			skb->len += rx_buf->len;
-			skb->data_len += rx_buf->len;
+
 			if (skb_shinfo(skb)->nr_frags == n_frags)
 				break;
 
@@ -111,8 +110,6 @@ static struct sk_buff *efx_rx_mk_skb(struct efx_channel *channel,
 		n_frags = 0;
 	}
 
-	skb->truesize += n_frags * efx->rx_buffer_truesize;
-
 	/* Move past the ethernet header */
 	skb->protocol = eth_type_trans(skb, efx->net_dev);
 
-- 
2.27.0

