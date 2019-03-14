From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Mar 2019 23:08:38 +0000
Subject: [PATCH] x86/lib: fix indentation issue, remove extra tab
Message-Id: <20190314230838.18256-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The increment of buff is indented one level too deeply, clean
this up by removing a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/lib/csum-partial_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/lib/csum-partial_64.c b/arch/x86/lib/csum-partial_64.c
index 9baca3e054be..e7925d668b68 100644
--- a/arch/x86/lib/csum-partial_64.c
+++ b/arch/x86/lib/csum-partial_64.c
@@ -94,7 +94,7 @@ static unsigned do_csum(const unsigned char *buff, unsigned len)
 				    : "m" (*(unsigned long *)buff), 
 				    "r" (zero),  "0" (result));
 				--count; 
-					buff += 8;
+				buff += 8;
 			}
 			result = add32_with_carry(result>>32,
 						  result&0xffffffff); 
-- 
2.20.1
