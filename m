From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 20:33:14 +0000
Subject: [PATCH] powerpc/rtas_flash: Move an assignment for the variable "rc" in manage_flash_write()
Message-Id: <026724c5-0907-d342-1fb3-f7af0bd1c765@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Jan 2017 21:20:09 +0100

A local variable was set to an error code before a concrete error situation
was detected. Thus move the corresponding assignment into an if branch
to indicate a software failure there.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/rtas_flash.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index db2b482af658..663904beff67 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -419,9 +419,10 @@ static ssize_t manage_flash_write(struct file *file, const char __user *buf,
 	op = -1;
 	if (buf) {
 		if (count > 9) count = 9;
-		rc = -EFAULT;
-		if (copy_from_user (stkbuf, buf, count))
+		if (copy_from_user(stkbuf, buf, count)) {
+			rc = -EFAULT;
 			goto error;
+		}
 		if (strncmp(stkbuf, reject_str, strlen(reject_str)) = 0) 
 			op = RTAS_REJECT_TMP_IMG;
 		else if (strncmp(stkbuf, commit_str, strlen(commit_str)) = 0) 
-- 
2.11.0

