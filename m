From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Oct 2017 11:18:39 +0000
Subject: [PATCH] ALSA: emux: remove unused redundant variable p2
Message-Id: <20171016111839.11365-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable p2 is being assigned but never used, it is redundant
and can be safely removed.  Cleans up clang warning: Value stored to
'p2' is never read.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/synth/emux/emux_oss.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/synth/emux/emux_oss.c b/sound/synth/emux/emux_oss.c
index de19e108974a..764ff4bc2089 100644
--- a/sound/synth/emux/emux_oss.c
+++ b/sound/synth/emux/emux_oss.c
@@ -430,7 +430,6 @@ gusspec_control(struct snd_emux *emu, struct snd_emux_port *port, int cmd,
 {
 	int voice;
 	unsigned short p1;
-	short p2;
 	int plong;
 	struct snd_midi_channel *chan;
 
@@ -445,7 +444,6 @@ gusspec_control(struct snd_emux *emu, struct snd_emux_port *port, int cmd,
 	chan = &port->chset.channels[voice];
 
 	p1 = *(unsigned short *) &event[4];
-	p2 = *(short *) &event[6];
 	plong = *(int*) &event[4];
 
 	switch (cmd) {
-- 
2.14.1

