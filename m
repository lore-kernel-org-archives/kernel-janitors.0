From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Aug 2015 21:08:43 +0000
Subject: [patch] paride: fix a return in pd_detect()
Message-Id: <20150812210843.GC8068@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Waugh <tim@cyberelk.net>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

In this function returning non-zero means the hardware was detected and
zero means it wasn't.  This is a failure path so we should return zero.

Fixes: 9f4ba6b05869 ('paride: use new parport device model')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/paride/pd.c b/drivers/block/paride/pd.c
index b9242d7..4e75c5f 100644
--- a/drivers/block/paride/pd.c
+++ b/drivers/block/paride/pd.c
@@ -877,7 +877,7 @@ static int pd_detect(void)
 	par_drv = pi_register_driver(name);
 	if (!par_drv) {
 		pr_err("failed to register %s driver\n", name);
-		return -1;
+		return 0;
 	}
 
 	if (pd_drive_count = 0) { /* nothing spec'd - so autoprobe for 1 */
