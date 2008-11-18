From: "Hannes Eder" <hannes@hanneseder.net>
Date: Tue, 18 Nov 2008 17:25:06 +0000
Subject: Re: [PATCH] sound: Fix warnings relating to ignored return value in snd_card_register
Message-Id: <154e089b0811180925j7f35e87k22926d3c354b2c58@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811180759x4db4ba61k467fa2275710938f@mail.gmail.com>
	 <s5hej19dn9o.wl%tiwai@suse.de>
	 <154e089b0811180906r69099866vf0b80cd40d7e2cc7@mail.gmail.com>
	 <s5h1vx9dkl7.wl%tiwai@suse.de>
In-Reply-To: <s5h1vx9dkl7.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>, Richard Holden <aciddeath@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Do not ignore the return of 'device_create_file' in
'snd_card_register' and thereby fixing the following warnings:

sound/core/init.c: In function 'snd_card_register':
sound/core/init.c:640: warning: ignoring return value of
'device_create_file', declared with attribute warn_unused_result
sound/core/init.c:641: warning: ignoring return value of
'device_create_file', declared with attribute warn_unused_result

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
All warnings and errors reported by checkpatch.pl fixed.

Thank you for your feedback.

 sound/core/init.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index af1e407..0d5520c 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -637,8 +637,12 @@ int snd_card_register(struct snd_card *card)
 #endif
 #ifndef CONFIG_SYSFS_DEPRECATED
 	if (card->card_dev) {
-		device_create_file(card->card_dev, &card_id_attrs);
-		device_create_file(card->card_dev, &card_number_attrs);
+		err = device_create_file(card->card_dev, &card_id_attrs);
+		if (err < 0)
+			return err;
+		err = device_create_file(card->card_dev, &card_number_attrs);
+		if (err < 0)
+			return err;
 	}
 #endif
 	return 0;
