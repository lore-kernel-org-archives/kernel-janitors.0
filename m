From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Feb 2019 13:51:18 +0000
Subject: [PATCH] drm/nouveau/falcon: fix a few indentation issues
Message-Id: <20190212135118.8498-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a few statements that are indented incorrectly. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
index 771e16a16267..a8bee1e046aa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue.c
@@ -269,7 +269,7 @@ cmd_write(struct nvkm_msgqueue *priv, struct nvkm_msgqueue_hdr *cmd,
 		commit = false;
 	}
 
-	   cmd_queue_close(priv, queue, commit);
+	cmd_queue_close(priv, queue, commit);
 
 	return ret;
 }
@@ -347,7 +347,7 @@ nvkm_msgqueue_post(struct nvkm_msgqueue *priv, enum msgqueue_msg_priority prio,
 	ret = cmd_write(priv, cmd, queue);
 	if (ret) {
 		seq->state = SEQ_STATE_PENDING;
-		      msgqueue_seq_release(priv, seq);
+		msgqueue_seq_release(priv, seq);
 	}
 
 	return ret;
@@ -373,7 +373,7 @@ msgqueue_msg_handle(struct nvkm_msgqueue *priv, struct nvkm_msgqueue_hdr *hdr)
 	if (seq->completion)
 		complete(seq->completion);
 
-	   msgqueue_seq_release(priv, seq);
+	msgqueue_seq_release(priv, seq);
 
 	return 0;
 }
-- 
2.20.1
