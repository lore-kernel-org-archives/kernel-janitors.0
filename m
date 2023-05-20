Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9E8C77B7F
	for <kernel-janitors@archiver.kernel.org>; Sat, 20 May 2023 08:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbjETIa0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 20 May 2023 04:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbjETIaY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 20 May 2023 04:30:24 -0400
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8D719A
        for <kernel-janitors@vger.kernel.org>; Sat, 20 May 2023 01:30:23 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 0Hylq5VzBHWsH0HylqQZQ4; Sat, 20 May 2023 10:30:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684571421;
        bh=oQETDRJrVbTE0ETdYYPnZKcQRoVWgLVTmKiK6jA9rrg=;
        h=From:To:Cc:Subject:Date;
        b=fmfKyYeh/B4aI/deh2jAk95LR+ZzeVPc4Ln4zuzzuZFkDAlcfHLp8OTDNASXkHcIV
         Ftg2EZf55rTKYNQYyMOHhGb6iYzriNOgnMPrsPtgbexXDDutlsTdqVgXTXCJOTwH3z
         iLfYflB2vMl9kNWXBMR72sdVKf+wDpI+xcDcI4fmyN470r7OxoLjXaRW5FunRPHCYM
         5yFUiTLe0g6BliVHQPUPpimbXeXzg942AnAX7V+sMjxTIC4jZndhv448LQ6bS+c9cU
         +CGc3tVVhRiPVBE1c46aZ5F8ftOUNKK+D8Jb9T0yKeghb7YoHgAh64NL6P3n4rgmbK
         Ar4Z68IHOFy5g==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 10:30:21 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Rain River <rain.1986.08.12@gmail.com>,
        Zhu Yanjun <zyjzyj2000@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Ayaz Abdulla <aabdulla@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        netdev@vger.kernel.org
Subject: [PATCH net] forcedeth: Fix an error handling path in nv_probe()
Date:   Sat, 20 May 2023 10:30:17 +0200
Message-Id: <355e9a7d351b32ad897251b6f81b5886fcdc6766.1684571393.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If an error occures after calling nv_mgmt_acquire_sema(), it should be
undone with a corresponding nv_mgmt_release_sema() call.

Add it in the error handling path of the probe as already done in the
remove function.

Fixes: cac1c52c3621 ("forcedeth: mgmt unit interface")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I don't think that the Fixes tag is really accurate, but
nv_mgmt_release_sema() was introduced here. And cac1c52c3621 is already old
so should be good enough.
---
 drivers/net/ethernet/nvidia/forcedeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/nvidia/forcedeth.c
index 0605d1ee490d..7a549b834e97 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -6138,6 +6138,7 @@ static int nv_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	return 0;
 
 out_error:
+	nv_mgmt_release_sema(dev);
 	if (phystate_orig)
 		writel(phystate|NVREG_ADAPTCTL_RUNNING, base + NvRegAdapterControl);
 out_freering:
-- 
2.34.1

