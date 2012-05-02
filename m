From: Tomas Melin <tomas.melin@iki.fi>
Date: Wed, 02 May 2012 16:13:37 +0000
Subject: [PATCH] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <1335975217-5895-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-Simplified function logic by assuming that n_chan >1 if not <=1. Removes
one level of indentation.
-> readability improved and code fits into 80 chars
- Code indentation fixes, corrected comments
- Added braces to if() for readability

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   84 +++++++++++++-------------
 1 files changed, 43 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 8318c82..fa4a6fb 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1142,9 +1142,9 @@ static int pci171x_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 
 /*
 =======================================
- Check if channel list from user is builded correctly
- If it's ok, then program scan/gain logic.
- This works for all cards.
+ * Check if channel list from user is build correctly
+ * If it's ok, then program scan/gain logic.
+ * This works for all cards.
 */
 static int check_channel_list(struct comedi_device *dev,
 			      struct comedi_subdevice *s,
@@ -1160,48 +1160,50 @@ static int check_channel_list(struct comedi_device *dev,
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
+	/* n_chan must be >1 */
+	/* first channel is every time ok */
+	chansegment[0] = chanlist[0];
+	/*  build part of chanlist */
+	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {
+		if (chanlist[0] = chanlist[i])
+			break; /* detected loop, done */
+		if (CR_CHAN(chanlist[i]) & 1) {
+			if (CR_AREF(chanlist[i]) = AREF_DIFF) {
+				comedi_error(dev,
+				"Odd channel can't be differential input!\n");
 				return 0;
 			}
-			chansegment[i] = chanlist[i];	/*  well, this is next correct channel in list */
 		}
-
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
+		nowmustbechan = (CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
+		if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
+			nowmustbechan = (nowmustbechan + 1) % s->n_chan;
+		/*  channel list isn't continuous :-( */
+		if (nowmustbechan != CR_CHAN(chanlist[i])) {
+			printk(
+				"channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
+				i, CR_CHAN(chanlist[i]), nowmustbechan,
+				CR_CHAN(chanlist[0]));
+			return 0;
+		}
+		/*  well, this is next correct channel in list */
+		chansegment[i] = chanlist[i];
+	}
+	/*  check whole chanlist */
+	for (i = 0, segpos = 0; i < n_chan; i++) {
+		if (chanlist[i] != chansegment[i % seglen]) {
+			printk(
+				"bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
+				i, CR_CHAN(chansegment[i]),
+				CR_RANGE(chansegment[i]),
+				CR_AREF(chansegment[i]),
+				CR_CHAN(chanlist[i % seglen]),
+				CR_RANGE(chanlist[i % seglen]),
+				CR_AREF(chansegment[i % seglen]));
+			return 0; /*  chan/gain list is strange */
 		}
-	} else {
-		seglen = 1;
 	}
 	return seglen;
 }
-- 
1.7.5.4

