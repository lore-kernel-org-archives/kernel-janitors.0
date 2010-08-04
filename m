From: Dan Carpenter <error27@gmail.com>
Date: Wed, 04 Aug 2010 16:33:19 +0000
Subject: [patch] rocket: release_region or error path
Message-Id: <20100804163319.GC9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

There was a release_region() missing on the error path.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/rocket.c b/drivers/char/rocket.c
index 0e29a23..258bc35 100644
--- a/drivers/char/rocket.c
+++ b/drivers/char/rocket.c
@@ -2334,7 +2334,7 @@ static int __init rp_init(void)
 	ret = tty_register_driver(rocket_driver);
 	if (ret < 0) {
 		printk(KERN_ERR "Couldn't install tty RocketPort driver\n");
-		goto err_tty;
+		goto err_controller;
 	}
 
 #ifdef ROCKET_DEBUG_OPEN
@@ -2369,6 +2369,9 @@ static int __init rp_init(void)
 	return 0;
 err_ttyu:
 	tty_unregister_driver(rocket_driver);
+err_controller:
+	if (controller)
+		release_region(controller, 4);
 err_tty:
 	put_tty_driver(rocket_driver);
 err:
