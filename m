From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Nov 2015 22:17:04 +0000
Subject: [PATCH] ALSA: ctxfi: constify amixer_rsc_ops structure
Message-Id: <1447021024-10392-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

The amixer_rsc_ops structure is never modified, so declare it as
const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/pci/ctxfi/ctamixer.c |    2 +-
 sound/pci/ctxfi/ctamixer.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ctxfi/ctamixer.c b/sound/pci/ctxfi/ctamixer.c
index c7dc38d..465b5c5 100644
--- a/sound/pci/ctxfi/ctamixer.c
+++ b/sound/pci/ctxfi/ctamixer.c
@@ -186,7 +186,7 @@ static int amixer_setup(struct amixer *amixer, struct rsc *input,
 	return 0;
 }
 
-static struct amixer_rsc_ops amixer_ops = {
+static const struct amixer_rsc_ops amixer_ops = {
 	.set_input		= amixer_set_input,
 	.set_invalid_squash	= amixer_set_invalid_squash,
 	.set_scale		= amixer_set_y,
diff --git a/sound/pci/ctxfi/ctamixer.h b/sound/pci/ctxfi/ctamixer.h
index 72f42f2..2de18aa 100644
--- a/sound/pci/ctxfi/ctamixer.h
+++ b/sound/pci/ctxfi/ctamixer.h
@@ -58,7 +58,7 @@ struct amixer {
 	unsigned char idx[8];
 	struct rsc *input;	/* pointer to a resource acting as source */
 	struct sum *sum;	/* Put amixer output to this summation node */
-	struct amixer_rsc_ops *ops;	/* AMixer specific operations */
+	const struct amixer_rsc_ops *ops;	/* AMixer specific operations */
 };
 
 struct amixer_rsc_ops {

