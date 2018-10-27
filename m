From: Colin King <colin.king@canonical.com>
Date: Sat, 27 Oct 2018 14:27:19 +0000
Subject: [PATCH] staging: rtl8723bs: fix typo in function name rtw_sctx_chk_waring_status
Message-Id: <20181027142719.6269-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to typo in function name, rename it to
rtw_sctx_chk_warning_status.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index edb678190b4b..729fd37f440b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -3033,7 +3033,7 @@ int rtw_sctx_wait(struct submit_ctx *sctx, const char *msg)
 	return ret;
 }
 
-static bool rtw_sctx_chk_waring_status(int status)
+static bool rtw_sctx_chk_warning_status(int status)
 {
 	switch (status) {
 	case RTW_SCTX_DONE_UNKNOWN:
@@ -3051,7 +3051,7 @@ static bool rtw_sctx_chk_waring_status(int status)
 void rtw_sctx_done_err(struct submit_ctx **sctx, int status)
 {
 	if (*sctx) {
-		if (rtw_sctx_chk_waring_status(status))
+		if (rtw_sctx_chk_warning_status(status))
 			DBG_871X("%s status:%d\n", __func__, status);
 		(*sctx)->status = status;
 		complete(&((*sctx)->done));
-- 
2.19.1
