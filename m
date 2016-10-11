From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2016 06:47:22 +0000
Subject: [bug report] wlcore/wl18xx: Add functionality to accept TX rate per link
Message-Id: <20161011064722.GA7477@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Maxim Altshul,

The patch 88f07e70d1be: "wlcore/wl18xx: Add functionality to accept
TX rate per link" from Jul 11, 2016, leads to the following static
checker warning:

	drivers/net/wireless/ti/wl18xx/tx.c:35 wl18xx_get_last_tx_rate()
	error: buffer overflow 'wl->links' 16 <= 255

drivers/net/wireless/ti/wl18xx/tx.c
    31  static
    32  void wl18xx_get_last_tx_rate(struct wl1271 *wl, struct ieee80211_vif *vif,
    33                               u8 band, struct ieee80211_tx_rate *rate, u8 hlid)
    34  {
    35          u8 fw_rate = wl->links[hlid].fw_rate_idx;
                                       ^^^^
The complaint here is that we take "hlid" from skb->data without
verifying that it's correct.  But this is the tx path and not the rx
path so it might be a false positive if we verify that it's correct
earlier.  I don't know the code well enough to say.

    36  
    37          if (fw_rate > CONF_HW_RATE_INDEX_MAX) {
    38                  wl1271_error("last Tx rate invalid: %d", fw_rate);
    39                  rate->idx = 0;
    40                  rate->flags = 0;
    41                  return;
    42          }
    43  
    44          if (fw_rate <= CONF_HW_RATE_INDEX_54MBPS) {
    45                  rate->idx = fw_rate;
    46                  if (band = NL80211_BAND_5GHZ)
    47                          rate->idx -= CONF_HW_RATE_INDEX_6MBPS;
    48                  rate->flags = 0;

regards,
dan carpenter
