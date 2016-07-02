From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Jul 2016 19:05:32 +0000
Subject: [PATCH 1/2] Input-at32psif: Return directly after a failed kzalloc() in psif_probe()
Message-Id: <85f42edb-7ce5-cf23-80f5-48440a14cd94@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4471604f-f401-bed9-39be-1aff2a92edf6@users.sourceforge.net>
In-Reply-To: <4471604f-f401-bed9-39be-1aff2a92edf6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Jul 2016 18:34:43 +0200

Return directly after a memory allocation failed at the beginning.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/serio/at32psif.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/serio/at32psif.c b/drivers/input/serio/at32psif.c
index 2e4ff5b..fcb769a 100644
--- a/drivers/input/serio/at32psif.c
+++ b/drivers/input/serio/at32psif.c
@@ -212,8 +212,7 @@ static int __init psif_probe(struct platform_device *pdev)
 	psif = kzalloc(sizeof(struct psif), GFP_KERNEL);
 	if (!psif) {
 		dev_dbg(&pdev->dev, "out of memory\n");
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 	psif->pdev = pdev;
 
@@ -297,7 +296,6 @@ out_free_io:
 	kfree(io);
 out_free_psif:
 	kfree(psif);
-out:
 	return ret;
 }
 
-- 
2.9.0

