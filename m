From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 06 Oct 2013 00:37:23 +0000
Subject: [patch] drm/radeon: tweak a timeout condition slightly
Message-Id: <20131006003723.GB16592@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Jerome Glisse <jglisse@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, David Howells <dhowells@redhat.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

The code was supposed to loop 10 times but it loops 11 times because it
uses a post op instead of pre op.  Using parenthesis doesn't affect how
post ops work.

Also I have clarified the comment.  Hopefully I understood the intent
correctly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checkers stuff.  I haven't tested this.  I was auditing for post
op vs pre op increments.  It turns out that some people always put
parenthesis around increment operations for style reasons so it's also
possible that the intent was to loop 11 times.

diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index ddb8f8e..fc6e9f4 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -180,11 +180,10 @@ void radeon_fence_process(struct radeon_device *rdev, int ring)
 		 */
 		wake = true;
 		last_seq = seq;
-		if ((count_loop++) > 10) {
-			/* We looped over too many time leave with the
-			 * fact that we might have set an older fence
-			 * seq then the current real last seq as signaled
-			 * by the hw.
+		if (++count_loop > 10) {
+			/* We have looped too many times.  Leave despite the
+			 * fact that we might have set an older fence seq than
+			 * the current real last_seq as signaled by the hw.
 			 */
 			break;
 		}
