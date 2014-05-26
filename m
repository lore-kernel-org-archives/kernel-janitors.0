From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:21:22 +0000
Subject: [PATCH 13/18] drm/edid: Use kmemdup instead of kmalloc + memcpy
Message-Id: <1401117687-28911-14-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: benoit.taine@lip6.fr, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This issue was reported by coccicheck using the semantic patch 
at scripts/coccinelle/api/memdup.cocci

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
---
Tested by compilation without errors.

 drivers/gpu/drm/drm_edid.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7a4fd2e..d74239f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3228,10 +3228,9 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 
 			/* Speaker Allocation Data Block */
 			if (dbl = 3) {
-				*sadb = kmalloc(dbl, GFP_KERNEL);
+				*sadb = kmemdup(&db[1], dbl, GFP_KERNEL);
 				if (!*sadb)
 					return -ENOMEM;
-				memcpy(*sadb, &db[1], dbl);
 				count = dbl;
 				break;
 			}

