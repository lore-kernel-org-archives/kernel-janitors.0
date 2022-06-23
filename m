Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5161DC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Jun 2022 19:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbiFWT31 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Jun 2022 15:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiFWT2z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Jun 2022 15:28:55 -0400
X-Greylist: delayed 308 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Jun 2022 11:58:32 PDT
Received: from mail-smail-vm101.hanmail.net (mail-smail-vm101.daum.net [211.231.106.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70CD7A1B0
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Jun 2022 11:58:32 -0700 (PDT)
Received: from mail-hmail-smtp1 ([10.194.31.49])
        by mail-smail-vm101.hanmail.net (8.13.8/8.9.1) with SMTP id 25NIrFrW026686;
        Fri, 24 Jun 2022 03:53:15 +0900
X-Kakaomail-MID: CsIfMQAAB8oAAAGBkelMnQA4ztE=
X-Hermes-Message-Id: q5O3rEmnB1062865947
X-Originating-IP: 188.155.157.251
Received: from mail-qpsmtp-vm1 ([10.61.241.118]) by hermes of mail-hmail-smtp1 (10.194.31.49) with ESMTP id q5O3rEmnB1062865947; Fri, 24 Jun 2022 03:53:14 +0900 (KST)
Received: from [188.155.157.251] (HELO localhost.localdomain) (188.155.157.251)
 by  (8.12.9/8.9.1) with ESMTPA; Fri, 24 Jun 2022 03:53:14 +0900
Authentication-Results: mail-qpsmtp-vm1; auth=pass (plain) smtp.auth=luz666@daum.net
From:   Luz <luz666@daum.net>
To:     kernel-janitors@vger.kernel.org
Cc:     Luz <luz666@daum.net>
Subject: [PATCH] Add Belimo to ftdi driver
Date:   Thu, 23 Jun 2022 20:52:38 +0200
Message-Id: <20220623185238.3240-1-luz666@daum.net>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-UT: Xs82pWTH/dvDFitzOBeoGpcqrVewUiIe
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Those two known usb attributes regarding the product id are known.

Signed-off-by: Luz <luz666@daum.net>
---
 drivers/usb/serial/ftdi_sio.c     | 3 +++
 drivers/usb/serial/ftdi_sio_ids.h | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index b440d338a895..d5a3986dfee7 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1023,6 +1023,9 @@ static const struct usb_device_id id_table_combined[] = {
 	{ USB_DEVICE(FTDI_VID, CHETCO_SEASMART_DISPLAY_PID) },
 	{ USB_DEVICE(FTDI_VID, CHETCO_SEASMART_LITE_PID) },
 	{ USB_DEVICE(FTDI_VID, CHETCO_SEASMART_ANALOG_PID) },
+	/* Belimo Automation devices */
+	{ USB_DEVICE(FTDI_VID, BELIMO_ZTH_PID) },
+	{ USB_DEVICE(FTDI_VID, BELIMO_ZIP_PID) },
 	/* ICP DAS I-756xU devices */
 	{ USB_DEVICE(ICPDAS_VID, ICPDAS_I7560U_PID) },
 	{ USB_DEVICE(ICPDAS_VID, ICPDAS_I7561U_PID) },
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index d1a9564697a4..4e92c165c86b 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1568,6 +1568,12 @@
 #define CHETCO_SEASMART_LITE_PID	0xA5AE /* SeaSmart Lite USB Adapter */
 #define CHETCO_SEASMART_ANALOG_PID	0xA5AF /* SeaSmart Analog Adapter */
 
+/*
+ * Belimo Automation
+ */
+#define BELIMO_ZTH_PID			0x8050
+#define BELIMO_ZIP_PID			0xC811
+
 /*
  * Unjo AB
  */
-- 
2.36.0

