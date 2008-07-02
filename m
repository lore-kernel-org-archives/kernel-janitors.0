From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 02 Jul 2008 23:41:38 +0000
Subject: [PATCH] drivers/net/wireless/iwlwifi/iwl-3945.c Fix type issue on
Message-Id: <1215042098.8635.14.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linville@tuxdriver.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ipw2100-admin@linux.intel.com, yi.zhu@intel.com

>> What about the format line in the IWL_DEBUG_RX that uses rate?

I had figured that as rate was only positive it would work as is.
However you are dead right, there is no point in a patch removing one
example of bad programming only to introduce another.

Here is the updated patch:


Coverity CID: 2265 NEGATIVE_RETURNS

"rate" is of an unsigned type, and the code requires a signed type.
The following patch makes it so.

﻿﻿Signed-off-by: Darren Jenkins <darrenrjenkins@gmailcom>

diff --git a/drivers/net/wireless/iwlwifi/iwl-3945.c b/drivers/net/wireless/iwlwifi/iwl-3945.c
index 62a3d8f..d97c025 100644
--- a/drivers/net/wireless/iwlwifi/iwl-3945.c
+++ b/drivers/net/wireless/iwlwifi/iwl-3945.c
@@ -449,7 +449,7 @@ static void iwl3945_dbg_report_frame(struct iwl3945_priv *priv,
 
 	if (print_summary) {
 		char *title;
-		u32 rate;
+		int rate;
 
 		if (hundred)
 			title = "100Frames";
@@ -487,7 +487,7 @@ static void iwl3945_dbg_report_frame(struct iwl3945_priv *priv,
 		 *    but you can hack it to show more, if you'd like to. */
 		if (dataframe)
 			IWL_DEBUG_RX("%s: mhd=0x%04x, dst=0x%02x, "
-				     "len=%u, rssi=%d, chnl=%d, rate=%u, \n",
+				     "len=%u, rssi=%d, chnl=%d, rate=%d, \n",
 				     title, fc, header->addr1[5],
 				     length, rssi, channel, rate);
 		else {


