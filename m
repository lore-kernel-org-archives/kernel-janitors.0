From: Dan Carpenter <error27@gmail.com>
Date: Thu, 19 Aug 2010 09:39:57 +0000
Subject: [patch] drm: fix end of loop test
Message-Id: <20100819093957.GK645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, kernel-janitors@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, dri-devel@lists.freedesktop.org

"agpmem" is never NULL here because it is the list cursor of a
list_for_each_entry() list.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 3778360..fda6746 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -138,7 +138,7 @@ static int drm_do_vm_fault(struct vm_area_struct *vma, struct vm_fault *vmf)
 				break;
 		}
 
-		if (!agpmem)
+		if (&agpmem->head = &dev->agp->memory)
 			goto vm_fault_error;
 
 		/*
