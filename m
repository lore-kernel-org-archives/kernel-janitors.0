Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33003C7EE23
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jun 2023 04:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjFDEmI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Jun 2023 00:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjFDEmH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Jun 2023 00:42:07 -0400
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF675CF
        for <kernel-janitors@vger.kernel.org>; Sat,  3 Jun 2023 21:42:05 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 5fZ4q5cPPbOsk5fZ4qqpwK; Sun, 04 Jun 2023 06:42:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1685853723;
        bh=/V3bb2t3S9ERy4bkX7WFDcRfY60GVE2pPffF3L5h38c=;
        h=From:To:Cc:Subject:Date;
        b=CfFUQY2teH7AsnaLHJL4lU6kx8XHXzOginGc3EugTHKqGjSBqn6frzcO2Ow4Oxq5N
         u+MrEJcvu5TLU8KvNlRI/F3YR22pjozCHyQyF7xGZgy52CFqWTzLfrcdyxsTlAwewu
         rfJ8QFZmH3oKkgsOkBkrcjBS3qE++cL9UuFQ9nO51UaoVxGio2Sgw483VEWPQRxOuC
         bvQxV2Hp8AOU8SGgAiozPUWTIw71aYBGBU5NKp4PmDGK/Ww3de9LxfiKdklRNSvPnJ
         kM4B2ySerIGcJl3bt02cQhgLgXdNyAAjF0WTA+KcU+0p40cqUyS+0JRIeSEQcpd0xt
         0Cf2NTYAD05Gw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 04 Jun 2023 06:42:03 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdpart: Drop useless LIST_HEAD
Date:   Sun,  4 Jun 2023 06:42:01 +0200
Message-Id: <547248195d87d1240d6126d13eb1364b1a0b634d.1685853690.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'tmp_list' is unused, so drop it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This was introduced in commit 46b5889cc2c5 ("mtd: implement proper partition handling")
---
 drivers/mtd/mtdpart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 85f5ee6f06fc..a46affbb037d 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -326,7 +326,6 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 static int __del_mtd_partitions(struct mtd_info *mtd)
 {
 	struct mtd_info *child, *next;
-	LIST_HEAD(tmp_list);
 	int ret, err = 0;
 
 	list_for_each_entry_safe(child, next, &mtd->partitions, part.node) {
-- 
2.34.1

