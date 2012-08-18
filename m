From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Aug 2012 08:47:59 +0000
Subject: [patch] staging: ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <20120818084759.GB30592@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"addr" is a pointer so it's either 4 or 8 bytes, but actually we want
to compare 6 bytes (ETH_ALEN).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ozwpan/ozcdev.c b/drivers/staging/ozwpan/ozcdev.c
index d983219..63c1b67 100644
--- a/drivers/staging/ozwpan/ozcdev.c
+++ b/drivers/staging/ozwpan/ozcdev.c
@@ -213,7 +213,7 @@ static int oz_set_active_pd(u8 *addr)
 		if (old_pd)
 			oz_pd_put(old_pd);
 	} else {
-		if (!memcmp(addr, "\0\0\0\0\0\0", sizeof(addr))) {
+		if (!memcmp(addr, "\0\0\0\0\0\0", ETH_ALEN)) {
 			spin_lock_bh(&g_cdev.lock);
 			pd = g_cdev.active_pd;
 			g_cdev.active_pd = 0;
