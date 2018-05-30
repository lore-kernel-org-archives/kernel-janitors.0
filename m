From: Colin King <colin.king@canonical.com>
Date: Wed, 30 May 2018 09:40:29 +0000
Subject: [PATCH] RDMA/qedr: fix spelling mistake: "adrresses" -> "addresses"
Message-Id: <20180530094029.10747-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180501082549.22215-1-colin.king@canonical.com>
In-Reply-To: <20180501082549.22215-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Kalderon <Michal.Kalderon@cavium.com>, Ariel Elior <Ariel.Elior@cavium.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_ERR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/qedr/verbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/qedr/verbs.c b/drivers/infiniband/hw/qedr/verbs.c
index 988aace89430..614a954d0757 100644
--- a/drivers/infiniband/hw/qedr/verbs.c
+++ b/drivers/infiniband/hw/qedr/verbs.c
@@ -414,7 +414,7 @@ int qedr_mmap(struct ib_ucontext *context, struct vm_area_struct *vma)
 
 	if ((vma->vm_start & (PAGE_SIZE - 1)) || (len & (PAGE_SIZE - 1))) {
 		DP_ERR(dev,
-		       "failed mmap, adrresses must be page aligned: start=0x%pK, end=0x%pK\n",
+		       "failed mmap, addresses must be page aligned: start=0x%pK, end=0x%pK\n",
 		       (void *)vma->vm_start, (void *)vma->vm_end);
 		return -EINVAL;
 	}
-- 
2.17.0

