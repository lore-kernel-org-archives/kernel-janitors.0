From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Mar 2015 19:13:18 +0000
Subject: [patch v2] ALSA: opl3: small array underflow
Message-Id: <20150303191318.GA7569@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54F5993E.7000109@ladisch.de>
In-Reply-To: <54F5993E.7000109@ladisch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

We don't check for negatives so "pitchbend" can be SHRT_MIN here.  It
means that we can read up to 6 elements before the start of the
opl3_note_table[] array.

There are several ways we could fix this.  I have gone with what is
maybe the lazier approach of just changing negative values to zero.
Hopefully, people aren't passing negatives here anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: The first patch just chan->midi_pitchbend unsigned but Clemens
Ladisch pointed out that that breaks the API.

diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index f62780e..0cb91dc 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -105,6 +105,8 @@ static void snd_opl3_calc_pitch(unsigned char *fnum, unsigned char *blocknum,
 		int pitchbend = chan->midi_pitchbend;
 		int segment;
 
+		if (pitchbend < 0)
+			pitchbend = 0;
 		if (pitchbend > 0x1FFF)
 			pitchbend = 0x1FFF;
 
