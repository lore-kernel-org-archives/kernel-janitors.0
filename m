From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Mar 2013 20:31:46 +0000
Subject: [patch] applicom: use correct array offset
Message-Id: <20130301203146.GC22066@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We're iterating through abps[] printing information, but here we
use the wrong array index.  IndexCard comes from the user and in
this case it was specifically not range checked because we didn't
expect to use it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/applicom.c b/drivers/char/applicom.c
index 25373df..974321a 100644
--- a/drivers/char/applicom.c
+++ b/drivers/char/applicom.c
@@ -804,8 +804,8 @@ static long ac_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 			printk(KERN_INFO "Prom version board %d ....... V%d.%d %s",
 			       i+1,
-			       (int)(readb(apbs[IndexCard].RamIO + VERS) >> 4),
-			       (int)(readb(apbs[IndexCard].RamIO + VERS) & 0xF),
+			       (int)(readb(apbs[i].RamIO + VERS) >> 4),
+			       (int)(readb(apbs[i].RamIO + VERS) & 0xF),
 			       boardname);
 
 
