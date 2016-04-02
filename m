From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 02 Apr 2016 04:51:08 +0000
Subject: [patch] usb: gadget: f_midi: unlock on error
Message-Id: <20160402045108.GD11775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We added some new locking here, but missed an error path where we need
to unlock.

Fixes: 9acdf4df2fc4 ('usb: gadget: f_midi: added spinlock on transmit function')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 56e2dde..2c0616c 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -609,8 +609,10 @@ static void f_midi_transmit(struct f_midi *midi)
 
 	do {
 		ret = f_midi_do_transmit(midi, ep);
-		if (ret < 0)
+		if (ret < 0) {
+			spin_unlock_irqrestore(&midi->transmit_lock, flags);
 			goto drop_out;
+		}
 	} while (ret);
 
 	spin_unlock_irqrestore(&midi->transmit_lock, flags);
