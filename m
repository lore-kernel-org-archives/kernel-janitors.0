From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 11 Aug 2010 08:01:19 +0000
Subject: [PATCH] staging: tm6000: fix memory leak
Message-Id: <1281513681-5395-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, Stefan Ringel <stefan.ringel@arcor.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Original code doesn't call kfree(chip) on error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/tm6000/tm6000-alsa.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/tm6000/tm6000-alsa.c b/drivers/staging/tm6000/tm6000-alsa.c
index 087137d..6c09ef3 100644
--- a/drivers/staging/tm6000/tm6000-alsa.c
+++ b/drivers/staging/tm6000/tm6000-alsa.c
@@ -403,7 +403,7 @@ int tm6000_audio_init(struct tm6000_core *dev)
 
 	rc = snd_pcm_new(card, "TM6000 Audio", 0, 0, 1, &pcm);
 	if (rc < 0)
-		goto error;
+		goto error_chip;
 
 	pcm->info_flags = 0;
 	pcm->private_data = chip;
@@ -413,12 +413,15 @@ int tm6000_audio_init(struct tm6000_core *dev)
 
 	rc = snd_card_register(card);
 	if (rc < 0)
-		goto error;
+		goto error_chip;
 
 	dprintk(1,"Registered audio driver for %s\n", card->longname);
 
 	return 0;
 
+error_chip:
+	kfree(chip);
+	dev->adev = NULL;
 error:
 	snd_card_free(card);
 	return rc;
-- 
1.7.0.4

