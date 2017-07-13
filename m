From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jul 2017 07:38:49 +0000
Subject: [PATCH 2/2] KVM: PPC: e500mc: Fix a NULL dereference
Message-Id: <20170713073849.tj6jqmhliyjmn3zi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Graf <agraf@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

We should set "err = -ENOMEM;", otherwise it means we're returning
ERR_PTR(0) which is NULL.  It results in a NULL pointer dereference in
the caller.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index f48a0c22e8f9..d0b6b5788afc 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -331,8 +331,10 @@ static struct kvm_vcpu *kvmppc_core_vcpu_create_e500mc(struct kvm *kvm,
 		goto uninit_vcpu;
 
 	vcpu->arch.shared = (void *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
-	if (!vcpu->arch.shared)
+	if (!vcpu->arch.shared) {
+		err = -ENOMEM;
 		goto uninit_tlb;
+	}
 
 	return vcpu;
 
