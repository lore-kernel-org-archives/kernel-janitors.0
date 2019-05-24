From: Colin King <colin.king@canonical.com>
Date: Fri, 24 May 2019 21:33:51 +0000
Subject: [PATCH][next] ALSA: firewire-lib: remove redundant assignment to cip_header
Message-Id: <20190524213351.24594-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignement to cip_header is redundant as the value never
read and it is being re-assigned in the if and else paths of
the following if statement. Clean up the code by removing it.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/firewire/amdtp-stream.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 2d9c764061d1..4236955bbf57 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -675,7 +675,6 @@ static int handle_in_packet(struct amdtp_stream *s, unsigned int cycle,
 		return -EIO;
 	}
 
-	cip_header = ctx_header + 2;
 	if (!(s->flags & CIP_NO_HEADER)) {
 		cip_header = &ctx_header[2];
 		err = check_cip_header(s, cip_header, payload_length,
-- 
2.20.1
