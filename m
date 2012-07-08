From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Jul 2012 21:13:42 +0000
Subject: [PATCH 2/3] drivers/gpu/drm/gma500/oaktrail_crtc.c: remove invalid reference to list iterator variab
Message-Id: <1341782023-23868-2-git-send-email-Julia.Lawall@lip6.fr>
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

A break is added after the switch; the break in the switch would jump out
of the switch, but not out of the complete iteration.

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
 drivers/gpu/drm/gma500/oaktrail_crtc.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index f821c83..4b2172e 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -329,6 +329,7 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 			is_mipi = true;
 			break;
 		}
+		break;
 	}
 
 	/* Disable the VGA plane that we never use */
