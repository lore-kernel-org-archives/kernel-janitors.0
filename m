Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC10C433B4
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Apr 2021 12:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A12561382
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Apr 2021 12:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhDDMnH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Apr 2021 08:43:07 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:27469 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhDDMnG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Apr 2021 08:43:06 -0400
Received: from localhost.localdomain ([90.126.11.170])
        by mwinf5d25 with ME
        id ocj02400K3g7mfN03cj0LR; Sun, 04 Apr 2021 14:43:01 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Apr 2021 14:43:01 +0200
X-ME-IP: 90.126.11.170
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     aelior@marvell.com, GR-everest-linux-l2@marvell.com,
        davem@davemloft.net, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] qede: Use 'skb_add_rx_frag()' instead of hand coding it
Date:   Sun,  4 Apr 2021 14:42:57 +0200
Message-Id: <ee2f585f0fdb993366b1e33a01a4a268ba05e6f9.1617540100.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1c27abb938a430e58bd644729597015b3414d4aa.1617540100.git.christophe.jaillet@wanadoo.fr>
References: <1c27abb938a430e58bd644729597015b3414d4aa.1617540100.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Some lines of code can be merged into an equivalent 'skb_add_rx_frag()'
call which is less verbose.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/qlogic/qede/qede_fp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_fp.c b/drivers/net/ethernet/qlogic/qede/qede_fp.c
index ee3e45e38cb7..8e150dd4f899 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_fp.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_fp.c
@@ -1209,12 +1209,9 @@ static int qede_rx_build_jumbo(struct qede_dev *edev,
 		dma_unmap_page(rxq->dev, bd->mapping,
 			       PAGE_SIZE, DMA_FROM_DEVICE);
 
-		skb_fill_page_desc(skb, skb_shinfo(skb)->nr_frags,
-				   bd->data, rxq->rx_headroom, cur_size);
+		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, bd->data,
+				rxq->rx_headroom, cur_size, PAGE_SIZE);
 
-		skb->truesize += PAGE_SIZE;
-		skb->data_len += cur_size;
-		skb->len += cur_size;
 		pkt_len -= cur_size;
 	}
 
-- 
2.27.0

