Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F1AC433C1
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 09:33:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47CED6193C
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 09:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbhC2Jcw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 Mar 2021 05:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbhC2Jcv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Mar 2021 05:32:51 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C565C061574;
        Mon, 29 Mar 2021 02:32:51 -0700 (PDT)
Received: from pd956d63d.dip0.t-ipconnect.de ([217.86.214.61] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lQoGL-00065Q-IZ; Mon, 29 Mar 2021 11:32:45 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2] staging: rtl8188eu: (trivial) remove a duplicate debug print
Date:   Mon, 29 Mar 2021 11:32:15 +0200
Message-Id: <20210329093215.16186-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210328175200.27069-1-martin@kaiser.cx>
References: <20210328175200.27069-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Keep the one that shows the wakeup capability.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - fix the subject line

 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 91a3d34a1050..e18f1fff59ca 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -377,7 +377,6 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 		dvobj->pusbdev->do_remote_wakeup = 1;
 		pusb_intf->needs_remote_wakeup = 1;
 		device_init_wakeup(&pusb_intf->dev, 1);
-		pr_debug("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~~~~\n");
 		pr_debug("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~[%d]~~~\n",
 			 device_may_wakeup(&pusb_intf->dev));
 	}
-- 
2.20.1

