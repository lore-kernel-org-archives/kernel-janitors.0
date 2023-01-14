Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07F6C46467
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Jan 2023 09:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjANJj2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 14 Jan 2023 04:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjANJjZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Jan 2023 04:39:25 -0500
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C068E1BE
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Jan 2023 01:39:24 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id Gd0Qp24IHA7XxGd0RpTOKO; Sat, 14 Jan 2023 10:39:23 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 14 Jan 2023 10:39:23 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kvm@vger.kernel.org
Subject: [PATCH v2] KVM: x86/mmu: Use kstrtobool() instead of strtobool()
Date:   Sat, 14 Jan 2023 10:39:11 +0100
Message-Id: <670882aa04dbdd171b46d3b20ffab87158454616.1673689135.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
This patch was already sent as a part of a serie ([1]) that axed all usages
of strtobool().
Most of the patches have been merged in -next.

I synch'ed with latest -next and re-send the remaining ones as individual
patches.

Changes in v2:
  - synch with latest -next.

[1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
---
 arch/x86/kvm/mmu/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 9c7198544195..699f7eac5070 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -43,6 +43,7 @@
 #include <linux/uaccess.h>
 #include <linux/hash.h>
 #include <linux/kern_levels.h>
+#include <linux/kstrtox.h>
 #include <linux/kthread.h>
 
 #include <asm/page.h>
@@ -6752,7 +6753,7 @@ static int set_nx_huge_pages(const char *val, const struct kernel_param *kp)
 		new_val = 1;
 	else if (sysfs_streq(val, "auto"))
 		new_val = get_nx_auto_mode();
-	else if (strtobool(val, &new_val) < 0)
+	else if (kstrtobool(val, &new_val) < 0)
 		return -EINVAL;
 
 	__set_nx_huge_pages(new_val);
-- 
2.34.1

