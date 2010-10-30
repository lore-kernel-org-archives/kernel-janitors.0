From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 30 Oct 2010 18:55:22 +0000
Subject: [PATCH v2] powerpc: kvm: powerpc: fix information leak to userland
Message-Id: <1288464922-8812-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Alexander Graf <agraf@suse.de>, Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Structure kvm_ppc_pvinfo is copied to userland with "flags" and "pad"
fields unitialized.  It leads to leaking of contents of kernel stack
memory.  We have to initialize them to zero.

In patch v1 Jan Kiszka suggested to fill reserved fields with zeros
instead of memset'ting the whole struct.  It makes sense as these
fields are explicitly marked as padding.  No more fields need zeroing.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 arch/powerpc/kvm/powerpc.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2f87a16..5962336 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -604,6 +604,8 @@ static int kvm_vm_ioctl_get_pvinfo(struct kvm_ppc_pvinfo *pvinfo)
 	pvinfo->hcall[1] = inst_ori | (KVM_SC_MAGIC_R0 & inst_imm_mask);
 	pvinfo->hcall[2] = inst_sc;
 	pvinfo->hcall[3] = inst_nop;
+	pvinfo->flags = 0;
+	memset(&pvinfo->pad, 0, sizeof(pvinfo->pad));
 
 	return 0;
 }
-- 
1.7.0.4

