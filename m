From: Colin King <colin.king@canonical.com>
Date: Sun, 26 Jan 2020 22:05:49 +0000
Subject: [PATCH] staging: rtl8723bs: fix copy of overlapping memory
Message-Id: <20200126220549.9849-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the rtw_sprintf prints the contents of thread_name
onto thread_name and this can lead to a potential copy of a
string over itself. Avoid this by printing the literal string RTWHALXT
instread of the contents of thread_name.

Addresses-Coverity: ("copy of overlapping memory")
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index b44e902ed338..890e0ecbeb2e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -476,14 +476,13 @@ int rtl8723bs_xmit_thread(void *context)
 	s32 ret;
 	struct adapter *padapter;
 	struct xmit_priv *pxmitpriv;
-	u8 thread_name[20] = "RTWHALXT";
-
+	u8 thread_name[20];
 
 	ret = _SUCCESS;
 	padapter = context;
 	pxmitpriv = &padapter->xmitpriv;
 
-	rtw_sprintf(thread_name, 20, "%s-"ADPT_FMT, thread_name, ADPT_ARG(padapter));
+	rtw_sprintf(thread_name, 20, "RTWHALXT-" ADPT_FMT, ADPT_ARG(padapter));
 	thread_enter(thread_name);
 
 	DBG_871X("start "FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
-- 
2.24.0
