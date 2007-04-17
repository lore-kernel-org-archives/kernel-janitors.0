From: Surya <surya.prabhakar@wipro.com>
Date: Tue, 17 Apr 2007 05:45:38 +0000
Subject: [KJ] [RESEND] Trivial patch2:changing const char foo* to const
Message-Id: <1176788018.5526.27.camel@bluegenie>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
  Resending the patch. I was using a certificate which corrupted the patch in the previous mail.
Once I removed the cert the patch is getting inserted fine in evolution.I am not sure what
character set I should be using.

the patch below changes the const char *foo = "xyz" to static const char foo[] = "xyz".
Modifications suggested by Jeff Garzik.


Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>
---

diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index e6f5799..a441d7c 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -445,7 +445,7 @@ static void entry_status(Node *e, char *page)
 {
 	char *dp;
 	char *status = "disabled";
-	const char * flags = "flags: ";
+	static const char flags[] = "flags: ";
 
 	if (test_bit(Enabled, &e->flags))
 		status = "enabled";


-- 
surya.
17/04/2007
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
