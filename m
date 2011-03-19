From: Dan Carpenter <error27@gmail.com>
Date: Sat, 19 Mar 2011 04:40:32 +0000
Subject: [patch] rapidio: potential null deref on failure path
Message-Id: <20110319044032.GC2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Porter <mporter@kernel.crashing.org>
Cc: Alexandre Bounine <alexandre.bounine@idt.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If rio is not a switch then "rswitch" is null.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/rapidio/rio-scan.c b/drivers/rapidio/rio-scan.c
index a50391b..3a59d5f 100644
--- a/drivers/rapidio/rio-scan.c
+++ b/drivers/rapidio/rio-scan.c
@@ -517,7 +517,7 @@ static struct rio_dev __devinit *rio_setup_device(struct rio_net *net,
 	return rdev;
 
 cleanup:
-	if (rswitch->route_table)
+	if (rio_is_switch(rdev))
 		kfree(rswitch->route_table);
 
 	kfree(rdev);
