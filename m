Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6B6C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 14:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE55561008
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Aug 2021 14:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241759AbhHJOL5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Aug 2021 10:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233046AbhHJOL4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Aug 2021 10:11:56 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7251C0613C1
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Aug 2021 07:11:33 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h2so17118575lji.6
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Aug 2021 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aykNWGq0KrPzpwgEK3d68B0ttbaXB7mVVS+iAmFpuBc=;
        b=m/GfFd6du7nHiO1kTr8uFuI1NmEOyDXkDoNaUN1aqK8vEhtyGOmdCg4JJhoN357QZZ
         QWGnk4TzuJ1T/JpJlCVc/PmuXcRgUeQVqBCpjJprXa3up7WvPHeWHM9RFnPN5lIZEi+W
         w6KYmv1c8IeNjI4tzJo0us7Kt4wqJKcXLREUv0liTFQmF26rSktdxYTldYqg1HBXT3Wa
         fy9aI6RuWEBg+uI0UKW/95K7BF6EoFb2oOxxKzQyfjkr1lbBKsj3nPM6CNiWQxEO7rQo
         /Kuy0jf5sqBlAAt2m577E8YFxjzm/cps5A+igsa4G75Oz6GqTfYOVJaNnmw2GzwOoOwq
         tF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aykNWGq0KrPzpwgEK3d68B0ttbaXB7mVVS+iAmFpuBc=;
        b=nn/xZLnZXlxbnm8jK2wd4xU33baBws8gQtwro9fhuhabQGoblJvUPDr1xsnkEGg5W/
         GhNbCAWDE9SlYnRfAgTnYticGjJEQF6/qkDKsc4FOSa8bBt3n4emr+u12/yPpTlKMFyi
         ssA56sET1LP8deXSk35OPdHwa5LMImtq7ioTci8v05E0hQU5lTknCGGo1biOIGOSW6bl
         pQm3vcK0EzeEjopwjXUy/v2ijtw0j9JlJypXMvxlCYmrEVdQHcCZAPFT3Hzc4KqyPuXc
         Tz64SASjV9BmlcKSnF086y3ivNvbj5xwP+UoaZ78XCu5u+wdZuSM+Q6ONf8kBAKNtbWT
         /rvQ==
X-Gm-Message-State: AOAM531g85OD5j82AXMm69BAXdYdSdhsOdzb0KTntFwcXhG0Q6TEeMig
        iC3NpbcpNUnFhXIiW/MJ4zdY6DTDIGKgBw==
X-Google-Smtp-Source: ABdhPJyemAjujMlBzv8RujSWpZQ/Z9mBfthDeYsyRjcW06d6pC7sM+ZczGneaE6SgWDoDWQoh16vuA==
X-Received: by 2002:a2e:b17a:: with SMTP id a26mr15198766ljm.342.1628604691888;
        Tue, 10 Aug 2021 07:11:31 -0700 (PDT)
Received: from ?IPv6:2001:14ba:3601:3500:eb55:9e82:316:b9a9? (dh4yxmyjnm2skfy423hzt-3.rev.dnainternet.fi. [2001:14ba:3601:3500:eb55:9e82:316:b9a9])
        by smtp.gmail.com with ESMTPSA id q14sm43989lfc.179.2021.08.10.07.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 07:11:31 -0700 (PDT)
Subject: Re: USB Hid Timeout and r8169 module to trust HW if present.
From:   "Late @ Gmail" <ljakku77@gmail.com>
To:     akpm@linux-foundation.org
Cc:     kernel-janitors@vger.kernel.org
References: <d15b7fa7-596c-96f8-dd07-7831a9fa2f0e@gmail.com>
 <20200204062749.GP1778@kadam>
 <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
 <20200204071849.GQ1778@kadam>
 <2da536f9-f39b-64fc-cab5-109f32a2d273@gmail.com>
Message-ID: <cea07a6d-3042-c17b-1631-c550fcbc5e15@gmail.com>
Date:   Tue, 10 Aug 2021 17:11:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2da536f9-f39b-64fc-cab5-109f32a2d273@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi, Now i got it working without user meddeling at all:


From: Lauri Jakku <lja@lja.fi>

Date: Mon, 9 Aug 2021 21:44:53 +0300
Subject: [PATCH] net:realtek:r8169 driver load fix

   net:realtek:r8169

     Problem:

       The driver seems not to work at first run for some HW's, not even
       when proper hardware is detected by it at the first probe.

     Solution:

       the driver will trust the hardware that reports valid ID and then
       make re-loading of the module as it would being reloaded manually.


Signed-off-by: Lauri Jakku <lja@lja.fi>
---
 .../drivers/net/ethernet/realtek/r8169_main.c | 35 ++++++++++++++---
 linux-5.14-rc4/drivers/net/phy/phy_device.c   | 38 +++++++++++++++++++
 2 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c b/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c
