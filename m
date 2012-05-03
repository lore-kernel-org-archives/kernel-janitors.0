From: Tomas Melin <tomas.melin@iki.fi>
Date: Thu, 03 May 2012 14:49:03 +0000
Subject: [PATCH 3/3] Staging: Comedi adv_pci1710: Cleaned up function check_channel_list
Message-Id: <1336056543-4625-1-git-send-email-tomas.melin@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed one additional level of if() by combining two if() statements into one.

Signed-off-by: Tomas Melin <tomas.melin@iki.fi>
---
 drivers/staging/comedi/drivers/adv_pci1710.c |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci1710.c b/drivers/staging/comedi/drivers/adv_pci1710.c
index a4c7dbb..72ff1de 100644
--- a/drivers/staging/comedi/drivers/adv_pci1710.c
+++ b/drivers/staging/comedi/drivers/adv_pci1710.c
@@ -1171,12 +1171,11 @@ static int check_channel_list(struct comedi_device *dev,
 	for (i = 1, seglen = 1; i < n_chan; i++, seglen++) {
 		if (chanlist[0] = chanlist[i])
 			break; /* detected loop, done */
-		if (CR_CHAN(chanlist[i]) & 1)
-			if (CR_AREF(chanlist[i]) = AREF_DIFF) {
-				comedi_error(dev,
-				"Odd channel can't be differential input!\n");
-				return 0;
-			}
+		if ((CR_CHAN(chanlist[i]) & 1) &&
+		    (CR_AREF(chanlist[i]) = AREF_DIFF)) {
+			comedi_error(dev, "Odd channel can't be differential input!\n");
+			return 0;
+		}
 		nowmustbechan = (CR_CHAN(chansegment[i - 1]) + 1) % s->n_chan;
 		if (CR_AREF(chansegment[i - 1]) = AREF_DIFF)
 			nowmustbechan = (nowmustbechan + 1) % s->n_chan;
-- 
1.7.5.4

