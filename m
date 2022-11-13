Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AB2C4332F
	for <kernel-janitors@archiver.kernel.org>; Sun, 13 Nov 2022 13:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbiKMNxD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 13 Nov 2022 08:53:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235388AbiKMNxD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 13 Nov 2022 08:53:03 -0500
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74921209B
        for <kernel-janitors@vger.kernel.org>; Sun, 13 Nov 2022 05:53:01 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id uDPsoatM9TyouuDPso0z7n; Sun, 13 Nov 2022 14:52:59 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Nov 2022 14:52:59 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()
Date:   Sun, 13 Nov 2022 14:52:54 +0100
Message-Id: <c5e918630ba37273d7b0f4e4dbb6f90d4c2f321d.1668347565.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In kvm_arch_prepare_memory_region(), if no error occurs, a spin_lock()/
spin_unlock() call can be avoided.

Switch to kvm_riscv_gstage_iounmap() that is the same as the current code,
but with a better semantic.
It also embeds the locking logic. So it is avoided if ret == 0.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I don't use cross-compiler, so this patch is NOT even compile tested.
---
 arch/riscv/kvm/mmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..c8834e463763 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -537,10 +537,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if (change == KVM_MR_FLAGS_ONLY)
 		goto out;
 
-	spin_lock(&kvm->mmu_lock);
 	if (ret)
-		gstage_unmap_range(kvm, base_gpa, size, false);
-	spin_unlock(&kvm->mmu_lock);
+		kvm_riscv_gstage_iounmap(kvm, base_gpa, size);
 
 out:
 	mmap_read_unlock(current->mm);
-- 
2.34.1

