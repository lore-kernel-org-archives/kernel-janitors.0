From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 12:10:48 +0000
Subject: [patch 2/2] gru: cleanup gru_dump_context() a little
Message-Id: <20140130121048.GA17321@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitri Sivanich <sivanich@sgi.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" is zero here so we can remove the "!ret" part of the condition.
"uhdr" is alread a __user pointer so we can remove the cast.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, speaking of __user pointers there are some places where we
dereference them in this file.  It's not a security problem because we
have already used copy_to_user() to successfully write to the pointer at
point.  But if you have something like PAX which puts user pointers and
kernel pointers in a separate address space then this will cause
problems.

Run sparse to see the issue.

diff --git a/drivers/misc/sgi-gru/grukdump.c b/drivers/misc/sgi-gru/grukdump.c
index 2bef3f76032a..a3700a56b8ff 100644
--- a/drivers/misc/sgi-gru/grukdump.c
+++ b/drivers/misc/sgi-gru/grukdump.c
@@ -178,10 +178,10 @@ static int gru_dump_context(struct gru_state *gru, int ctxnum,
 	hdr.cbrcnt = cbrcnt;
 	hdr.dsrcnt = dsrcnt;
 	hdr.cch_locked = cch_locked;
-	if (!ret && copy_to_user((void __user *)uhdr, &hdr, sizeof(hdr)))
-		ret = -EFAULT;
+	if (copy_to_user(uhdr, &hdr, sizeof(hdr)))
+		return -EFAULT;
 
-	return ret ? ret : bytes;
+	return bytes;
 }
 
 int gru_dump_chiplet_request(unsigned long arg)
