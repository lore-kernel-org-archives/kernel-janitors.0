From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Aug 2014 07:55:51 +0000
Subject: [patch]  staging: comedi: amplc_pci230: fix a precedence bug
Message-Id: <20140826073908.GB31076@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The addition operation has higher precedence than ?: so this would write
to PCI230_DACOUT1 instead of devpriv->daqio + PCI230_DACOUT1.

Fixes: 4f9c63fe5333 ('staging: comedi: amplc_pci230: refactor iobase addresses')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/amplc_pci230.c b/drivers/staging/comedi/drivers/amplc_pci230.c
index 0fd212f..60d21e0 100644
--- a/drivers/staging/comedi/drivers/amplc_pci230.c
+++ b/drivers/staging/comedi/drivers/amplc_pci230.c
@@ -628,7 +628,7 @@ static inline void pci230_ao_write_nofifo(struct comedi_device *dev,
 
 	/* Write mangled datum to appropriate DACOUT register. */
 	outw(pci230_ao_mangle_datum(dev, datum),
-	     devpriv->daqio + ((chan) = 0) ? PCI230_DACOUT1 : PCI230_DACOUT2);
+	     devpriv->daqio + ((chan = 0) ? PCI230_DACOUT1 : PCI230_DACOUT2));
 }
 
 static inline void pci230_ao_write_fifo(struct comedi_device *dev,
