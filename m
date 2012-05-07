From: Tomas Melin <tomas.melin@iki.fi>
Date: Mon, 07 May 2012 19:50:24 +0000
Subject: [PATCH 3/4] Staging: Comedi adv_pci1710: Combined two conditions
Message-Id: <1336420224-31233-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Combined two if statements making the code cleaner, removing one level
of indentation.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index ef8b429..9c17cd1 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1167,12 +1167,11 @@ static int check_channel_list(struct comedi_device *dev,
 	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {
 		if (chanlist[0] = chanlist[i])
 			break;	/*  we detected a loop, stop */
-		if (CR_CHAN(chanlist[i]) & 1)
-			if (CR_AREF(chanlist[i]) = AREF_DIFF) {
-				comedi_error(dev,
-					     "Odd channel cannot be differential input!\n");
-				return 0;
-			}
+		if ((CR_CHAN(chanlist[i]) & 1) &&
+		    (CR_AREF(chanlist[i]) = AREF_DIFF)) {
+			comedi_error(dev, "Odd channel cannot be differential input!\n");
+			return 0;
+		}
 		nowmustbechan  			(CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
 		if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
-- 
1.7.9.5

