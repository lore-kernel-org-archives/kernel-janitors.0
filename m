From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Apr 2017 10:47:23 +0000
Subject: [PATCH] staging: rtl8188eu: prevent an underflow in rtw_check_beacon_data()
Message-Id: <20170422104723.vbv53sn6u4t4aomd@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "len" could be as low as -14 so we should check for negatives.

Fixes: 9a7fe54ddc3a ("staging: r8188eu: Add source files for new driver - part 1")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index 91156a21b8f2..519b4d3584a2 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -878,7 +878,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		return _FAIL;
 
 
-	if (len > MAX_IE_SZ)
+	if (len < 0 || len > MAX_IE_SZ)
 		return _FAIL;
 
 	pbss_network->IELength = len;
