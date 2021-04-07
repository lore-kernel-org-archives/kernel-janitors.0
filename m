Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F91C43460
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 17:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B0DF610CC
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 17:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354591AbhDGRGY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 13:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354576AbhDGRGS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 13:06:18 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D71FC061764;
        Wed,  7 Apr 2021 10:06:08 -0700 (PDT)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lUBcy-0001Q6-VM; Wed, 07 Apr 2021 19:06:05 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: rtl8188eu: make usb_dvobj_init return a status
Date:   Wed,  7 Apr 2021 19:05:30 +0200
Message-Id: <20210407170531.29356-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407170531.29356-1-martin@kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

usb_dvobj_init populates a struct dvobj_priv and installs it as interface
data of the usb interface. There's no point in returning this struct to the
caller, it makes more sense to return an error status.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 26 ++++++++-------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 301dab65b571..71ef7941f688 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -48,7 +48,7 @@ static const struct usb_device_id rtw_usb_id_tbl[] = {
 
 MODULE_DEVICE_TABLE(usb, rtw_usb_id_tbl);
 
-static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
+static int usb_dvobj_init(struct usb_interface *usb_intf)
 {
 	int	i;
 	struct dvobj_priv *pdvobjpriv;
@@ -61,7 +61,7 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
 
 	pdvobjpriv = kzalloc(sizeof(*pdvobjpriv), GFP_KERNEL);
 	if (!pdvobjpriv)
-		return NULL;
+		return -ENOMEM;
 
 	pdvobjpriv->pusbintf = usb_intf;
 	pusbd = interface_to_usbdev(usb_intf);
@@ -108,7 +108,7 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
 	mutex_init(&pdvobjpriv->usb_vendor_req_mutex);
 	usb_get_dev(pusbd);
 
-	return pdvobjpriv;
+	return 0;
 }
 
 static void usb_dvobj_deinit(struct usb_interface *usb_intf)
@@ -450,27 +450,21 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
 
 static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
 {
-	struct dvobj_priv *dvobj;
+	int err;
 
-	/* Initialize dvobj_priv */
-	dvobj = usb_dvobj_init(pusb_intf);
-	if (!dvobj) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			 ("initialize device object priv Failed!\n"));
-		goto exit;
+	err = usb_dvobj_init(pusb_intf);
+	if (err) {
+		pr_debug("usb_dvobj_init failed\n");
+		return err;
 	}
 
 	if (!rtw_usb_if1_init(pusb_intf)) {
 		pr_debug("rtw_usb_if1_init failed\n");
-		goto free_dvobj;
+		usb_dvobj_deinit(pusb_intf);
+		return -ENODEV;
 	}
 
 	return 0;
-
-free_dvobj:
-	usb_dvobj_deinit(pusb_intf);
-exit:
-	return -ENODEV;
 }
 
 /*
-- 
2.20.1

