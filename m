From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:17:34 +0000
Subject: [patch] Staging: bcm2835-audio: fix an uninitialized return value
Message-Id: <20170207131734.GC27416@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"ret" isn't necessarily initialized on the success path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
index 9ac1f72a178e..b7922be4909c 100644
--- a/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
@@ -432,6 +432,7 @@ static int bcm2835_audio_open_connection(struct bcm2835_alsa_stream *alsa_stream
 	alsa_stream->instance = instance;
 
 	LOG_DBG(" success !\n");
+	ret = 0;
 err_free_mem:
 	LOG_DBG(" .. OUT\n");
 
