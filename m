From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 14 Feb 2019 01:54:21 +0000
Subject: [PATCH -next] drm/vmwgfx: Remove set but not used variable 'restart'
Message-Id: <20190214020804.22935-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538739418-151469-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538739418-151469-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function 'vmw_cmdbuf_work_func':
drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:514:7: warning:
 variable 'restart' set but not used [-Wunused-but-set-variable]

It not used any more after commit dc366364c4ef ("drm/vmwgfx: Fix multiple
command buffer context use")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 70dab55e7888..ed15655eacd2 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -511,17 +511,14 @@ static void vmw_cmdbuf_work_func(struct work_struct *work)
 		container_of(work, struct vmw_cmdbuf_man, work);
 	struct vmw_cmdbuf_header *entry, *next;
 	uint32_t dummy;
-	bool restart[SVGA_CB_CONTEXT_MAX];
 	bool send_fence = false;
 	struct list_head restart_head[SVGA_CB_CONTEXT_MAX];
 	int i;
 	struct vmw_cmdbuf_context *ctx;
 	bool global_block = false;
 
-	for_each_cmdbuf_ctx(man, i, ctx) {
+	for_each_cmdbuf_ctx(man, i, ctx)
 		INIT_LIST_HEAD(&restart_head[i]);
-		restart[i] = false;
-	}
 
 	mutex_lock(&man->error_mutex);
 	spin_lock(&man->lock);
@@ -533,7 +530,6 @@ static void vmw_cmdbuf_work_func(struct work_struct *work)
 		const char *cmd_name;
 
 		list_del_init(&entry->list);
-		restart[entry->cb_context] = true;
 		global_block = true;
 
 		if (!vmw_cmd_describe(header, &error_cmd_size, &cmd_name)) {
