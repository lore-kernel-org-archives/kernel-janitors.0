From: Tomas Melin <tomas.melin@iki.fi>
Date: Mon, 07 May 2012 19:49:48 +0000
Subject: [PATCH 2/4] Staging: Comedi adv_pci1710: Cleaned up comments
Message-Id: <1336420188-31181-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed useless comments and cleaned up text.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index 2048b19..ef8b429 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1163,33 +1163,31 @@ static int check_channel_list(struct comedi_device *dev,
 	if (n_chan = 1)
 		return 1; /* seglen=1 */
 
-	chansegment[0] = chanlist[0];	/*  first channel is every time ok */
-	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {	/*  build part of chanlist */
-		/*  printk("%d. %d %d\n",i,CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
+	chansegment[0] = chanlist[0]; /*  first channel is every time ok */
+	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {
 		if (chanlist[0] = chanlist[i])
-			break;	/*  we detect loop, this must by finish */
-		if (CR_CHAN(chanlist[i]) & 1)	/*  odd channel cann't by differencial */
+			break;	/*  we detected a loop, stop */
+		if (CR_CHAN(chanlist[i]) & 1)
 			if (CR_AREF(chanlist[i]) = AREF_DIFF) {
 				comedi_error(dev,
-					     "Odd channel can't be differential input!\n");
+					     "Odd channel cannot be differential input!\n");
 				return 0;
 			}
 		nowmustbechan  			(CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
 		if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
 			nowmustbechan = (nowmustbechan + 1) % s->n_chan;
-		if (nowmustbechan != CR_CHAN(chanlist[i])) {	/*  channel list isn't continuous :-( */
+		if (nowmustbechan != CR_CHAN(chanlist[i])) {
 			printk
 				("channel list must be continuous! chanlist[%i]=%d but must be %d or %d!\n",
 				 i, CR_CHAN(chanlist[i]), nowmustbechan,
 				 CR_CHAN(chanlist[0]));
 			return 0;
 		}
-		chansegment[i] = chanlist[i];	/*  well, this is next correct channel in list */
+		chansegment[i] = chanlist[i]; /* next correct channel in list */
 	}
 
-	for (i = 0, segpos = 0; i < n_chan; i++) {	/*  check whole chanlist */
-		/* printk("%d %d=%d %d\n",CR_CHAN(chansegment[i%seglen]),CR_RANGE(chansegment[i%seglen]),CR_CHAN(chanlist[i]),CR_RANGE(chanlist[i])); */
+	for (i = 0, segpos = 0; i < n_chan; i++) {
 		if (chanlist[i] != chansegment[i % seglen]) {
 			printk
 				("bad channel, reference or range number! chanlist[%i]=%d,%d,%d and not %d,%d,%d!\n",
@@ -1199,7 +1197,7 @@ static int check_channel_list(struct comedi_device *dev,
 				 CR_CHAN(chanlist[i % seglen]),
 				 CR_RANGE(chanlist[i % seglen]),
 				 CR_AREF(chansegment[i % seglen]));
-			return 0;	/*  chan/gain list is strange */
+			return 0; /*  chan/gain list is strange */
 		}
 	}
 	return seglen;
-- 
1.7.9.5

