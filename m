Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4680EC4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 13:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CEDC60EE7
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 13:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238033AbhHJNk1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Aug 2021 09:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbhHJNk0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Aug 2021 09:40:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73381C0613D3
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Aug 2021 06:40:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y34so11597764lfa.8
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Aug 2021 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=HV51pV4lIg0hUReH/E22I/gtq0tL9QYoUy6FivA3K6Q=;
        b=nLV9eA9eN6Aa8IHMHOd85PMC7UwlYrz8TlH1uPAaHgYX8puqOmTq/226/x5JV21A3E
         73eiQ6vNydBmygG3geBnjSTczD2azjyVaWzH1Qly/aQfoG8g7tLmmUnK7bIUESkrl65M
         ZBHmNeUbMh2TxheFBaNw9aQUchgh9tMJBtGXY08CQ7caX3KqoV6y8F7Ue0D7zuk2MgDB
         w5efdr6GUwT/0iVHcsLNb9SR76sirPT9Pwkpkm4xCZggKc+fTs8MzOJTtfyJxvXkg6Yr
         I151RfCkzsV8sCNvuW3QCQJHwKuQXL6ovhKnOyYnP6ji/XmgGVu+1KGv76mKJb89UiAN
         P5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=HV51pV4lIg0hUReH/E22I/gtq0tL9QYoUy6FivA3K6Q=;
        b=U031KB1N5JU+L6ou0Q8xdCAvIBYv2LtWYyG5h944yOapbDJaJoMWmKrCTHL5eFIRei
         CrHqd62BIEMxRFQCI7G72k0D0UUVG3q6yUKQ06Sq82ir5lAfdPHgnpSmexqVAWxf1p41
         PIBTbjnG8YhyV/quXyg2aByNA10GTq3ITWPPJqz5M1DPyvy82tl/nFoBA6nuv660JsUT
         nArcgAVLt856HmTAp+Soqldnvexro3WWk0oC3De5PDFDLec0q5gFa9pUx+2t59nkg0XS
         bacoOxG8jAS2izXsVmwsesoeN6rr7maoBH5uJ+fzbducXoRK07qW0jI3aPHBq54B4mS3
         GplQ==
X-Gm-Message-State: AOAM531+MdkD63X3u8kZQ0bC+gG+CT5KlE8G0BUQJ6lMFVgVa+YkXUVg
        h4bpOwJ7EKYLFuJZnDmMLrcYS5LwReCJQA==
X-Google-Smtp-Source: ABdhPJwmimoM6tscU/bnOZN3SSnNlSJX+TjmG4YN8aHiKWr2ak84aBL8n/0ulmqgzI3eJdLvH9MmlA==
X-Received: by 2002:ac2:5a45:: with SMTP id r5mr21409607lfn.124.1628602802559;
        Tue, 10 Aug 2021 06:40:02 -0700 (PDT)
Received: from ?IPv6:2001:14ba:3601:3500:eb55:9e82:316:b9a9? (dh4yxmyjnm2skfy423hzt-3.rev.dnainternet.fi. [2001:14ba:3601:3500:eb55:9e82:316:b9a9])
        by smtp.gmail.com with ESMTPSA id y3sm639297ljc.119.2021.08.10.06.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 06:40:01 -0700 (PDT)
To:     akpm@linux-foundation.org
Cc:     kernel-janitors@vger.kernel.org
References: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
 <20200204062749.GP1778@kadam>
 <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
 <20200204071849.GQ1778@kadam>
From:   "Late @ Gmail" <ljakku77@gmail.com>
Subject: USB Hid Timeout and r8169 module to trust HW if present.
Message-ID: <2da536f9-f39b-64fc-cab5-109f32a2d273@gmail.com>
Date:   Tue, 10 Aug 2021 16:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20200204071849.GQ1778@kadam>
Content-Type: multipart/mixed;
 boundary="------------E171EF7E61AECED1F8DA4996"
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------E171EF7E61AECED1F8DA4996
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I got this timeout patch and patch for r8168 to work, both are 
situations that i've had, and fixes work for me ok.


Where do I send them ?


--Lauri


On 4.2.2020 9.18, Dan Carpenter wrote:
> On Tue, Feb 04, 2020 at 09:00:46AM +0200, Lauri Jakku wrote:
>> Hi,
>>
>> I'm quite newbie publicly patching stuff, but at anyway:
>>
>> On 4.2.2020 8.27, Dan Carpenter wrote:
>>> Hi Lauri,
>>>
>>> There are a bunch of issues with this patch.
>>>
>>> 1)  There is no way we're going to add a retry loop to
>>>      usb_control_msg().  We might add it to a driver, but probably we
>>>      would suspect that the hardware is bad.  Maybe the cable is faulty?
>>>      Or I could be wrong on that...
>> For example there is lot of USB HID related oddities reported
>>
>> by multiple users, that have said that after (kernel) update
>>
>> of their system USB devices stopped working or work randomly.
>>
>>
>> I have problem with my mouse, and the problem went away
>>
>> with my patch. I think that the change to driver by driver is
>>
>> just code duplication, and with my patch the 'good' HW still
>>
>> is not going to sleep even that 20ms, the time that I tought
>>
>> to be good. Max retry time is 400ms.
>>
> That doesn't sound totally unreasonable.  Go ahead and try sending the
> patch.  Maybe they apply it or maybe they don't but either way there
> is no harm in sending a patch.
>
> regards,
> dan carpenter
>

