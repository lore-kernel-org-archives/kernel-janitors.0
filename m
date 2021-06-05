Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E216C4743E
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6534E61416
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhFEQzk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Jun 2021 12:55:40 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:45807 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFEQzj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Jun 2021 12:55:39 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d06 with ME
        id DUto2500721Fzsu03Uto4N; Sat, 05 Jun 2021 18:53:50 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jun 2021 18:53:50 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     arnd@arndb.de, gregkh@linuxfoundation.org,
        mihai.carabas@oracle.com, akpm@linux-foundation.org,
        andriy.shevchenko@linux.intel.com, yuehaibing@huawei.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH] misc/pvpanic: Remove some dead-code
Date:   Sat,  5 Jun 2021 18:53:47 +0200
Message-Id: <8e425618f4042a8ab8366be4d34026972e77bd40.1622911768.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'pvpanic_remove()' is referenced only by a 'devm_add_action_or_reset()'
call in 'devm_pvpanic_probe()'. So, we know that its parameter is non-NULL.

Axe the unneeded check to save a few lines of code.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/pvpanic/pvpanic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/pvpanic/pvpanic.c b/drivers/misc/pvpanic/pvpanic.c
index 82770a088d62..02b807c788c9 100644
--- a/drivers/misc/pvpanic/pvpanic.c
+++ b/drivers/misc/pvpanic/pvpanic.c
@@ -66,9 +66,6 @@ static void pvpanic_remove(void *param)
 	struct pvpanic_instance *pi_cur, *pi_next;
 	struct pvpanic_instance *pi = param;
 
-	if (!pi)
-		return;
-
 	spin_lock(&pvpanic_lock);
 	list_for_each_entry_safe(pi_cur, pi_next, &pvpanic_list, list) {
 		if (pi_cur == pi) {
-- 
2.30.2

