From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jul 2013 16:40:17 +0000
Subject: [patch] ASoC: adau1701: type bug with ADAU1707_CLKDIV_UNSET
Message-Id: <20130725164016.GA4027@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>, Daniel Mack <zonque@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@kernel.org>, device-drivers-devel@blackfin.uclinux.org, Grant Likely <grant.likely@linaro.org>

ADAU1707_CLKDIV_UNSET is always compared against an unsigned int and
not an unsigned long.  The current tests are always false.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 44d8a95..2c10252 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -91,7 +91,7 @@
 #define ADAU1701_OSCIPOW_OPD		0x04
 #define ADAU1701_DACSET_DACINIT		1
 
-#define ADAU1707_CLKDIV_UNSET		(-1UL)
+#define ADAU1707_CLKDIV_UNSET		(-1U)
 
 #define ADAU1701_FIRMWARE "adau1701.bin"
 
