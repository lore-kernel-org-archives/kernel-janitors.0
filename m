From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 17:40:24 +0000
Subject: [PATCH 2/2] Input: arc_ps2: Improve a size determination in two functions
Message-Id: <38a03d93-7663-f3c3-9066-88cd935e3790@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f3c837b2-7be1-11fe-ba2c-1792590125d2@users.sourceforge.net>
In-Reply-To: <f3c837b2-7be1-11fe-ba2c-1792590125d2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 18:30:45 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/serio/arc_ps2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/arc_ps2.c b/drivers/input/serio/arc_ps2.c
index 9860b1c1e67a..6a3c845e12ea 100644
--- a/drivers/input/serio/arc_ps2.c
+++ b/drivers/input/serio/arc_ps2.c
@@ -156,9 +156,8 @@ static int arc_ps2_create_port(struct platform_device *pdev,
 					 int index)
 {
 	struct arc_ps2_port *port = &arc_ps2->port[index];
-	struct serio *io;
+	struct serio *io = kzalloc(sizeof(*io), GFP_KERNEL);
 
-	io = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (!io)
 		return -ENOMEM;
 
@@ -195,8 +194,7 @@ static int arc_ps2_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	arc_ps2 = devm_kzalloc(&pdev->dev, sizeof(struct arc_ps2_data),
-				GFP_KERNEL);
+	arc_ps2 = devm_kzalloc(&pdev->dev, sizeof(*arc_ps2), GFP_KERNEL);
 	if (!arc_ps2)
 		return -ENOMEM;
 
-- 
2.16.1

