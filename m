Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEBAC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 21:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A199610C9
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 21:06:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346751AbhIGVHp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 17:07:45 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:43552 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346455AbhIGVHp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 17:07:45 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d16 with ME
        id r96Z250053riaq20396ZGW; Tue, 07 Sep 2021 23:06:35 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 07 Sep 2021 23:06:35 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     minyard@acm.org, zweiss@equinix.com, andrew@aj.id.au
Cc:     openipmi-developer@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ipmi: kcs_bmc: Fix a memory leak in the error handling path of 'kcs_bmc_serio_add_device()'
Date:   Tue,  7 Sep 2021 23:06:32 +0200
Message-Id: <ecbfa15e94e64f4b878ecab1541ea46c74807670.1631048724.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In the unlikely event where 'devm_kzalloc()' fails and 'kzalloc()'
succeeds, 'port' would be leaking.

Test each allocation separately to avoid the leak.

Fixes: 3a3d2f6a4c64 ("ipmi: kcs_bmc: Add serio adaptor")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/char/ipmi/kcs_bmc_serio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/kcs_bmc_serio.c b/drivers/char/ipmi/kcs_bmc_serio.c
index 7948cabde50b..7e2067628a6c 100644
--- a/drivers/char/ipmi/kcs_bmc_serio.c
+++ b/drivers/char/ipmi/kcs_bmc_serio.c
@@ -73,10 +73,12 @@ static int kcs_bmc_serio_add_device(struct kcs_bmc_device *kcs_bmc)
 	struct serio *port;
 
 	priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
 
 	/* Use kzalloc() as the allocation is cleaned up with kfree() via serio_unregister_port() */
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
-	if (!(priv && port))
+	if (!port)
 		return -ENOMEM;
 
 	port->id.type = SERIO_8042;
-- 
2.30.2

