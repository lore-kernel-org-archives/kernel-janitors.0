From: "Scott Thompson" <postfail@hushmail.com>
Date: Wed, 01 Aug 2007 06:06:06 +0000
Subject: [PATCH 3/3] sound/soc ioremap/iounmap balancing
Message-Id: <20070801060606.BB9C3DA82E@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

ioremap / iounmap balancing in sound/soc tree

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
---
diff --git a/sound/soc/s3c24xx/s3c24xx-i2s.c 
b/sound/soc/s3c24xx/s3c24xx-i2s.c
index 39f0246..cd89c41 100644
--- a/sound/soc/s3c24xx/s3c24xx-i2s.c
+++ b/sound/soc/s3c24xx/s3c24xx-i2s.c
@@ -385,6 +385,7 @@ static int s3c24xx_i2s_probe(struct 
platform_device *pdev)
 	s3c24xx_i2s.iis_clk=clk_get(&pdev->dev, "iis");
 	if (s3c24xx_i2s.iis_clk = NULL) {
 		DBG("failed to get iis_clock\n");
+		iounmap(s3c24xx_i2s.regs);
 		return -ENODEV;
 	}
 	clk_enable(s3c24xx_i2s.iis_clk);

--
Click to get freedom from your annoying glasses. Save on LASIK surgery.
http://tagline.hushmail.com/fc/Ioyw6h4eJhpY2lk39qq0GYowuzjUjbLmD7mg54cZU7ogIFKBTZa55s/


