Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06509C77B61
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Apr 2023 06:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjDXG4x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Apr 2023 02:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbjDXG4v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Apr 2023 02:56:51 -0400
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ACF130C3
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Apr 2023 23:56:38 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id qq7npmbKSs9Agqq7oprqv5; Mon, 24 Apr 2023 08:56:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1682319396;
        bh=sv4+9V+79L7JIkIFQr4LHHxT2Rej6AyKPx3VrA1kgYY=;
        h=From:To:Cc:Subject:Date;
        b=KjzVa0KUsTUUxW75B+QaBRVX2IB/LaPlhbU9LpOf40XLRm4wddYLfaI61b4zq9yhc
         hMOQgUXUhUq/7RNkDJ0kB18PD6PslFnCqaJ5taYbtMzH/NwqVxf69akBHu9EEpn7rj
         mrNIwv1awCRkC0YU4WC00qsm+RZkqhVluqphOdyG3mSTgzi9D8peC2jyqqJcPLR7by
         OZ+FYaBvxABwCOgX++jZHtPN44ukx0rsG6o5EBtdVI4AYWTag4YKoNvOOfkcZrhtxu
         QJjjo0ImDfNu1ONfXPQ7kMqRuP9HdxJ1RCe2szaNM0fWvITZi96aBSZ2pIfUK8ntwE
         kwzA8gKI/IhBw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Apr 2023 08:56:36 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mfd: rc5t583-irq: Remove the unneeded include <linux/i2c.h>
Date:   Mon, 24 Apr 2023 08:56:34 +0200
Message-Id: <128025bf5b81f5424db2202b0c8cfd9722c28aab.1682319383.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This driver does not use i2c, so there is no point in including
<linux/i2c.h>

Remove it and add the needed <linux/device.h> instead, which is much more
lightweight.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/rc5t583-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rc5t583-irq.c b/drivers/mfd/rc5t583-irq.c
index 621ea61fa7c6..97f52b671520 100644
--- a/drivers/mfd/rc5t583-irq.c
+++ b/drivers/mfd/rc5t583-irq.c
@@ -8,9 +8,9 @@
  * based on code
  *      Copyright (C) 2011 RICOH COMPANY,LTD
  */
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/i2c.h>
 #include <linux/mfd/rc5t583.h>
 
 enum int_type {
-- 
2.34.1

