From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Feb 2017 13:17:57 +0000
Subject: [patch] Staging: bcm2835-audio: remove unneeded NULL check
Message-Id: <20170207131757.GC28207@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We just dereferenced "instance" on the line before so checking it here
is pointless.  Anyway, it can't be NULL here so let's remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
index b7922be4909c..6578246b0f08 100644
--- a/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/bcm2835-audio/bcm2835-vchiq.c
@@ -775,10 +775,9 @@ int bcm2835_audio_close(struct bcm2835_alsa_stream *alsa_stream)
 	mutex_unlock(&instance->vchi_mutex);
 
 	/* Stop the audio service */
-	if (instance) {
-		vc_vchi_audio_deinit(instance);
-		alsa_stream->instance = NULL;
-	}
+	vc_vchi_audio_deinit(instance);
+	alsa_stream->instance = NULL;
+
 	LOG_DBG(" .. OUT\n");
 	return ret;
 }
