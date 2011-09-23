From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:25:48 +0000
Subject: [patch] paride: potential information leak in pg_read()
Message-Id: <20110923062548.GK4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Waugh <tim@cyberelk.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch has a new check for Rosenberg type information leaks where
structs are copied to the user with uninitialized stack data in them.
i
In this case, the pg_write_hdr struct has a hole in it.

struct pg_write_hdr {
        char                       magic;                /*     0     1 */
        char                       func;                 /*     1     1 */
        /* XXX 2 bytes hole, try to pack */
        int                        dlen;                 /*     4     4 */

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/paride/pg.c b/drivers/block/paride/pg.c
index 6b9a200..a79fb4f 100644
--- a/drivers/block/paride/pg.c
+++ b/drivers/block/paride/pg.c
@@ -630,6 +630,7 @@ static ssize_t pg_read(struct file *filp, char __user *buf, size_t count, loff_t
 		if (dev->status & 0x10)
 			return -ETIME;
 
+	memset(&hdr, 0, sizeof(hdr));
 	hdr.magic = PG_MAGIC;
 	hdr.dlen = dev->dlen;
 	copy = 0;

