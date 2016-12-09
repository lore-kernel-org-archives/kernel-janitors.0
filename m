From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 14:40:24 +0000
Subject: [PATCH 4/4] staging: greybus: power_supply: Use kcalloc() in gb_power_supplies_setup()
Message-Id: <3d6e0e13-b74d-f022-3edc-1bf1ae6ef9ac@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
In-Reply-To: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 9 Dec 2016 15:04:24 +0100

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Fixes: ffe2e2487a388cf01ec44439346363aa8d654cd4 ("greybus: power_supply: rework and operation changes")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/greybus/power_supply.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
index e85c988b7034..19080c7f1491 100644
--- a/drivers/staging/greybus/power_supply.c
+++ b/drivers/staging/greybus/power_supply.c
@@ -944,10 +944,9 @@ static int gb_power_supplies_setup(struct gb_power_supplies *supplies)
 	if (ret < 0)
 		goto out;
 
-	supplies->supply = kzalloc(supplies->supplies_count *
-				     sizeof(struct gb_power_supply),
-				     GFP_KERNEL);
-
+	supplies->supply = kcalloc(supplies->supplies_count,
+				   sizeof(*supplies->supply),
+				   GFP_KERNEL);
 	if (!supplies->supply) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.11.0

