Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C32C433C1
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 Mar 2021 17:55:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79F7061964
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 Mar 2021 17:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhC1RzV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 28 Mar 2021 13:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbhC1RzL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 Mar 2021 13:55:11 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8880C061756;
        Sun, 28 Mar 2021 10:55:10 -0700 (PDT)
Received: from ipservice-092-217-065-008.092.217.pools.vodafone-ip.de ([92.217.65.8] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lQZcw-00035s-Nz; Sun, 28 Mar 2021 19:55:06 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: rtl8188eu: remove unused function parameter
Date:   Sun, 28 Mar 2021 19:54:46 +0200
Message-Id: <20210328175446.28063-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

rtw_usb_if1_init does not use its struct usb_device_id parameter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index e18f1fff59ca..fba0af36d302 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -323,8 +323,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
  */
 
 static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
-					struct usb_interface *pusb_intf,
-					const struct usb_device_id *pdid)
+					struct usb_interface *pusb_intf)
 {
 	struct adapter *padapter;
 	struct net_device *pnetdev;
@@ -462,7 +461,7 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
 		goto exit;
 	}
 
-	if1 = rtw_usb_if1_init(dvobj, pusb_intf, pdid);
+	if1 = rtw_usb_if1_init(dvobj, pusb_intf);
 	if (!if1) {
 		pr_debug("rtw_init_primarystruct adapter Failed!\n");
 		goto free_dvobj;
-- 
2.20.1

