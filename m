From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2012 07:33:31 +0000
Subject: [patch] mwl8k: fix condition in mwl8k_cmd_encryption_remove_key()
Message-Id: <20120117073322.GE11358@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lennert Buytenhek <buytenh@wantstofly.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, Nishant Sarmukadam <nishants@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The intent here was to check whether key->cipher was WEP40 or WEP104.
We do a similar check correctly in several other places in this file.
The current condition is always true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/mwl8k.c b/drivers/net/wireless/mwl8k.c
index 7becea3..d187ea2 100644
--- a/drivers/net/wireless/mwl8k.c
+++ b/drivers/net/wireless/mwl8k.c
@@ -4066,7 +4066,7 @@ static int mwl8k_cmd_encryption_remove_key(struct ieee80211_hw *hw,
 		goto done;
 
 	if (key->cipher = WLAN_CIPHER_SUITE_WEP40 ||
-			WLAN_CIPHER_SUITE_WEP104)
+			key->cipher = WLAN_CIPHER_SUITE_WEP104)
 		mwl8k_vif->wep_key_conf[key->keyidx].enabled = 0;
 
 	cmd->action = cpu_to_le32(MWL8K_ENCR_REMOVE_KEY);
