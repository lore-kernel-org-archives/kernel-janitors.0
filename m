From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Jan 2019 12:06:41 +0000
Subject: [PATCH -next] staging: wilc1000: remove set but not used variable 'msa'
Message-Id: <1547035601-84566-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adham Abozaeid <adham.abozaeid@microchip.com>, Ajay Singh <ajay.kathat@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/wilc1000/host_interface.c: In function 'wilc_parse_network_info':
drivers/staging/wilc1000/host_interface.c:748:16: warning:
 variable 'msa' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/wilc1000/host_interface.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 5dae6e7..c05c120 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -745,7 +745,7 @@ static s32 wilc_parse_network_info(u8 *msg_buffer,
 {
 	struct network_info *info;
 	struct ieee80211_mgmt *mgt;
-	u8 *wid_val, *msa, *ies;
+	u8 *wid_val, *ies;
 	u16 wid_len, rx_len, ies_len;
 	u8 msg_type;
 	size_t offset;
@@ -764,7 +764,6 @@ static s32 wilc_parse_network_info(u8 *msg_buffer,
 
 	info->rssi = wid_val[0];
 
-	msa = &wid_val[1];
 	mgt = (struct ieee80211_mgmt *)&wid_val[1];
 	rx_len = wid_len - 1;
 
