From: Tomas Melin <tomas.melin@iki.fi>
Date: Wed, 02 May 2012 16:15:17 +0000
Subject: [PATCH 2/2] Staging: Comedi adv_pci1710 : Corrected over 80 column warnings
Message-Id: <1335975317-5969-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Indentation problems aswell as various comments and code lines longer
than 80 chars fixed in file adv_pci1710.c

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index dd40fd3..3f6733a 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1220,14 +1220,14 @@ static void setup_channel_list(struct comedi_device *dev,
 	DPRINTK("SegLen: %d\n", seglen);
 	for (i = 0; i < seglen; i++) {	/*  store range list to card */
 		chanprog = muxonechan[CR_CHAN(chanlist[i])];
-		outw(chanprog, dev->iobase + PCI171x_MUX);	/* select channel */
+		outw(chanprog, dev->iobase + PCI171x_MUX); /* select channel */
 		range = this_board->rangecode_ai[CR_RANGE(chanlist[i])];
 		if (CR_AREF(chanlist[i]) = AREF_DIFF)
 			range |= 0x0020;
-		outw(range, dev->iobase + PCI171x_RANGE);	/* select gain */
+		outw(range, dev->iobase + PCI171x_RANGE); /* select gain */
 #ifdef PCI171x_PARANOIDCHECK
 		devpriv->act_chanlist[i] -		    (CR_CHAN(chanlist[i]) << 12) & 0xf000;
+			(CR_CHAN(chanlist[i]) << 12) & 0xf000;
 #endif
 		DPRINTK("GS: %2d. [%4x]=%4x %4x\n", i, chanprog, range,
 			devpriv->act_chanlist[i]);
@@ -1235,13 +1235,14 @@ static void setup_channel_list(struct comedi_device *dev,
 #ifdef PCI171x_PARANOIDCHECK
 	for ( ; i < n_chan; i++) { /* store remainder of channel list */
 		devpriv->act_chanlist[i] -		    (CR_CHAN(chanlist[i]) << 12) & 0xf000;
+			(CR_CHAN(chanlist[i]) << 12) & 0xf000;
 	}
 #endif
 
 	devpriv->ai_et_MuxVal -	    CR_CHAN(chanlist[0]) | (CR_CHAN(chanlist[seglen - 1]) << 8);
-	outw(devpriv->ai_et_MuxVal, dev->iobase + PCI171x_MUX);	/* select channel interval to scan */
+		CR_CHAN(chanlist[0]) | (CR_CHAN(chanlist[seglen - 1]) << 8);
+	/* select channel interval to scan */
+	outw(devpriv->ai_et_MuxVal, dev->iobase + PCI171x_MUX);
 	DPRINTK("MUX: %4x L%4x.H%4x\n",
 		CR_CHAN(chanlist[0]) | (CR_CHAN(chanlist[seglen - 1]) << 8),
 		CR_CHAN(chanlist[0]), CR_CHAN(chanlist[seglen - 1]));
-- 
1.7.5.4

