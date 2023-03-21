Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F11C76195
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Mar 2023 21:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjCUVnW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Mar 2023 17:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjCUVnU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Mar 2023 17:43:20 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51D3A274
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Mar 2023 14:43:19 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id ejlCpyJDJQ3ZFejlGp7IvP; Tue, 21 Mar 2023 22:43:18 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 21 Mar 2023 22:43:18 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: pci-quirks: Remove a useless initialization
Date:   Tue, 21 Mar 2023 22:43:10 +0100
Message-Id: <a3c703152d89a2c6b34b31f0158f84ba504e24d8.1679434951.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3850d93ff40ed12f4724621a540fb5993c0a0fa9.1679434951.git.christophe.jaillet@wanadoo.fr>
References: <3850d93ff40ed12f4724621a540fb5993c0a0fa9.1679434951.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'info' is memset()'ed a few lines below and is not use in the between.

There is no need to initialize one of its field to false here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/host/pci-quirks.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 6b741327d2c4..46f2412dcb40 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -208,7 +208,6 @@ static void usb_amd_find_chipset_info(void)
 {
 	unsigned long flags;
 	struct amd_chipset_info info;
-	info.need_pll_quirk = false;
 
 	spin_lock_irqsave(&amd_lock, flags);
 
-- 
2.34.1

