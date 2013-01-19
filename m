From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 19 Jan 2013 16:33:05 +0000
Subject: [PATCH 02/24] use IS_ENABLED() macro
Message-Id: <1358613206-4274-2-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1358613206-4274-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@redhat.com
Cc: remi.schwartz@gmail.com, sean@mess.org, kyle@kyle.strickland.name, simon.farnsworth@onelan.co.uk, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

replace:
 #if defined(CONFIG_VIDEO_SAA7134_DVB) || \
     defined(CONFIG_VIDEO_SAA7134_DVB_MODULE)
with:
 #if IS_ENABLED(CONFIG_VIDEO_SAA7134_DVB)

This change was made for: CONFIG_VIDEO_SAA7134_DVB

Reported-by: Mauro Carvalho Chehab <mchehab@redhat.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/media/pci/saa7134/saa7134.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134.h b/drivers/media/pci/saa7134/saa7134.h
index 0a3feaa..ace44fd 100644
--- a/drivers/media/pci/saa7134/saa7134.h
+++ b/drivers/media/pci/saa7134/saa7134.h
@@ -42,7 +42,7 @@
 #include <media/videobuf-dma-sg.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
-#if defined(CONFIG_VIDEO_SAA7134_DVB) || defined(CONFIG_VIDEO_SAA7134_DVB_MODULE)
+#if IS_ENABLED(CONFIG_VIDEO_SAA7134_DVB)
 #include <media/videobuf-dvb.h>
 #endif
 
@@ -644,7 +644,7 @@ struct saa7134_dev {
 	struct work_struct         empress_workqueue;
 	int                        empress_started;
 
-#if defined(CONFIG_VIDEO_SAA7134_DVB) || defined(CONFIG_VIDEO_SAA7134_DVB_MODULE)
+#if IS_ENABLED(CONFIG_VIDEO_SAA7134_DVB)
 	/* SAA7134_MPEG_DVB only */
 	struct videobuf_dvb_frontends frontends;
 	int (*original_demod_sleep)(struct dvb_frontend *fe);
-- 
1.7.11.7

