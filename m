From: Colin King <colin.king@canonical.com>
Date: Sun, 23 Feb 2020 15:28:40 +0000
Subject: [PATCH] staging: rtl8723bs: core: remove redundant zero'ing of counter variable k
Message-Id: <20200223152840.418439-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The zero'ing of counter variable k is redundant as it is never read
after breaking out of the while loop. Remove it.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 3b8848182221..bdb6ff8aab7d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -244,10 +244,8 @@ u16 	Address)
 		while (!(Bytetemp & 0x80)) {
 			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
 			k++;
-			if (k = 1000) {
-				k = 0;
+			if (k = 1000)
 				break;
-			}
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
 	} else
-- 
2.25.0
