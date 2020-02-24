From: Walter Harms <wharms@bfs.de>
Date: Mon, 24 Feb 2020 11:07:55 +0000
Subject: AW: [PATCH] staging: rtl8723bs: core: remove redundant zero'ing of counter variable k
Message-Id: <5f875f84e6014d2bb5b78f71dc2831a2@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200223152840.418439-1-colin.king@canonical.com>
In-Reply-To: <20200223152840.418439-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Colin King <colin.king@canonical.com>
Gesendet: Sonntag, 23. Februar 2020 16:28
An: Greg Kroah-Hartman; devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Betreff: [PATCH] staging: rtl8723bs: core: remove redundant zero'ing of counter variable k

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
@@ -244,10 +244,8 @@ u16        Address)
                while (!(Bytetemp & 0x80)) {
                        Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
                        k++;
-                       if (k == 1000) {
-                               k = 0;
+                       if (k == 1000)
                                break;
-                       }

IMHO this is confusing to read, i suggest:

 for(k=0;k<1000;k++) {
      Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
      if ( Bytetemp & 0x80 )
               break;
      }

 NTL is am wondering what will happen if k==1000
 and Bytetemp is still invalid. Will rtw_read8() fail or
 simply return invalid data ?

 ym2c,
 re,
 wh
                }
                return rtw_read8(Adapter, EFUSE_CTRL);
        } else
--
2.25.0
