From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 10 Aug 2012 09:22:23 +0000
Subject: [PATCH] edac_mc: fix kfree calls in the error path
Message-Id: <20120810092223.GA27375@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120809135416.GA13100@localhost>
 <5023F360.2050409@redhat.com>
In-Reply-To: <5023F360.2050409@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Dave Peterson <dsp@llnl.gov>, kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org

We need to free up memory in this order: 

  free csrows[i]->channels[j]
  free csrows[i]->channels
  free csrows[i]
  free csrows

Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 drivers/edac/edac_mc.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

--- linux.orig/drivers/edac/edac_mc.c	2012-08-10 17:16:14.444794060 +0800
+++ linux/drivers/edac/edac_mc.c	2012-08-10 17:16:19.048794169 +0800
@@ -419,14 +419,16 @@ error:
 		kfree(mci->dimms);
 	}
 	if (mci->csrows) {
-		for (chn = 0; chn < tot_channels; chn++) {
-			csr = mci->csrows[chn];
+		for (row = 0; row < tot_csrows; row++) {
+			csr = mci->csrows[row];
 			if (csr) {
-				for (chn = 0; chn < tot_channels; chn++)
-					kfree(csr->channels[chn]);
+				if (csr->channels) {
+					for (chn = 0; chn < tot_channels; chn++)
+						kfree(csr->channels[chn]);
+					kfree(csr->channels);
+				}
 				kfree(csr);
 			}
-			kfree(mci->csrows[i]);
 		}
 		kfree(mci->csrows);
 	}
