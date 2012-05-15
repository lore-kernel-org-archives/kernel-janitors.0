From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 May 2012 08:56:59 +0000
Subject: [patch] drm/radeon: check kmalloc() for failures
Message-Id: <20120515085659.GE30265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@amd.com>, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

We can just return -ENOMEM here if the allocation fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 0874a6d..fb44e7e 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -2008,6 +2008,8 @@ int r100_cs_parse(struct radeon_cs_parser *p)
 	int r;
 
 	track = kzalloc(sizeof(*track), GFP_KERNEL);
+	if (!track)
+		return -ENOMEM;
 	r100_cs_track_clear(p->rdev, track);
 	p->track = track;
 	do {
