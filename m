From: Colin King <colin.king@canonical.com>
Date: Sat, 26 May 2018 15:11:00 +0000
Subject: [PATCH] ALSA: seq: fix spelling mistake "Unamed" -> "Unnamed"
Message-Id: <20180526151100.10774-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in string

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/core/seq/seq_ports.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index d21ece9f8d73..24d90abfc64d 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -669,7 +669,7 @@ int snd_seq_event_port_attach(int client,
 	/* Set up the port */
 	memset(&portinfo, 0, sizeof(portinfo));
 	portinfo.addr.client = client;
-	strlcpy(portinfo.name, portname ? portname : "Unamed port",
+	strlcpy(portinfo.name, portname ? portname : "Unnamed port",
 		sizeof(portinfo.name));
 
 	portinfo.capability = cap;
-- 
2.17.0

