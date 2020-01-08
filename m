From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 05:37:06 +0000
Subject: [PATCH] ALSA: control: potential uninitialized return value
Message-Id: <20200108053706.h3hcnvmnf62wkjac@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Kirill Smelkov <kirr@nexedi.com>, Allison Randal <allison@lohutok.net>

Smatch complains that "ret" might be uninitialized.

Fixes: fbd3eb7f66c5 ("ALSA: control: Add verification for kctl accesses")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index d06033d418a8..aa0c0cf182af 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -896,7 +896,7 @@ static int sanity_check_elem_value(struct snd_card *card,
 				   u32 pattern)
 {
 	size_t offset;
-	int i, ret;
+	int i, ret = 0;
 	u32 *p;
 
 	switch (info->type) {
-- 
2.11.0
