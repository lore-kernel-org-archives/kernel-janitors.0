From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2016 10:00:05 +0000
Subject: [patch] mwifiex: fix a reversed condition
Message-Id: <20160202100005.GA3040@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <akarwar@marvell.com>, chunfan chen <jeffc@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The NULL test here is reversed.

Fixes: 7d7f07d8c5d3 ('mwifiex: add wowlan net-detect support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index fc8d8ca..489f7a9 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2196,7 +2196,7 @@ int mwifiex_ret_802_11_scan(struct mwifiex_private *priv,
 
 			pmatch = adapter->nd_info->matches[idx];
 
-			if (!pmatch) {
+			if (pmatch) {
 				memset(pmatch, 0, sizeof(*pmatch));
 				if (chan_band_tlv) {
 					pmatch->n_channels = 1;
