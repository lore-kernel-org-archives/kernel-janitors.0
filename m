Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF329C4167B
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Dec 2022 20:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234321AbiLTU5R (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Dec 2022 15:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbiLTU5O (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Dec 2022 15:57:14 -0500
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B00C193DB
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Dec 2022 12:57:11 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 7jfgp6zGQPNsN7jfgpkyQP; Tue, 20 Dec 2022 21:57:09 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 20 Dec 2022 21:57:09 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Taku Izumi <izumi.taku@jp.fujitsu.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH net] fjes: Fix an error handling path in fjes_probe()
Date:   Tue, 20 Dec 2022 21:57:06 +0100
Message-Id: <fde673f106d2b264ad76759195901aae94691b5c.1671569785.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

A netif_napi_add() call is hidden in fjes_sw_init(). It should be undone
by a corresponding netif_napi_del() call in the error handling path of the
probe, as already done inthe remove function.

Fixes: 265859309a76 ("fjes: NAPI polling function")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/fjes/fjes_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/fjes/fjes_main.c b/drivers/net/fjes/fjes_main.c
index 2513be6d4e11..01b4c9c6adbd 100644
--- a/drivers/net/fjes/fjes_main.c
+++ b/drivers/net/fjes/fjes_main.c
@@ -1370,7 +1370,7 @@ static int fjes_probe(struct platform_device *plat_dev)
 	adapter->txrx_wq = alloc_workqueue(DRV_NAME "/txrx", WQ_MEM_RECLAIM, 0);
 	if (unlikely(!adapter->txrx_wq)) {
 		err = -ENOMEM;
-		goto err_free_netdev;
+		goto err_del_napi;
 	}
 
 	adapter->control_wq = alloc_workqueue(DRV_NAME "/control",
@@ -1431,6 +1431,8 @@ static int fjes_probe(struct platform_device *plat_dev)
 	destroy_workqueue(adapter->control_wq);
 err_free_txrx_wq:
 	destroy_workqueue(adapter->txrx_wq);
+err_del_napi:
+	netif_napi_del(&adapter->napi);
 err_free_netdev:
 	free_netdev(netdev);
 err_out:
-- 
2.34.1

