From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:18:58 +0000
Subject: [PATCH 19/37] drivers/net/usb: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152318410.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petko Manolov <petkan@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/usb/pegasus.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff -u -p a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -203,13 +203,12 @@ static int set_registers(pegasus_t * peg
 	char *buffer;
 	DECLARE_WAITQUEUE(wait, current);
 
-	buffer = kmalloc(size, GFP_KERNEL);
+	buffer = kmemdup(data, size, GFP_KERNEL);
 	if (!buffer) {
 		netif_warn(pegasus, drv, pegasus->net,
 			   "out of memory in %s\n", __func__);
 		return -ENOMEM;
 	}
-	memcpy(buffer, data, size);
 
 	add_wait_queue(&pegasus->ctrl_wait, &wait);
 	set_current_state(TASK_UNINTERRUPTIBLE);
@@ -255,13 +254,12 @@ static int set_register(pegasus_t * pega
 	char *tmp;
 	DECLARE_WAITQUEUE(wait, current);
 
-	tmp = kmalloc(1, GFP_KERNEL);
+	tmp = kmemdup(&data, 1, GFP_KERNEL);
 	if (!tmp) {
 		netif_warn(pegasus, drv, pegasus->net,
 			   "out of memory in %s\n", __func__);
 		return -ENOMEM;
 	}
-	memcpy(tmp, &data, 1);
 	add_wait_queue(&pegasus->ctrl_wait, &wait);
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	while (pegasus->flags & ETH_REGS_CHANGED)
