From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 20:39:57 +0000
Subject: [PATCH 1/2] macintosh/rack-meter: Delete an error message for a failed memory allocation in rackmete
Message-Id: <e8373573-fb9d-5a90-96e7-1faf5434e6e1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c11e0a90-a7b2-dddd-7751-7dac3e62215b@users.sourceforge.net>
In-Reply-To: <c11e0a90-a7b2-dddd-7751-7dac3e62215b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 21:23:36 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/macintosh/rack-meter.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/macintosh/rack-meter.c b/drivers/macintosh/rack-meter.c
index 910b5b6f96b1..0796b74174d4 100644
--- a/drivers/macintosh/rack-meter.c
+++ b/drivers/macintosh/rack-meter.c
@@ -399,7 +399,6 @@ static int rackmeter_probe(struct macio_dev* mdev,
 	/* Create and initialize our instance data */
 	rm = kzalloc(sizeof(struct rackmeter), GFP_KERNEL);
 	if (rm = NULL) {
-		printk(KERN_ERR "rackmeter: failed to allocate memory !\n");
 		rc = -ENOMEM;
 		goto bail_release;
 	}
-- 
2.15.1

