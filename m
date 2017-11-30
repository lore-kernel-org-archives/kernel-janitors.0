From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Nov 2017 12:04:22 +0000
Subject: [PATCH] KVM: x86: MMU: make array audit_point_name static
Message-Id: <20171130120422.4783-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array audit_point_name is local to the source and does not need to
be in global scope, so make it static.

Cleans up sparse warning:
arch/x86/kvm/mmu_audit.c:22:12: warning: symbol 'audit_point_name' was
not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/kvm/mmu_audit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu_audit.c b/arch/x86/kvm/mmu_audit.c
index d22ddbdf5e6e..1272861e77b9 100644
--- a/arch/x86/kvm/mmu_audit.c
+++ b/arch/x86/kvm/mmu_audit.c
@@ -19,7 +19,7 @@
 
 #include <linux/ratelimit.h>
 
-char const *audit_point_name[] = {
+static char const *audit_point_name[] = {
 	"pre page fault",
 	"post page fault",
 	"pre pte write",
-- 
2.14.1

