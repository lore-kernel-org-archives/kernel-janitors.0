From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Sep 2017 10:23:22 +0000
Subject: [PATCH 2/3] ALSA: bebob: Adjust six checks for null pointers
Message-Id: <3ef7ccac-9bab-4030-da89-92f5c488e8bf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85f95150-9cec-7a53-7692-837ba543e1ec@users.sourceforge.net>
In-Reply-To: <85f95150-9cec-7a53-7692-837ba543e1ec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Sep 2017 11:48:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/firewire/bebob/bebob_stream.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index bc9e42b6368e..211ff43207d6 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -268,7 +268,7 @@ map_data_channels(struct snd_bebob *bebob, struct amdtp_stream *s)
 	 * use the maximum length of FCP.
 	 */
 	buf = kzalloc(256, GFP_KERNEL);
-	if (buf = NULL)
+	if (!buf)
 		return -ENOMEM;
 
 	if (s = &bebob->tx_stream)
@@ -472,7 +472,7 @@ break_both_connections(struct snd_bebob *bebob)
 	bebob->connected = false;
 
 	/* These models seems to be in transition state for a longer time. */
-	if (bebob->maudio_special_quirk != NULL)
+	if (bebob->maudio_special_quirk)
 		msleep(200);
 }
 
@@ -496,7 +496,7 @@ start_stream(struct snd_bebob *bebob, struct amdtp_stream *stream,
 		conn = &bebob->out_conn;
 
 	/* channel mapping */
-	if (bebob->maudio_special_quirk = NULL) {
+	if (!bebob->maudio_special_quirk) {
 		err = map_data_channels(bebob, stream);
 		if (err < 0)
 			goto end;
@@ -611,7 +611,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob, unsigned int rate)
 		 *
 		 * For firmware customized by M-Audio, refer to next NOTE.
 		 */
-		if (bebob->maudio_special_quirk = NULL) {
+		if (!bebob->maudio_special_quirk) {
 			err = rate_spec->set(bebob, rate);
 			if (err < 0) {
 				dev_err(&bebob->unit->device,
@@ -637,7 +637,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob, unsigned int rate)
 		 * The firmware customized by M-Audio uses these commands to
 		 * start transmitting stream. This is not usual way.
 		 */
-		if (bebob->maudio_special_quirk != NULL) {
+		if (bebob->maudio_special_quirk) {
 			err = rate_spec->set(bebob, rate);
 			if (err < 0) {
 				dev_err(&bebob->unit->device,
@@ -794,7 +794,7 @@ fill_stream_formations(struct snd_bebob *bebob, enum avc_bridgeco_plug_dir dir,
 	int err;
 
 	buf = kmalloc(FORMAT_MAXIMUM_LENGTH, GFP_KERNEL);
-	if (buf = NULL)
+	if (!buf)
 		return -ENOMEM;
 
 	if (dir = AVC_BRIDGECO_PLUG_DIR_IN)
-- 
2.14.1

