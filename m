From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Nov 2012 07:44:54 +0000
Subject: [patch] ALSA: es1968: precedence bug in snd_es1968_tea575x_get_pins()
Message-Id: <20121113074454.GB13198@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, Ondrej Zary <linux@rainbow-software.org>, Mauro Carvalho Chehab <mchehab@redhat.com>, Takashi Iwai <tiwai@suse.de>, Rusty Russell <rusty@rustcorp.com.au>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

I don't think this works as intended.  '|' higher precedence than ?: so
the bitwize OR "0 | (val & STR_MOST)" is a no-op.

I have re-written it to be more clear.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have a way to test this.

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 50169bc..7266020 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2581,9 +2581,14 @@ static u8 snd_es1968_tea575x_get_pins(struct snd_tea575x *tea)
 	struct es1968 *chip = tea->private_data;
 	unsigned long io = chip->io_port + GPIO_DATA;
 	u16 val = inw(io);
-
-	return  (val & STR_DATA) ? TEA575X_DATA : 0 |
-		(val & STR_MOST) ? TEA575X_MOST : 0;
+	u8 ret;
+
+	ret = 0;
+	if (val & STR_DATA)
+		ret |= TEA575X_DATA;
+	if (val & STR_MOST)
+		ret |= TEA575X_MOST;
+	return ret;
 }
 
 static void snd_es1968_tea575x_set_direction(struct snd_tea575x *tea, bool output)
