From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Jul 2012 21:13:43 +0000
Subject: [PATCH 3/3] drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c: remove invalid reference to list iterator variable
Message-Id: <1341782023-23868-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341782023-23868-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341782023-23868-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If list_for_each_entry, etc complete a traversal of the list, the iterator
variable ends up pointing to an address at an offset from the list head,
and not a meaningful structure.  Thus this value should not be used after
the end of the iterator.

After the iteractor, entry->base.crtc.fb is not a meaningful value.  What
seems to be intended is crtc->fb, which gets the information from the last
element of the list.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier c;
expression E;
iterator name list_for_each_entry;
statement S;
@@

list_for_each_entry(c,...) { ... when != break;
                                 when forall
                                 when strict
}
...
(
c = E
|
*c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

---
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 070fb23..634611a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -93,7 +93,7 @@ static int vmw_ldu_commit_list(struct vmw_private *dev_priv)
 
 		if (crtc = NULL)
 			return 0;
-		fb = entry->base.crtc.fb;
+		fb = crtc->fb;
 
 		return vmw_kms_write_svga(dev_priv, w, h, fb->pitches[0],
 					  fb->bits_per_pixel, fb->depth);

