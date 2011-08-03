From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Wed, 03 Aug 2011 19:51:19 +0000
Subject: [PATCH] Fix potential NULL dereference in drivers/gpu/drm/radeon/atom.c
Message-Id: <1312401079-1775-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie
Cc: alexdeucher@gmail.com, airlied@redhat.com, akpm@linux-foundation.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bojan Prtvar <prtvar.b@gmail.com>

kzalloc() can return NULL, so I added check for it

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 drivers/gpu/drm/radeon/atom.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atom.c b/drivers/gpu/drm/radeon/atom.c
index ebdb0fd..e88c644 100644
--- a/drivers/gpu/drm/radeon/atom.c
+++ b/drivers/gpu/drm/radeon/atom.c
@@ -1245,6 +1245,9 @@ struct atom_context *atom_parse(struct card_info *card, void *bios)
 	char name[512];
 	int i;
 
+	if (!ctx)
+		return NULL;
+
 	ctx->card = card;
 	ctx->bios = bios;
 
-- 
1.7.1

