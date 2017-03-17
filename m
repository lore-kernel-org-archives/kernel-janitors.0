From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Mar 2017 20:42:46 +0000
Subject: [PATCH] Staging: atomisp: fix locking in alloc_user_pages()
Message-Id: <20170317204246.GB16505@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

We call this function with the lock held and should also return with the
lock held as well.  This one error path is not-consistent because we
should return without the lock held.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c
index fd3bd5c48672..d1a609d25f18 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo.c
@@ -1012,6 +1012,7 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 		dev_err(atomisp_dev, "find_vma failed\n");
 		atomisp_kernel_free(bo->page_obj);
 		atomisp_kernel_free(pages);
+		mutex_lock(&bo->mutex);
 		return -EFAULT;
 	}
 	mutex_lock(&bo->mutex);
