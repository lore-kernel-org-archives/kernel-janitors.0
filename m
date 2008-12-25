From: Julia Lawall <julia@diku.dk>
Date: Thu, 25 Dec 2008 20:09:57 +0000
Subject: [PATCH 1/2] drivers/staging/go7007: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0812252109230.31651@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pete@sensoray.com, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kmalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,l;
position p1,p2;
expression *ptr != NULL;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
)
<... when != x
     when != if (...) { <+...x...+> }
x->f = E
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/staging/go7007/s2250-board.c           |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/go7007/s2250-board.c b/drivers/staging/go7007/s2250-board.c
index fb6845e..a11ce63 100644
--- a/drivers/staging/go7007/s2250-board.c
+++ b/drivers/staging/go7007/s2250-board.c
@@ -166,6 +166,7 @@ static int write_reg(struct i2c_client *client, u8 reg, u8 value)
 
 	if (down_interruptible(&usb->i2c_lock) != 0) {
 		printk(KERN_INFO "i2c lock failed\n");
+		kfree(buf);
 		return -EINTR;
 	}
 	rc = go7007_usb_vendor_request(go, 0x55, dev_addr,
