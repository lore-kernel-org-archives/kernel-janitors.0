From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 21 Sep 2013 22:27:49 +0000
Subject: [PATCH 17/19] staging: Change variable type to bool
Message-Id: <1379802471-30252-17-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pavel@ucw.cz
Cc: gregkh@linuxfoundation.org, harsh1kumar@gmail.com, dan.carpenter@oracle.com, peter.senna@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The variable Trigger is only assigned the values true and false.
Change its type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/staging/winbond/wb35tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/winbond/wb35tx.c b/drivers/staging/winbond/wb35tx.c
index 30a77cc..708c5b0 100644
--- a/drivers/staging/winbond/wb35tx.c
+++ b/drivers/staging/winbond/wb35tx.c
@@ -180,7 +180,7 @@ void Wb35Tx_CurrentTime(struct wbsoft_priv *adapter, u32 TimeCount)
 {
 	struct hw_data *pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
-	unsigned char Trigger = false;
+	bool Trigger = false;
 
 	if (pWb35Tx->TxTimer > TimeCount)
 		Trigger = true;
-- 
1.8.3.1

