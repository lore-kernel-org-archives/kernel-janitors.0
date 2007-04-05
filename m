From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Thu, 05 Apr 2007 13:56:22 +0000
Subject: [KJ] [PATCH]ROUND_UP macro cleanup in arch/alpha/kernel/osf_sys.c
Message-Id: <20070405134422.GA9510@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru

ROUND_UP macro cleanup use ALIGN
 
Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
---

 osf_sys.c |    4 +---
 1 files changed, 1 insertion(+), 3 deletions(-)


diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index be133f1..c77d231 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -93,7 +93,6 @@ osf_set_program_attributes(unsigned long text_start, unsigned long text_len,
  * offset differences aren't the same as "d_reclen").
  */
 #define NAME_OFFSET	offsetof (struct osf_dirent, d_name)
-#define ROUND_UP(x)	(((x)+3) & ~3)
 
 struct osf_dirent {
 	unsigned int d_ino;
@@ -115,7 +114,7 @@ osf_filldir(void *__buf, const char *name, int namlen, loff_t offset,
 {
 	struct osf_dirent __user *dirent;
 	struct osf_dirent_callback *buf = (struct osf_dirent_callback *) __buf;
-	unsigned int reclen = ROUND_UP(NAME_OFFSET + namlen + 1);
+	unsigned int reclen = ALIGN(NAME_OFFSET + namlen + 1, sizeof(u32));
 	unsigned int d_ino;
 
 	buf->error = -EINVAL;	/* only used if we fail */
@@ -174,7 +173,6 @@ osf_getdirentries(unsigned int fd, struct osf_dirent __user *dirent,
 	return error;
 }
 
-#undef ROUND_UP
 #undef NAME_OFFSET
 
 asmlinkage unsigned long
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
