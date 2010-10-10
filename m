From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 10 Oct 2010 17:28:55 +0000
Subject: [PATCH] staging: tidspbridge: fix signess error
Message-Id: <1286731736-18125-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Fernando Guzman Lugo <x0095840@ti.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

i was unsigned, so check for (i < 0) made no sense.  Made it signed.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I cannot compile this driver, so it is not tested.

 drivers/staging/tidspbridge/core/dsp-mmu.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/tidspbridge/core/dsp-mmu.c b/drivers/staging/tidspbridge/core/dsp-mmu.c
index 3c978f9..983c95a 100644
--- a/drivers/staging/tidspbridge/core/dsp-mmu.c
+++ b/drivers/staging/tidspbridge/core/dsp-mmu.c
@@ -219,7 +219,8 @@ u32 user_to_dsp_map(struct iommu *mmu, u32 uva, u32 da, u32 size,
 				struct page **usr_pgs)
 {
 	int res, w;
-	unsigned pages, i;
+	unsigned pages;
+	int i;
 	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	struct sg_table *sgt;
-- 
1.7.0.4

