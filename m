From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:27:54 +0000
Subject: [PATCH 09/11] KVM: PPC: Book3S: Improve a size determination in two functions
Message-Id: <f2b94132-efd8-df81-35b3-a4990dceb05f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
In-Reply-To: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 16:28:43 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_xics.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 3740f9efcf06..d45c1b59b70a 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -1032,7 +1032,7 @@ static struct kvmppc_ics *kvmppc_xics_create_ics(struct kvm *kvm,
 		goto out;
 
 	/* Create the ICS */
-	ics = kzalloc(sizeof(struct kvmppc_ics), GFP_KERNEL);
+	ics = kzalloc(*ics), GFP_KERNEL);
 	if (!ics)
 		goto out;
 
@@ -1064,7 +1064,7 @@ int kvmppc_xics_create_icp(struct kvm_vcpu *vcpu, unsigned long server_num)
 	if (kvmppc_xics_find_server(vcpu->kvm, server_num))
 		return -EEXIST;
 
-	icp = kzalloc(sizeof(struct kvmppc_icp), GFP_KERNEL);
+	icp = kzalloc(sizeof(*icp), GFP_KERNEL);
 	if (!icp)
 		return -ENOMEM;
 
-- 
2.11.0

