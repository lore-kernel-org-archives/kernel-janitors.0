Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37332C00145
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Dec 2022 19:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233258AbiLLTiB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Dec 2022 14:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbiLLTh7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Dec 2022 14:37:59 -0500
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0124164A1
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Dec 2022 11:37:56 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id 4ocXpvXppb9QW4ocXpZUeo; Mon, 12 Dec 2022 20:37:51 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 12 Dec 2022 20:37:51 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        UNGLinuxDriver@microchip.com,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH net-next] net: lan966x: Remove a useless test in lan966x_ptp_add_trap()
Date:   Mon, 12 Dec 2022 20:37:16 +0100
Message-Id: <27992ffcee47fc865ce87274d6dfcffe7a1e69e0.1670873784.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

vcap_alloc_rule() can't return NULL.

So remove some dead-code

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c b/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
index 300fe4005919..f9ebfaafbebc 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_ptp.c
@@ -76,8 +76,6 @@ static int lan966x_ptp_add_trap(struct lan966x_port *port,
 	vrule = vcap_alloc_rule(lan966x->vcap_ctrl, port->dev,
 				LAN966X_VCAP_CID_IS2_L0,
 				VCAP_USER_PTP, 0, rule_id);
-	if (!vrule)
-		return -ENOMEM;
 	if (IS_ERR(vrule))
 		return PTR_ERR(vrule);
 
-- 
2.34.1

