From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Jul 2012 21:13:41 +0000
Subject: [PATCH 1/3] drivers/gpu/drm/gma500/mdfld_intel_display.c: remove invalid reference to list iterator
Message-Id: <1341782023-23868-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
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

A break is added after the switch; the break in the switch would jump out
of the switch, but not out of the complete iteration.  The null test on
connector is also removed, because the iterator variable of
list_for_each_entry is never null.

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
 drivers/gpu/drm/gma500/mdfld_intel_display.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu/drm/gma500/mdfld_intel_display.c
index 3f3cd61..fc1ced0 100644
--- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
+++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
@@ -755,9 +755,6 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 					sizeof(struct drm_display_mode));
 
 	list_for_each_entry(connector, &mode_config->connector_list, head) {
-		if (!connector)
-			continue;
-
 		encoder = connector->encoder;
 
 		if (!encoder)
@@ -779,6 +776,7 @@ static int mdfld_crtc_mode_set(struct drm_crtc *crtc,
 			is_hdmi = true;
 			break;
 		}
+		break;
 	}
 
 	/* Disable the VGA plane that we never use */
