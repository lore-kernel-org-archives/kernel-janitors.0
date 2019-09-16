From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Sep 2019 09:22:11 +0000
Subject: [PATCH][next] staging: rtl8723bs: os_dep: fix spelling mistake "offet" -> "offset"
Message-Id: <20190916092211.32646-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DBG_871X error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index d1b199e3e5bd..32e9ccab0754 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2793,7 +2793,7 @@ static int rtw_dbg_port(struct net_device *dev,
 
 					DBG_871X("oper_ch =%d\n", rtw_get_oper_ch(padapter));
 					DBG_871X("oper_bw =%d\n", rtw_get_oper_bw(padapter));
-					DBG_871X("oper_ch_offet =%d\n", rtw_get_oper_choffset(padapter));
+					DBG_871X("oper_ch_offset =%d\n", rtw_get_oper_choffset(padapter));
 
 					break;
 				case 0x05:
-- 
2.20.1
