From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Jul 2020 10:05:25 +0000
Subject: [PATCH] staging: rtl8723bs: remove redundant assignment to variable ret
Message-Id: <20200729100525.573500-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413141346.9791-1-colin.king@canonical.com>
In-Reply-To: <20170413141346.9791-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned an error return value that is never
read, the control passes to a return statement and ret is never referenced.
Remove the redundant assignment. Also remove an empty line.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 6d443197a0cf..f61ad9200960 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -146,10 +146,8 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 	rereg_priv->old_pnetdev = cur_pnetdev;
 
 	pnetdev = rtw_init_netdev(padapter);
-	if (!pnetdev)  {
-		ret = -1;
+	if (!pnetdev)
 		goto error;
-	}
 
 	SET_NETDEV_DEV(pnetdev, dvobj_to_dev(adapter_to_dvobj(padapter)));
 
@@ -170,9 +168,7 @@ int rtw_change_ifname(struct adapter *padapter, const char *ifname)
 	return 0;
 
 error:
-
 	return -1;
-
 }
 
 void rtw_buf_free(u8 **buf, u32 *buf_len)
-- 
2.27.0
