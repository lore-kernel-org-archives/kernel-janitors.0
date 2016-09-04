From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Sep 2016 19:08:20 +0000
Subject: [PATCH] x86/amd_nb: Use kmalloc_array() in amd_cache_gart()
Message-Id: <3b30d96b-9280-623d-2bcb-c24e2c94e425@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 4 Sep 2016 21:01:47 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/kernel/amd_nb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 4fdf623..e2e3e8a 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -226,7 +226,9 @@ static void amd_cache_gart(void)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return;
 
-	flush_words = kmalloc(amd_nb_num() * sizeof(u32), GFP_KERNEL);
+	flush_words = kmalloc_array(amd_nb_num(),
+				    sizeof(*flush_words),
+				    GFP_KERNEL);
 	if (!flush_words) {
 		amd_northbridges.flags &= ~AMD_NB_GART;
 		pr_notice("Cannot initialize GART flush words, GART support disabled\n");
-- 
2.9.3

