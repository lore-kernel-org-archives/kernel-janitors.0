From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 11 Sep 2011 18:07:30 +0000
Subject: [PATCH] sound/soc/kirkwood/kirkwood-i2s.c: fix trivial build regression
Message-Id: <3099701.CcMbBAJgz4@wuerfel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313820761-12042-1-git-send-email-julia@diku.dk>
In-Reply-To: <1313820761-12042-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@suse.de>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>, Arnaud Patard <arnaud.patard@rtp-net.org>

A fix merged in 3.1-rc2 introduced a small regression, this should get it
to build again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
On Saturday 20 August 2011 08:12:38 Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Adjust the goto to jump to the error handling code that includes kfree.
> 

/home/arnd/linux-arm/sound/soc/kirkwood/kirkwood-i2s.c: In function 'kirkwood_i2s_dev_probe':
/home/arnd/linux-arm/sound/soc/kirkwood/kirkwood-i2s.c:427:3: error: label 'error_alloc' used but not defined

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 8f16cd3..d0bcf3f 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -424,7 +424,7 @@ static __devinit int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	if (!priv->mem) {
 		dev_err(&pdev->dev, "request_mem_region failed\n");
 		err = -EBUSY;
-		goto error_alloc;
+		goto err_alloc;
 	}
 
 	priv->io = ioremap(priv->mem->start, SZ_16K);
