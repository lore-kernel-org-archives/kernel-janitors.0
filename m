From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Sep 2018 13:34:05 +0000
Subject: [PATCH] staging: rtl8188eu: fix spelling mistake "transfoer_len" -> "transfer_len"
Message-Id: <20180926133405.31199-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DBG_88E debug message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index 5ddfc2ead127..43f031d644fd 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -84,7 +84,7 @@ static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 
 		if ((pattrib->pkt_len <= 0) || (pkt_offset > transfer_len)) {
 			RT_TRACE(_module_rtl871x_recv_c_, _drv_info_, ("recvbuf2recvframe: pkt_len<=0\n"));
-			DBG_88E("%s()-%d: RX Warning!,pkt_len<=0 or pkt_offset> transfoer_len\n", __func__, __LINE__);
+			DBG_88E("%s()-%d: RX Warning!,pkt_len<=0 or pkt_offset> transfer_len\n", __func__, __LINE__);
 			rtw_free_recvframe(precvframe, pfree_recv_queue);
 			goto _exit_recvbuf2recvframe;
 		}
-- 
2.17.1
