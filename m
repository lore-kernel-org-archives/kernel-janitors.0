From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:25 +0000
Subject: [PATCH 02/20] media: em28xx-audio: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-3-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/em28xx/em28xx-audio.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-audio.c b/drivers/media/usb/em28xx/em28xx-audio.c
index dc968fd5ace9..4d5ab1433b44 100644
--- a/drivers/media/usb/em28xx/em28xx-audio.c
+++ b/drivers/media/usb/em28xx/em28xx-audio.c
@@ -583,9 +583,9 @@ static int em28xx_cvol_new(struct snd_card *card, struct em28xx *dev,
 	struct snd_kcontrol_new tmp;
 
 	memset(&tmp, 0, sizeof(tmp));
-	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	tmp.private_value = id,
-	tmp.name  = ctl_name,
+	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	tmp.private_value = id;
+	tmp.name  = ctl_name;
 
 	/* Add Mute Control */
 	sprintf(ctl_name, "%s Switch", name);
@@ -600,16 +600,16 @@ static int em28xx_cvol_new(struct snd_card *card, struct em28xx *dev,
 		ctl_name, id);
 
 	memset(&tmp, 0, sizeof(tmp));
-	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	tmp.private_value = id,
-	tmp.name  = ctl_name,
+	tmp.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	tmp.private_value = id;
+	tmp.name  = ctl_name;
 
 	/* Add Volume Control */
 	sprintf(ctl_name, "%s Volume", name);
 	tmp.get   = em28xx_vol_get;
 	tmp.put   = em28xx_vol_put;
 	tmp.info  = em28xx_vol_info;
-	tmp.tlv.p = em28xx_db_scale,
+	tmp.tlv.p = em28xx_db_scale;
 	kctl = snd_ctl_new1(&tmp, dev);
 	err = snd_ctl_add(card, kctl);
 	if (err < 0)
