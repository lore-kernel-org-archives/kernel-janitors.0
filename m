Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EEBC433ED
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 20:49:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD7EF6121E
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 20:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347326AbhDFUty (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Apr 2021 16:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347312AbhDFUtn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 16:49:43 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486C7C06174A;
        Tue,  6 Apr 2021 13:49:34 -0700 (PDT)
Received: from ipservice-092-217-067-214.092.217.pools.vodafone-ip.de ([92.217.67.214] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lTsdZ-0005Yc-Ev; Tue, 06 Apr 2021 22:49:25 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/11] staging: rtl8188eu: remove an obsolete comment
Date:   Tue,  6 Apr 2021 22:48:29 +0200
Message-Id: <20210406204829.18130-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406204829.18130-1-martin@kaiser.cx>
References: <20210406204829.18130-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This driver does not set URB_ZERO_PACKET.

The rtl8188eu driver that's available from Realtek/Edimax has some
commented-out code that sets zero packet. It was removed from this
driver before it was imported.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index bb5889a130ca..8e9fd9d4afda 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -677,8 +677,6 @@ u32 usb_write_port(struct adapter *padapter, u32 addr, u32 cnt, struct xmit_buf
 
 	ret = _SUCCESS;
 
-/*    We add the URB_ZERO_PACKET flag to urb so that the host will send the zero packet automatically. */
-
 	RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("-%s\n", __func__));
 
 exit:
-- 
2.20.1

