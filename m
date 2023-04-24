Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118E6C77B76
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Apr 2023 08:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbjDXIkE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Apr 2023 04:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjDXIkD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Apr 2023 04:40:03 -0400
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F37E51
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Apr 2023 01:40:01 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id qrjpp9pdVS2Yhqrjqpy8BT; Mon, 24 Apr 2023 10:39:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1682325599;
        bh=vgMfnD5w8L8osmiEQCPKAcBxZ5zFalY5WsdQV5PqFVU=;
        h=From:To:Cc:Subject:Date;
        b=X9QChUa0hH2ybgHWlFRyPLmC5Dd0l0eKvnf5G6fJo66FWer4zD/ICt0pjXKSaN76J
         y/J8oE8QazQDRAZkQvMnNDELOuZq66MPu0VaRSnO45ebxzG1gTBVSf6vQqtMTiVdBq
         9xoBjg6jyAfzx8JfM3fWaXhAeOcm6qfWGI7jkifXS6CSNXBFJnF7KIusxzgwfWO70n
         HdvGnUzH2/g3MnX5YgfksRY636m0p6Tc/h4YufQzqyEsAhQ81hgMsLZCI6sYAyX0Zb
         eIrWarETpt4fDopYH99zjv38VHPTW4mYE60syRYxi45Sii3+sZccwAy4t3U2WATTOD
         uOREdSNVtKMWw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Apr 2023 10:39:59 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: mux: Remove some unneeded includes
Date:   Mon, 24 Apr 2023 10:39:56 +0200
Message-Id: <1db1e8bd253cbb652835c0cef6a0a2bb9a4970eb.1682325582.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This driver includes many header files that are unneeded.
Remove them and add <linux/device.h> where devm_kzalloc() is defined.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Based on one of my script, this reduces the number of included files
during the build process of this file from 551 to 345.
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index f62516dafe8f..c07856069d43 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -3,14 +3,11 @@
  * Copyright (C) 2022 Linaro Ltd.
  */
 
-#include <linux/bits.h>
-#include <linux/i2c.h>
-#include <linux/kernel.h>
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 
-- 
2.34.1

