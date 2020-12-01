From: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
Date: Tue, 01 Dec 2020 21:47:14 +0000
Subject: [PATCH] Staging: rtl8723bs/core: Add blank line after variable declarations.
Message-Id: <20201201214714.GA397282@a>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201130214749.GA381950@a>
In-Reply-To: <20201130214749.GA381950@a>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix the checkpatch.pl warning:

rtw_security.c:2374: WARNING: Missing a blank line after declarations

Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 159d32ace2bc..a3a6558c9e03 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -2371,6 +2371,7 @@ u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 
 	if (securitypriv->btkip_countermeasure) {
 		unsigned long passing_ms = jiffies_to_msecs(jiffies - securitypriv->btkip_countermeasure_time);
+
 		if (passing_ms > 60*1000) {
 			DBG_871X_LEVEL(_drv_always_, "%s("ADPT_FMT") countermeasure time:%lus > 60s\n",
 				caller, ADPT_ARG(adapter), passing_ms/1000);
-- 
2.25.1

Hello kernel janitors,

this is my third patch and I don't feel very confident yet. Would this patch be worth Greg's time?

Thanks!
Br. Matt