--------------E171EF7E61AECED1F8DA4996
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-net-realtek-r8169-driver-load-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-net-realtek-r8169-driver-load-fix.patch"

From 8e9898889c035e6301c7e92b1a63717d441eded6 Mon Sep 17 00:00:00 2001
From: Lauri Jakku <lja@lja.fi>
Date: Mon, 9 Aug 2021 21:44:53 +0300
Subject: [PATCH 1/2] net:realtek:r8169, driver load fix

   net:realtek:r8169

     Problem:

       The driver seems not to work at first run, not even when proper HW
       is detected by it at the first probe.

     Solution:

       the driver will trust the HW that reports valid ID and then make
       re-loading of the module as it would being reloaded manually

Signed-off-by: Lauri Jakku <lja@lja.fi>
---
 .../drivers/net/ethernet/realtek/r8169_main.c | 35 ++++++++++++++---
 linux-5.14-rc4/drivers/net/phy/phy_device.c   | 38 +++++++++++++++++++
 2 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c b/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c
index c7af5bc3b..d8e602527 100644
--- a/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c
+++ b/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c
@@ -634,6 +634,8 @@ struct rtl8169_private {
 	struct rtl_fw *rtl_fw;
 
 	u32 ocp_base;
+
+	int retry_probeing;
 };
 
 typedef void (*rtl_generic_fct)(struct rtl8169_private *tp);
@@ -5097,13 +5099,16 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
 	tp->phydev = mdiobus_get_phy(new_bus, 0);
 	if (!tp->phydev) {
 		return -ENODEV;
-	} else if (!tp->phydev->drv) {
-		/* Most chip versions fail with the genphy driver.
-		 * Therefore ensure that the dedicated PHY driver is loaded.
+	} else if (tp->phydev->phy_id != RTL_GIGA_MAC_NONE) {
+		/* Most chip versions fail with the genphy driver, BUT do rerport valid IW
+		 * ID. Re-starting the module seem to fix the issue of non-functional driver.
 		 */
-		dev_err(&pdev->dev, "no dedicated PHY driver found for PHY ID 0x%08x, maybe realtek.ko needs to be added to initramfs?\n",
+		dev_err(&pdev->dev,
+			"no dedicated driver, but HW found: PHY PHY ID 0x%08x\n",
 			tp->phydev->phy_id);
-		return -EUNATCH;
+
+		dev_err(&pdev->dev, "trying re-probe few times..\n");
+
 	}
 
 	tp->phydev->mac_managed_pm = 1;
@@ -5250,6 +5255,7 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	enum mac_version chipset;
 	struct net_device *dev;
 	u16 xid;
+	int savederr = 0;
 
 	dev = devm_alloc_etherdev(&pdev->dev, sizeof (*tp));
 	if (!dev)
@@ -5261,6 +5267,7 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	tp->dev = dev;
 	tp->pci_dev = pdev;
 	tp->supports_gmii = ent->driver_data == RTL_CFG_NO_GBIT ? 0 : 1;
+	tp->retry_probeing = 0;
 	tp->eee_adv = -1;
 	tp->ocp_base = OCP_STD_PHY_BASE;
 
@@ -5410,7 +5417,15 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pdev, tp);
 
-	rc = r8169_mdio_register(tp);
+	savederr = r8169_mdio_register(tp);
+
+	if (
+		(tp->retry_probeing > 0) &&
+		(savederr == -EAGAIN)
+	   ) {
+		netdev_info(dev, " retry of probe requested..............");
+	}
+
 	if (rc)
 		return rc;
 
@@ -5435,6 +5450,14 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (pci_dev_run_wake(pdev))
 		pm_runtime_put_sync(&pdev->dev);
 
+	if (
+		(tp->retry_probeing > 0) &&
+		(savederr == -EAGAIN)
+	   ) {
+		netdev_info(dev, " retry of probe requested..............");
+		return savederr;
+	}
+
 	return 0;
 }
 
diff --git a/linux-5.14-rc4/drivers/net/phy/phy_device.c b/linux-5.14-rc4/drivers/net/phy/phy_device.c
index 5d5f9a9ee..59c6ac031 100644
--- a/linux-5.14-rc4/drivers/net/phy/phy_device.c
+++ b/linux-5.14-rc4/drivers/net/phy/phy_device.c
@@ -2980,6 +2980,9 @@ struct fwnode_handle *fwnode_get_phy_node(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_get_phy_node);
 
