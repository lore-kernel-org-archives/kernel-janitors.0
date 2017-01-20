From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:22:50 +0000
Subject: [PATCH 04/11] KVM: PPC: Book3S HV: Use common error handling code in kvmppc_clr_passthru_irq()
Message-Id: <68158b48-c85b-4da8-1ef7-c996de1db5da@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
In-Reply-To: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 11:00:08 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_hv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index a93e1c4445da..cfc7699d05df 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3509,11 +3509,9 @@ static int kvmppc_clr_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 		return -EIO;
 
 	mutex_lock(&kvm->lock);
+	if (!kvm->arch.pimap)
+		goto unlock;
 
-	if (kvm->arch.pimap = NULL) {
-		mutex_unlock(&kvm->lock);
-		return 0;
-	}
 	pimap = kvm->arch.pimap;
 
 	for (i = 0; i < pimap->n_mapped; i++) {
@@ -3535,7 +3533,7 @@ static int kvmppc_clr_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	 * We don't free this structure even when the count goes to
 	 * zero. The structure is freed when we destroy the VM.
 	 */
-
+unlock:
 	mutex_unlock(&kvm->lock);
 	return 0;
 }
-- 
2.11.0

