Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A87C7EE24
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 19:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243399AbjEOTJY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 15:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242268AbjEOTJX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 15:09:23 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18314100DC
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 12:09:22 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id ydZNpe93Z4EobydZNpkGvL; Mon, 15 May 2023 21:09:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684177760;
        bh=zACXJ1h4Wvn8bpxBXMt599tP1i74X5J3NU0zEKmumlQ=;
        h=From:To:Cc:Subject:Date;
        b=EZ1E8N1HPbyOUIsJmwq/apxM3uqLJ9JMBchA4b8ZR1Em53R8jLyIRCZYebKjvhQyM
         SxhGsNrUzhIGnQKmBIMYNzCrgzdOier+rcs9ROhGZ47k5WOUbdNBH0FlkzLq2K3pUA
         e1F3bX0YxT8R6QUq13rHP1rOzaTG5Nz6rx6S81R30Fn3ybdg1N/JOr3dZqC/rLwxtx
         927wDflqKO5DtdZ3+Zz4Gyi1aIEW8yqRxIcnkTsjOpVL3jaolZcZ6ws9sTad2xxcBh
         LC5z5W4K/JC82rJFJI74+dvNZ2pB4cGevalo5Rd+Vo6Vb65LEvn/KPkB8Lq1KkyICi
         3yb+lIfHWUwHg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 May 2023 21:09:20 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jaswinder Singh <jaswinder@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH] cassini: Fix a memory leak in the error handling path of cas_init_one()
Date:   Mon, 15 May 2023 21:09:11 +0200
Message-Id: <de2bb89d2c9c49198353c3d66fa9b67ce6c0f191.1684177731.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

cas_saturn_firmware_init() allocates some memory using vmalloc(). This
memory is freed in the .remove() function but not it the error handling
path of the probe.

Add the missing vfree() to avoid a memory leak, should an error occur.

Fixes: fcaa40669cd7 ("cassini: use request_firmware")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/sun/cassini.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/sun/cassini.c b/drivers/net/ethernet/sun/cassini.c
index 2d52f54ebb45..b317b9486455 100644
--- a/drivers/net/ethernet/sun/cassini.c
+++ b/drivers/net/ethernet/sun/cassini.c
@@ -5073,6 +5073,8 @@ static int cas_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		cas_shutdown(cp);
 	mutex_unlock(&cp->pm_mutex);
 
+	vfree(cp->fw_data);
+
 	pci_iounmap(pdev, cp->regs);
 
 
-- 
2.34.1

