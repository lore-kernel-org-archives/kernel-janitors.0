Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B334C7618E
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Apr 2023 07:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbjDXHA7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Apr 2023 03:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjDXHA6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Apr 2023 03:00:58 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C8911A
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Apr 2023 00:00:57 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id qqBypjQGQMX1TqqBzpkSDy; Mon, 24 Apr 2023 09:00:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1682319656;
        bh=wimltcHWO++ccTmg1YhHLldcbR0vJLqg7EEkwCCKOd4=;
        h=From:To:Cc:Subject:Date;
        b=tYFGVyJamE+84N6Du0duGjtA45vtpH3lXYr/wBG5zP91KQsm8wCKhcoJuilFFoH5p
         3VfQMqkGe2Adk43j0dqVoiYo6ZaTt5BDeR9eaNwfwwPeCZGhKvzGlV7K8F8Ae2a05c
         wwDvkkm0dGyGRiJWikGBJxINKVt6Nckb5207iOv266Zg+TTizPcwJbe18YP8sNkaQF
         zo2qjmGFhbXmY90vofUAfSUxKCVpbk40t2KNOZ+SZ2PRhFL/moXpVKdlzi0l/3HNrn
         vTXMiaparxw5xNTivlk16QdkBx7qBxelHzV546NEpQxbAoQHuCDCYRdAU4nPHFIfGp
         147PLus3An8Gw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Apr 2023 09:00:56 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] misc: smpro-errmon: Remove the unneeded include <linux/i2c.h>
Date:   Mon, 24 Apr 2023 09:00:53 +0200
Message-Id: <002f7afb1a2935bc2357c4b1450b757f40902a8c.1682319647.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This driver does not use i2c, so there is no point in including
<linux/i2c.h>

Remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/misc/smpro-errmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
index a1f0b2c77fac..c12035a46585 100644
--- a/drivers/misc/smpro-errmon.c
+++ b/drivers/misc/smpro-errmon.c
@@ -6,7 +6,6 @@
  *
  */
 
-#include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.34.1

