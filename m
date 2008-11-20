From: "Hannes Eder" <hannes@hanneseder.net>
Date: Thu, 20 Nov 2008 20:25:25 +0000
Subject: [PATCH] sound/sound_core: Fix sparse warnings: returning void-valued expression and make 'soundcore_
Message-Id: <154e089b0811201225n78a9f746oc7632e496c445d95@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the following sparse warnings:

sound/sound_core.c:460:2: warning: returning void-valued expression
sound/sound_core.c:477:2: warning: returning void-valued expression
sound/sound_core.c:510:5: warning: symbol 'soundcore_open' was not
declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 sound/sound_core.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index a75b289..10ba421 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -457,7 +457,7 @@ EXPORT_SYMBOL(unregister_sound_mixer);

 void unregister_sound_midi(int unit)
 {
-	return sound_remove_unit(&chains[2], unit);
+	sound_remove_unit(&chains[2], unit);
 }

 EXPORT_SYMBOL(unregister_sound_midi);
@@ -474,7 +474,7 @@ EXPORT_SYMBOL(unregister_sound_midi);

 void unregister_sound_dsp(int unit)
 {
-	return sound_remove_unit(&chains[3], unit);
+	sound_remove_unit(&chains[3], unit);
 }


@@ -507,7 +507,7 @@ static struct sound_unit *__look_for_unit(int
chain, int unit)
 	return NULL;
 }

-int soundcore_open(struct inode *inode, struct file *file)
+static int soundcore_open(struct inode *inode, struct file *file)
 {
 	int chain;
 	int unit = iminor(inode);
