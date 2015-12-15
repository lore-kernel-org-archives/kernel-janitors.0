From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 10:09:08 +0000
Subject: [patch] [media] media_entity: logical vs bitwise AND typo
Message-Id: <20151215100908.GD20848@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This was obviously supposed to be a bitwise AND.

Fixes: 403da6ca3465 ('[media] media: move MEDIA_LNK_FL_INTERFACE_LINK logic to link creation')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/media-entity.c b/drivers/media/media-entity.c
index 7895e17..6926e06 100644
--- a/drivers/media/media-entity.c
+++ b/drivers/media/media-entity.c
@@ -526,7 +526,7 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
 
 	link->source = &source->pads[source_pad];
 	link->sink = &sink->pads[sink_pad];
-	link->flags = flags && ~MEDIA_LNK_FL_INTERFACE_LINK;
+	link->flags = flags & ~MEDIA_LNK_FL_INTERFACE_LINK;
 
 	/* Initialize graph object embedded at the new link */
 	media_gobj_create(source->graph_obj.mdev, MEDIA_GRAPH_LINK,
