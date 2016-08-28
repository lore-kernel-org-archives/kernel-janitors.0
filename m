From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 17:15:14 +0000
Subject: [PATCH 3/6] KVM: PPC: e500: Delete an unnecessary initialisation in kvm_vcpu_ioctl_config_tlb()
Message-Id: <a457526f-d337-f789-9bd0-243760214077@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <c3fd4483-38d2-af0f-0e19-a7e57e120c5b@users.sourceforge.net>
In-Reply-To: <c3fd4483-38d2-af0f-0e19-a7e57e120c5b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 17:37:10 +0200

The local variable "g2h_bitmap" will be set to an appropriate value
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/e500_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/e500_mmu.c b/arch/powerpc/kvm/e500_mmu.c
index b65a894..e9c19e9 100644
--- a/arch/powerpc/kvm/e500_mmu.c
+++ b/arch/powerpc/kvm/e500_mmu.c
@@ -743,7 +743,7 @@ int kvm_vcpu_ioctl_config_tlb(struct kvm_vcpu *vcpu,
 	char *virt;
 	struct page **pages;
 	struct tlbe_priv *privs[2] = {};
-	u64 *g2h_bitmap = NULL;
+	u64 *g2h_bitmap;
 	size_t array_len;
 	u32 sets;
 	int num_pages, ret, i;
-- 
2.9.3

