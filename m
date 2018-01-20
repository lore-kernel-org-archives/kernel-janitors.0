From: Colin King <colin.king@canonical.com>
Date: Sat, 20 Jan 2018 22:31:06 +0000
Subject: [PATCH] staging: rtl8712: remove redundant initialization to 'rfPath'
Message-Id: <20180120223106.22469-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The value stored to rfPath during initialization is never read, the
following switch statement re-assigns it a new value on all the
case and default paths. Hence the initialization is redundant and
can be removed.

Cleans up clang warning:
drivers/staging/rtl8712/rtl871x_mp.c:544:5: warning: Value stored to
'rfPath' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8712/rtl871x_mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mp.c b/drivers/staging/rtl8712/rtl871x_mp.c
index 3c10a2c848c8..ba208a2e1e4e 100644
--- a/drivers/staging/rtl8712/rtl871x_mp.c
+++ b/drivers/staging/rtl8712/rtl871x_mp.c
@@ -541,7 +541,7 @@ void r8712_SetSingleCarrierTx(struct _adapter *pAdapter, u8 bStart)
 
 void r8712_SetSingleToneTx(struct _adapter *pAdapter, u8 bStart)
 {
-	u8 rfPath = pAdapter->mppriv.curr_rfpath;
+	u8 rfPath;
 
 	switch (pAdapter->mppriv.antenna_tx) {
 	case ANTENNA_B:
-- 
2.15.1

