From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Feb 2013 05:13:45 +0000
Subject: [patch 2/2] wlan-ng: add a bounds check
Message-Id: <20130227051345.GB22703@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm not sure where these results come from, but it can't hurt to
add a sanity check the array offset.  The .results[] array on the
next line has HFA384x_CHINFORESULT_MAX (16) elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index dc221f2..428a9be 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -1170,6 +1170,9 @@ static void prism2sta_inf_chinforesults(wlandevice_t *wlandev,
 		result = &inf->info.chinforesult.result[n];
 		chan = le16_to_cpu(result->chid) - 1;
 
+		if (chan < 0 || chan >= HFA384x_CHINFORESULT_MAX)
+			continue;
+
 		chinforesult = &hw->channel_info.results.result[chan];
 		chinforesult->chid = chan;
 		chinforesult->anl = le16_to_cpu(result->anl);
