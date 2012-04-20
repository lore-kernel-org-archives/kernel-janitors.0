From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 13:15:02 +0000
Subject: [patch] [media] ngene: remove an unneeded condition
Message-Id: <20120420131502.GB26339@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Oliver Endriss <o.endriss@gmx.de>, Ralph Metzler <rmetzler@digitaldevices.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"stat" is always zero here.  The condition used to be needed, but we
shifted stuff around in 0f0b270f90 "[media] ngene: CXD2099AR Common
Interface driver".

This doesn't change how the code works, it's just a bit tidier.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/ngene/ngene-core.c b/drivers/media/dvb/ngene/ngene-core.c
index f129a93..3985738 100644
--- a/drivers/media/dvb/ngene/ngene-core.c
+++ b/drivers/media/dvb/ngene/ngene-core.c
@@ -1409,10 +1409,8 @@ static int ngene_start(struct ngene *dev)
 	if (stat < 0)
 		goto fail;
 
-	if (!stat)
-		return stat;
+	return 0;
 
-	/* otherwise error: fall through */
 fail:
 	ngwritel(0, NGENE_INT_ENABLE);
 	free_irq(dev->pci_dev->irq, dev);
