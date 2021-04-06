Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7362AC433B4
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 20:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45FE66121E
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Apr 2021 20:49:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241815AbhDFUtY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Apr 2021 16:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241894AbhDFUtR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Apr 2021 16:49:17 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA5BC06174A;
        Tue,  6 Apr 2021 13:49:08 -0700 (PDT)
Received: from ipservice-092-217-067-214.092.217.pools.vodafone-ip.de ([92.217.67.214] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lTsdE-0005Yc-EE; Tue, 06 Apr 2021 22:49:04 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/11] staging: rtl8188eu: ctrl vendor req index is not used
Date:   Tue,  6 Apr 2021 22:48:21 +0200
Message-Id: <20210406204829.18130-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406204829.18130-1-martin@kaiser.cx>
References: <20210406204829.18130-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The index for rtl8188eu's vendor-specific control requests is not used.
Remove the index parameter from usbctrl_vendorreq and pass index 0 to
usb_control_msg.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 .../staging/rtl8188eu/os_dep/usb_ops_linux.c  | 33 ++++++-------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index bf57a91cc40d..b760636f03d3 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -11,6 +11,7 @@
 #include <rtw_sreset.h>
 
 #define REALTEK_USB_VENQT_CMD_REQ	0x05
+#define REALTEK_USB_VENQT_CMD_IDX	0x00
 
 static void interrupt_handler_8188eu(struct adapter *adapt, u16 pkt_len, u8 *pbuf)
 {
@@ -201,7 +202,7 @@ unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
 }
 
 static int
-usbctrl_vendorreq(struct adapter *adapt, u16 value, u16 index, void *pdata, u16 len, u8 requesttype)
+usbctrl_vendorreq(struct adapter *adapt, u16 value, void *pdata, u16 len, u8 requesttype)
 {
 	struct dvobj_priv *dvobjpriv = adapter_to_dvobj(adapt);
 	struct usb_device *udev = dvobjpriv->pusbdev;
@@ -251,7 +252,8 @@ usbctrl_vendorreq(struct adapter *adapt, u16 value, u16 index, void *pdata, u16
 		}
 
 		status = usb_control_msg(udev, pipe, REALTEK_USB_VENQT_CMD_REQ,
-					 reqtype, value, index, pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
+					 reqtype, value, REALTEK_USB_VENQT_CMD_IDX,
+					 pIo_buf, len, RTW_USB_CONTROL_MSG_TIMEOUT);
 
 		if (status == len) {   /*  Success this control transfer. */
 			if (requesttype == 0x01)
@@ -292,17 +294,15 @@ u8 usb_read8(struct adapter *adapter, u32 addr)
 {
 	u8 requesttype;
 	u16 wvalue;
-	u16 index;
 	u16 len;
 	u8 data = 0;
 
 	requesttype = 0x01;/* read_in */
-	index = 0;/* n/a */
 
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 1;
 
-	usbctrl_vendorreq(adapter, wvalue, index, &data, len, requesttype);
+	usbctrl_vendorreq(adapter, wvalue, &data, len, requesttype);
 
 	return data;
 }
@@ -311,15 +311,13 @@ u16 usb_read16(struct adapter *adapter, u32 addr)
 {
 	u8 requesttype;
 	u16 wvalue;
-	u16 index;
 	u16 len;
 	__le32 data;
 
 	requesttype = 0x01;/* read_in */
-	index = 0;/* n/a */
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 2;
-	usbctrl_vendorreq(adapter, wvalue, index, &data, len, requesttype);
+	usbctrl_vendorreq(adapter, wvalue, &data, len, requesttype);
 
 	return (u16)(le32_to_cpu(data) & 0xffff);
 }
@@ -328,17 +326,15 @@ u32 usb_read32(struct adapter *adapter, u32 addr)
 {
 	u8 requesttype;
 	u16 wvalue;
-	u16 index;
 	u16 len;
 	__le32 data;
 
 	requesttype = 0x01;/* read_in */
-	index = 0;/* n/a */
 
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 4;
 
-	usbctrl_vendorreq(adapter, wvalue, index, &data, len, requesttype);
+	usbctrl_vendorreq(adapter, wvalue, &data, len, requesttype);
 
 	return le32_to_cpu(data);
 }
@@ -508,56 +504,47 @@ int usb_write8(struct adapter *adapter, u32 addr, u8 val)
 {
 	u8 requesttype;
 	u16 wvalue;
-	u16 index;
 	u16 len;
 	u8 data;
 
 	requesttype = 0x00;/* write_out */
-	index = 0;/* n/a */
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 1;
 	data = val;
-	return usbctrl_vendorreq(adapter, wvalue,
-				 index, &data, len, requesttype);
+	return usbctrl_vendorreq(adapter, wvalue, &data, len, requesttype);
 }
 
 int usb_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	u8 requesttype;
 	u16 wvalue;
-	u16 index;
 	u16 len;
 	__le32 data;
 
 	requesttype = 0x00;/* write_out */
-	index = 0;/* n/a */
 
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 2;
 
 	data = cpu_to_le32(val & 0x0000ffff);
 
-	return usbctrl_vendorreq(adapter, wvalue,
-				 index, &data, len, requesttype);
+	return usbctrl_vendorreq(adapter, wvalue, &data, len, requesttype);
 }
 
 int usb_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	u8 requesttype;
 	u16 wvalue;
-	u16 index;
 	u16 len;
 	__le32 data;
 
 	requesttype = 0x00;/* write_out */
-	index = 0;/* n/a */
 
 	wvalue = (u16)(addr & 0x0000ffff);
 	len = 4;
 	data = cpu_to_le32(val);
 
-	return usbctrl_vendorreq(adapter, wvalue,
-				 index, &data, len, requesttype);
+	return usbctrl_vendorreq(adapter, wvalue, &data, len, requesttype);
 }
 
 static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
-- 
2.20.1

