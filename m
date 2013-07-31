From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 09:08:36 +0000
Subject: [patch] paride: underflow bug in pg_write()
Message-Id: <20130731090836.GE8210@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Waugh <tim@cyberelk.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The test here can underflow so we pass bogus lengths to the hardware.
It's a static checker fix and I don't know the impact.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/paride/pg.c b/drivers/block/paride/pg.c
index 4a27b1d..2ce3dfd 100644
--- a/drivers/block/paride/pg.c
+++ b/drivers/block/paride/pg.c
@@ -581,7 +581,7 @@ static ssize_t pg_write(struct file *filp, const char __user *buf, size_t count,
 
 	if (hdr.magic != PG_MAGIC)
 		return -EINVAL;
-	if (hdr.dlen > PG_MAX_DATA)
+	if (hdr.dlen < 0 || hdr.dlen > PG_MAX_DATA)
 		return -EINVAL;
 	if ((count - hs) > PG_MAX_DATA)
 		return -EINVAL;
