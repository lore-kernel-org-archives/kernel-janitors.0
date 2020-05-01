From: Colin King <colin.king@canonical.com>
Date: Fri, 01 May 2020 17:39:00 +0000
Subject: [PATCH] libertas_tf: avoid a null dereference in pointer priv
Message-Id: <20200501173900.296658-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Lubomir Rintel <lkundrak@v3.sk>, Steve deRosier <derosier@cal-sierra.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a check if priv is null when calling lbtf_remove_card
but not in a previous call to if_usb_reset_dev that can also dereference
priv.  Fix this by also only calling lbtf_remove_card if priv is null.

It is noteable that there don't seem to be any bugs reported that the
null pointer dereference has ever occurred, so I'm not sure if the null
check is required, but since we're doing a null check anyway it should
be done for both function calls.

Addresses-Coverity: ("Dereference before null check")
Fixes: baa0280f08c7 ("libertas_tf: don't defer firmware loading until start()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/marvell/libertas_tf/if_usb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas_tf/if_usb.c b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
index 25ac9db35dbf..bedc09215088 100644
--- a/drivers/net/wireless/marvell/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
@@ -247,10 +247,10 @@ static void if_usb_disconnect(struct usb_interface *intf)
 
 	lbtf_deb_enter(LBTF_DEB_MAIN);
 
-	if_usb_reset_device(priv);
-
-	if (priv)
+	if (priv) {
+		if_usb_reset_device(priv);
 		lbtf_remove_card(priv);
+	}
 
 	/* Unlink and free urb */
 	if_usb_free(cardp);
-- 
2.25.1
