From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 10:15:46 +0000
Subject: [patch] KVM: PPC: fix a sanity check
Message-Id: <20160714101545.GB18175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Graf <agraf@suse.com>, Bharat Bhushan <r65777@freescale.com>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, kernel-janitors@vger.kernel.org, kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org

We use logical negate where bitwise negate was intended.  It means that
we never return -EINVAL here.

Fixes: ce11e48b7fdd ('KVM: PPC: E500: Add userspace debug stub support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 02b4672..df3f270 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -2038,7 +2038,7 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 		if (type = KVMPPC_DEBUG_NONE)
 			continue;
 
-		if (type & !(KVMPPC_DEBUG_WATCH_READ |
+		if (type & ~(KVMPPC_DEBUG_WATCH_READ |
 			     KVMPPC_DEBUG_WATCH_WRITE |
 			     KVMPPC_DEBUG_BREAKPOINT))
 			return -EINVAL;
