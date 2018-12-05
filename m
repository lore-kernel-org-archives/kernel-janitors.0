From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 05 Dec 2018 07:26:06 +0000
Subject: [PATCH] b43: remove set but not used variables 'tx_pwr_state,tmp2'
Message-Id: <1543994766-7057-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538712945-141866-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538712945-141866-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Larry Finger <Larry.Finger@lwfinger.net>, Priit Laes <plaes@plaes.org>, Kees Cook <keescook@chromium.org>, Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/broadcom/b43/phy_n.c: In function 'b43_nphy_op_recalc_txpower':
drivers/net/wireless/broadcom/b43/phy_n.c:5898:7: warning:
 variable 'tx_pwr_state' set but not used [-Wunused-but-set-variable]

drivers/net/wireless/broadcom/b43/phy_n.c:6047:20: warning:
 variable 'tmp2' set but not used [-Wunused-but-set-variable]

'tx_pwr_state' never used since introduction in commit
8615eb2870f1 ("b43: N-PHY: support setting custom TX power")

'tmp2' not used any more since commit c002831a07dd ("b43: N-PHY: use helper
for checking IPA")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 7d30036..77d7cd5 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -5895,7 +5895,6 @@ static enum b43_txpwr_result b43_nphy_op_recalc_txpower(struct b43_wldev *dev,
 	struct ieee80211_channel *channel = dev->wl->hw->conf.chandef.chan;
 	struct b43_ppr *ppr = &nphy->tx_pwr_max_ppr;
 	u8 max; /* qdBm */
-	bool tx_pwr_state;
 
 	if (nphy->tx_pwr_last_recalc_freq = channel->center_freq &&
 	    nphy->tx_pwr_last_recalc_limit = phy->desired_txpower)
@@ -5931,7 +5930,6 @@ static enum b43_txpwr_result b43_nphy_op_recalc_txpower(struct b43_wldev *dev,
 	b43_ppr_apply_min(dev, ppr, INT_TO_Q52(8));
 
 	/* Apply */
-	tx_pwr_state = nphy->txpwrctrl;
 	b43_mac_suspend(dev);
 	b43_nphy_tx_power_ctl_setup(dev);
 	if (dev->dev->core_rev = 11 || dev->dev->core_rev = 12) {
@@ -6044,7 +6042,6 @@ static int b43_phy_initn(struct b43_wldev *dev)
 	u8 tx_pwr_state;
 	struct nphy_txgains target;
 	u16 tmp;
-	enum nl80211_band tmp2;
 	bool do_rssi_cal;
 
 	u16 clip[2];
@@ -6138,7 +6135,6 @@ static int b43_phy_initn(struct b43_wldev *dev)
 		b43_phy_write(dev, B43_NPHY_DUP40_BL, 0x9A4);
 	}
 
-	tmp2 = b43_current_band(dev->wl);
 	if (b43_nphy_ipa(dev)) {
 		b43_phy_set(dev, B43_NPHY_PAPD_EN0, 0x1);
 		b43_phy_maskset(dev, B43_NPHY_EPS_TABLE_ADJ0, 0x007F,
