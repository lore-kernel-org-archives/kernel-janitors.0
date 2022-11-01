Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD18C43219
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Nov 2022 21:16:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbiKAVQg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbiKAVQI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Nov 2022 17:16:08 -0400
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB051EAD3
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Nov 2022 14:15:28 -0700 (PDT)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id pyanoKD2rsfCIpybXoWfL7; Tue, 01 Nov 2022 22:15:27 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 01 Nov 2022 22:15:27 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 24/30] arm64: cpufeature: Use kstrtobool() instead of strtobool()
Date:   Tue,  1 Nov 2022 22:14:12 +0100
Message-Id: <5a1b329cda34aec67615c0d2fd326eb0d6634bf7.1667336095.git.christophe.jaillet@wanadoo.fr>
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


This patch has NOT been compile tested.


[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 arch/arm64/kernel/cpufeature.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6062454a9067..271a142b96fa 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -65,6 +65,7 @@
 #include <linux/bsearch.h>
 #include <linux/cpumask.h>
 #include <linux/crash_dump.h>
+#include <linux/kstrtox.h>
 #include <linux/sort.h>
 #include <linux/stop_machine.h>
 #include <linux/sysfs.h>
@@ -1769,7 +1770,7 @@ kpti_install_ng_mappings(const struct arm64_cpu_capabilities *__unused)
 static int __init parse_kpti(char *str)
 {
 	bool enabled;
-	int ret = strtobool(str, &enabled);
+	int ret = kstrtobool(str, &enabled);
 
 	if (ret)
 		return ret;
@@ -2013,7 +2014,7 @@ static bool enable_pseudo_nmi;
 
 static int __init early_enable_pseudo_nmi(char *p)
 {
-	return strtobool(p, &enable_pseudo_nmi);
+	return kstrtobool(p, &enable_pseudo_nmi);
 }
 early_param("irqchip.gicv3_pseudo_nmi", early_enable_pseudo_nmi);
 
-- 
2.34.1

