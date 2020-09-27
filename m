From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:12 +0000
Subject: [PATCH 02/18] ipmi:bt-bmc: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-3-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/char/ipmi/bt-bmc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index a395e2e70dc5..6e3d247b55d1 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -462,9 +462,9 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	mutex_init(&bt_bmc->mutex);
 	init_waitqueue_head(&bt_bmc->queue);
 
-	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR,
-	bt_bmc->miscdev.name	= DEVICE_NAME,
-	bt_bmc->miscdev.fops	= &bt_bmc_fops,
+	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR;
+	bt_bmc->miscdev.name	= DEVICE_NAME;
+	bt_bmc->miscdev.fops	= &bt_bmc_fops;
 	bt_bmc->miscdev.parent = dev;
 	rc = misc_register(&bt_bmc->miscdev);
 	if (rc) {
