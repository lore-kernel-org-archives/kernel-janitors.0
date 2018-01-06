From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 06 Jan 2018 09:26:50 +0000
Subject: [PATCH] mei: fix an && vs || typo
Message-Id: <20180106092650.n5jcxbazrzqlgvdt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

->dev_state can't be both MEI_DEV_RESETTING and MEI_DEV_POWER_DOWN at
the same time.  && was clearing intended here.

Fixes: 8d52af6795c0 ("mei: speed up the power down flow")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mei/hw-txe.c b/drivers/misc/mei/hw-txe.c
index 84197277f26c..c2c8993e2a51 100644
--- a/drivers/misc/mei/hw-txe.c
+++ b/drivers/misc/mei/hw-txe.c
@@ -1128,7 +1128,7 @@ irqreturn_t mei_txe_irq_thread_handler(int irq, void *dev_id)
 		/* Read from TXE */
 		rets = mei_irq_read_handler(dev, &cmpl_list, &slots);
 		if (rets &&
-		    (dev->dev_state != MEI_DEV_RESETTING ||
+		    (dev->dev_state != MEI_DEV_RESETTING &&
 		     dev->dev_state != MEI_DEV_POWER_DOWN)) {
 			dev_err(dev->dev,
 				"mei_irq_read_handler ret = %d.\n", rets);
