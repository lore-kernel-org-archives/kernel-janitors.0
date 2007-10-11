From: Kev Jackson <foamdino@gmail.com>
Date: Thu, 11 Oct 2007 07:54:06 +0000
Subject: [KJ] [patch] [trivial] drivers/video: Use char foo[] instead of
Message-Id: <470DD69E.2060509@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Kev Jackson <foamdino@gmail.com>

-Use char foo[] instead of char *foo as per kernel janitors TODO list

Signed-off-by: Kev Jackson <foamdino@gmail.com>

---

 savagefb_driver.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/savage/savagefb_driver.c b/drivers/video/savage/savagefb_driver.c
index b855f4a..ffde49a 100644
--- a/drivers/video/savage/savagefb_driver.c
+++ b/drivers/video/savage/savagefb_driver.c
@@ -1999,7 +1999,7 @@ static int savage_init_hw(struct savagefb_par *par)
 		int panelY = (VGArSEQ(0x69, par) +
 			      ((VGArSEQ(0x6e, par) & 0x70) << 4) + 1);

-		char * sTechnology = "Unknown";
+		char sTechnology[] = "Unknown";

 		/* OK, I admit it.  I don't know how to limit the max dot clock
 		 * for LCD panels of various sizes.  I thought I copied the
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
