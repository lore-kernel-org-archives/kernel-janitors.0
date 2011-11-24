From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 11:48:24 +0000
Subject: [patch] ALSA: hda - cut and paste typo in cs420x_models[]
Message-Id: <20111124114824.GC32522@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, David Henningsson <david.henningsson@canonical.com>, Tim Howe <tim.howe@cirrus.com>

The CS420X_IMAC27 was copied from the line before but CS420X_APPLE
was clearly intented.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 7bd2a52..70a7abd 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1278,7 +1278,7 @@ static const char * const cs420x_models[CS420X_MODELS] = {
 	[CS420X_MBP53] = "mbp53",
 	[CS420X_MBP55] = "mbp55",
 	[CS420X_IMAC27] = "imac27",
-	[CS420X_IMAC27] = "apple",
+	[CS420X_APPLE] = "apple",
 	[CS420X_AUTO] = "auto",
 };
 
