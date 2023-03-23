Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F277BC76196
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Mar 2023 19:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbjCWTkf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Mar 2023 15:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbjCWTk2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Mar 2023 15:40:28 -0400
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4DF20D22
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Mar 2023 12:40:27 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id fQnPptlrMzvWyfQnPpVPOc; Thu, 23 Mar 2023 20:40:25 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 23 Mar 2023 20:40:25 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: pci-quirks: Reduce the length of a spinlock section in usb_amd_find_chipset_info()
Date:   Thu, 23 Mar 2023 20:40:22 +0100
Message-Id: <08ee42fced6af6bd56892cd14f2464380ab071fa.1679600396.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'info' is local to the function. There is no need to zeroing it within
a spin_lock section. Moreover, there is no need to explicitly initialize
the .need_pll_quirk field.

Initialize the structure when defined and remove the now useless memset().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/host/pci-quirks.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index ef08d68b9714..2665832f9add 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -207,8 +207,7 @@ EXPORT_SYMBOL_GPL(sb800_prefetch);
 static void usb_amd_find_chipset_info(void)
 {
 	unsigned long flags;
-	struct amd_chipset_info info;
-	info.need_pll_quirk = false;
+	struct amd_chipset_info info = { };
 
 	spin_lock_irqsave(&amd_lock, flags);
 
@@ -218,7 +217,6 @@ static void usb_amd_find_chipset_info(void)
 		spin_unlock_irqrestore(&amd_lock, flags);
 		return;
 	}
-	memset(&info, 0, sizeof(info));
 	spin_unlock_irqrestore(&amd_lock, flags);
 
 	if (!amd_chipset_sb_type_init(&info)) {
-- 
2.34.1

