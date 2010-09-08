From: Dan Carpenter <error27@gmail.com>
Date: Wed, 08 Sep 2010 19:44:47 +0000
Subject: [patch] i915: snprintf returns large values
Message-Id: <20100908194447.GC3463@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

snprintf() returns the number of bytes which would have been used if
there was enough space.  It can be larger than the size of the buffer.
Obviously in this case the buffer is large enough but everyone just
copy and pastes this code so it's better to limit it and set a good
example.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 5e43d70..1cb29ec 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -741,6 +741,9 @@ i915_wedged_read(struct file *filp,
 		       "wedged :  %d\n",
 		       atomic_read(&dev_priv->mm.wedged));
 
+	if (len > sizeof (buf))
+		len = sizeof (buf);
+
 	return simple_read_from_buffer(ubuf, max, ppos, buf, len);
 }
 
