From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:17 +0000
Subject: [PATCH 07/18] hwrng: mxc-rnga - use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-8-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/char/hw_random/mxc-rnga.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/mxc-rnga.c b/drivers/char/hw_random/mxc-rnga.c
index 025083c838f5..008763c988ed 100644
--- a/drivers/char/hw_random/mxc-rnga.c
+++ b/drivers/char/hw_random/mxc-rnga.c
@@ -143,9 +143,9 @@ static int __init mxc_rnga_probe(struct platform_device *pdev)
 	mxc_rng->dev = &pdev->dev;
 	mxc_rng->rng.name = "mxc-rnga";
 	mxc_rng->rng.init = mxc_rnga_init;
-	mxc_rng->rng.cleanup = mxc_rnga_cleanup,
-	mxc_rng->rng.data_present = mxc_rnga_data_present,
-	mxc_rng->rng.data_read = mxc_rnga_data_read,
+	mxc_rng->rng.cleanup = mxc_rnga_cleanup;
+	mxc_rng->rng.data_present = mxc_rnga_data_present;
+	mxc_rng->rng.data_read = mxc_rnga_data_read;
 
 	mxc_rng->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(mxc_rng->clk)) {
