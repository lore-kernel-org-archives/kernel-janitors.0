From: JI-HUN KIM <jihuun.k@gmail.com>
Date: Wed, 27 Dec 2017 05:52:54 +0000
Subject: [PATCH 1/3] staging: irda: fix type from "unsigned" to "unsigned int"
Message-Id: <20171227055250.GA32718@MacBook-Air>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: samuel@sortiz.org
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, shreeya.patel23498@gmail.com, netdev@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Clean up checkpatch warning:
WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: JI-HUN KIM <jihuun.k@gmail.com>
---
 drivers/staging/irda/drivers/esi-sir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/irda/drivers/esi-sir.c b/drivers/staging/irda/drivers/esi-sir.c
index eb7aa64..a12cf55 100644
--- a/drivers/staging/irda/drivers/esi-sir.c
+++ b/drivers/staging/irda/drivers/esi-sir.c
@@ -39,7 +39,7 @@
 
 static int esi_open(struct sir_dev *);
 static int esi_close(struct sir_dev *);
-static int esi_change_speed(struct sir_dev *, unsigned);
+static int esi_change_speed(struct sir_dev *, unsigned int);
 static int esi_reset(struct sir_dev *);
 
 static struct dongle_driver esi = {
@@ -93,7 +93,7 @@ static int esi_close(struct sir_dev *dev)
  * Apparently (see old esi-driver) no delays are needed here...
  *
  */
-static int esi_change_speed(struct sir_dev *dev, unsigned speed)
+static int esi_change_speed(struct sir_dev *dev, unsigned int speed)
 {
 	int ret = 0;
 	int dtr, rts;
-- 
2.10.1 (Apple Git-78)

