From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Jun 2016 19:06:51 +0000
Subject: [PATCH] ALSA: echoaudio: Fix memory allocation
Message-Id: <1467054411-19752-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'commpage_bak' is allocated with 'sizeof(struct echoaudio)' bytes.
We then copy 'sizeof(struct comm_page)' bytes in it.
On my system, smatch complains because one is 2960 and the other is 3072.

This would result in memory corruption or a oops.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/pci/echoaudio/echoaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 1cb85ae..286f5e3 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -2200,11 +2200,11 @@ static int snd_echo_resume(struct device *dev)
 	u32 pipe_alloc_mask;
 	int err;
 
-	commpage_bak = kmalloc(sizeof(struct echoaudio), GFP_KERNEL);
+	commpage_bak = kmalloc(sizeof(*commpage), GFP_KERNEL);
 	if (commpage_bak = NULL)
 		return -ENOMEM;
 	commpage = chip->comm_page;
-	memcpy(commpage_bak, commpage, sizeof(struct comm_page));
+	memcpy(commpage_bak, commpage, sizeof(*commpage));
 
 	err = init_hw(chip, chip->pci->device, chip->pci->subsystem_device);
 	if (err < 0) {
-- 
2.7.4

