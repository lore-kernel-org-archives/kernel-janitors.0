From: Tobias Klauser <tklauser@distanz.ch>
Date: Fri, 11 Aug 2006 19:39:28 +0000
Subject: [KJ] [PATCH] sound/pci/fm801: Use ARRAY_SIZE macro
Message-Id: <20060811193928.GA28911@neon.tklauser.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0])

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 sound/pci/fm801.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 13868c9..17ab02f 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -318,10 +318,8 @@ static unsigned int channels[] = {
   2, 4, 6
 };
 
-#define CHANNELS sizeof(channels) / sizeof(channels[0])
-
 static struct snd_pcm_hw_constraint_list hw_constraints_channels = {
-	.count = CHANNELS,
+	.count = ARRAY_SIZE(channels),
 	.list = channels,
 	.mask = 0,
 };
-- 
1.4.1

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
