From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2015 17:49:06 +0000
Subject: [patch v3] ALSA: opl3: small array underflow
Message-Id: <20150305174906.GB17072@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org

There is a missing lower bound check on "pitchbend" so it means we can
read up to 6 elements before the start of the opl3_note_table[] array.

Thanks to Clemens Ladisch for his help with this patch.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v3:  The first two versions of this broke the user space API.

diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index f62780e..7821b07 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -105,6 +105,8 @@ static void snd_opl3_calc_pitch(unsigned char *fnum, unsigned char *blocknum,
 		int pitchbend = chan->midi_pitchbend;
 		int segment;
 
+		if (pitchbend < -0x2000)
+			pitchbend = -0x2000;
 		if (pitchbend > 0x1FFF)
 			pitchbend = 0x1FFF;
 
