From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Aug 2017 15:07:10 +0000
Subject: [PATCH] staging: r8822be: fix null pointer dereference with a null driver_adapter
Message-Id: <20170823150710.22313-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Ping-Ke Shih <pkshih@realtek.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to _rtl_dbg_trace via macro HALMAC_RT_TRACE will trigger a null
pointer deference on the null driver_adapter.  Fix this by assigning
driver_adapter earlier to halmac_adapter->driver_adapter before the tracing
call so that a non-null driver_adapter is passed instead.

Detected by CoverityScan, CID#1454613 ("Explicit null dereferenced")

Fixes: 938a0447f094 ("staging: r8822be: Add code for halmac sub-driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c b/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c
index a6c8a87f755f..3a24e33228f8 100644
--- a/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c
+++ b/drivers/staging/rtlwifi/halmac/halmac_88xx/halmac_api_88xx.c
@@ -4447,7 +4447,7 @@ halmac_func_p2pps_88xx(struct halmac_adapter *halmac_adapter,
 {
 	u8 h2c_buff[HALMAC_H2C_CMD_SIZE_88XX] = {0};
 	u16 h2c_seq_mum = 0;
-	void *driver_adapter = NULL;
+	void *driver_adapter = halmac_adapter->driver_adapter;
 	struct halmac_api *halmac_api;
 	struct halmac_h2c_header_info h2c_header_info;
 	enum halmac_ret_status status = HALMAC_RET_SUCCESS;
@@ -4455,7 +4455,6 @@ halmac_func_p2pps_88xx(struct halmac_adapter *halmac_adapter,
 	HALMAC_RT_TRACE(driver_adapter, HALMAC_MSG_H2C, DBG_DMESG,
 			"[TRACE]halmac_p2pps !!\n");
 
-	driver_adapter = halmac_adapter->driver_adapter;
 	halmac_api = (struct halmac_api *)halmac_adapter->halmac_api;
 
 	P2PPS_SET_OFFLOAD_EN(h2c_buff, p2p_ps->offload_en);
-- 
2.14.1

