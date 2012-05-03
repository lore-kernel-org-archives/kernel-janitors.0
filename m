From: Tomas Melin <tomas.melin@iki.fi>
Date: Thu, 03 May 2012 14:48:41 +0000
Subject: [PATCH 2/3] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <1336056521-4589-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Code indentation fixes, corrected comments.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   52 +++++++++++++-------------
 1 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 2048b19..a4c7dbb 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1163,43 +1163,43 @@ static int check_channel_list(struct comedi_device *dev,
 	if (n_chan = 1)
 		return 1; /* seglen=1 */
 
-	chansegment[0] = chanlist[0];	/*  first channel is every time ok */
-	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {	/*  build part of chanlist */
-		/*  printk("%d. %d %d\n",i,CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
+	/* n_chan must be >1
+	 * first channel is every time ok
+	 * build part of chanlist
+	 */
+	chansegment[0] = chanlist[0];
+	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {
 		if (chanlist[0] = chanlist[i])
-			break;	/*  we detect loop, this must by finish */
-		if (CR_CHAN(chanlist[i]) & 1)	/*  odd channel cann't by differencial */
+			break; /* detected loop, done */
+		if (CR_CHAN(chanlist[i]) & 1)
 			if (CR_AREF(chanlist[i]) = AREF_DIFF) {
 				comedi_error(dev,
-					     "Odd channel can't be differential input!\n");
+				"Odd channel can't be differential input!\n");
 				return 0;
 			}
-		nowmustbechan -			(CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
+		nowmustbechan = (CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
 		if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
 			nowmustbechan = (nowmustbechan + 1) % s->n_chan;
-		if (nowmustbechan != CR_CHAN(chanlist[i])) {	/*  channel list isn't continuous :-( */
-			printk
-				("channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
-				 i, CR_CHAN(chanlist[i]), nowmustbechan,
-				 CR_CHAN(chanlist[0]));
+		if (nowmustbechan != CR_CHAN(chanlist[i])) {
+			printk("channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
+				i, CR_CHAN(chanlist[i]), nowmustbechan,
+				CR_CHAN(chanlist[0]));
 			return 0;
 		}
-		chansegment[i] = chanlist[i];	/*  well, this is next correct channel in list */
+		/* well, this is next correct channel in list */
+		chansegment[i] = chanlist[i];
 	}
-
-	for (i = 0, segpos = 0; i < n_chan; i++) {	/*  check whole chanlist */
-		/* printk("%d %d=%d %d\n",CR_CHAN(chansegment[i%seglen]),CR_RANGE(chansegment[i%seglen]),CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
+	/*  check whole chanlist */
+	for (i = 0, segpos = 0; i < n_chan; i++) {
 		if (chanlist[i] != chansegment[i % seglen]) {
-			printk
-				("bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
-				 i, CR_CHAN(chansegment[i]),
-				 CR_RANGE(chansegment[i]),
-				 CR_AREF(chansegment[i]),
-				 CR_CHAN(chanlist[i % seglen]),
-				 CR_RANGE(chanlist[i % seglen]),
-				 CR_AREF(chansegment[i % seglen]));
-			return 0;	/*  chan/gain list is strange */
+			printk("bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
+				i, CR_CHAN(chansegment[i]),
+				CR_RANGE(chansegment[i]),
+				CR_AREF(chansegment[i]),
+				CR_CHAN(chanlist[i % seglen]),
+				CR_RANGE(chanlist[i % seglen]),
+				CR_AREF(chansegment[i % seglen]));
+			return 0; /* chan/gain list is strange */
 		}
 	}
 	return seglen;
-- 
1.7.5.4

