From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 17:09:57 +0000
Subject: [PATCH 0/6] KVM: PPC: e500: Fine-tuning for two function implementations
Message-Id: <c3fd4483-38d2-af0f-0e19-a7e57e120c5b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Paul Mackerras <paulus@samba.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 19:01:02 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Use kmalloc_array() in kvm_vcpu_ioctl_config_tlb()
  Less function calls in kvm_vcpu_ioctl_config_tlb() after error detection
  Delete an unnecessary initialisation in kvm_vcpu_ioctl_config_tlb()
  Replace kzalloc() calls by kcalloc() in two functions
  Use kmalloc_array() in kvmppc_e500_tlb_init()
  Rename jump labels in kvmppc_e500_tlb_init()

 arch/powerpc/kvm/e500_mmu.c | 71 +++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 35 deletions(-)

-- 
2.9.3

