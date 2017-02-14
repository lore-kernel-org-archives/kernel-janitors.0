From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Feb 2017 23:10:44 +0000
Subject: [patch] Staging: bcm2835-audio: && vs & typo
Message-Id: <20170214231044.GA9160@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We intended to mask away the upper bits but there is a "&&" vs "&" typo
so it's broken.

Fixes: 23b028c871e1 ("staging: bcm2835-audio: initial staging submission")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm2835-audio/bcm2835-ctl.c b/drivers/staging/bcm2835-audio/bcm2835-ctl.c
index bfb7e9f74176..a4ffa1bf53e5 100644
--- a/drivers/staging/bcm2835-audio/bcm2835-ctl.c
+++ b/drivers/staging/bcm2835-audio/bcm2835-ctl.c
@@ -209,7 +209,7 @@ static int snd_bcm2835_spdif_default_get(struct snd_kcontrol *kcontrol,
 
 	for (i = 0; i < 4; i++)
 		ucontrol->value.iec958.status[i] -		(chip->spdif_status >> (i * 8)) && 0xff;
+			(chip->spdif_status >> (i * 8)) & 0xff;
 
 	mutex_unlock(&chip->audio_mutex);
 	return 0;
