Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DC8C46467
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Jan 2023 20:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbjADUlT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Jan 2023 15:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbjADUlS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Jan 2023 15:41:18 -0500
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D71EB9C
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Jan 2023 12:41:12 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id DAZPpIg1LIwEfDAZPpB30n; Wed, 04 Jan 2023 21:41:10 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 04 Jan 2023 21:41:10 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
        Taku Izumi <izumi.taku@jp.fujitsu.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH net-next v2] fjes: Fix an error handling path in fjes_probe()
Date:   Wed,  4 Jan 2023 21:40:47 +0100
Message-Id: <a294f5f3af7e29212a27cc7d17503fba346266b5.1672864635.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

free_netdev() already calls netif_napi_del(), no need to call it
explicitly.
It's harmless, but useless.

Remove the call, make the  error handling path of the probe and the remove
function be consistent one with the other.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Change in v2:
  - Leave the error handling path of the probe as-is, and simplify the
    remove function instead.
  - Removes the Fixes tag. It's finally not at fix, just a consistency
    issue. (was Fixes: 265859309a76 ("fjes: NAPI polling function"))
  - As a consequence, target net-next instead of net, now.

v1:
https://lore.kernel.org/all/fde673f106d2b264ad76759195901aae94691b5c.1671569785.git.christophe.jaillet@wanadoo.fr/
---
 drivers/net/fjes/fjes_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/fjes/fjes_main.c b/drivers/net/fjes/fjes_main.c
index 5805e4a56385..db9c0da82f33 100644
--- a/drivers/net/fjes/fjes_main.c
+++ b/drivers/net/fjes/fjes_main.c
@@ -1324,8 +1324,6 @@ static int fjes_remove(struct platform_device *plat_dev)
 
 	fjes_hw_exit(hw);
 
-	netif_napi_del(&adapter->napi);
-
 	free_netdev(netdev);
 
 	return 0;
-- 
2.34.1