+
+static int phy_remove(struct device *dev);
+
 /**
  * phy_probe - probe and init a PHY device
  * @dev: device to probe and init
@@ -2988,13 +2991,22 @@ EXPORT_SYMBOL_GPL(fwnode_get_phy_node);
  *   set the state to READY (the driver's init function should
  *   set it to STARTING if needed).
  */
+#define REDO_PROBE_TIMES	5
 static int phy_probe(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
 	struct device_driver *drv = phydev->mdio.dev.driver;
 	struct phy_driver *phydrv = to_phy_driver(drv);
+	int again = 0;
+	int savederr = 0;
+again_retry:
 	int err = 0;
 
+	if (again > 0) {
+		pr_err("%s: Re-probe %d of driver.....\n",
+		       phydrv->name, again);
+	}
+
 	phydev->drv = phydrv;
 
 	/* Disable the interrupt if the PHY doesn't support it
@@ -3013,6 +3025,17 @@ static int phy_probe(struct device *dev)
 
 	if (phydev->drv->probe) {
 		err = phydev->drv->probe(phydev);
+
+		/* If again requested. */
+		if (err == -EAGAIN) {
+			again++;
+			savederr = err;
+			err = 0;
+
+			pr_info("%s: EAGAIN: %d ...\n",
+				phydrv->name, again);
+		}
+
 		if (err)
 			goto out;
 	}
@@ -3081,6 +3104,20 @@ static int phy_probe(struct device *dev)
 
 	mutex_unlock(&phydev->lock);
 
+	if ((savederr == -EAGAIN) &&
+	    ((again > 0) && (again < REDO_PROBE_TIMES))
+	   ) {
+		pr_err("%s: Retry removal driver..\n",
+			phydrv->name);
+
+		phy_remove(dev);
+
+		pr_err("%s: Re-probe driver..\n",
+			phydrv->name);
+		savederr = 0;
+		goto again_retry;
+	}
+
 	return err;
 }
 
@@ -3108,6 +3145,7 @@ static int phy_remove(struct device *dev)
 	return 0;
 }
 
+
 static void phy_shutdown(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
-- 
2.17.1


--------------E171EF7E61AECED1F8DA4996
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-USB-core-tinkering.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-USB-core-tinkering.patch"

From b9838664ed2ac62eb2a957f477bf57d79f09da73 Mon Sep 17 00:00:00 2001
From: Lauri Jakku <lja@lja.fi>
Date: Mon, 9 Aug 2021 21:44:53 +0300
Subject: [PATCH 2/2] USB core tinkering:

   USB:core:message:

     Problem:

       Timeout happening in USB transfer some times.

     Solution:

       Linger a bit, prior to the next control message or if return
       value is timeout, but do try few times before quitting.

Signed-off-by: Lauri Jakku <lja@lja.fi>
---
 linux-5.14-rc4/drivers/usb/core/message.c | 28 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/linux-5.14-rc4/drivers/usb/core/message.c b/linux-5.14-rc4/drivers/usb/core/message.c
index 4d59d927a..ba95e5995 100644
--- a/linux-5.14-rc4/drivers/usb/core/message.c
+++ b/linux-5.14-rc4/drivers/usb/core/message.c
@@ -21,6 +21,7 @@
 #include <linux/usb/hcd.h>	/* for usbcore internals */
 #include <linux/usb/of.h>
 #include <asm/byteorder.h>
+#include <uapi/asm-generic/errno.h>
 
 #include "usb.h"
 
@@ -138,7 +139,12 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
 		    __u16 size, int timeout)
 {
 	struct usb_ctrlrequest *dr;
-	int ret;
+	int ret = -ETIMEDOUT;
+	int retry_cnt = 5;
+
+	/* By default: while done at least one time */
+	int retryStill = 1;
+	int isTimeout = 1;
 
 	dr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_NOIO);
 	if (!dr)
@@ -150,11 +156,23 @@ int usb_control_msg(struct usb_device *dev, unsigned int pipe, __u8 request,
 	dr->wIndex = cpu_to_le16(index);
 	dr->wLength = cpu_to_le16(size);
 
-	ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
 
-	/* Linger a bit, prior to the next control message. */
-	if (dev->quirks & USB_QUIRK_DELAY_CTRL_MSG)
-		msleep(200);
+	while (retryStill && isTimeout) {
+		ret = usb_internal_control_msg(dev, pipe, dr, data, size, timeout);
+
+		/*
+		 * Linger a bit, prior to the next control message or if return
+		 * value is timeout, but do try few times before quitting.
+		 */
+
+		retryStill = (retry_cnt > 0);
+		isTimeout = (ret == -ETIMEDOUT);
+
+		if ((dev->quirks & USB_QUIRK_DELAY_CTRL_MSG) || isTimeout)
+			msleep(200);
+
+		retry_cnt--
+	}
 
 	kfree(dr);
 
-- 
2.17.1


--------------E171EF7E61AECED1F8DA4996--
