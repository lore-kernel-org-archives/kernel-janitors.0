From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Feb 2015 20:32:02 +0000
Subject: [patch] ALSA: oxfw: fix a condition in start_stream()
Message-Id: <20150226203202.GC6820@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Static checkers complain that this function doesn't return negative
error codes.  The comments for amdtp_stream_wait_callback() say that we
should stop the stream if it returns false.

Fixes: f3699e2c7745 ('ALSA: oxfw: Change the way to start stream')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 29ccb36..ee67581 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -172,7 +172,7 @@ static int start_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream,
 
 	/* Wait first packet */
 	err = amdtp_stream_wait_callback(stream, CALLBACK_TIMEOUT);
-	if (err < 0)
+	if (err = 0)
 		stop_stream(oxfw, stream);
 end:
 	return err;
