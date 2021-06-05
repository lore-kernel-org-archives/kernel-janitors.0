Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB1DC4743D
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A98DD61436
	for <kernel-janitors@archiver.kernel.org>; Sat,  5 Jun 2021 16:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFERBS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 5 Jun 2021 13:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhFERBR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Jun 2021 13:01:17 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B43BC061766;
        Sat,  5 Jun 2021 09:59:29 -0700 (PDT)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lpZdt-0002hw-4Q; Sat, 05 Jun 2021 18:59:25 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/9] staging: rtl8188eu: simplify rtw_get_wireless_stats
Date:   Sat,  5 Jun 2021 18:58:54 +0200
Message-Id: <20210605165858.3175-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605165858.3175-1-martin@kaiser.cx>
References: <20210605165858.3175-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Remove unnecessary temporary variables.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index ebd61ba93ef0..70c028e06aee 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -2920,25 +2920,18 @@ static struct iw_statistics *rtw_get_wireless_stats(struct net_device *dev)
 {
 	struct adapter *padapter = netdev_priv(dev);
 	struct iw_statistics *piwstats = &padapter->iwstats;
-	int tmp_level = 0;
-	int tmp_qual = 0;
-	int tmp_noise = 0;
 
 	if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
 		piwstats->qual.qual = 0;
 		piwstats->qual.level = 0;
 		piwstats->qual.noise = 0;
 	} else {
-		tmp_level = padapter->recvpriv.signal_strength;
-		tmp_qual = padapter->recvpriv.signal_qual;
-		tmp_noise = padapter->recvpriv.noise;
-
-		piwstats->qual.level = tmp_level;
-		piwstats->qual.qual = tmp_qual;
-		piwstats->qual.noise = tmp_noise;
+		piwstats->qual.level = padapter->recvpriv.signal_strength;
+		piwstats->qual.qual = padapter->recvpriv.signal_qual;
+		piwstats->qual.noise = padapter->recvpriv.noise;
 	}
 	piwstats->qual.updated = IW_QUAL_ALL_UPDATED;/* IW_QUAL_DBM; */
-	return &padapter->iwstats;
+	return piwstats;
 }
 
 struct iw_handler_def rtw_handlers_def = {
-- 
2.20.1

