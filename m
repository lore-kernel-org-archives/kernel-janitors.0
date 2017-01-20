From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:18:04 +0000
Subject: [PATCH 00/11] PowerPC-KVM: Fine-tuning for some function implementations
Message-Id: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 19:07:21 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (11):
  Move assignments for the variable "err" in kvm_htab_write()
  Improve a size determination in kvmppc_alloc_hpt()
  Move error code assignments in two functions
  Use common error handling code in kvmppc_clr_passthru_irq()
  Adjust nine checks for null pointers
  Use kcalloc() in kvmppc_alloc_host_rm_ops()
  Improve size determinations in five functions
  Use seq_puts() in xics_debug_show()
  Improve a size determination in two functions
  Use kcalloc() in e500_mmu_host_init()
  Return directly after a failed copy_from_user() in two functions

 arch/powerpc/kvm/book3s_64_mmu_hv.c | 26 +++++++------
 arch/powerpc/kvm/book3s_hv.c        | 73 +++++++++++++++++++------------------
 arch/powerpc/kvm/book3s_xics.c      |  7 ++--
 arch/powerpc/kvm/e500_mmu_host.c    |  5 +--
 arch/powerpc/kvm/powerpc.c          | 48 ++++++++++--------------
 5 files changed, 75 insertions(+), 84 deletions(-)

-- 
2.11.0

