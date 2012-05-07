From: Tomas Melin <tomas.melin@iki.fi>
Date: Mon, 07 May 2012 19:49:11 +0000
Subject: [PATCH 1/4] Staging: Comedi adv_pci1710: Move check forward
Message-Id: <1336420151-31137-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Simplifies function logic by assuming that n_chan >1 if not <=1.
Removes one level of indentation.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   73 +++++++++++++-------------
 1 file changed, 36 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 8318c82..2048b19 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1160,48 +1160,47 @@ static int check_channel_list(struct comedi_device *dev,
 		return 0;
 	}
 
-	if (n_chan > 1) {
-		chansegment[0] = chanlist[0];	/*  first channel is every time ok */
-		for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {	/*  build part of chanlist */
-			/*  printk("%d. %d %d\n",i,CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
-			if (chanlist[0] = chanlist[i])
-				break;	/*  we detect loop, this must by finish */
-			if (CR_CHAN(chanlist[i]) & 1)	/*  odd channel cann't by differencial */
-				if (CR_AREF(chanlist[i]) = AREF_DIFF) {
-					comedi_error(dev,
-						     "Odd channel can't be differential input!\n");
-					return 0;
-				}
-			nowmustbechan -			    (CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
-			if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
-				nowmustbechan = (nowmustbechan + 1) % s->n_chan;
-			if (nowmustbechan != CR_CHAN(chanlist[i])) {	/*  channel list isn't continuous :-( */
-				printk
-				    ("channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
-				     i, CR_CHAN(chanlist[i]), nowmustbechan,
-				     CR_CHAN(chanlist[0]));
+	if (n_chan = 1)
+		return 1; /* seglen=1 */
+
+	chansegment[0] = chanlist[0];	/*  first channel is every time ok */
+	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {	/*  build part of chanlist */
+		/*  printk("%d. %d %d\n",i,CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
+		if (chanlist[0] = chanlist[i])
+			break;	/*  we detect loop, this must by finish */
+		if (CR_CHAN(chanlist[i]) & 1)	/*  odd channel cann't by differencial */
+			if (CR_AREF(chanlist[i]) = AREF_DIFF) {
+				comedi_error(dev,
+					     "Odd channel can't be differential input!\n");
 				return 0;
 			}
-			chansegment[i] = chanlist[i];	/*  well, this is next correct channel in list */
+		nowmustbechan +			(CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
+		if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
+			nowmustbechan = (nowmustbechan + 1) % s->n_chan;
+		if (nowmustbechan != CR_CHAN(chanlist[i])) {	/*  channel list isn't continuous :-( */
+			printk
+				("channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
+				 i, CR_CHAN(chanlist[i]), nowmustbechan,
+				 CR_CHAN(chanlist[0]));
+			return 0;
 		}
+		chansegment[i] = chanlist[i];	/*  well, this is next correct channel in list */
+	}
 
-		for (i = 0, segpos = 0; i < n_chan; i++) {	/*  check whole chanlist */
-			/* printk("%d %d=%d %d\n",CR_CHAN(chansegment[i%seglen]),CR_RANGE(chansegment[i%seglen]),CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
-			if (chanlist[i] != chansegment[i % seglen]) {
-				printk
-				    ("bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
-				     i, CR_CHAN(chansegment[i]),
-				     CR_RANGE(chansegment[i]),
-				     CR_AREF(chansegment[i]),
-				     CR_CHAN(chanlist[i % seglen]),
-				     CR_RANGE(chanlist[i % seglen]),
-				     CR_AREF(chansegment[i % seglen]));
-				return 0;	/*  chan/gain list is strange */
-			}
+	for (i = 0, segpos = 0; i < n_chan; i++) {	/*  check whole chanlist */
+		/* printk("%d %d=%d %d\n",CR_CHAN(chansegment[i%seglen]),CR_RANGE(chansegment[i%seglen]),CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
+		if (chanlist[i] != chansegment[i % seglen]) {
+			printk
+				("bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
+				 i, CR_CHAN(chansegment[i]),
+				 CR_RANGE(chansegment[i]),
+				 CR_AREF(chansegment[i]),
+				 CR_CHAN(chanlist[i % seglen]),
+				 CR_RANGE(chanlist[i % seglen]),
+				 CR_AREF(chansegment[i % seglen]));
+			return 0;	/*  chan/gain list is strange */
 		}
-	} else {
-		seglen = 1;
 	}
 	return seglen;
 }
-- 
1.7.9.5

