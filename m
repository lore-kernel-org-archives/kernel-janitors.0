From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 30 Oct 2010 09:04:24 +0000
Subject: [PATCH] powerpc: kvm: fix information leak to userland
Message-Id: <1288429464-21763-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Alexander Graf <agraf@suse.de>, kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Avi Kivity <avi@redhat.com>, linuxppc-dev@lists.ozlabs.org

Structure kvm_ppc_pvinfo is copied to userland with flags and
pad fields unitialized.  It leads to leaking of contents of
kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I cannot compile this driver, so it is not tested at all.

 arch/powerpc/kvm/powerpc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2f87a16..38f756f 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -617,6 +617,7 @@ long kvm_arch_vm_ioctl(struct file *filp,
 	switch (ioctl) {
 	case KVM_PPC_GET_PVINFO: {
 		struct kvm_ppc_pvinfo pvinfo;
+		memset(&pvinfo, 0, sizeof(pvinfo));
 		r = kvm_vm_ioctl_get_pvinfo(&pvinfo);
 		if (copy_to_user(argp, &pvinfo, sizeof(pvinfo))) {
 			r = -EFAULT;
-- 
1.7.0.4

