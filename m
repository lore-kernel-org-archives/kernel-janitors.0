From: Thomas Meyer <thomas@m3y3r.de>
Date: Thu, 04 Aug 2011 22:05:58 +0000
Subject: [PATCH] GFP_KERNEL malloc with lock held in net/wireless/mwifiex
Message-Id: <1312495562.2629.53.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Thomas Meyer <thomas@m3y3r.de>

 Find functions that refer to GFP_KERNEL but are called with locks held.
 The proposed change of converting the GFP_KERNEL is not necessarily the
 correct one.  It may be desired to unlock the lock, or to not call the
 function under the lock in the first place.

 The semantic patch that makes this output is available
 in scripts/coccinelle/locks/call_kern.cocci.

 More information about semantic patching is available at
 http://coccinelle.lip6.fr/

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---
the function mwifiex_save_curr_bcn() is guarded by:

 spin_lock_irqsave(&priv->curr_bcn_buf_lock, flags);
 mwifiex_save_curr_bcn(priv);
 spin_unlock_irqrestore(&priv->curr_bcn_buf_lock, flags);

Is it okay to allocate memory with a spin lock held and interrupts
disabled in this case?

diff -u -p a/drivers/net/wireless/mwifiex/scan.c b/drivers/net/wireless/mwifiex/scan.c
--- a/drivers/net/wireless/mwifiex/scan.c 2011-07-26 00:46:08.483511656 +0200
+++ b/drivers/net/wireless/mwifiex/scan.c 2011-08-02 09:36:50.174808818 +0200
@@ -2998,7 +2998,7 @@ mwifiex_save_curr_bcn(struct mwifiex_pri
 
 		kfree(priv->curr_bcn_buf);
 		priv->curr_bcn_buf = kzalloc(curr_bss->beacon_buf_size,
-						GFP_KERNEL);
+						GFP_ATOMIC);
 		if (!priv->curr_bcn_buf) {
 			dev_err(priv->adapter->dev,
 					"failed to alloc curr_bcn_buf\n");


