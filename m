Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F90C43217
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 21:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbiKAVPo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiKAVP1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:15:27 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFB21DDCC
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:15:12 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pyanoKD2rsfCIpybHoWfIs; Tue, 01 Nov 2022 22:15:11 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:11 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org
Subject: [PATCH 07/30] usb: core: Use kstrtobool() instead of strtobool()
Date:   Tue,  1 Nov 2022 22:13:55 +0100
Message-Id: <f01ef2ddaf12a6412127611617786adc1234e0b4.1667336095.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
References: <cover.1667336095.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

strtobool() is the same as kstrtobool().
However, the latter is more used within the kernel.

In order to remove strtobool() and slightly simplify kstrtox.h, switch to
the other function name.

While at it, include the corresponding header file (<linux/kstrtox.h>)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is part of a serie that axes all usages of strtobool().
Each patch can be applied independently from the other ones.

The last patch of the serie removes the definition of strtobool().

You may not be in copy of the cover letter. So, if needed, it is available
at [1].

[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 drivers/usb/core/port.c  | 3 ++-
 drivers/usb/core/sysfs.c | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 38c1a4f4fdea..015204fc67a1 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/pm_qos.h>
 #include <linux/component.h>
@@ -63,7 +64,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 	bool disabled;
 	int rc;
 
-	rc = strtobool(buf, &disabled);
+	rc = kstrtobool(buf, &disabled);
 	if (rc)
 		return rc;
 
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index 631574718d8a..8217032dfb85 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -13,6 +13,7 @@
 
 
 #include <linux/kernel.h>
+#include <linux/kstrtox.h>
 #include <linux/string.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
@@ -505,7 +506,7 @@ static ssize_t usb2_hardware_lpm_store(struct device *dev,
 	if (ret < 0)
 		return -EINTR;
 
-	ret = strtobool(buf, &value);
+	ret = kstrtobool(buf, &value);
 
 	if (!ret) {
 		udev->usb2_hw_lpm_allowed = value;
@@ -975,7 +976,7 @@ static ssize_t interface_authorized_default_store(struct device *dev,
 	int rc = count;
 	bool val;
 
-	if (strtobool(buf, &val) != 0)
+	if (kstrtobool(buf, &val) != 0)
 		return -EINVAL;
 
 	if (val)
@@ -1176,7 +1177,7 @@ static ssize_t interface_authorized_store(struct device *dev,
 	struct usb_interface *intf = to_usb_interface(dev);
 	bool val;
 
-	if (strtobool(buf, &val) != 0)
+	if (kstrtobool(buf, &val) != 0)
 		return -EINVAL;
 
 	if (val)
-- 
2.34.1

