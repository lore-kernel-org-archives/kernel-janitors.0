From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Aug 2018 15:22:28 +0000
Subject: [PATCH] KVM: x86: SVM: remove unused variable dst_vaddr_end
Message-Id: <20180828152228.12133-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro@8bytes.org>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable dst_vaddr_end is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable 'dst_vaddr_end' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kvm/svm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm.c b/arch/x86/kvm/svm.c
index 6276140044d0..4339fc4715fa 100644
--- a/arch/x86/kvm/svm.c
+++ b/arch/x86/kvm/svm.c
@@ -6747,7 +6747,7 @@ static int __sev_dbg_encrypt_user(struct kvm *kvm, unsigned long paddr,
 static int sev_dbg_crypt(struct kvm *kvm, struct kvm_sev_cmd *argp, bool dec)
 {
 	unsigned long vaddr, vaddr_end, next_vaddr;
-	unsigned long dst_vaddr, dst_vaddr_end;
+	unsigned long dst_vaddr;
 	struct page **src_p, **dst_p;
 	struct kvm_sev_dbg debug;
 	unsigned long n;
@@ -6763,7 +6763,6 @@ static int sev_dbg_crypt(struct kvm *kvm, struct kvm_sev_cmd *argp, bool dec)
 	size = debug.len;
 	vaddr_end = vaddr + size;
 	dst_vaddr = debug.dst_uaddr;
-	dst_vaddr_end = dst_vaddr + size;
 
 	for (; vaddr < vaddr_end; vaddr = next_vaddr) {
 		int len, s_off, d_off;
-- 
2.17.1
