From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sun, 01 Apr 2007 12:35:19 +0000
Subject: [KJ] [PATCH] ROUND_UP cleanup in arch/mips/kernel/sysirix.c
Message-Id: <20070401122319.GA10178@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linux-mips@linux-mips.org, ralf@linux-mips.org

ROUND_UP(32|64) cleanup, use ALIGN

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 sysirix.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


diff --git a/arch/mips/kernel/sysirix.c b/arch/mips/kernel/sysirix.c
index 93a1484..59c25bc 100644
--- a/arch/mips/kernel/sysirix.c
+++ b/arch/mips/kernel/sysirix.c
@@ -1736,14 +1736,13 @@ struct irix_dirent32_callback {
 };
 
 #define NAME_OFFSET32(de) ((int) ((de)->d_name - (char *) (de)))
-#define ROUND_UP32(x) (((x)+sizeof(u32)-1) & ~(sizeof(u32)-1))
 
 static int irix_filldir32(void *__buf, const char *name,
 	int namlen, loff_t offset, u64 ino, unsigned int d_type)
 {
 	struct irix_dirent32 __user *dirent;
 	struct irix_dirent32_callback *buf = __buf;
-	unsigned short reclen = ROUND_UP32(NAME_OFFSET32(dirent) + namlen + 1);
+	unsigned short reclen = ALIGN(NAME_OFFSET32(dirent) + namlen + 1, sizeof(u32));
 	int err = 0;
 	u32 d_ino;
 
@@ -1838,14 +1837,13 @@ struct irix_dirent64_callback {
 };
 
 #define NAME_OFFSET64(de) ((int) ((de)->d_name - (char *) (de)))
-#define ROUND_UP64(x) (((x)+sizeof(u64)-1) & ~(sizeof(u64)-1))
 
 static int irix_filldir64(void *__buf, const char *name,
 	int namlen, loff_t offset, u64 ino, unsigned int d_type)
 {
 	struct irix_dirent64 __user *dirent;
 	struct irix_dirent64_callback * buf = __buf;
-	unsigned short reclen = ROUND_UP64(NAME_OFFSET64(dirent) + namlen + 1);
+	unsigned short reclen = ALIGN(NAME_OFFSET64(dirent) + namlen + 1,sizeof(u64));
 	int err = 0;
 
 	if (!access_ok(VERIFY_WRITE, buf, sizeof(*buf)))

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
