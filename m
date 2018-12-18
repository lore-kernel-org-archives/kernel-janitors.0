From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2018 08:21:29 +0000
Subject: [PATCH 2/2] fsl_hypervisor: prevent integer overflow in ioctl
Message-Id: <20181218082129.GE32567@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20181218082003.GD32567@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Timur Tabi <timur@freescale.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mihai Caraman <mihai.caraman@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

The "param.count" value is a u64 thatcomes from the user.  The code
later in the function assumes that param.count is at least one and if
it's not then it leads to an Oops when we dereference the ZERO_SIZE_PTR.

Also the addition can have an integer overflow which would lead us to
allocate a smaller "pages" array than required.  I can't immediately
tell what the possible run times implications are, but it's safest to
prevent the overflow.

Fixes: 6db7199407ca ("drivers/virt: introduce Freescale hypervisor management driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/virt/fsl_hypervisor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 7b7f8e9a2801..1bbd910d4ddb 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -215,6 +215,9 @@ static long ioctl_memcpy(struct fsl_hv_ioctl_memcpy __user *p)
 	 * hypervisor.
 	 */
 	lb_offset = param.local_vaddr & (PAGE_SIZE - 1);
+	if (param.count = 0 ||
+	    param.count > U64_MAX - lb_offset - PAGE_SIZE + 1)
+		return -EINVAL;
 	num_pages = (param.count + lb_offset + PAGE_SIZE - 1) >> PAGE_SHIFT;
 
 	/* Allocate the buffers we need */
-- 
2.17.1
