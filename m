From: Colin King <colin.king@canonical.com>
Date: Tue, 21 May 2019 13:17:06 +0000
Subject: [PATCH] staging: wilc1000: remove redundant masking of pkt_offset
Message-Id: <20190521131706.30236-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adham Abozaeid <adham.abozaeid@microchip.com>, Ajay Singh <ajay.kathat@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The masking update of pkg_offset is redundant as the updated
value is never read and pkg_offset is re-assigned on the next
iteration of the loop.  Clean this up by removing the redundant
assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/wilc_wlan.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/wilc1000/wilc_wlan.c b/drivers/staging/wilc1000/wilc_wlan.c
index 95eaf8fdf4f2..dcd728557958 100644
--- a/drivers/staging/wilc1000/wilc_wlan.c
+++ b/drivers/staging/wilc1000/wilc_wlan.c
@@ -709,9 +709,6 @@ static void wilc_wlan_handle_rx_buff(struct wilc *wilc, u8 *buffer, int size)
 			break;
 
 		if (pkt_offset & IS_MANAGMEMENT) {
-			pkt_offset &= ~(IS_MANAGMEMENT |
-					IS_MANAGMEMENT_CALLBACK |
-					IS_MGMT_STATUS_SUCCES);
 			buff_ptr += HOST_HDR_OFFSET;
 			wilc_wfi_mgmt_rx(wilc, buff_ptr, pkt_len);
 		} else {
-- 
2.20.1
