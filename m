From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 07:45:20 +0000
Subject: [patch] ALSA: snd-aoa: two copy and paste bugs
Message-Id: <20131113074520.GD25541@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, kernel-janitors@vger.kernel.org, Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org

These functions were cut and paste and the tests for NULL weren't
updated properly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index 61ab640..9dc5806 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -644,7 +644,7 @@ static int n##_control_put(struct snd_kcontrol *kcontrol,		\
 			   struct snd_ctl_elem_value *ucontrol)		\
 {									\
 	struct gpio_runtime *gpio = snd_kcontrol_chip(kcontrol);	\
-	if (gpio->methods && gpio->methods->get_##n)			\
+	if (gpio->methods && gpio->methods->set_##n)			\
 		gpio->methods->set_##n(gpio,				\
 			!!ucontrol->value.integer.value[0]);		\
 	return 1;							\
@@ -1135,7 +1135,7 @@ static int aoa_fabric_layout_resume(struct soundbus_dev *sdev)
 {
 	struct layout_dev *ldev = dev_get_drvdata(&sdev->ofdev.dev);
 
-	if (ldev->gpio.methods && ldev->gpio.methods->all_amps_off)
+	if (ldev->gpio.methods && ldev->gpio.methods->all_amps_restore)
 		ldev->gpio.methods->all_amps_restore(&ldev->gpio);
 
 	return 0;
