From: Julia Lawall <julia@diku.dk>
Date: Sat, 20 Aug 2011 06:12:38 +0000
Subject: [PATCH 1/4] sound/soc/kirkwood/kirkwood-i2s.c: add missing kfree
Message-Id: <1313820761-12042-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@suse.de>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaud Patard <arnaud.patard@rtp-net.org>

From: Julia Lawall <julia@diku.dk>

Adjust the goto to jump to the error handling code that includes kfree.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
expression E1!=0,E2,E3,E4;
statement S;
iterator I;
@@

(
if (...) { ... when != kfree(x)
               when != x = E3
               when != E3 = x
*  return ...;
 }
... when != x = E2
    when != I(...,x,...) S
if (...) { ... when != x = E4
 kfree(x); ... return ...; }
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 sound/soc/kirkwood/kirkwood-i2s.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index a33fc51..8f16cd3 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -424,7 +424,7 @@ static __devinit int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	if (!priv->mem) {
 		dev_err(&pdev->dev, "request_mem_region failed\n");
 		err = -EBUSY;
-		goto error;
+		goto error_alloc;
 	}
 
 	priv->io = ioremap(priv->mem->start, SZ_16K);

