Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38519C636CC
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Jan 2023 18:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235316AbjA2SXt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 29 Jan 2023 13:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235300AbjA2SXp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Jan 2023 13:23:45 -0500
Received: from smtp.smtpout.orange.fr (smtp-12.smtpout.orange.fr [80.12.242.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43ACF1C599
        for <kernel-janitors@vger.kernel.org>; Sun, 29 Jan 2023 10:23:40 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id MCKlpGwDQMaRbMCL4pnjkG; Sun, 29 Jan 2023 19:23:38 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Jan 2023 19:23:38 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     gregkh@linuxfoundation.org, peterz@infradead.org, pmladek@suse.com,
        john.ogness@linutronix.de, baolu.lu@linux.intel.com,
        tglx@linutronix.de, mingo@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] usb: early: xhci-dbc: Use memcpy_and_pad()
Date:   Sun, 29 Jan 2023 19:23:10 +0100
Message-Id: <b447a7e9778d3f9e6997eb9494f1687dc2d5d3bf.1675016180.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1675016180.git.christophe.jaillet@wanadoo.fr>
References: <cover.1675016180.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Instead of zeroing some memory and then copying data in part or all of it,
use memcpy_and_pad().
This avoids writing some memory twice and should save a few cycles.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/early/xhci-dbc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 965a24e47c0f..341408410ed9 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -499,8 +499,7 @@ static int xdbc_bulk_transfer(void *data, int size, bool read)
 		addr = xdbc.in_dma;
 		xdbc.flags |= XDBC_FLAGS_IN_PROCESS;
 	} else {
-		memset(xdbc.out_buf, 0, XDBC_MAX_PACKET);
-		memcpy(xdbc.out_buf, data, size);
+		memcpy_and_pad(xdbc.out_buf, XDBC_MAX_PACKET, data, size, 0);
 		addr = xdbc.out_dma;
 		xdbc.flags |= XDBC_FLAGS_OUT_PROCESS;
 	}
-- 
2.34.1

