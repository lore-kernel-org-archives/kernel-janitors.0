From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:24:59 +0000
Subject: [PATCH 06/11] KVM: PPC: Book3S HV: Use kcalloc() in kvmppc_alloc_host_rm_ops()
Message-Id: <62a8df66-ab16-8f93-8acd-20fb461fd7de@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
In-Reply-To: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 16:20:43 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Delete the local variable "size" which became unnecessary
  with this refactoring.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_hv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3122998f6a32..596201b3f22e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3199,7 +3199,6 @@ void kvmppc_alloc_host_rm_ops(void)
 	struct kvmppc_host_rm_ops *ops;
 	unsigned long l_ops;
 	int cpu, core;
-	int size;
 
 	/* Not the first time here ? */
 	if (kvmppc_host_rm_ops_hv)
@@ -3209,9 +3208,9 @@ void kvmppc_alloc_host_rm_ops(void)
 	if (!ops)
 		return;
 
-	size = cpu_nr_cores() * sizeof(struct kvmppc_host_rm_core);
-	ops->rm_core = kzalloc(size, GFP_KERNEL);
-
+	ops->rm_core = kcalloc(cpu_nr_cores(),
+			       sizeof(*ops->rm_core),
+			       GFP_KERNEL);
 	if (!ops->rm_core) {
 		kfree(ops);
 		return;
-- 
2.11.0

