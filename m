From: Dan Carpenter <error27@gmail.com>
Date: Thu, 16 Sep 2010 18:13:47 +0000
Subject: [patch] ALSA: usb/mixer: remove bogus cast
Message-Id: <20100916181347.GC7867@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"uinfo->value.enumerated.item" is an unsigned int.  If it's negative
when we do the comparison:
	if ((int)uinfo->value.enumerated.item >= cval->max)
then we would read past the end of the array on the next line.

I also changed the strcpy() to strlcpy() out of paranoia.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 3ed3901..93c95c5 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1642,9 +1642,10 @@ static int mixer_ctl_selector_info(struct snd_kcontrol *kcontrol, struct snd_ctl
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
 	uinfo->count = 1;
 	uinfo->value.enumerated.items = cval->max;
-	if ((int)uinfo->value.enumerated.item >= cval->max)
+	if (uinfo->value.enumerated.item >= cval->max)
 		uinfo->value.enumerated.item = cval->max - 1;
-	strcpy(uinfo->value.enumerated.name, itemlist[uinfo->value.enumerated.item]);
+	strlcpy(uinfo->value.enumerated.name, itemlist[uinfo->value.enumerated.item],
+		sizeof(uinfo->value.enumerated.name));
 	return 0;
 }
 
