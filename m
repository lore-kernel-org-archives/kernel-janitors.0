From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 24 Jan 2005 22:50:12 +0000
Subject: [KJ] [UPDATE PATCH 2/40] atm/zatm: replace sleep_on() with
Message-Id: <20050124225012.GE2685@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45453578141360951=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45453578141360951==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 20, 2005 at 10:17:42AM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: Use wait_event() instead of the deprecated sleep_on(). The first
> replacement is relatively non-controversial, as the message is only printed
> once, and still is. In the second, though, the message is printed every
> iteration of the loop. This functionality has been lost with wait_event().
> Removed the unused variable once (which made sure that certain things were done
> on the first iteration of the loop, but not after; now there is only one
> "iteration"). Also fixed some strange tabbing.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.11-rc1-kj-v/drivers/atm/zatm.c	2005-01-15 16:55:43.000000000 -0800
> +++ 2.6.11-rc1-kj/drivers/atm/zatm.c	2005-01-19 17:41:21.000000000 -0800

<snip>

> +	wait_event(zatm_vcc->tx_wait, !skb_peek(&zatm_vcc->backlog));
> +	printk("waiting for TX queue to drain ... %p\n",skb);

This line results in a compile failure. Fixed (sort of) below...


Description: Use wait_event() instead of the deprecated sleep_on(). The first
replacement is relatively non-controversial, as the message is only printed
once, and still is. In the second, though, the message is printed every
iteration of the loop. This functionality has been lost with wait_event().
Removed the unused variable once (which made sure that certain things were done
on the first iteration of the loop, but not after; now there is only one
"iteration"). Also fixed some strange tabbing. The final printk had to be
modified as well, since it references a pointer which has not yet been assigned.
Since the printk only happens once now (instead of repeatedly in a loop as
before), I think this should be ok.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/atm/zatm.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/atm/zatm.c	2005-01-19 17:41:21.000000000 -0800
@@ -22,6 +22,7 @@
 #include <linux/atm_zatm.h>
 #include <linux/capability.h>
 #include <linux/bitops.h>
+#include <linux/wait.h>
 #include <asm/byteorder.h>
 #include <asm/system.h>
 #include <asm/string.h>
@@ -867,32 +868,19 @@ static void close_tx(struct atm_vcc *vcc
 	struct zatm_vcc *zatm_vcc;
 	unsigned long flags;
 	int chan;
-struct sk_buff *skb;
-int once = 1;
+	struct sk_buff *skb;
 
 	zatm_vcc = ZATM_VCC(vcc);
 	zatm_dev = ZATM_DEV(vcc->dev);
 	chan = zatm_vcc->tx_chan;
 	if (!chan) return;
 	DPRINTK("close_tx\n");
-	while (skb_peek(&zatm_vcc->backlog)) {
-if (once) {
-printk("waiting for backlog to drain ...\n");
-event_dump();
-once = 0;
-}
-		sleep_on(&zatm_vcc->tx_wait);
-	}
-once = 1;
-	while ((skb = skb_peek(&zatm_vcc->tx_queue))) {
-if (once) {
-printk("waiting for TX queue to drain ... %p\n",skb);
-event_dump();
-once = 0;
-}
-		DPRINTK("waiting for TX queue to drain ... %p\n",skb);
-		sleep_on(&zatm_vcc->tx_wait);
-	}
+	printk("waiting for backlog to drain ...\n");
+	event_dump();
+	wait_event(zatm_vcc->tx_wait, !skb_peek(&zatm_vcc->backlog));
+	printk("waiting for TX queue to drain ...\n");
+	event_dump();
+	wait_event(zatm_vcc->tx_wait, !(skb = skb_peek(&zatm_vcc->tx_queue)));
 	spin_lock_irqsave(&zatm_dev->lock, flags);
 #if 0
 	zwait;

--===============45453578141360951==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45453578141360951==--
