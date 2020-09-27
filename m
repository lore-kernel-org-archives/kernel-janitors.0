From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:14 +0000
Subject: [PATCH 04/18] hwrng: stm32 - use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-5-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Alexandre Torgue <alexandre.torgue@st.com>

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
 drivers/char/hw_random/stm32-rng.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 38324c2ddda1..bc22178f83e8 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -145,12 +145,12 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 
 	dev_set_drvdata(dev, priv);
 
-	priv->rng.name = dev_driver_string(dev),
+	priv->rng.name = dev_driver_string(dev);
 #ifndef CONFIG_PM
-	priv->rng.init = stm32_rng_init,
-	priv->rng.cleanup = stm32_rng_cleanup,
+	priv->rng.init = stm32_rng_init;
+	priv->rng.cleanup = stm32_rng_cleanup;
 #endif
-	priv->rng.read = stm32_rng_read,
+	priv->rng.read = stm32_rng_read;
 	priv->rng.priv = (unsigned long) dev;
 	priv->rng.quality = 900;
 
