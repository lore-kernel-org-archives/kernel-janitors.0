From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:13:33 +0000
Subject: [PATCH 04/15] drm: radeon: check kzalloc() result
Message-Id: <1279296814-24903-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexdeucher@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

If kzalloc() fails exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/gpu/drm/radeon/r300.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
index 7e81db5..767c109 100644
--- a/drivers/gpu/drm/radeon/r300.c
+++ b/drivers/gpu/drm/radeon/r300.c
@@ -1176,6 +1176,8 @@ int r300_cs_parse(struct radeon_cs_parser *p)
 	int r;
 
 	track = kzalloc(sizeof(*track), GFP_KERNEL);
+	if (track = NULL)
+		return -ENOMEM;
 	r100_cs_track_clear(p->rdev, track);
 	p->track = track;
 	do {
-- 
1.7.0.4

