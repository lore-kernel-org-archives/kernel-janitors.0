From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Jan 2015 14:20:25 +0000
Subject: [patch] staging: fbtft: fix allyesconfig build
Message-Id: <20150123142025.GA9974@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are two functions call reset() so the allyesconfig breaks.  Let's
make this one static.

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hi Jim, can you test this patch and see if it fixes the build issue?

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index 7fe4fa0..9cc7d25 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -89,7 +89,7 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
 
-void reset(struct fbtft_par *par)
+static void reset(struct fbtft_par *par)
 {
 	if (par->gpio.reset = -1)
 		return;
