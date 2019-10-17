From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Oct 2019 09:18:32 +0000
Subject: [PATCH] staging: wilc1000: potential corruption in wilc_parse_join_bss_param()
Message-Id: <20191017091832.GB31278@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adham Abozaeid <adham.abozaeid@microchip.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Singh <ajay.kathat@microchip.com>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

The "rates_len" value needs to be capped so that the memcpy() doesn't
copy beyond the end of the array.

Fixes: c5c77ba18ea6 ("staging: wilc1000: Add SDIO/SPI 802.11 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/wilc1000/wilc_hif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/wilc1000/wilc_hif.c b/drivers/staging/wilc1000/wilc_hif.c
index 0ac2b6ac50b0..e0a95c5cc0d5 100644
--- a/drivers/staging/wilc1000/wilc_hif.c
+++ b/drivers/staging/wilc1000/wilc_hif.c
@@ -479,6 +479,8 @@ void *wilc_parse_join_bss_param(struct cfg80211_bss *bss,
 	rates_ie = cfg80211_find_ie(WLAN_EID_SUPP_RATES, ies->data, ies->len);
 	if (rates_ie) {
 		rates_len = rates_ie[1];
+		if (rates_len > WILC_MAX_RATES_SUPPORTED)
+			rates_len = WILC_MAX_RATES_SUPPORTED;
 		param->supp_rates[0] = rates_len;
 		memcpy(&param->supp_rates[1], rates_ie + 2, rates_len);
 	}
-- 
2.20.1
