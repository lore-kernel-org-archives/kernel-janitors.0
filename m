Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2EBC432BE
	for <kernel-janitors@archiver.kernel.org>; Sat, 21 Aug 2021 14:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2D4761208
	for <kernel-janitors@archiver.kernel.org>; Sat, 21 Aug 2021 14:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbhHUO6R (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 21 Aug 2021 10:58:17 -0400
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:60135 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhHUO6Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 Aug 2021 10:58:16 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d87 with ME
        id kExX2500F3riaq203ExYwV; Sat, 21 Aug 2021 16:57:36 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Aug 2021 16:57:36 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     agust@denx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, alex.popov@linux.com
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] powerpc/512x: Fix an error handling path in 'mpc512x_lpbfifo_kick()'
Date:   Sat, 21 Aug 2021 16:57:30 +0200
Message-Id: <3d57a9d4ff752a4ff1dd977552641795dc9db83f.1629557783.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

At this point 'dma_map_single()' has not been called yet, so there is no
point in branching in the error handling path to undo it.

Use a direct return instead.

Fixes: 1a4bb93f7955 ("powerpc/512x: add LocalPlus Bus FIFO device driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is speculative. Review with care.
---
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 04bf6ecf7d55..85e0fa7d902b 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -240,10 +240,8 @@ static int mpc512x_lpbfifo_kick(void)
 	dma_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	/* Make DMA channel work with LPB FIFO data register */
-	if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
-		ret = -EINVAL;
-		goto err_dma_prep;
-	}
+	if (dma_dev->device_config(lpbfifo.chan, &dma_conf))
+		return -EINVAL;
 
 	sg_init_table(&sg, 1);
 
-- 
2.30.2

