From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Sep 2017 08:38:17 +0000
Subject: [PATCH] x86/xen: clean up clang build warning
Message-Id: <20170918083817.26870-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where sizeof(maddr) != sizeof(long) p is initialized and
never read and clang throws a warning on this.  Move declaration of
p to clean up the clang build warning:

warning: Value stored to 'p' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/include/asm/xen/hypercall.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/xen/hypercall.h b/arch/x86/include/asm/xen/hypercall.h
index 9606688caa4b..5ff77cb2529e 100644
--- a/arch/x86/include/asm/xen/hypercall.h
+++ b/arch/x86/include/asm/xen/hypercall.h
@@ -552,13 +552,13 @@ static inline void
 MULTI_update_descriptor(struct multicall_entry *mcl, u64 maddr,
 			struct desc_struct desc)
 {
-	u32 *p = (u32 *) &desc;
-
 	mcl->op = __HYPERVISOR_update_descriptor;
 	if (sizeof(maddr) = sizeof(long)) {
 		mcl->args[0] = maddr;
 		mcl->args[1] = *(unsigned long *)&desc;
 	} else {
+		u32 *p = (u32 *) &desc;
+
 		mcl->args[0] = maddr;
 		mcl->args[1] = maddr >> 32;
 		mcl->args[2] = *p++;
-- 
2.14.1

