From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:28:55 +0000
Subject: [PATCH 10/11] KVM: PPC: e500: Use kcalloc() in e500_mmu_host_init()
Message-Id: <f532b32f-49b2-d72d-207a-f05bbaa8eb39@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
In-Reply-To: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 16:30:18 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/e500_mmu_host.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index b0333cc737dd..a1af2f445988 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -797,9 +797,8 @@ int e500_mmu_host_init(struct kvmppc_vcpu_e500 *vcpu_e500)
 	host_tlb_params[0].sets  		host_tlb_params[0].entries / host_tlb_params[0].ways;
 	host_tlb_params[1].sets = 1;
-
-	vcpu_e500->h2g_tlb1_rmap = kzalloc(sizeof(unsigned int) *
-					   host_tlb_params[1].entries,
+	vcpu_e500->h2g_tlb1_rmap = kcalloc(host_tlb_params[1].entries,
+					   sizeof(*vcpu_e500->h2g_tlb1_rmap),
 					   GFP_KERNEL);
 	if (!vcpu_e500->h2g_tlb1_rmap)
 		return -EINVAL;
-- 
2.11.0

