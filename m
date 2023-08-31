Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9593C83F29
	for <kernel-janitors@archiver.kernel.org>; Thu, 31 Aug 2023 07:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239394AbjHaHhL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 31 Aug 2023 03:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjHaHhK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 31 Aug 2023 03:37:10 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A3F511A3;
        Thu, 31 Aug 2023 00:37:07 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id E6136604DE905;
        Thu, 31 Aug 2023 15:37:02 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Su Hui <suhui@nfschina.com>
Subject: [PATCH] driver base: slience unused warning
Date:   Thu, 31 Aug 2023 15:36:55 +0800
Message-Id: <20230831073654.1713710-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Avoid unused warning with gcc and W=1 option.

drivers/base/module.c:36:6: error:
variable ‘no_warn’ set but not used [-Werror=unused-but-set-variable]

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/base/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/module.c b/drivers/base/module.c
index 46ad4d636731..10494336d601 100644
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -33,7 +33,7 @@ static void module_create_drivers_dir(struct module_kobject *mk)
 void module_add_driver(struct module *mod, struct device_driver *drv)
 {
 	char *driver_name;
-	int no_warn;
+	int __maybe_unused no_warn;
 	struct module_kobject *mk = NULL;
 
 	if (!drv)
-- 
2.30.2

