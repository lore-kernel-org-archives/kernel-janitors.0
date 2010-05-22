From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:33:11 +0000
Subject: [patch] ath9k: cleanup: remove unneeded null check
Message-Id: <20100522203311.GR22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Cc: Jouni Malinen <jmalinen@atheros.com>, Sujith Manoharan <Sujith.Manoharan@atheros.com>, Vasanthakumar Thiagarajan <vasanth@atheros.com>, Senthil Balasubramanian <senthilkumar@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Ming Lei <tom.leiming@gmail.com>, linux-wireless@vger.kernel.org, ath9k-devel@lists.ath9k.org, kernel-janitors@vger.kernel.org

We dereference "wmi" on the line before and also when we initialize "ah".
This check has always been after a dereference since the first commit a
couple months ago.  Looking through the code, it looks like "wmi" can't 
actually be null here so I just removed the check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/ath/ath9k/wmi.c b/drivers/net/wireless/ath/ath9k/wmi.c
index e23172c..6260faa 100644
--- a/drivers/net/wireless/ath/ath9k/wmi.c
+++ b/drivers/net/wireless/ath/ath9k/wmi.c
@@ -279,9 +279,6 @@ int ath9k_wmi_cmd(struct wmi *wmi, enum wmi_cmd_id cmd_id,
 	if (wmi->drv_priv->op_flags & OP_UNPLUGGED)
 		return 0;
 
-	if (!wmi)
-		return -EINVAL;
-
 	skb = alloc_skb(headroom + cmd_len, GFP_ATOMIC);
 	if (!skb)
 		return -ENOMEM;
