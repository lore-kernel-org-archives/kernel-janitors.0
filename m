Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F3CC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 21:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbiKAVQn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiKAVQO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:16:14 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8A61DDEC
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:15:35 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pyanoKD2rsfCIpybdoWfMe; Tue, 01 Nov 2022 22:15:34 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:34 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 29/30] driver core: Use kstrtobool() instead of strtobool()
Date:   Tue,  1 Nov 2022 22:14:17 +0100
Message-Id: <02ba683a5c0716638ad8ca11e8b0fdca97c4f294.1667336095.git.christophe.jaillet@wanadoo.fr>
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
 drivers/base/core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d02501933467..5f6b80329cf1 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/init.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -1628,7 +1629,7 @@ early_param("fw_devlink", fw_devlink_setup);
 static bool fw_devlink_strict;
 static int __init fw_devlink_strict_setup(char *arg)
 {
-	return strtobool(arg, &fw_devlink_strict);
+	return kstrtobool(arg, &fw_devlink_strict);
 }
 early_param("fw_devlink.strict", fw_devlink_strict_setup);
 
@@ -2280,7 +2281,7 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 {
 	struct dev_ext_attribute *ea = to_ext_attr(attr);
 
-	if (strtobool(buf, ea->var) < 0)
+	if (kstrtobool(buf, ea->var) < 0)
 		return -EINVAL;
 
 	return size;
@@ -2534,7 +2535,7 @@ static ssize_t online_store(struct device *dev, struct device_attribute *attr,
 	bool val;
 	int ret;
 
-	ret = strtobool(buf, &val);
+	ret = kstrtobool(buf, &val);
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1

