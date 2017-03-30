From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Mar 2017 09:40:36 +0000
Subject: [PATCH] staging/atomisp: fix spelling mistake: "falied" -> "failed"
Message-Id: <20170330094036.19049-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in dev_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo_dev.c b/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo_dev.c
index 87090cea5b9d..d22a2d2388c2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo_dev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/hmm/hmm_bo_dev.c
@@ -59,7 +59,7 @@ int hmm_bo_device_init(struct hmm_bo_device *bdev,
 
 	ret = hmm_vm_init(&bdev->vaddr_space, vaddr_start, size);
 	if (ret) {
-		dev_err(atomisp_dev, "hmm_vm_init falied. vaddr_start = 0x%x, size = %d\n",
+		dev_err(atomisp_dev, "hmm_vm_init failed. vaddr_start = 0x%x, size = %d\n",
 			vaddr_start, size);
 		goto vm_init_err;
 	}
-- 
2.11.0

