From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Mon, 18 Feb 2013 12:13:44 +0000
Subject: [PATCH] net: wireless: hostap: hostap_ap.c: Return -ENOMEM instead of -1 for if kmalloc() fails.
Message-Id: <1361189624-11274-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: j@w1.fi
Cc: linville@tuxdriver.com, wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

When memory allocation using, kmalloc() fails, report appropriate error value.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/net/wireless/hostap/hostap_ap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/hostap/hostap_ap.c b/drivers/net/wireless/hostap/hostap_ap.c
index c6ea995..dd9a18f 100644
--- a/drivers/net/wireless/hostap/hostap_ap.c
+++ b/drivers/net/wireless/hostap/hostap_ap.c
@@ -376,7 +376,7 @@ int ap_control_add_mac(struct mac_restrictions *mac_restrictions, u8 *mac)
 
 	entry = kmalloc(sizeof(struct mac_entry), GFP_KERNEL);
 	if (entry = NULL)
-		return -1;
+		return -ENOMEM;
 
 	memcpy(entry->addr, mac, ETH_ALEN);
 
-- 
1.7.9.5

