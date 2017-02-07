From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:17:07 +0000
Subject: [patch] staging: bcm2835-audio: off by one in snd_bcm2835_playback_open_generic()
Message-Id: <20170207131707.GB28207@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The > should be >= otherwise we write beyond the end of the array when
we do:

	chip->alsa_stream[idx] = alsa_stream;

Fixes: 23b028c871e1 ("staging: bcm2835-audio: initial staging submission")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm2835-audio/bcm2835-pcm.c b/drivers/staging/bcm2835-audio/bcm2835-pcm.c
index d2d9f9b6a09b..014bf7ab69f4 100644
--- a/drivers/staging/bcm2835-audio/bcm2835-pcm.c
+++ b/drivers/staging/bcm2835-audio/bcm2835-pcm.c
@@ -130,7 +130,7 @@ static int snd_bcm2835_playback_open_generic(
 		err = -EBUSY;
 		goto out;
 	}
-	if (idx > MAX_SUBSTREAMS) {
+	if (idx >= MAX_SUBSTREAMS) {
 		audio_error
 			("substream(%d) device doesn't exist max(%d) substreams allowed\n",
 			idx, MAX_SUBSTREAMS);
