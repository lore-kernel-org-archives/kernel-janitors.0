Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686CAC433F5
	for <kernel-janitors@archiver.kernel.org>; Sun, 24 Oct 2021 11:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DBEA6101C
	for <kernel-janitors@archiver.kernel.org>; Sun, 24 Oct 2021 11:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbhJXLzD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 24 Oct 2021 07:55:03 -0400
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:57041 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhJXLzC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 24 Oct 2021 07:55:02 -0400
Received: from pop-os.home ([92.140.161.106])
        by smtp.orange.fr with ESMTPA
        id ec3Kms3YFLyIyec3KmZeWF; Sun, 24 Oct 2021 13:52:40 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 24 Oct 2021 13:52:40 +0200
X-ME-IP: 92.140.161.106
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jeroendb@google.com, csully@google.com, awogbemila@google.com,
        davem@davemloft.net, kuba@kernel.org, willemb@google.com,
        bcf@google.com, gustavoars@kernel.org, edumazet@google.com,
        jfraker@google.com, yangchun@google.com, xliutaox@google.com,
        sagis@google.com, lrizzo@google.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] gve: Fix a possible invalid memory access
Date:   Sun, 24 Oct 2021 13:52:37 +0200
Message-Id: <fb712f802228ab4319891983164bf45e90d529e7.1635076200.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

It is spurious to allocate a bitmap for 'num_qpls' bits and record the
size of this bitmap with another value.

'qpl_map_size' is used in 'drivers/net/ethernet/google/gve/gve.h' with
'find_[first|next]_zero_bit()'.
So, it looks that memory after the allocated 'qpl_id_map' could be
scanned.

Remove the '* BITS_PER_BYTE' to have allocation and length be the same.

Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is completely speculative and un-tested!
You'll be warned.
---
 drivers/net/ethernet/google/gve/gve_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 7647cd05b1d2..19fe9e9b62f5 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -866,7 +866,7 @@ static int gve_alloc_qpls(struct gve_priv *priv)
 	}
 
 	priv->qpl_cfg.qpl_map_size = BITS_TO_LONGS(num_qpls) *
-				     sizeof(unsigned long) * BITS_PER_BYTE;
+				     sizeof(unsigned long);
 	priv->qpl_cfg.qpl_id_map = kvcalloc(BITS_TO_LONGS(num_qpls),
 					    sizeof(unsigned long), GFP_KERNEL);
 	if (!priv->qpl_cfg.qpl_id_map) {
-- 
2.30.2

