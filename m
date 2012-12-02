From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 02 Dec 2012 10:36:09 +0000
Subject: [patch] p54: potential signedness issue in p54_parse_rssical()
Message-Id: <20121202103609.GA16078@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"entries" is unsigned here, so it is never less than zero.  In theory,
len could be less than offset so I have added a check for that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/p54/eeprom.c b/drivers/net/wireless/p54/eeprom.c
index 1ef1bfe..d43e374 100644
--- a/drivers/net/wireless/p54/eeprom.c
+++ b/drivers/net/wireless/p54/eeprom.c
@@ -541,8 +541,9 @@ static int p54_parse_rssical(struct ieee80211_hw *dev,
 		entries = (len - offset) /
 			sizeof(struct pda_rssi_cal_ext_entry);
 
-		if ((len - offset) % sizeof(struct pda_rssi_cal_ext_entry) ||
-		    entries <= 0) {
+		if (len < offset ||
+		    (len - offset) % sizeof(struct pda_rssi_cal_ext_entry) ||
+		    entries = 0) {
 			wiphy_err(dev->wiphy, "invalid rssi database.\n");
 			goto err_data;
 		}