index c7af5bc3b..d8e602527 100644
--- a/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c
+++ b/linux-5.14-rc4/drivers/net/ethernet/realtek/r8169_main.c
@@ -634,6 +634,8 @@ struct rtl8169_private {
     struct rtl_fw *rtl_fw;
 
     u32 ocp_base;
+
+    int retry_probeing;
 };
 
 typedef void (*rtl_generic_fct)(struct rtl8169_private *tp);
@@ -5097,13 +5099,16 @@ static int r8169_mdio_register(struct rtl8169_private *tp)
     tp->phydev = mdiobus_get_phy(new_bus, 0);
     if (!tp->phydev) {
         return -ENODEV;
-    } else if (!tp->phydev->drv) {
-        /* Most chip versions fail with the genphy driver.
-         * Therefore ensure that the dedicated PHY driver is loaded.
+    } else if (tp->phydev->phy_id != RTL_GIGA_MAC_NONE) {
+        /* Most chip versions fail with the genphy driver, BUT do rerport valid IW
+         * ID. Re-starting the module seem to fix the issue of non-functional driver.
          */
-        dev_err(&pdev->dev, "no dedicated PHY driver found for PHY ID 0x%08x, maybe realtek.ko needs to be added to initramfs?\n",
+        dev_err(&pdev->dev,
+            "no dedicated driver, but HW found: PHY PHY ID 0x%08x\n",
             tp->phydev->phy_id);
-        return -EUNATCH;
+
+        dev_err(&pdev->dev, "trying re-probe few times..\n");
+
     }
 
     tp->phydev->mac_managed_pm = 1;
@@ -5250,6 +5255,7 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
     enum mac_version chipset;
     struct net_device *dev;
     u16 xid;
+    int savederr = 0;
 
     dev = devm_alloc_etherdev(&pdev->dev, sizeof (*tp));
     if (!dev)
@@ -5261,6 +5267,7 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
     tp->dev = dev;
     tp->pci_dev = pdev;
     tp->supports_gmii = ent->driver_data == RTL_CFG_NO_GBIT ? 0 : 1;
+    tp->retry_probeing = 0;
     tp->eee_adv = -1;
     tp->ocp_base = OCP_STD_PHY_BASE;
 
@@ -5410,7 +5417,15 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
     pci_set_drvdata(pdev, tp);
 
-    rc = r8169_mdio_register(tp);
+    savederr = r8169_mdio_register(tp);
+
+    if (
+        (tp->retry_probeing > 0) &&
+        (savederr == -EAGAIN)
+       ) {
+        netdev_info(dev, " retry of probe requested..............");
+    }
+
     if (rc)
         return rc;
 
@@ -5435,6 +5450,14 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
     if (pci_dev_run_wake(pdev))
         pm_runtime_put_sync(&pdev->dev);
 
+    if (
+        (tp->retry_probeing > 0) &&
+        (savederr == -EAGAIN)
+       ) {
+        netdev_info(dev, " retry of probe requested..............");
+        return savederr;
+    }
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
  *   set the state to READY (the driver's init function should
  *   set it to STARTING if needed).
  */
+#define REDO_PROBE_TIMES    5
 static int phy_probe(struct device *dev)
 {
     struct phy_device *phydev = to_phy_device(dev);
     struct device_driver *drv = phydev->mdio.dev.driver;
     struct phy_driver *phydrv = to_phy_driver(drv);
+    int again = 0;
+    int savederr = 0;
+again_retry:
     int err = 0;
 
+    if (again > 0) {
+        pr_err("%s: Re-probe %d of driver.....\n",
+               phydrv->name, again);
+    }
+
     phydev->drv = phydrv;
 
     /* Disable the interrupt if the PHY doesn't support it
@@ -3013,6 +3025,17 @@ static int phy_probe(struct device *dev)
 
     if (phydev->drv->probe) {
         err = phydev->drv->probe(phydev);
+
+        /* If again requested. */
+        if (err == -EAGAIN) {
+            again++;
+            savederr = err;
+            err = 0;
+
+            pr_info("%s: EAGAIN: %d ...\n",
+                phydrv->name, again);
+        }
+
         if (err)
             goto out;
     }
@@ -3081,6 +3104,20 @@ static int phy_probe(struct device *dev)
 
     mutex_unlock(&phydev->lock);
 
+    if ((savederr == -EAGAIN) &&
+        ((again > 0) && (again < REDO_PROBE_TIMES))
+       ) {
+        pr_err("%s: Retry removal driver..\n",
+            phydrv->name);
+
+        phy_remove(dev);
+
+        pr_err("%s: Re-probe driver..\n",
+            phydrv->name);
+        savederr = 0;
+        goto again_retry;
+    }
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


