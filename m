From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 17:48:09 +0000
Subject: [PATCH] TC: Delete an error message for a failed memory allocation in tc_bus_add_devices()
Message-Id: <bfb63956-346c-aa17-5b06-fbe19ff0a5e3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, "Maciej W. Rozycki" <macro@linux-mips.org>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 10 Dec 2017 18:42:42 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tc/tc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/tc/tc.c b/drivers/tc/tc.c
index 3be9519654e5..2deb3768a9f6 100644
--- a/drivers/tc/tc.c
+++ b/drivers/tc/tc.c
@@ -82,10 +82,9 @@ static void __init tc_bus_add_devices(struct tc_bus *tbus)
 
 		/* Found a board, allocate it an entry in the list */
 		tdev = kzalloc(sizeof(*tdev), GFP_KERNEL);
-		if (!tdev) {
-			pr_err("tc%x: unable to allocate tc_dev\n", slot);
+		if (!tdev)
 			goto out_err;
-		}
+
 		dev_set_name(&tdev->dev, "tc%x", slot);
 		tdev->bus = tbus;
 		tdev->dev.parent = &tbus->dev;
-- 
2.15.1

