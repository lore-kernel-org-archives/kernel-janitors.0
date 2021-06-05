Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C63C4743F
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F89861417
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhFERBX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Jun 2021 13:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhFERBW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Jun 2021 13:01:22 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC42C061766;
        Sat,  5 Jun 2021 09:59:33 -0700 (PDT)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lpZdx-0002hw-VM; Sat, 05 Jun 2021 18:59:30 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 9/9] staging: rtl8188eu: remove unused function parameter
Date:   Sat,  5 Jun 2021 18:58:58 +0200
Message-Id: <20210605165858.3175-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605165858.3175-1-martin@kaiser.cx>
References: <20210605165858.3175-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The loadparam function does not need a struct net_device.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/os_intfs.c b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
index 9944011b52d3..870148020e61 100644
--- a/drivers/staging/rtl8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
@@ -136,7 +136,7 @@ MODULE_PARM_DESC(monitor_enable, "Enable monitor interface (default: false)");
 
 static int netdev_close(struct net_device *pnetdev);
 
-static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
+static void loadparam(struct adapter *padapter)
 {
 	struct registry_priv *registry_par = &padapter->registrypriv;
 
@@ -315,7 +315,7 @@ struct net_device *rtw_init_netdev(void)
 	pnetdev->watchdog_timeo = HZ * 3; /* 3 second timeout */
 	pnetdev->wireless_handlers = (struct iw_handler_def *)&rtw_handlers_def;
 
-	loadparam(padapter, pnetdev);
+	loadparam(padapter);
 	padapter->cmdThread = NULL;
 
 	return pnetdev;
-- 
2.20.1

