From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 08:27:27 +0000
Subject: [patch] staging: comedi: comedi_bond: silence a shift wrapping warning
Message-Id: <20130821082727.GB5240@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We set this using:

	devs_closed |= (0x1 << bdev->minor)

Since 0x1 is an int then only the lower 32 bits are usable before we hit
a shift wrapping bug.  There are some static checkers which complain
about this.  I've silenced the warning by making devs_closed a 32 bit
number.

32 bits should be enough for anybody.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/comedi_bond.c b/drivers/staging/comedi/drivers/comedi_bond.c
index 7e20bf0..8f6c942 100644
--- a/drivers/staging/comedi/drivers/comedi_bond.c
+++ b/drivers/staging/comedi/drivers/comedi_bond.c
@@ -335,7 +335,7 @@ static int bonding_attach(struct comedi_device *dev,
 static void bonding_detach(struct comedi_device *dev)
 {
 	struct comedi_bond_private *devpriv = dev->private;
-	unsigned long devs_closed = 0;
+	unsigned int devs_closed = 0;
 
 	if (devpriv) {
 		while (devpriv->ndevs-- && devpriv->devs) {
