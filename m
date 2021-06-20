Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62007C49361
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 17:53:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A415610CA
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Jun 2021 17:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhFTRzj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Jun 2021 13:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhFTRzg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Jun 2021 13:55:36 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC91C061574;
        Sun, 20 Jun 2021 10:53:19 -0700 (PDT)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lv1dE-00012S-JA; Sun, 20 Jun 2021 19:53:16 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/13] staging: rtl8188eu: handle errors from dev_alloc_name
Date:   Sun, 20 Jun 2021 19:52:49 +0200
Message-Id: <20210620175301.14988-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Fail the usb interface initialization if dev_alloc_name returns an error.

Other wlan drivers like natsemi or atmel use the same error handling.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 5ca54dc36fa9..ee209b2fe4fe 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -387,8 +387,11 @@ static int rtw_usb_if1_init(struct usb_interface *pusb_intf)
 		pr_debug("can't get autopm:\n");
 
 	/*  alloc dev name after read efuse. */
-	if (dev_alloc_name(pnetdev, padapter->registrypriv.ifname) < 0)
+	err = dev_alloc_name(pnetdev, padapter->registrypriv.ifname);
+	if (err < 0) {
 		RT_TRACE(_module_os_intfs_c_, _drv_err_, ("dev_alloc_name, fail!\n"));
+		goto free_hal_data;
+	}
 
 	netif_carrier_off(pnetdev);
 
-- 
2.20.1

