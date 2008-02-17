From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 17:57:30 +0000
Subject: [PATCH 6/7] sound: Use BUG_ON
Message-Id: <Pine.LNX.4.64.0802171856530.28055@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@suse.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
side-effects to allow a definition of BUG_ON that drops the code completely.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ disable unlikely @ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (unlikely(E)) { BUG(); }
+ BUG_ON(E);
)

@@ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (E) { BUG(); }
+ BUG_ON(E);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
--- a/sound/core/seq/oss/seq_oss_synth.c 2006-11-30 19:05:47.000000000 +0100
+++ b/sound/core/seq/oss/seq_oss_synth.c 2008-02-17 16:43:24.000000000 +0100
@@ -245,8 +245,7 @@ snd_seq_oss_synth_setup(struct seq_oss_d
 		info->nr_voices = rec->nr_voices;
 		if (info->nr_voices > 0) {
 			info->ch = kcalloc(info->nr_voices, sizeof(struct seq_oss_chinfo), GFP_KERNEL);
-			if (!info->ch)
-				BUG();
+			BUG_ON(!info->ch);
 			reset_channels(info);
 		}
 		debug_printk(("synth %d assigned\n", i));
diff -u -p a/sound/oss/trident.c b/sound/oss/trident.c
--- a/sound/oss/trident.c 2008-02-10 22:34:18.000000000 +0100
+++ b/sound/oss/trident.c 2008-02-17 16:43:27.000000000 +0100
@@ -3076,8 +3076,7 @@ ali_ac97_get(struct trident_card *card, 
 	u16 wcontrol;
 	unsigned long flags;
 
-	if (!card)
-		BUG();
+	BUG_ON(!card);
 
 	address = ALI_AC97_READ;
 	if (card->revision = ALI_5451_V02) {
@@ -3148,8 +3147,7 @@ ali_ac97_set(struct trident_card *card, 
 
 	data = ((u32) val) << 16;
 
-	if (!card)
-		BUG();
+	BUG_ON(!card);
 
 	address = ALI_AC97_WRITE;
 	mask = ALI_AC97_WRITE_ACTION | ALI_AC97_AUDIO_BUSY;
@@ -3213,8 +3211,7 @@ ali_ac97_read(struct ac97_codec *codec, 
 	struct trident_card *card = NULL;
 
 	/* Added by Matt Wu */
-	if (!codec)
-		BUG();
+	BUG_ON(!codec);
 
 	card = (struct trident_card *) codec->private_data;
 
@@ -3240,8 +3237,7 @@ ali_ac97_write(struct ac97_codec *codec,
 	struct trident_card *card;
 
 	/*  Added by Matt Wu */
-	if (!codec)
-		BUG();
+	BUG_ON(!codec);
 
 	card = (struct trident_card *) codec->private_data;
 
