From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Feb 2020 20:01:05 +0000
Subject: [PATCH] staging: rtl8192e: remove redundant initialization of variable init_status
Message-Id: <20200222200105.201869-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer init_status is being initialized with a value that is never
read, it is being updated later on. The initialization is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ce57bf35c3ed..d3664e508cbe 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -732,7 +732,7 @@ static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rt_pwr_save_ctrl *pPSC = (struct rt_pwr_save_ctrl *)
 					(&priv->rtllib->PowerSaveControl);
-	bool init_status = true;
+	bool init_status;
 
 	priv->bDriverIsGoingToUnload = false;
 	priv->bdisable_nic = false;
-- 
2.25.0
