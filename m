From: Julia Lawall <julia@diku.dk>
Date: Tue, 03 Aug 2010 21:33:24 +0000
Subject: [PATCH 3/9] drivers/gpu/drm/i915: Drop unnecessary null test
Message-Id: <Pine.LNX.4.64.1008032333040.20393@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

list_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x,E;
@@

I(x,...) { <...
(
- (x = NULL) || 
  E
|
- (x != NULL) &&
  E
)
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/i915/intel_display.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
index 07da3ae..d81874d 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -746,7 +746,7 @@ bool intel_pipe_has_type (struct drm_crtc *crtc, int type)
     struct drm_encoder *l_entry;
 
     list_for_each_entry(l_entry, &mode_config->encoder_list, head) {
-	    if (l_entry && l_entry->crtc = crtc) {
+	    if (l_entry->crtc = crtc) {
 		    struct intel_encoder *intel_encoder = enc_to_intel_encoder(l_entry);
 		    if (intel_encoder->type = type)
 			    return true;
@@ -3343,7 +3343,7 @@ static int intel_crtc_mode_set(struct drm_crtc *crtc,
 
 	list_for_each_entry(encoder, &mode_config->encoder_list, head) {
 
-		if (!encoder || encoder->crtc != crtc)
+		if (encoder->crtc != crtc)
 			continue;
 
 		intel_encoder = enc_to_intel_encoder(encoder);
