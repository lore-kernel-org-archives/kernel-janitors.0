From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 02 Oct 2006 10:52:59 +0000
Subject: [KJ] [PATCH] sound/usb/usbaudio: Handle return value of
Message-Id: <20061002105259.GA12070@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: akpm@osdl.org, alsa-devel@alsa-project.org

Handle the return value of usb_register() in the module_init function.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 sound/usb/usbaudio.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/sound/usb/usbaudio.c b/sound/usb/usbaudio.c
index a42acf6..191c811 100644
--- a/sound/usb/usbaudio.c
+++ b/sound/usb/usbaudio.c
@@ -3576,8 +3576,7 @@ static int __init snd_usb_audio_init(voi
 		printk(KERN_WARNING "invalid nrpacks value.\n");
 		return -EINVAL;
 	}
-	usb_register(&usb_audio_driver);
-	return 0;
+	return usb_register(&usb_audio_driver);
 }
 
 
-- 
1.4.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
