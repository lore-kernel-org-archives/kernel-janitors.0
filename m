From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 08 Mar 2018 02:02:48 +0000
Subject: [PATCH 1/5] drm/vgem: Indent switch and case at the same level
Message-Id: <c67b45979965cb1f1e80c3baa06814d14a0662bf.1520474055.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

This patch fixes the checkpatch.pl errors:

vgem_drv.c:97: ERROR: switch and case should be at the same indent
vgem_drv.c:97: ERROR: trailing statements should be on next line

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 2524ff116f00..5767030d04a8 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -94,7 +94,8 @@ static int vgem_gem_fault(struct vm_fault *vmf)
 		if (!IS_ERR(page)) {
 			vmf->page = page;
 			ret = 0;
-		} else switch (PTR_ERR(page)) {
+		} else {
+			switch (PTR_ERR(page)) {
 			case -ENOSPC:
 			case -ENOMEM:
 				ret = VM_FAULT_OOM;
@@ -110,8 +111,8 @@ static int vgem_gem_fault(struct vm_fault *vmf)
 				WARN_ON(PTR_ERR(page));
 				ret = VM_FAULT_SIGBUS;
 				break;
+			}
 		}
-
 	}
 	return ret;
 }
-- 
2.16.2

