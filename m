From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Dec 2019 16:10:59 +0000
Subject: [PATCH][next] dma-buf: fix resource leak on -ENOTTY error return path
Message-Id: <20191216161059.269492-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Semwal <sumit.semwal@linaro.org>, "Andrew F . Davis" <afd@ti.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey <brian.starkey@arm.com>, John Stultz <john.stultz@linaro.org>, Sandeep Patil <sspatil@android.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The -ENOTTY error return path does not free the allocated
kdata as it returns directly. Fix this by returning via the
error handling label err.

Addresses-Coverity: ("Resource leak")
Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma-buf/dma-heap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 4f04d104ae61..80f2f5eac1e4 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -157,7 +157,8 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		ret = dma_heap_ioctl_allocate(file, kdata);
 		break;
 	default:
-		return -ENOTTY;
+		ret = -ENOTTY;
+		goto err;
 	}
 
 	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
-- 
2.24.0
