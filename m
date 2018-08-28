From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Aug 2018 08:46:34 +0000
Subject: [PATCH] [ALSA] seq: add error check in snd_seq_system_client_init()
Message-Id: <20180828084634.5tlvwgc6znrqixro@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

Static checkers complain that snd_seq_create_kernel_client() can return
-EBUSY here so we need to have some error handling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/seq/seq_system.c b/sound/core/seq/seq_system.c
index 8ce1d0b40dce..3b89b0adad6a 100644
--- a/sound/core/seq/seq_system.c
+++ b/sound/core/seq/seq_system.c
@@ -134,6 +134,10 @@ int __init snd_seq_system_client_init(void)
 
 	/* register client */
 	sysclient = snd_seq_create_kernel_client(NULL, 0, "System");
+	if (sysclient < 0) {
+		kfree(port);
+		return sysclient;
+	}
 
 	/* register timer */
 	strcpy(port->name, "Timer");
