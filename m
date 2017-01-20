From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:26:58 +0000
Subject: [PATCH 08/11] KVM: PPC: Book3S: Use seq_puts() in xics_debug_show()
Message-Id: <10e0dc46-5eec-bafc-e191-98df6a724b98@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
In-Reply-To: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 16:26:51 +0100

A string which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_xics.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 3bdc639157c1..3740f9efcf06 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -934,8 +934,7 @@ static int xics_debug_show(struct seq_file *m, void *private)
 	t_reject = 0;
 
 	xics_debugfs_irqmap(m, kvm->arch.pimap);
-
-	seq_printf(m, "=====\nICP state\n=====\n");
+	seq_puts(m, "=====\nICP state\n=====\n");
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		struct kvmppc_icp *icp = vcpu->arch.icp;
-- 
2.11.0

