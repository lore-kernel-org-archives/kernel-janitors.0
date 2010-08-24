From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 11:56:27 +0000
Subject: [patch] mtd/pcmciamtd: remove dead code
Message-Id: <20100824115627.GD29330@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Magnus Damm <damm@opensource.se>, Alexander Kurz <linux@kbdbabel.org>, linux-mtd@lists.infradead.org, Karsten Keil <keil@b1-systems.de>

This code isn't reachable.  I looked through the git history and it
hasn't been reachable for years.  Someone removed the label to silence
gcc's unused label warning but these few lines accidentally got left
behind.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index e9ca5ba..86c7468 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -654,10 +654,6 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	}
 	dev_info(&dev->p_dev->dev, "mtd%d: %s\n", mtd->index, mtd->name);
 	return 0;
-
-	dev_err(&dev->p_dev->dev, "CS Error, exiting\n");
-	pcmciamtd_release(link);
-	return -ENODEV;
 }
 
 

