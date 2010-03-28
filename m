From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:25:22 +0000
Subject: [patch] drm: fix check for end of loop
Message-Id: <20100328112522.GL5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Eric Anholt <eric@anholt.net>, Dave Airlie <airlied@redhat.com>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"agpmem" is never NULL here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/drm_memory.c b/drivers/gpu/drm/drm_memory.c
index e4865f9..7732268 100644
--- a/drivers/gpu/drm/drm_memory.c
+++ b/drivers/gpu/drm/drm_memory.c
@@ -77,7 +77,7 @@ static void *agp_remap(unsigned long offset, unsigned long size,
 		    && (agpmem->bound + (agpmem->pages << PAGE_SHIFT)) > 		    (offset + size))
 			break;
-	if (!agpmem)
+	if (&agpmem->head = &dev->agp->memory)
 		return NULL;
 
 	/*
