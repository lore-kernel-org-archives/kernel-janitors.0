From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Feb 2013 05:12:06 +0000
Subject: [patch 1/2] wlan-ng: clean up prism2sta_inf_chinforesults()
Message-Id: <20130227051206.GA22703@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This function is ugly because it hits against the 80 character
limit.  This patch does several things to clean it up.

1) Introduces "result" instead of inf->info.chinforesult.result[n].
2) Reverses the ".scanchannels & (1 << i)" so everthing can be
   pulled in one indent level.
3) Use "chan" instead of "channel".
4) Tweaks the line breaks to the call to pr_debug().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index 8d2277b..dc221f2 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -1160,30 +1160,30 @@ static void prism2sta_inf_chinforesults(wlandevice_t *wlandev,
 	    le16_to_cpu(inf->info.chinforesult.scanchannels);
 
 	for (i = 0, n = 0; i < HFA384x_CHINFORESULT_MAX; i++) {
-		if (hw->channel_info.results.scanchannels & (1 << i)) {
-			int channel -			    le16_to_cpu(inf->info.chinforesult.result[n].chid) -
-			    1;
-			hfa384x_ChInfoResultSub_t *chinforesult -			    &hw->channel_info.results.result[channel];
-			chinforesult->chid = channel;
-			chinforesult->anl -			    le16_to_cpu(inf->info.chinforesult.result[n].anl);
-			chinforesult->pnl -			    le16_to_cpu(inf->info.chinforesult.result[n].pnl);
-			chinforesult->active -			    le16_to_cpu(inf->info.chinforesult.result[n].
-					active);
-	pr_debug
-		("chinfo: channel %d, %s level (avg/peak)=%d/%d dB, pcf %d\n",
-			     channel + 1,
-			     chinforesult->
-			     active & HFA384x_CHINFORESULT_BSSACTIVE ? "signal"
-			     : "noise", chinforesult->anl, chinforesult->pnl,
-			     chinforesult->
-			     active & HFA384x_CHINFORESULT_PCFACTIVE ? 1 : 0);
-			n++;
-		}
+		hfa384x_ChInfoResultSub_t *result;
+		hfa384x_ChInfoResultSub_t *chinforesult;
+		int chan;
+
+		if (!(hw->channel_info.results.scanchannels & (1 << i)))
+			continue;
+
+		result = &inf->info.chinforesult.result[n];
+		chan = le16_to_cpu(result->chid) - 1;
+
+		chinforesult = &hw->channel_info.results.result[chan];
+		chinforesult->chid = chan;
+		chinforesult->anl = le16_to_cpu(result->anl);
+		chinforesult->pnl = le16_to_cpu(result->pnl);
+		chinforesult->active = le16_to_cpu(result->active);
+
+		pr_debug("chinfo: channel %d, %s level (avg/peak)=%d/%d dB, pcf %d\n",
+			 chan + 1,
+			 (chinforesult->active & HFA384x_CHINFORESULT_BSSACTIVE)
+				? "signal" : "noise",
+			 chinforesult->anl, chinforesult->pnl,
+			 (chinforesult->active & HFA384x_CHINFORESULT_PCFACTIVE)
+				? 1 : 0);
+		n++;
 	}
 	atomic_set(&hw->channel_info.done, 2);
 
