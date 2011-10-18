From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:10:12 +0000
Subject: [patch] vmwgfx: information leak in vmw_execbuf_copy_fence_user()
Message-Id: <20111018061012.GE27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, Vasiliy Kulikov <segooon@gmail.com>, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>

If ret is non-zero then we don't initialize the struct which leaks
stack information to user space.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index d4a1d8b..28e1c35 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1070,6 +1070,8 @@ vmw_execbuf_copy_fence_user(struct vmw_private *dev_priv,
 	if (user_fence_rep = NULL)
 		return;
 
+	memset(&fence_rep, 0, sizeof(fence_rep));
+
 	fence_rep.error = ret;
 	if (ret = 0) {
 		BUG_ON(fence = NULL);
