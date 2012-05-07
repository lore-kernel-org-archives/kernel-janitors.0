From: Tomas Melin <tomas.melin@iki.fi>
Date: Mon, 07 May 2012 19:50:55 +0000
Subject: [PATCH 4/4] Staging: Comedi adv_pci1710: Fixed indentation
Message-Id: <1336420255-31277-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixed indentation for print messages and code.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   27 ++++++++++++--------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 9c17cd1..906eb52 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1172,15 +1172,13 @@ static int check_channel_list(struct comedi_device *dev,
 			comedi_error(dev, "Odd channel cannot be differential input!\n");
 			return 0;
 		}
-		nowmustbechan -			(CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
+		nowmustbechan = (CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
 		if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
 			nowmustbechan = (nowmustbechan + 1) % s->n_chan;
 		if (nowmustbechan != CR_CHAN(chanlist[i])) {
-			printk
-				("channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
-				 i, CR_CHAN(chanlist[i]), nowmustbechan,
-				 CR_CHAN(chanlist[0]));
+			printk("channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
+			       i, CR_CHAN(chanlist[i]), nowmustbechan,
+			       CR_CHAN(chanlist[0]));
 			return 0;
 		}
 		chansegment[i] = chanlist[i]; /* next correct channel in list */
@@ -1188,15 +1186,14 @@ static int check_channel_list(struct comedi_device *dev,
 
 	for (i = 0, segpos = 0; i < n_chan; i++) {
 		if (chanlist[i] != chansegment[i % seglen]) {
-			printk
-				("bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
-				 i, CR_CHAN(chansegment[i]),
-				 CR_RANGE(chansegment[i]),
-				 CR_AREF(chansegment[i]),
-				 CR_CHAN(chanlist[i % seglen]),
-				 CR_RANGE(chanlist[i % seglen]),
-				 CR_AREF(chansegment[i % seglen]));
-			return 0; /*  chan/gain list is strange */
+			printk("bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
+			       i, CR_CHAN(chansegment[i]),
+			       CR_RANGE(chansegment[i]),
+			       CR_AREF(chansegment[i]),
+			       CR_CHAN(chanlist[i % seglen]),
+			       CR_RANGE(chanlist[i % seglen]),
+			       CR_AREF(chansegment[i % seglen]));
+			return 0;
 		}
 	}
 	return seglen;
-- 
1.7.9.5

