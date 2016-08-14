From: Harinath Nampally <harinath922@gmail.com>
Date: Sun, 14 Aug 2016 20:42:00 +0000
Subject: [PATCH] fix for sparse warning
Message-Id: <1471207320-28187-1-git-send-email-harinath922@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de, mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

 To fix the below warning added static qualifier 
 "warning: symbol 'verify_sha256_digest' was not
 declared" 

Signed-off-by: Harinath Nampally <harinath922@gmail.com>
---
 arch/x86/purgatory/purgatory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/purgatory/purgatory.c b/arch/x86/purgatory/purgatory.c
index 25e068b..c58a31f 100644
--- a/arch/x86/purgatory/purgatory.c
+++ b/arch/x86/purgatory/purgatory.c
@@ -39,7 +39,7 @@ static int copy_backup_region(void)
 	return 0;
 }
 
-int verify_sha256_digest(void)
+static int verify_sha256_digest(void)
 {
 	struct sha_region *ptr, *end;
 	u8 digest[SHA256_DIGEST_SIZE];
-- 
2.7.4

