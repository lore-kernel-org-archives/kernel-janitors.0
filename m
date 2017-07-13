From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jul 2017 07:38:29 +0000
Subject: [PATCH 1/2] KVM: PPC: e500: fix some NULL dereferences on error
Message-Id: <20170713073829.dqjahnakxqvpne7x@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Graf <agraf@suse.com>, Scott Wood <scottwood@freescale.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

There are some error paths in kvmppc_core_vcpu_create_e500() where we
forget to set the error code.  It means that we return ERR_PTR(0) which
is NULL and it results in a NULL pointer dereference in the caller.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
index 32fdab57d604..f9f6468f4171 100644
--- a/arch/powerpc/kvm/e500.c
+++ b/arch/powerpc/kvm/e500.c
@@ -455,16 +455,20 @@ static struct kvm_vcpu *kvmppc_core_vcpu_create_e500(struct kvm *kvm,
 	if (err)
 		goto free_vcpu;
 
-	if (kvmppc_e500_id_table_alloc(vcpu_e500) = NULL)
+	if (kvmppc_e500_id_table_alloc(vcpu_e500) = NULL) {
+		err = -ENOMEM;
 		goto uninit_vcpu;
+	}
 
 	err = kvmppc_e500_tlb_init(vcpu_e500);
 	if (err)
 		goto uninit_id;
 
 	vcpu->arch.shared = (void*)__get_free_page(GFP_KERNEL|__GFP_ZERO);
-	if (!vcpu->arch.shared)
+	if (!vcpu->arch.shared) {
+		err = -ENOMEM;
 		goto uninit_tlb;
+	}
 
 	return vcpu;
 
