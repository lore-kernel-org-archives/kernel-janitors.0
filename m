From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jul 2019 09:56:47 +0000
Subject: [PATCH] staging: rtl8192e: remove redundant initialization of rtstatus
Message-Id: <20190702095647.26378-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gabriela Bittencourt <gabrielabittencourt00@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable rtstatus is being initialized with a value that is never
read as it is being overwritten inside a do-while loop. Clean up
the code by removing the redundant initialization.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 5215a0b5fd45..7d78f16efc1d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1427,7 +1427,7 @@ static bool _rtl92e_set_rf_power_state(struct net_device *dev,
 				 "_rtl92e_set_rf_power_state() eRfOn!\n");
 			if ((priv->rtllib->eRFPowerState = eRfOff) &&
 			     RT_IN_PS_LEVEL(pPSC, RT_RF_OFF_LEVL_HALT_NIC)) {
-				bool rtstatus = true;
+				bool rtstatus;
 				u32 InitilizeCount = 3;
 
 				do {
-- 
2.20.1
